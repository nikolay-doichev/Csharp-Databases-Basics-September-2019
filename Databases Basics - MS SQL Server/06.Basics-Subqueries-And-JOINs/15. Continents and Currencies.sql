SELECT k.ContinentCode, k.CurrencyCode, k.CurrencyUsaga
	FROM(	
	SELECT c.ContinentCode, 
	       c.CurrencyCode, 
	       COUNT(c.CountryCode) AS [CurrencyUsaga],
	   DENSE_RANK() OVER(PARTITION BY c.ContinentCode ORDER BY COUNT(c.CurrencyCode) DESC) AS [CurrencyRank]
	FROM Countries AS c
	GROUP BY c.ContinentCode, c.CurrencyCode
	HAVING  COUNT(c.CountryCode) > 1
	) AS k
	WHERE K.CurrencyRank = 1
	ORDER BY k.ContinentCode, k.CurrencyCode	