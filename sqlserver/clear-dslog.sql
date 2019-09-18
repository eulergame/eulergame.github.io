-- DSLog -------------------------------------------------------
USE DSLog;
GO
DECLARE @CurrentZoneID SMALLINT = -1


DELETE t FROM log.ActorGoods t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));
DELETE t FROM log.GoodsSmelt t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));


DELETE t FROM log.ActorLevel t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));

DELETE t FROM log.ActorValue t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));


DELETE t FROM log.CppCache t WHERE (@CurrentZoneID <= 0 OR ZoneID IN (@CurrentZoneID));
