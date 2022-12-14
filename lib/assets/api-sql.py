from sqlalchemy import create_engine
import sqlalchemy as db
from sqlalchemy.orm import sessionmaker
from settings.settings import postgresql as settings
from sqlalchemy.ext.declarative import declarative_base
Base = declarative_base()
def get_engine(user,host,port,db):
    url = f"postgresql://{user}@{host}:{port}/{db}"
    engine = create_engine(url, echo=False)
    return engine

engine = get_engine(settings['pguser'],
                settings["pghost"],
                settings["pgport"],
                settings["pgdb"])


def get_session():
    session = sessionmaker(bind=engine) ()
    return session
     
session = get_session()

class user(Base):

    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key = True)
    email = db.Column(db.String)
    password_digest = db.Column(db.String)

users =session.query(user).all()
for username in users:
    print (username.email)