USE DSUser
GO
DELETE t FROM dbo.Users t WHERE 1 = 1
DELETE t FROM DSUser.log.ActorLogin t WHERE 1 = 1
DELETE t FROM DSUser.log.UserLogin t WHERE 1 = 1