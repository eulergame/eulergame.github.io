/****** Script for SelectTopNRows command from SSMS  ******/
USE DS
GO	
SELECT 
u.UserID,
Charged=SUM(c.Pay/100),
Money=CAST(SUM(c.Pay/100)*1.5 AS INT),
[Diamond]=CAST(SUM(c.Pay/100)*1.5 AS INT)*10,
[VIPScore]=CAST(SUM(c.Pay/100)*1.5 AS INT)*10,
ActorID=0
  FROM [DS].[dbo].[ChargeLog] c
  JOIN dbo.GameActor a ON a.ActorID = c.ActorID
  JOIN DSUser.dbo.Users u ON u.UserID = a.UserID
  WHERE c.ReasonType>0 AND a.ZoneID IN(1005,1006,1007,1008,1009)
  GROUP BY u.UserID