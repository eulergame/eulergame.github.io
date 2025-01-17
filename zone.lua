﻿print("zones ...")

Global_SpecialDevice = {"IMEI=864682033163841", "IMEI=865546034339628", "IMEI=866442037945612", "IMEI=351956085410684"}
--下面是特殊区名，左边大列表的区名，如果不填则显示1-10,11-20等
ZoneName =
{
	[1] = '公测44-99区',
	[10] = '区名窝',
	[20] = '区名窝20',
	[30] = '区名窝30',
	[40] = '区名窝40',
	[100] = '区名窝100',

}

Zone_DefaultTip3 = '服务器维护中，如果实在没什么事干，可以买块豆腐撞死？'

--state：0没有 1畅通 2繁忙 3维护
--flag： 0没有 1推荐 2新服
-- index, ip, port, name, id, state, flag, notice
--【Zone_DefaultTip3】是默认通用的维护提示，每个服务器最后一列不填，维护则弹出这个提示，否则弹每个服务器自己单独的维护提示
--[1] = {1,"118.25.108.97",5000, "楚汉之始","10000","1","2","服务器于3月28日15:30进行例行维护，预计维护3小时！","2035-03-15 18:00",islocal = 1 },
Zones = 
{
	[1] = {1, "127.1.1.1", 5002, "本机1私服1", "101","1","2","服务器于3月28日15:30进行例行维护，预计维护3小时！","2035-03-15 18:00" ,islocal = 1 },
        [2] = {2,"172.16.3.140",5002, "温德兴" ,"101","1" ,"2" ,"服务器于12月18日15：00开启！" ,"2028-05-06 15:00" ,islocal = 1 },
        [3] = {3,"172.16.3.140",5002, "温德兴50001" ,"2001","1" ,"2" ,"服务器于12月18日15：00开启！" ,"2028-05-06 15:00" },
        [4] = {4,"1.234.59.195",5003,"韩国测试服","2002","1","2","欢迎进入游戏","" },
	[100] = { 100, "127.1.1.1", 5002, "本机1私服", "101", "1", "1", "这个服务器自己单独维护提示", "2999-03-27 20:00" ,islocal = 1 },
	[101] = { 101, "172.16.1.59", 5002, "老张1.59", "101", "1", "1", "维护公告", "" ,islocal = 1 },
	[102] = { 102, "134.175.165.242",4997, "123","101","0" ,"0" ,"服务器于6月05日10:00-12:00维护！" ,"2019-05-06 15:00" ,islocal = 1 },
	[103] = { 103, "172.16.40.54", 5002, "阿发", "101", "1", "1", "维护公告", "2019-03-27 20:00" ,islocal = 1 },
	[109] = { 109, "172.16.1.58", 5002, "housen", "101", "1", "2", "维护公告", "" ,islocal = 1 },
	[110] = { 110, "172.16.1.62", 5002, "张琦", "101", "1", "2", "维护公告" ,islocal = 1 },
	[111] = { 111, "172.16.4.69", 5002, "zzx", "101", "1", "1", "维护公告", "2018-03-03 20:00" ,islocal = 1 },
	[112] = { 112,"172.16.9.220",5002,"孙俊","101","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[113] = { 113,"172.16.40.141",5002,"邹和助","101","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[114] = { 114,"172.16.198.4",5002,"罗华","101","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[116] = { 116,"172.16.4.61",5002,"陈锋锐","101","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[117] = { 117,"172.16.4.48",5002,"胡予诚","101","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[118] = { 118, "172.16.4.53", 6000, "老张2", "102", "1", "1", "维护公告", "" ,islocal = 1 },
	[120] = { 120,"172.16.1.60",5002,"廖佳琳","101","1","2","欢迎进入游戏","2035-03-15 18:00" ,islocal = 1 },
	[121] = { 121,"172.16.1.56",5002,"吴奇达2","101","1","2","欢迎进入游戏183.14.29.237","2035-03-15 18:00" ,islocal = 1 },
	[122] = { 122,"172.16.4.39",5002,"赵志豪","101","1","2","欢迎进入游戏","2035-03-15 18:00" ,islocal = 1 },
        [123] = { 123,"134.175.165.242",4997, "微软云测试服","1","0" ,"0" ,"服务器于6月05日10:00-12:00维护！" ,"2019-05-06 15:00" ,islocal = 1 },
        [124] = { 124,"134.175.165.242",4997, "微软云测试服1","1","0" ,"0" ,"服务器于6月05日10:00-12:00维护！" ,"2019-05-06 15:00" ,islocal = 1 },
        [125] = { 125,"210.211.124.35",5001, "越南版本","1001","0" ,"0" ,"服务器于6月05日10:00-12:00维护！" ,"2019-05-06 15:00" ,islocal = 1 },
        [126] = { 126,"40.73.97.187",4993,"11111","7","1","1","","" },
        [127] = { 127,"40.73.103.88",5002, "内部测试服1" ,"1002","0" ,"0" ,"服务器将于9月20日10:00-11:00停服维护！" ,"2028-05-06 15:00" ,islocal = 1 },
        [131] = { 131,"172.16.1.11",5999, "发-200" ,"200","0" ,"0" ,"服务器将于9月20日10:00-11:00停服维护！" ,"2028-05-06 15:00" ,islocal = 1 },
        [132] = { 132,"172.16.1.11",5999, "发-201" ,"201","0" ,"0" ,"服务器将于9月20日10:00-11:00停服维护！" ,"2028-05-06 15:00" ,islocal = 1 },
        [133] = { 133,"172.16.1.11",5999, "发-202" ,"202","0" ,"0" ,"服务器将于9月20日10:00-11:00停服维护！" ,"2028-05-06 15:00" ,islocal = 1 },
	[134] = { 134, "172.16.1.58", 5999, "housen-200", "200", "1", "2", "维护公告", "" ,islocal = 1 },
	[135] = { 135, "172.16.1.58", 5999, "housen-201", "201", "1", "2", "维护公告", "" ,islocal = 1 },
	[136] = { 136, "172.16.1.58", 5999, "housen-202", "202", "1", "2", "维护公告", "" ,islocal = 1 },
	[137] = { 137,"172.16.40.30",5999,"水哥-200","200","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[138] = { 138,"172.16.40.30",5999,"水哥-201","201","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[139] = { 139,"172.16.40.30",5999,"水哥-202","202","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[140] = { 140,"172.16.198.4",5999,"罗华-200","200","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[141] = { 141,"172.16.198.4",5999,"罗华-201","201","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[142] = { 142,"172.16.198.4",5999,"罗华-202","202","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[143] = { 143,"172.16.1.62",5999,"张琦-200","200","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[144] = { 144,"172.16.1.62",5999,"张琦-201","201","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[145] = { 145,"172.16.1.62",5999,"张琦-202","202","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[146] = { 146,"172.16.1.63",5999,"孙俊-200","200","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[147] = { 147,"172.16.1.63",5999,"孙俊-201","201","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[148] = { 148,"172.16.1.63",5999,"孙俊-202","202","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[149] = { 149,"172.16.4.61",5999,"张阳莉-200","200","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[150] = { 150,"172.16.4.61",5999,"张阳莉-201","201","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[151] = { 151,"172.16.4.61",5999,"张阳莉-202","202","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[152] = { 152,"172.16.1.71",5002,"zhangmengli","101","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[153] = { 153,"172.16.1.56",5999,"吴奇达-200","200","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[154] = { 154,"172.16.1.56",5999,"吴奇达-201","201","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[155] = { 155,"172.16.1.56",5999,"吴奇达-202","202","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[156] = { 156,"172.16.1.67",5002,"fa-101","101","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[157] = { 157, "127.1.1.1", 5999, "本机私服200", "200","1","2","服务器于3月28日15:30进行例行维护，预计维护3小时！","2035-03-15 18:00" ,islocal = 1 },
	[158] = { 158,"172.16.1.60",5999,"廖佳琳-200","200","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
	[159] = { 159,"172.16.1.51",5999,"温德兴-200","200","1","2","欢迎进入游戏172.16.4.47","" ,islocal = 1 },
}

NoticeContent = '各位将士：\n     传承经典、热血国战！由墨和游戏、逐鹿游戏联合打造的年度精品\nMMORPG手游《项羽传》先遣测试服将于2017年1月15日正式开启，邀\n您共赴热血之战！\n\n【测试服名称】巨鹿之战\n【开服时间】2017年1月15日10:00\n【官方QQ群】659682803（私聊群主可领取豪华大礼包）\n\n【先遣服】\n     最新游戏动态、最新内容率先体验！\n     先遣测试期间，充值任意金额，公测时300%返还！！\n\n【先遣专属福利】\n     为答谢广大玩家的喜爱，先遣专属福利送不停：在线礼包、等级礼\n包、首充豪礼、开服系列活动等诸多活动等您来拿！\n\n     由于先遣服的内容尚处于调优阶段，体验过程中可能偶尔会遇到卡\n顿、掉线等异常情况。可以第一时间通过官方Q群或游戏内反馈给我们，\n我们会第一时间妥善处理，为大家营造一个良好的游戏环境。\n\n     在游戏探索过程中，您对游戏有任何的意见或建议，也可以随时\n联系我们，我们很乐于听取您的意见和建议，感谢您对游戏的支持，\n祝您游戏愉快。\n                                         《项羽传》运营团队'
NoticeFlag = 0   --0不主动显示；1内容不同的时候主动显示
---GetTimeUrl = 'http://134.175555.179.214:81/monitor/gettime'  ----取资源服时间，判断开服、公告用

--推荐区
Zones.default = 1
--Zones[1].islocal = 1
return Zones