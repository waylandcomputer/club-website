import os

from dotenv import load_dotenv
from flask import flash, Flask, render_template, request, send_from_directory
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate


load_dotenv(".env")

app = Flask(__name__)
app.config["SECRET_KEY"] = os.environ.get('SECRET_KEY')
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_DATABASE_URI"] = os.environ.get('DATABASE_URI')
db = SQLAlchemy(app)
migrate = Migrate(app, db)

from models import Member, Project

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/members/<member>")
def get_member_info(member):
    db_result = Member.query.filter_by(fname=member).all()
    if len(db_result) != 1:
        return render_template("all_members.html", members=Member.query.all())
    else:
        return render_template("member.html", member=db_result[0], projects=Project.query.filter_by(owner=db_result[0].id).all())

@app.route("/signup", methods=["GET"])
def display_signup():
    return render_template("signup.html")

@app.route("/signup", methods=["POST"])
def process_signup():
    fname = request.form["fname"]
    lname = request.form["lname"]
    grade = request.form["grade"]
    print(fname, lname, grade)
    new_member = Member(fname=fname, lname=lname, grade=grade)
    db.session.add(new_member)
    db.session.commit()
    return render_template("all_members.html", members=Member.query.all())