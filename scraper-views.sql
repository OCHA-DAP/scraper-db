-- ---------------------------------------------------------------------
-- Basic PostgreSQL views for DAP ScraperWiki data
--
-- Started September 2013 by David Megginson
-- ---------------------------------------------------------------------

-- Combined view of scraped values
drop view if exists ValueView;
create view ValueView as
select V.*, 
 D.last_updated as dataset_last_updated, D.last_scraped as dataset_last_scraped, D.name as dataset_name,
 I.name as indicator_name, I.unit as indicator_unit,
 R.name as region_name
from Values V
join Datasets D using(dsID)
join Indicators I using(indID)
left join Regions R on V.region=R.regionID;

-- end --
