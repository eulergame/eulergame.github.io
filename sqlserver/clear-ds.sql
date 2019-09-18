
-- DS ----------------------------------------------------------
USE DS;
GO
DECLARE @CurrentZoneID SMALLINT = -1
DECLARE @RobotUserID BIGINT = 1

UPDATE dbo.GameServer SET [ServerData] = 0x, OpenTime = '2018-07-20 10:00:00' WHERE ZoneID IN (@CurrentZoneID);


DELETE t FROM dbo.ActorYB t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));
--DELETE t FROM dbo.ActorGift t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));
DELETE t FROM dbo.YBLog t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));
--DELETE t FROM dbo.Activity_Cycle t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.Market t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.Rank_Actor t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));
DELETE t FROM dbo.Rank_Society t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));
DELETE t FROM dbo.Rank_Activity t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.GameGoods t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.GameEmail t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));



DELETE t FROM dbo.Log_Flower t INNER JOIN dbo.GameActor ga ON t.ActorID_Dst = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.ActorTitle t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.ActorRelation t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.ChatOffLine t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));



DELETE t FROM dbo.AeranGame t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));
DELETE t FROM dbo.AeranRecord t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.Challenge t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));
DELETE t FROM dbo.ScoreChallengeChief t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.KingWar t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.CountryWar t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.Country t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));
DELETE t FROM dbo.CountryOfficer t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.SocietyMember t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));


DELETE t FROM dbo.Society t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));



DELETE t FROM dbo.Task t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));
DELETE t FROM dbo.TaskLog t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));

DELETE t FROM dbo.ActorFlag t INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));
DELETE t FROM dbo.GameActor2 t  INNER JOIN dbo.GameActor ga ON t.ActorID = ga.ActorID WHERE ga.UserID > @RobotUserID AND (@CurrentZoneID <= 0 OR ga.ZoneID IN (@CurrentZoneID));
DELETE t FROM dbo.GameActor t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID)) AND UserID > @RobotUserID;