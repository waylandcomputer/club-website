import datetime
import os


from dotenv import load_dotenv
from flask import Flask, render_template, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_cors import CORS
from pytz import timezone


load_dotenv(".env")
app = Flask(__name__)
app.config["SECRET_KEY"] = os.environ.get('SECRET_KEY')
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_DATABASE_URI"] = os.environ.get('DATABASE_URI')
db = SQLAlchemy(app)
migrate = Migrate(app, db)
CORS(app, resources={r'/data/*': {'origins': '*'}})


local_config = dict(
    init_date = datetime.datetime(1970, 1, 1),
    require_admin_approval = False,
)

with open("finish_time.txt") as f:
    s = f.readline().replace("\t", " ")
    local_config["init_date"] = s[:s.rfind(".")]

from models import Member, Contact #, Project, Language


@app.route("/data/admin_REDACTED", methods=["GET", "POST"])
def render_admin_panel():
    if request.method == "POST":
        local_config["require_admin_approval"] = "require_admin_approval" in request.form
        delete_ids = [key.split("_")[-1] for key in request.form.keys() if key.startswith("delete")]
        add_ids = [key.split("_")[-1] for key in request.form.keys() if key.startswith("add")]
        assert not bool(set(delete_ids) & set(add_ids))  # shouldn't be possible, but still check that no member is both added and deleted
        selected_members_delete = Member.query.filter(Member.id.in_(delete_ids)).all()
        selected_members_add = Member.query.filter(Member.id.in_(add_ids)).all()
        for member in selected_members_delete:
            assert len(Contact.query.filter_by(member=member.id).all()) == 0  # TODO: remove children (e.g. contact information)
            db.session.delete(member)

        for member in selected_members_add:
            member.position = "M"

        db.session.commit()

    # new_members = Member.query.filter(Member.position != "N").filter(Member.created_at >= local_config["init_date"]).all()
    new_members = Member.query.filter(Member.created_at >= local_config["init_date"]).all()
    pending_members = Member.query.filter_by(position="N").all()
    return render_template("admin_page.html", require_admin_approval=local_config["require_admin_approval"],
                           new_members=new_members, pending_members=pending_members)


@app.route("/data/signup", methods=["POST"])
def process_signup():
    form = request.get_json(silent=True)
    fname = form["fname"]
    lname = form["lname"]
    grade = form["grade"]
    if local_config["require_admin_approval"]:
        new_member = Member(fname=fname, lname=lname, grade=grade, image='template.jpg', position='N', created_at=datetime.datetime.now(timezone('America/New_York')))
        db.session.add(new_member)
        db.session.commit()
        return "Pending"
    else:
        new_member = Member(fname=fname, lname=lname, grade=grade, image='template.jpg', position='M', created_at=datetime.datetime.now(timezone('America/New_York')))
        db.session.add(new_member)
        db.session.commit()
        return "Accepted"


@app.route('/data/existing_member_data', methods=['GET'])
def load_data():
    data = []
    # TODO: check if comparison fails between 9 and 10 (Sept and Oct)
    members = Member.query.filter(Member.position != "N").filter(Member.created_at < local_config["init_date"]).all()
    for member in members:
        member_info = member.__dict__
        del member_info['_sa_instance_state']
        contact_info = Contact.query.filter_by(member=member.id).all()
        contact_list = []
        for contact in contact_info:
            contact_dict = contact.__dict__
            del contact_dict['member']
            del contact_dict['cid']
            del contact_dict['_sa_instance_state']
            contact_list.append(contact_dict)

        member_info["contact_list"] = contact_list
        data.append(member_info)

    return jsonify(data)


@app.route('/data/new_member_data', methods=['GET'])
def load_data2():
    data = []
    members = Member.query.filter(Member.position != "N").filter(Member.created_at >= local_config["init_date"]).all()
    for member in members:
        member_info = member.__dict__
        del member_info['_sa_instance_state']
        contact_info = Contact.query.filter_by(member=member.id).all()
        contact_list = []
        for contact in contact_info:
            contact_dict = contact.__dict__
            del contact_dict['member']
            del contact_dict['cid']
            del contact_dict['_sa_instance_state']
            contact_list.append(contact_dict)

        member_info["contact_list"] = contact_list
        data.append(member_info)

    return jsonify(data)
