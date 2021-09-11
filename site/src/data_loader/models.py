from app import db
from sqlalchemy import Table, Column, Integer, ForeignKey, DateTime
from sqlalchemy.orm import relationship


class Member(db.Model):
    __tablename__ = 'members'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    fname = db.Column(db.String(32), nullable=False)
    lname = db.Column(db.String(32), nullable=False)
    grade = db.Column(db.Integer, nullable=False)
    image = db.Column(db.String(64), nullable=False)
    position = db.Column(db.String(16), nullable=False)
    description = db.Column(db.String(256))

    def toString(self):
        print(f"{self.fname} {self.lname}")


class Project(db.Model):
    __tablename__ = 'projects'
    pid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(32), nullable=False)
    owner = db.Column(db.Integer, db.ForeignKey('members.id'), nullable=False)
    image = db.Column(db.String(64), nullable=False)
    description = db.Column(db.String(256))

    def toString(self):
        print(self.name)


class Contact(db.Model):
    __tablename__ = 'contacts'
    cid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    link = db.Column(db.String(128), nullable=False)
    icon = db.Column(db.String(64), nullable=False)
    member = db.Column(db.Integer, db.ForeignKey('members.id'), nullable=False)

    def toString(self):
        print(f"{self.member} {self.icon}")


class Language(db.Model):
    __tablename__ = 'languages'
    lid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    language = db.Column(db.String(32), nullable=False)
    member = db.Column(db.Integer, db.ForeignKey('members.id'), nullable=False)

    def toString(self):
        print(f"{self.member} {self.language}")