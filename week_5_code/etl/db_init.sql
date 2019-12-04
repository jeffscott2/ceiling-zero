# drop schema housing;
create schema housing;

create table housing.kc_prices (

id int not null primary key auto_increment
, price int
, bedrooms int
, bathrooms int
, sqft_living int
, sqft_lot int
, floors int
, waterfront int
, view int
, cond int
, grade int
, yr_built int
, yr_renovated int
, zipcode int
)