import os

from dotenv import load_dotenv
from flask import Flask, flash, render_template, send_from_directory
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
        flash("Member does not exist. Please check that you entered his/her proper first name.")
        return render_template("index.html")
    else:
        return render_template("member.html", member=db_result[0], projects=Project.query.filter_by(owner=db_result[0].id).all())