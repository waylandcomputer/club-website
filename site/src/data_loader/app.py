import datetime
import os

from dotenv import load_dotenv
from flask import Flask, render_template, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_cors import CORS


load_dotenv(".env")

app = Flask(__name__)
app.config["SECRET_KEY"] = os.environ.get('SECRET_KEY')
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_DATABASE_URI"] = os.environ.get('DATABASE_URI')
db = SQLAlchemy(app)
migrate = Migrate(app, db)
CORS(app, resources={r'/data/*': {'origins': '*'}})

from models import Member, Project, Contact, Language


@app.route("/data/signup", methods=["POST"])
def process_signup():
    form = request.get_json(silent=True)
    fname = form["fname"]
    lname = form["lname"]
    grade = form["grade"]
    new_member = Member(fname=fname, lname=lname, grade=grade, image='template.jpg', position='M')
    db.session.add(new_member)
    db.session.commit()
    return "0"


@app.route('/data/existing_member_data', methods=['GET'])
def load_data():
    data = []
    members = Member.query.filter_by().all()
    for member in members:
        if member.created_at <= datetime.datetime(2021, 9, 22, 12, 9):  # TODO: fix
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
            # data[member.id] = member_info
            data.append(member_info)

    return jsonify(data)


@app.route('/data/new_member_data', methods=['GET'])
def load_data2():
    data = []
    members = Member.query.all()
    for member in members:
        if member.created_at >= datetime.datetime(2021, 9, 22, 12, 9):  # TODO: fix
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
            # data[member.id] = member_info
            data.append(member_info)
    return jsonify(data)
