-- ---------------------------------------------------------------------
-- Basic PostgreSQL schema for DAP ScraperWiki data
--
-- Started September 2013 by David Megginson
-- ---------------------------------------------------------------------

-- Sources of scraped data
create table Datasets (
  dsID varchar(64) primary key,
  last_updated varchar(32),
  last_scraped varchar(32),
  name varchar(128)
);

-- Definition of indicator types
create table Indicators (
  indID varchar(128) primary key,
  name varchar(128),
  unit varchar(128)
);

-- Scraped values for the indicators
create table Values (
  dsID varchar(64) not null,
  region varchar(8),
  indID varchar(128) not null,
  period varchar(32),
  value varchar(256),
  is_number boolean default false,
  source text,
  foreign key(dsID) references Datasets(dsID),
  foreign key(indID) references Indicators(indID)
);

-- Derived table of regions (entities)
create table Regions (
  regionID varchar(8) primary key,
  name varchar(128)
);

-- end --
