#!/bin/bash

price_data_file_raw="kc_house_data_raw.csv"
price_data_file_clean="kc_house_data_clean.csv"
price_data_file_sql="kc_house_data_clean.sql"

min_num_rooms_for_analysis=2
price_data_analysis_input="kc_house_data_analysis_input.csv"
analysis_output_pdf="RPlots.pdf"
analysis_log="R_log.txt"

db_host="127.0.0.1"
db_user="root"
db_schema="housing"


echo "# Starting ETL"

# Extract the data from a url (APIs fix here nicely too)
source_url="https://raw.githubusercontent.com/jeffscott2/ceiling-zero/master/week_5_code/kc_house_data.csv"
echo "E: Extracting data from URL to ${price_data_file_raw}"
echo "$ curl -s $source_url -o $price_data_file_raw"
echo ""
#curl -s $source_url -o $price_data_file_raw



# Transform by fixing the exponential notation
echo "T: Cleaning data to: $price_data_file_clean"
echo "$ cat $price_data_file_raw \
| sed 's/\(.\)\./\1/' \
| sed 's/E\+06/0000/' > $price_data_file_clean
"
echo ""
#cat $price_data_file_raw \
#| sed 's/\(.\)\./\1/' \
#| sed 's/E\+06/0000/' > $price_data_file_clean


# Load
echo "L: Generate SQL to insert into the DB"
echo "$ cat $price_data_file_clean \
| grep -v "price" \
| awk '{print \"insert into kc_prices(price,bedrooms,bathrooms,sqft_living,sqft_lot,floors,waterfront,view,cond,grade,yr_built,yr_renovated,zipcode) select \" \$0 \";\"}' \
> $price_data_file_sql"
echo ""

#cat $price_data_file_clean \
#| grep -v "price" \
#| awk '{print "insert into kc_prices(price,bedrooms,bathrooms,sqft_living,sqft_lot,floors,waterfront,view,cond,grade,yr_built,yr_renovated,zipcode) select " $0 ";"}' \
#> $price_data_file_sql


echo "L: Clean the DB table"
echo "$ delete_sql=\"delete from kc_prices\""
echo "$ mysql -e \"\$delete_sql\" -h $db_host -u $db_user $db_schema"
echo ""
#delete_sql="delete from kc_prices"
#mysql -e "$delete_sql" -h $db_host -u $db_user $db_schema



echo "L: Loading clean data to mysql"
echo "$ mysql -h $db_host -u $db_user $db_schema < $price_data_file_sql"
echo ""
#mysql -h $db_host -u $db_user $db_schema < $price_data_file_sql





echo ""
echo "# Starting Analysis"




echo "Exporting CSV of large houses for processing to $price_data_analysis_input"
echo " Filtering houses to those with #bedrooms >= $min_num_rooms_for_analysis"
echo "$ python3 db_data_query.py 2 > $price_data_analysis_input"
echo ""
# python3 db_data_query.py 2 > $price_data_analysis_input



echo "Running Analysis with R"
echo "$ Rscript bootcamp_etl.R $price_data_analysis_input $analysis_output_pdf > $analysis_log"
echo ""
# Rscript bootcamp_etl.R $price_data_analysis_input $analysis_output_pdf > $analysis_log




echo "Done!"