import pymysql
import sqlalchemy
# python3 -m pip install sqlalchemy

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.sql import text

Base = declarative_base()

class Film(Base):
    __tablename__ = 'film'

    film_id = Column(Integer, primary_key=True)
    title = Column(String)
    description  = Column(String)
    
    def display(self):
        return f"{self.film_id}, {self.title}, {self.description}"

def connect_via_sql_alchemy(user, password, host, dbname):

    #'mysql+pymysql://<username>:<password>@<host>/<dbname>[?<options>]'
    if password is None :
        connection_string = f"mysql+pymysql://{user}@{host}/{dbname}"
    else:
        connection_string = f"mysql+pymysql://{user}:{password}@{host}/{dbname}"
    engine = create_engine(connection_string)
    Session = sessionmaker(bind=engine)
    session = Session()
    return engine, session

engine, session = connect_via_sql_alchemy("root", None, "127.0.0.1", "sakila")

# query = session.query(Film)
# result = query.all()
# for row in result:
#     print(row.display())


# query = session.query(Film).filter(Film.film_id.__eq__(1))
# result = query.all()
# for row in result:
#     print(row.display())

# is that better than "select * from film where film_id = 1"  ?


# sql = 'select * from film where film_id = 1'
# #result = engine.execute(text(sql), group = 'Film')
# result = engine.execute(text(sql))
# print(result)
# for row in result:
#     print(type(row))
#     print(row.film_id)


sql = 'select * from film where film_id in (1,4,50)'
result = session.query(Film).from_statement(text(sql)).all()
for row in result:
    # print(type(row))
    print(row.display())



ids="1,4,50"
sql = f"""
select * 
from film 
where film_id in ({ids})
"""
result = session.query(Film).from_statement(text(sql)).all()
for row in result:
    # print(type(row))
    print(row.display())



session.close()