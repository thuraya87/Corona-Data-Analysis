-- 1. Write a code to check NULL values
SELECT * FROM dataset 
 WHERE 
     'id' IS NULL OR
     'Province' IS NULL OR 
     'Country/Region' IS NULL OR 
     'Latitude' IS NULL OR 
     'Longitude' IS NULL OR 
     'Date' IS NULL OR 
     'Confirmed' IS NULL OR 
     'Deaths' IS NULL OR 
     'Recovered' IS NULL;

-- 2. If NULL values are present, update them with zeros for all columns. -- NO NULL VALUES

-- 3. check total number of rows
SELECT 
     COUNT(*) as total_number_of_records 
FROM 
     dataset;

-- 4. Check what is start_date and end_date
SELECT 
     MIN(date) as start_date, 
     MAX(date) as end_date  
FROM 
     dataset;

-- 5. Number of month present in dataset
 SELECT 
     COUNT(*) AS NUMBER_OF_MONTHS 
 FROM 
     (SELECT
          YEAR(DATE),
          month(DATE) 
      FROM 
          dataset 
      GROUP BY 
          MONTH(DATE), 
          YEAR(DATE)) A;

-- 6. Find monthly average for confirmed, deaths, recovered
SELECT 
    YEAR(date),
    MONTH(date), 
    AVG(CONFIRMED) AS AVG_CONFIRMED, 
    AVG(DEATHS) AS AVG_DEATHS,
    AVG(RECOVERED) AS AVG_RECOVERED 
FROM 
    dataset 
GROUP BY 
    YEAR(Date), 
    MONTH(Date);

-- 7. Find most frequent value for confirmed, deaths, recovered each month
SELECT 
    YEAR(date),
    MONTH(date), 
    Confirmed, 
    count(*) AS NUM_CONFIRMED 
FROM 
    dataset 
GROUP BY 
    YEAR(Date), 
    MONTH(Date),
    Confirmed;

--  8. Find minimum values for confirmed, deaths, recovered per year
SELECT 
    YEAR(date),
    MIN(CONFIRMED) AS MIN_CONFIRMED, 
    MIN(DEATHS) AS MIN_DEATHS, 
    MIN(RECOVERED) AS MIN_RECOVERED 
FROM 
    dataset 
GROUP BY 
    YEAR(Date);

-- 9. Find maximum values of confirmed, deaths, recovered per year
SELECT 
    YEAR(date), 
    MAX(CONFIRMED) AS MAX_CONFIRMED, 
    MAX(DEATHS) AS MAX_DEATHS, 
    MAX(RECOVERED) AS MAX_RECOVERED 
FROM 
    dataset 
GROUP BY 
    YEAR(Date);

-- 10. The total number of case of confirmed, deaths, recovered each month
SELECT 
    YEAR(date),
    MONTH(date),
    sum(Confirmed>0),
    sum(Deaths>0),
    sum(Recovered>0) 
FROM 
    dataset 
GROUP BY 
    YEAR(Date), 
    MONTH(Date);

-- 11. Check how corona virus spread out with respect to confirmed case (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    sum(Confirmed), 
    AVG(CONFIRMED), 
    variance(CONFIRMED), 
    stddev(CONFIRMED) 
FROM 
    dataset;

-- 12. Check how corona virus spread out with respect to death case per month     (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    sum(DEATHS), 
    AVG(DEATHS), 
    variance(DEATHS), 
    stddev(DEATHS) 
FROM 
    dataset;

-- 13. Check how corona virus spread out with respect to recovered case    (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    sum(RECOVERED), 
    AVG(RECOVERED), 
    variance(RECOVERED), 
    stddev(RECOVERED) 
FROM 
    dataset;

-- 14. Find Country having highest number of the Confirmed case
SELECT 
    Country_Region,
    MAX(Confirmed) AS TEST 
FROM 
    dataset 
GROUP BY 
    Country_Region 
ORDER BY 
    TEST DESC LIMIT 1;
 
 -- 15. Find Country having lowest number of the death case
SELECT 
    Country_Region,MAX(DEATHS) AS MIN_DEATHS 
FROM 
    dataset 
GROUP BY 
    Country_Region 
ORDER BY 
    MIN_DEATHS ASC LIMIT 4;
 
 SELECT Country_Region,MAX(RECOVERED) AS MAX_RECOVERED FROM dataset GROUP BY Country_Region ORDER BY MAX_RECOVERED DESC LIMIT 5;
 
 
 
 
