SELECT COUNT(*) AS Artwork_Count
FROM Artworks_Cleaned_Final;

SELECT COUNT(*) AS Artist_Count
FROM Artists_Cleaned_Final;

-- How modern are the artworks at the Museum?

SELECT
    MIN(Created_Year) AS Oldest_Artwork,
    MAX(Created_Year) AS Newest_Artwork,
    AVG(Created_Year) AS Average_Year
FROM Artworks_Cleaned_Final
WHERE Created_Year > 0;

-- Which artists are featured the most?

SELECT TOP 10
    Artist,
    COUNT(*) AS Artwork_Count
FROM Artworks_Cleaned_Final
WHERE Artist IS NOT NULL
  AND Artist <> ''
  AND Artist <> 'Unknown'
GROUP BY Artist
ORDER BY Artwork_Count DESC;

-- Are there any trends in the dates of acquisition?

SELECT
    DateAcquired_Year,
    COUNT(*) AS Acquisitions
FROM Artworks_Cleaned_Final
WHERE DateAcquired_Year > 0
GROUP BY DateAcquired_Year
ORDER BY DateAcquired_Year;

-- What types of artwork are most common?

SELECT
    Classification,
    COUNT(*) AS Total
FROM Artworks_Cleaned_Final
WHERE Classification IS NOT NULL
  AND Classification <> ''
  and Classification <> '(not assigned)'
GROUP BY Classification
ORDER BY Total DESC;

-- Which Mediums Are Most Used by Artists?

SELECT
    Medium,
    COUNT(*) AS Total_Artworks
FROM Artworks_Cleaned_Final
WHERE Medium IS NOT NULL
  and Medium <> ''
  and Medium <> 'Unknown'
GROUP BY Medium
ORDER BY Total_Artworks DESC;

-- Which nationalities have the most artists?

SELECT
    Nationality,
    COUNT(*) AS Artist_Count
FROM Artists_Cleaned_Final
WHERE Nationality IS NOT NULL
  and Nationality <> ''
  AND Nationality <> 'Nationality unknown'
GROUP BY Nationality
ORDER BY Artist_Count DESC;