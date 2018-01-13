# -*- coding: utf-8 -*-

from sqlalchemy import Column, Integer, String, Text, DateTime
from addb.database import Base
from sqlalchemy.orm import synonym
from werkzeug import check_password_hash, generate_password_hash
from datetime import datetime


class WikiContent(Base):
    __tablename__ = 'wikicontents'                  # テーブル名
    id = Column(Integer, primary_key=True)          # カラム１(id)
    title = Column(String(128), unique=True)        # カラム２(title)
    body = Column(Text)                             # カラム3(body)
    date = Column(DateTime, default=datetime.now()) # カラム４(date) デフォルト現在日時を設定

    def __init__(self, title=None, body=None, date=None):
        self.title = title
        self.body = body
        self.date = date

    def __repr__(self):
        return '<Title %r>' % (self.title)


class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    name = Column(String(100), default='', nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    _password = Column('password', String(100), nullable=False)

    def _get_password(self):
        return self._password
    def _set_password(self, password):
        if password:
            password = password.strip()
        self._password = generate_password_hash(password)
    password_descriptor = property(_get_password, _set_password)
    password = synonym('_password', descriptor=password_descriptor)

    def check_password(self, password):
        password = password.strip()
        if not password:
            return False
        return check_password_hash(self.password, password)

    @classmethod
    def authenticate(cls, query, email, password):
        user = query(cls).filter(cls.email==email).first()
        if user is None:
            return None, False
        return user, user.check_password(password)

    def __repr__(self):
        return u'<User id={self.id} email={self.email!r}>'.format(
                self=self)
