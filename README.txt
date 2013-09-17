This package sets up a PostgreSQL relational database based on the
ScraperWiki UN-OCHA DAP data.  To use, following the instructions in
data/README.txt to download the three required CSV data files, then
run the setup script (make sure that no database named "scraperwiki"
already exists, or else it will be overwritten):

  sh setup-db.sh

When the script completes (assuming that you have a PostgreSQL user
with appropriate permissions), you will have a database named
"scraperwiki" containing the following tables and views:

- Datasets
- Indicators
- Values
- Regions
- ValueView (a denormalized view of scraped values)

The database uses foreign keys to maintain data integrity.


David Megginson
September, 2013


