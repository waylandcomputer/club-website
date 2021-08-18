import os

from dotenv import load_dotenv
from flask import Flask, render_template, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate


load_dotenv(".env")

app = Flask(__name__)
app.config["SECRET_KEY"] = os.environ.get('SECRET_KEY')
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_DATABASE_URI"] = os.environ.get('DATABASE_URI')
db = SQLAlchemy(app)
migrate = Migrate(app, db)

from models import Member, Project, Contact, Language

@app.route("/")
def index():
    assert Member.query.with_entities(Member.position).distinct().all().sort() == [('P',), ('VP',), ('M',)].sort(), \
        'Assuming the possible positions are: President, VP, and Member'
    ranked_members = {rank.lower() + "s": Member.query.filter_by(position=rank).all() for rank in ['P', 'VP', 'M']}
    assert len(ranked_members["ps"]) == 1, "Assuming there's only one president."
    ranked_members["p"] = ranked_members.pop("ps")[0]
    return render_template("all_members.html", **ranked_members, filter=lambda id: Contact.query.filter_by(member=id))
    # return render_template("index.html")

@app.route("/members/<member>")
def get_member_info(member):
    assert member.count("_") == 1, "Underscore separates first and last names"
    fname, lname = member.split("_")
    print(fname, lname)
    db_result = Member.query.filter_by(fname=fname, lname=lname).all()
    if len(db_result) != 1:
        return render_template("index.html")
    else:
        return render_template("member.html", member=db_result[0])#, projects=Project.query.filter_by(owner=db_result[0].id).all())

@app.route("/statistics")
def statistics():
    return render_template("statistics.html")

@app.route("/signup", methods=["GET"])
def display_signup():
    return render_template("signup.html")

@app.route("/signup", methods=["POST"])
def process_signup():
    fname = request.form["fname"]
    lname = request.form["lname"]
    grade = request.form["grade"]
    new_member = Member(fname=fname, lname=lname, grade=grade, image='template.jpg', position='M')
    db.session.add(new_member)
    db.session.commit()
    return index()


@app.route('/load_data', methods=['GET'])
def load_data():
    data = {'members': [], 'languages': []}
    members = Member.query.all()
    for member in members:
        member_info = member.__dict__
        del member_info['_sa_instance_state']
        data['members'].append(member_info)

    languages = Language.query.all()
    for language in languages:
        language_info = language.__dict__
        del language_info['_sa_instance_state']
        data['languages'].append(language_info)
    return jsonify(data)