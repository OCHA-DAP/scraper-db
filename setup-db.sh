#!/bin/sh
########################################################################
# Create and set up a PostgreSQL database of ScraperWiki DAP data
#
# Started September 2013 by David Megginson
########################################################################

echo "Setting up database ..."
echo 'drop database scraperwiki;' | psql
echo 'create database scraperwiki;' | psql
cat scraper-schema.sql | psql scraperwiki
cat scraper-views.sql | psql scraperwiki

echo "Loading datasets ..."
cp -f data/dataset.csv /tmp
echo "copy Datasets from '/tmp/dataset.csv' delimiter ',' header csv;" | psql scraperwiki
rm -f /tmp/dataset.csv

echo "Loading indicators ..."
cp -f data/indicator.csv /tmp
echo "copy Indicators from '/tmp/indicator.csv' delimiter ',' header csv;" | psql scraperwiki
rm -f /tmp/indicator.csv

echo "Loading values ..."
cp -f data/value.csv /tmp
echo "copy Values from '/tmp/value.csv' delimiter ',' header csv;" | psql scraperwiki
rm -f /tmp/value.csv

echo "Generating region list ..."
echo "insert into Regions select region, value from Values where indid='m49-name' and region is not null;" | psql scraperwiki
echo "alter table values add foreign key(region) references Regions(regionId);" | psql scraperwiki

# end
