local region = {}
  region.cmd = "fly xyl;|!mmdd::ok|"
  region.name = "逍遥林1"
  region.id = "xyl1"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly ws;wd;nd;nd;wu;wu"
      region.rooms[1].name = "舍身崖"
      region.rooms[1].zone = "华山|逍遥林1"
      region.rooms[1].id = 2679
      region.rooms[1].desc = "    这是一段极窄极险的山崖，四周云雾飞绕，下面渊深无底。如不小心，一失足掉下去，只怕连骨头都找不到。边上有个小山洞(dong)。"
      region.rooms[1].exits = "eastdown|west"
      region.rooms[1].links = {}
        region.rooms[1].links.ed = {}
          region.rooms[1].links.ed.to = 2677
          region.rooms[1].links.ed.con = ""
        region.rooms[1].links.w = {}
          region.rooms[1].links.w.to = 2680
          region.rooms[1].links.w.con = ""
    region.rooms[2] = {}
      region.rooms[2].path = "fly ws;wd;nd;nd;wu;wu;w"
      region.rooms[2].name = "瀑布"
      region.rooms[2].zone = "华山|逍遥林1"
      region.rooms[2].id = 2680
      region.rooms[2].desc = "    你猛听得水声响亮，轰轰隆隆，便如潮水大至一般，抬头一看，只见一条大瀑布，犹如银河倒悬，从高崖上直泻下来。下面是万丈深渊，云雾弥漫，望不到尽头。。。。"
      region.rooms[2].exits = "east"
      region.rooms[2].links = {}
        region.rooms[2].links.e = {}
          region.rooms[2].links.e.to = 2679
          region.rooms[2].links.e.con = ""
        region.rooms[2].links["jump down"] = {}
          region.rooms[2].links["jump down"].to = 2759
          region.rooms[2].links["jump down"].con = "xyjump:"
    region.rooms[3] = {}
      region.rooms[3].path = "fly xyl;|!mmdd::ok|;u;u;s;w;s;s;out;e;u"
      region.rooms[3].name = "岩缝"
      region.rooms[3].zone = "逍遥林1"
      region.rooms[3].id = 2759
      region.rooms[3].links = {}
        region.rooms[3].links.u = {}
          region.rooms[3].links.u.to = 2680
          region.rooms[3].links.u.con = ""
        region.rooms[3].links.d = {}
          region.rooms[3].links.d.to = 2760
          region.rooms[3].links.d.con = ""
      region.rooms[3].exits = "up|down"
      region.rooms[3].desc = "    忽然，你感觉到被什么东西钩了一下，原来是一棵横着伸出悬崖的古松止住了下坠之势，细看山崖中裂开了一条大缝，似乎可以攀缘而下。"
    region.rooms[4] = {}
      region.rooms[4].path = "fly xyl;|!mmdd::ok|;u;u;s;w;s;s;out;e"
      region.rooms[4].name = "谷底"
      region.rooms[4].zone = "逍遥林1"
      region.rooms[4].id = 2760
      region.rooms[4].links = {}
        region.rooms[4].links.u = {}
          region.rooms[4].links.u.to = 2759
          region.rooms[4].links.u.con = ""
        region.rooms[4].links.w = {}
          region.rooms[4].links.w.to = 2761
          region.rooms[4].links.w.con = ""
      region.rooms[4].exits = "up|west"
      region.rooms[4].desc = "    但听得耳边轰聋聋的响声越来越大，山崖也逐渐变得倾斜，而不再象上面那么陡峭笔立了，终于到达谷底了。只见上面的上崖一条大瀑布如玉龙悬空，滚滚而下，倾入了一座清澈异常的大湖之中。甚为壮观。"
    region.rooms[5] = {}
      region.rooms[5].path = "fly xyl;|!mmdd::ok|;u;u;s;w;s;s;out"
      region.rooms[5].name = "湖边"
      region.rooms[5].zone = "逍遥林1"
      region.rooms[5].id = 2761
      region.rooms[5].links = {}
        region.rooms[5].links.e = {}
          region.rooms[5].links.e.to = 2760
          region.rooms[5].links.e.con = ""
        region.rooms[5].links["enter hole"] = {}
          region.rooms[5].links["enter hole"].to = 2762
          region.rooms[5].links["enter hole"].con = "xylpush:"
      region.rooms[5].exits = "east"
      region.rooms[5].desc = "    这个就是谷底的大湖，湖水一平入镜，月光映入湖中，湖心也是一轮皎洁的圆月。湖畔还生着一丛丛各式各样的茶花。在月光下摇曳生姿。此湖呈椭圆形，大部分隐入了花树丛中。东南西北全是岩石(stone)和悬崖(xuanya)，但是悬崖十分陡峭，即使是绝顶的高手，也无法攀缘而上。"
    region.rooms[6] = {}
      region.rooms[6].path = "fly xyl;|!mmdd::ok|;u;u;s;w;s;s"
      region.rooms[6].name = "岩洞"
      region.rooms[6].zone = "逍遥林1"
      region.rooms[6].id = 2762
      region.rooms[6].links = {}
        region.rooms[6].links.n = {}
          region.rooms[6].links.n.to = 2763
          region.rooms[6].links.n.con = ""
        region.rooms[6].links.out = {}
          region.rooms[6].links.out.to = 2761
          region.rooms[6].links.out.con = ""
      region.rooms[6].exits = "north|out"
      region.rooms[6].desc = "    这里四周没有丝毫的光亮，每前进一步，都要先试探个虚实，但是却觉得脚下平整，便似走在石板路上一般，只见道路不断地往下倾斜，越走越低。"
    region.rooms[7] = {}
      region.rooms[7].path = "fly xyl;|!mmdd::ok|;u;u;s;w;s"
      region.rooms[7].name = "石室大门"
      region.rooms[7].zone = "逍遥林1"
      region.rooms[7].id = 2763
      region.rooms[7].links = {}
        region.rooms[7].links.s = {}
          region.rooms[7].links.s.to = 2762
          region.rooms[7].links.s.con = ""
        region.rooms[7].links.n = {}
          region.rooms[7].links.n.to = 2764
          region.rooms[7].links.n.con = ""
      region.rooms[7].exits = "south|north"
      region.rooms[7].desc = "    穿多岩洞，突然之间，手碰到一个冷冰冰的圆物，原来是个门环，门环的后面象是一扇铜铁铸成的大门，十分沉重。即使是臂力很好的人，推它也觉得甚为吃力。"
    region.rooms[8] = {}
      region.rooms[8].path = "fly xyl;|!mmdd::ok|;u;u;s;w"
      region.rooms[8].name = "石洞"
      region.rooms[8].zone = "逍遥林1"
      region.rooms[8].id = 2764
      region.rooms[8].links = {}
        region.rooms[8].links.e = {}
          region.rooms[8].links.e.to = 2769
          region.rooms[8].links.e.con = ""
        region.rooms[8].links.s = {}
          region.rooms[8].links.s.to = 2763
          region.rooms[8].links.s.con = ""
        region.rooms[8].links.w = {}
          region.rooms[8].links.w.to = 2765
          region.rooms[8].links.w.con = ""
        region.rooms[8].links.n = {}
          region.rooms[8].links.n.to = 2768
          region.rooms[8].links.n.con = ""
      region.rooms[8].exits = "south|east|north|west"
      region.rooms[8].desc = "    这是一个比较大的圆形石洞，光亮从左边的窗口透了过来，细看那窗的时候，发现原来是镶在石壁上的一块大水晶透过水晶向外看去，只见鱼虾水族来回游动，原来你竟处身水底之中！"
    region.rooms[9] = {}
      region.rooms[9].path = "fly xyl;|!mmdd::ok|;u;u;s;w;w"
      region.rooms[9].name = "石级"
      region.rooms[9].zone = "逍遥林1"
      region.rooms[9].id = 2765
      region.rooms[9].links = {}
        region.rooms[9].links.e = {}
          region.rooms[9].links.e.to = 2764
          region.rooms[9].links.e.con = ""
        region.rooms[9].links.w = {}
          region.rooms[9].links.w.to = 2766
          region.rooms[9].links.w.con = ""
        region.rooms[9].links.n = {}
          region.rooms[9].links.n.to = 2767
          region.rooms[9].links.n.con = ""
      region.rooms[9].exits = "north|east|west"
      region.rooms[9].desc = "    这是一段长长的石级，四周由于缺乏光亮，难免有点阴深深的感觉，石级向着东西两面伸展，一眼望去，不可以望到尽头。"
    region.rooms[10] = {}
      region.rooms[10].path = "fly xyl;|!mmdd::ok|;u;u;s;w;w;w"
      region.rooms[10].name = "石室"
      region.rooms[10].zone = "逍遥林1"
      region.rooms[10].id = 2766
      region.rooms[10].links = {}
        region.rooms[10].links.e = {}
          region.rooms[10].links.e.to = 2765
          region.rooms[10].links.e.con = ""
      region.rooms[10].exits = "east"
      region.rooms[10].desc = "    这是一个石头砌成的房间，因为好久没有人来过，散发着一些很难闻的气味，房间中到处可以看到蛛丝和虫迹。"
    region.rooms[11] = {}
      region.rooms[11].path = "fly xyl;|!mmdd::ok|;u;u;s;w;w;n"
      region.rooms[11].name = "房间"
      region.rooms[11].zone = "逍遥林1"
      region.rooms[11].id = 2767
      region.rooms[11].links = {}
        region.rooms[11].links.s = {}
          region.rooms[11].links.s.to = 2765
          region.rooms[11].links.s.con = ""
      region.rooms[11].exits = "south"
      region.rooms[11].desc = "    可以看出这里以前曾经是一个下棋的地方，房间除了一张石几，两只软椅之外，空荡荡的一无所有，石几上刻着纵横十九道棋路，棋局上布着二百多颗棋子，却是黑白对峙，竟然是一局没有下完的棋。"
    region.rooms[12] = {}
      region.rooms[12].path = "fly xyl;|!mmdd::ok|;u;u;s;w;n"
      region.rooms[12].name = "石室"
      region.rooms[12].zone = "逍遥林1"
      region.rooms[12].id = 2768
      region.rooms[12].links = {}
        region.rooms[12].links.s = {}
          region.rooms[12].links.s.to = 2764
          region.rooms[12].links.s.con = ""
        region.rooms[12].links["move bed"] = {}
          region.rooms[12].links["move bed"].to = 2775
          region.rooms[12].links["move bed"].con = ""
      region.rooms[12].exits = "south"
      region.rooms[12].desc = "    这里是一个极大的石室，比之外面的任何一个都大了数倍，室中一排排地列满了木制成的书架(shelf),可是书架上却空荡荡地连一本书也没有，走近看时，只见书架上贴满了“昆仑派”，“少林派”，“青城派”之类的条目，想象当年所列，皆是各门各派的武功秘籍。室中还有一张小床(bed)。"
    region.rooms[13] = {}
      region.rooms[13].path = "fly xyl;|!mmdd::ok|;u;u;s"
      region.rooms[13].name = "石级"
      region.rooms[13].zone = "逍遥林1"
      region.rooms[13].id = 2769
      region.rooms[13].links = {}
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 2771
          region.rooms[13].links.e.con = ""
        region.rooms[13].links.w = {}
          region.rooms[13].links.w.to = 2764
          region.rooms[13].links.w.con = ""
        region.rooms[13].links.n = {}
          region.rooms[13].links.n.to = 2770
          region.rooms[13].links.n.con = ""
      region.rooms[13].exits = "north|east|west"
      region.rooms[13].desc = "    这是一段长长的石级，四周由于缺乏光亮，难免有点阴深深的感觉，石级向着东西两面伸展，一眼望去，不可以望到尽头。"
    region.rooms[14] = {}
      region.rooms[14].path = "fly xyl;|!mmdd::ok|;u;u"
      region.rooms[14].name = "房间"
      region.rooms[14].zone = "逍遥林1"
      region.rooms[14].id = 2770
      region.rooms[14].links = {}
        region.rooms[14].links.s = {}
          region.rooms[14].links.s.to = 2769
          region.rooms[14].links.s.con = ""
      region.rooms[14].exits = "south"
      region.rooms[14].desc = "    这是一间布置成卧室模样的小房间，有张石床，床上摆着个小小的木头制成的摇篮，墙壁上悬着一个七弦琴，弦线都已经断了。"
    region.rooms[15] = {}
      region.rooms[15].path = "fly xyl;|!mmdd::ok|;u;u;s;e"
      region.rooms[15].name = "石室"
      region.rooms[15].zone = "逍遥林1"
      region.rooms[15].id = 2771
      region.rooms[15].links = {}
        region.rooms[15].links.w = {}
          region.rooms[15].links.w.to = 2769
          region.rooms[15].links.w.con = ""
        region.rooms[15].links["open door;n"] = {}
          region.rooms[15].links["open door;n"].to = 2772
          region.rooms[15].links["open door;n"].con = ""
      region.rooms[15].exits = "west"
      region.rooms[15].desc = "    这是一个石头砌成的房间，因为好久没有人来过，散发着一些很难闻的气味，房间中到处可以看到蛛丝和虫迹。"
    region.rooms[16] = {}
      region.rooms[16].path = "fly xyl;|!mmdd::ok|;u;u;s;e;open door;n"
      region.rooms[16].name = "石级"
      region.rooms[16].zone = "逍遥林1"
      region.rooms[16].id = 2772
      region.rooms[16].links = {}
        region.rooms[16].links.s = {}
          region.rooms[16].links.s.to = 2771
          region.rooms[16].links.s.con = ""
        region.rooms[16].links.n = {}
          region.rooms[16].links.n.to = 2773
          region.rooms[16].links.n.con = ""
      region.rooms[16].exits = "south|north"
      region.rooms[16].desc = "    这是一段向南北方向伸展的石级，四周由于缺乏光亮，难免有点阴深深的感觉，北面是个月形的铜门，南面是个石室。"
    region.rooms[17] = {}
      region.rooms[17].path = "fly xyl;|!mmdd::ok|;u;u;s;e;open door;n;n"
      region.rooms[17].name = "铜门"
      region.rooms[17].zone = "逍遥林1"
      region.rooms[17].id = 2773
      region.rooms[17].links = {}
        region.rooms[17].links.s = {}
          region.rooms[17].links.s.to = 2772
          region.rooms[17].links.s.con = ""
        region.rooms[17].links.w = {}
          region.rooms[17].links.w.to = 2774
          region.rooms[17].links.w.con = ""
      region.rooms[17].exits = "south|west"
      region.rooms[17].desc = "    这是一个月形的铜门，门旁的壁上凿着“琅环福地”四个大字。"
    region.rooms[18] = {}
      region.rooms[18].path = "fly xyl;|!mmdd::ok|;u;u;s;e;open door;n;n;w"
      region.rooms[18].name = "房间"
      region.rooms[18].zone = "逍遥林1"
      region.rooms[18].id = 2774
      region.rooms[18].links = {}
        region.rooms[18].links.e = {}
          region.rooms[18].links.e.to = 2773
          region.rooms[18].links.e.con = ""
      region.rooms[18].exits = "east"
      region.rooms[18].desc = "    你只觉得眼前陡然一亮，一个宫装的美女，正拿着一把长剑，对准了你的胸膛！。。。。一场虚惊之后，你才发现原来只是个白玉雕成的玉像，但是看上去却与真人一般无异。玉像的一双眸子莹然有光，神采飞扬。你此时只觉得神驰目眩，竟如着魔中邪，眼光再也离不开玉像。。。。"
    region.rooms[19] = {}
      region.rooms[19].path = "fly xyl;|!mmdd::ok|;u;u;s;w;n;move bed"
      region.rooms[19].name = "秘密通道"
      region.rooms[19].zone = "逍遥林1"
      region.rooms[19].id = 2775
      region.rooms[19].links = {}
        region.rooms[19].links.n = {}
          region.rooms[19].links.n.to = 2776
          region.rooms[19].links.n.con = ""
        region.rooms[19].links.out = {}
          region.rooms[19].links.out.to = 2768
          region.rooms[19].links.out.con = ""
      region.rooms[19].exits = "north|out"
      region.rooms[19].desc = "    这是一段又长又黑的秘密通道，隐约可以感觉到四周是冰冷而坚硬的石壁，你什么了看不清楚，只可以靠摸索着前进。"
    region.rooms[20] = {}
      region.rooms[20].path = "fly xyl;|!mmdd::ok|;u;u;s;w;n;move bed;n"
      region.rooms[20].name = "秘密通道"
      region.rooms[20].zone = "逍遥林1"
      region.rooms[20].id = 2776
      region.rooms[20].links = {}
        region.rooms[20].links.s = {}
          region.rooms[20].links.s.to = 2775
          region.rooms[20].links.s.con = ""
        region.rooms[20].links.n = {}
          region.rooms[20].links.n.to = 2777
          region.rooms[20].links.n.con = ""
      region.rooms[20].exits = "south|north"
      region.rooms[20].desc = "    这是一段又长又黑的秘密通道，隐约可以感觉到四周是冰冷而坚硬的石壁，你什么了看不清楚，只可以靠摸索着前进。"
    region.rooms[21] = {}
      region.rooms[21].path = "fly xyl;|!mmdd::ok|;u;u;s;w;n;move bed;n;n"
      region.rooms[21].name = "秘密通道"
      region.rooms[21].zone = "逍遥林1"
      region.rooms[21].id = 2777
      region.rooms[21].links = {}
        region.rooms[21].links.s = {}
          region.rooms[21].links.s.to = 2776
          region.rooms[21].links.s.con = ""
      region.rooms[21].exits = "south|out"
      region.rooms[21].desc = "    这是一段又长又黑的秘密通道，隐约可以感觉到四周是冰冷而坚硬的石壁，你什么了看不清楚，只可以靠摸索着前进。"
    region.rooms[22] = {}
      region.rooms[22].path = "fly xyl;|!mmdd::ok|"
      region.rooms[22].name = "地下石室"
      region.rooms[22].zone = "逍遥林1"
      region.rooms[22].id = 2981
      region.rooms[22].desc = "    这里是地下石室的最下面一层了，四周是黑乎乎，说不出的阴深恐怖，你可以闻到强烈的腐烂的东西所发出的气味。看来还是快点离开比较好。"
      region.rooms[22].exits = "up"
      region.rooms[22].links = {}
        region.rooms[22].links.u = {}
          region.rooms[22].links.u.to = 2982
          region.rooms[22].links.u.con = ""
    region.rooms[23] = {}
	  region.rooms[23].danger = 3
      region.rooms[23].path = "fly xyl;|!mmdd::ok|;u"
      region.rooms[23].name = "地下石室"
      region.rooms[23].zone = "逍遥林1"
      region.rooms[23].id = 2982
      region.rooms[23].desc = "    这是一个地下的秘密石室，四面可以感觉得到的只有强烈的杀气，以及处身地底的一些难闻的气味。在微弱的灯光下，你竟然看到有个人站着那里。继续往下好象还有路。"
      region.rooms[23].exits = "down|up"
      region.rooms[23].links = {}
        region.rooms[23].links.u = {}
          region.rooms[23].links.u.to = 2770
          region.rooms[23].links.u.con = ""
        region.rooms[23].links.d = {}
          region.rooms[23].links.d.to = 2981
          region.rooms[23].links.d.con = ""
  region.center = 2981
return region