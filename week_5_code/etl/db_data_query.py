import sys
import pymysql
import sqlalchemy
# python3 -m pip install sqlalchemy

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.sql import text

Base = declarative_base()


class KcPrices(Base):
    __tablename__ = 'kc_prices'

    id = Column(Integer, primary_key=True)
    price = Column(Integer)
    bedrooms = Column(Integer)
    bathrooms = Column(Integer)
    sqft_living = Column(Integer)
    sqft_lot = Column(Integer)
    floors = Column(Integer)
    waterfront = Column(Integer)
    view = Column(Integer)
    cond = Column(Integer)
    grade = Column(Integer)
    yr_built = Column(Integer)
    yr_renovated = Column(Integer)
    zipcode = Column(Integer)
    
    def display(self):
        return f"{self.price},{self.bedrooms},{self.bathrooms},{self.sqft_living},{self.sqft_lot},{self.floors},{self.waterfront},{self.view},{self.cond},{self.grade},{self.yr_built},{self.yr_renovated},{self.zipcode}"

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



def query_big_houses(session, min_room_count):

    
    sql = f"""
    select * 
    from kc_prices 
    where bedrooms >= {min_room_count}
    """
    result = session.query(KcPrices).from_statement(text(sql)).all()
    print("price,bedrooms,bathrooms,sqft_living,sqft_lot,floors,waterfront,view,cond,grade,yr_built,yr_renovated,zipcode")
    for row in result:
        # print(type(row))
        print(row.display())






def main(min_room_count):
    engine, session = connect_via_sql_alchemy("root", None, "127.0.0.1", "housing")
    query_big_houses(session, min_room_count)
    session.close()


if __name__ == "__main__":
    arg_count = len(sys.argv) - 1
    if arg_count == 0:
        min_room_count = 0
    else:
        min_room_count = sys.argv[1]

    main(min_room_count)