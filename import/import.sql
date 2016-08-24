-- I'm currently storing everything in raw format, just in case we want to add features

-- Surname import
DROP TABLE surnames;
CREATE TABLE surnames (name TEXT,rank INTEGER,count INTEGER,prop100k REAL,cum_prop100k REAL,pctwhite REAL,pctblack REAL,pctapi REAL,pctaian REAL,pct2prace REAL,pcthispanic REAL);
DROP INDEX IF EXISTS surnames_name_idx;
CREATE INDEX surnames_name_idx ON surnames (name ASC);
.mode csv
.import ./app_c.csv surnames

DELETE FROM surnames WHERE name='name';

-- Forename import 
DROP TABLE forenames_female;
CREATE TABLE forenames_female (name TEXT, frequency REAL, cumulative_frequency REAL, rank INTEGER);
DROP INDEX IF EXISTS forenames_male_name_idx;
CREATE INDEX forenames_female_name_idx ON forenames_female (name ASC);

DROP TABLE forenames_male;
CREATE TABLE forenames_male (name TEXT, frequency REAL, cumulative_frequency REAL, rank INTEGER);
DROP INDEX IF EXISTS forenames_male_name_idx;
CREATE INDEX forenames_male_name_idx ON forenames_male (name ASC);

DROP TABLE IF EXISTS _temp_names_import;
CREATE TABLE _temp_names_import (line TEXT);
.mode line
.import ./dist.male.first _temp_names_import

INSERT INTO forenames_male (name, frequency, cumulative_frequency, rank) 
SELECT 
    TRIM(SUBSTR(line, 1, 15)) as name,
    CAST(SUBSTR(line, 16, 6) AS REAL) as frequency,
    CAST(SUBSTR(line, 22, 7) AS REAL) as cumulative_frequency,
    CAST(SUBSTR(line, 31, 5) AS REAL) as rank
FROM _temp_names_import;

DELETE FROM _temp_names_import;

.mode line
.import ./dist.female.first _temp_names_import

INSERT INTO forenames_female (name, frequency, cumulative_frequency, rank)
SELECT 
    TRIM(SUBSTR(line, 1, 15)) as name,
    CAST(SUBSTR(line, 16, 6) AS REAL) as frequency,
    CAST(SUBSTR(line, 22, 7) AS REAL) as cumulative_frequency,
    CAST(SUBSTR(line, 31, 5) AS REAL) as rank
FROM _temp_names_import;

DROP TABLE _temp_names_import;

