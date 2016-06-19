local region = {}
  region.cmd = "fly bj;#6 w"
  region.name = "黑木崖1"
  region.id = "hmy1"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly bj;#6 w"
      region.rooms[1].name = "平定州"
      region.rooms[1].zone = "黑木崖1"
      region.rooms[1].id = 2906
      region.rooms[1].links = {}
        region.rooms[1].links.e = {}
          region.rooms[1].links.e.to = 1048
          region.rooms[1].links.e.con = ""
        region.rooms[1].links.w = {}
          region.rooms[1].links.w.to = 2907
          region.rooms[1].links.w.con = ""
      region.rooms[1].exits = "east|west"
      region.rooms[1].desc = "    平定州在河北境内，州府不大，但地处要冲，十分重要。往来京城的客商穿梭频繁。但大街上日月教徒横冲直撞，出手抓人，虽近在京畿，却丝毫没将官府放在眼里。"
    region.rooms[2] = {}
      region.rooms[2].path = "fly bj;#6 w;w"
      region.rooms[2].name = "黄土路"
      region.rooms[2].zone = "黑木崖1"
      region.rooms[2].id = 2907
      region.rooms[2].links = {}
        region.rooms[2].links.e = {}
          region.rooms[2].links.e.to = 2906
          region.rooms[2].links.e.con = ""
        region.rooms[2].links.sw = {}
          region.rooms[2].links.sw.to = 2908
          region.rooms[2].links.sw.con = ""
      region.rooms[2].exits = "east|southwest"
      region.rooms[2].desc = "    你走在一条黄土路上。西南是一个小高岗，地势险恶，客旅断绝。东面隐隐可以看到平定州城。"
    region.rooms[3] = {}
      region.rooms[3].path = "fly bj;#6 w;w;sw"
      region.rooms[3].name = "乱石坡"
      region.rooms[3].zone = "黑木崖1"
      region.rooms[3].id = 2908
      region.rooms[3].links = {}
        region.rooms[3].links.e = {}
          region.rooms[3].links.e.to = 2909
          region.rooms[3].links.e.con = ""
        region.rooms[3].links.sw = {}
          region.rooms[3].links.sw.to = 2911
          region.rooms[3].links.sw.con = ""
        region.rooms[3].links.w = {}
          region.rooms[3].links.w.to = 2913
          region.rooms[3].links.w.con = ""
        region.rooms[3].links.ne = {}
          region.rooms[3].links.ne.to = 2907
          region.rooms[3].links.ne.con = ""
      region.rooms[3].exits = "east|northeast|west|southwest"
      region.rooms[3].desc = "    这是一处乱石怪异的小山岗，向东北是通往平安州的小路。据说前方经常有野兽出没，不可久留。"
    region.rooms[4] = {}
      region.rooms[4].path = "fly bj;#6 w;w;sw;e"
      region.rooms[4].name = "天香堂"
      region.rooms[4].zone = "黑木崖1"
      region.rooms[4].id = 2909
      region.rooms[4].links = {}
        region.rooms[4].links.w = {}
          region.rooms[4].links.w.to = 2908
          region.rooms[4].links.w.con = ""
        region.rooms[4].links.su = {}
          region.rooms[4].links.su.to = 2910
          region.rooms[4].links.su.con = ""
      region.rooms[4].exits = "southup|west"
      region.rooms[4].desc = "    这是『日月神教』下第四大堂：天香堂的大厅，远远望去郁郁渺渺，好似不食人间烟火。堂梁上有一块匾(bian)。"
    region.rooms[5] = {}
      region.rooms[5].path = "fly bj;#6 w;w;sw;e;su"
      region.rooms[5].name = "天香堂"
      region.rooms[5].zone = "黑木崖1"
      region.rooms[5].id = 2910
      region.rooms[5].links = {}
        region.rooms[5].links.nd = {}
          region.rooms[5].links.nd.to = 2909
          region.rooms[5].links.nd.con = ""
      region.rooms[5].exits = "northdown"
      region.rooms[5].desc = "    这里是黑木崖的第四大堂“天香堂”。一中年妇人横眉立在当地。"
    region.rooms[6] = {}
      region.rooms[6].path = "fly bj;#6 w;w;sw;sw"
      region.rooms[6].name = "黄土路"
      region.rooms[6].zone = "黑木崖1"
      region.rooms[6].id = 2911
      region.rooms[6].links = {}
        region.rooms[6].links.ne = {}
          region.rooms[6].links.ne.to = 2908
          region.rooms[6].links.ne.con = ""
        region.rooms[6].links.sw = {}
          region.rooms[6].links.sw.to = 2912
          region.rooms[6].links.sw.con = ""
      region.rooms[6].exits = "northeast|southwest"
      region.rooms[6].desc = "    你走在一条黄土路上。这里是山西地界，往东就进入河北了。现在这里不是太平时节，还是快点走吧。"
    region.rooms[7] = {}
      region.rooms[7].path = "fly bj;#6 w;w;sw;sw;sw"
      region.rooms[7].name = "龙门渡口"
      region.rooms[7].zone = "黑木崖1"
      region.rooms[7].id = 2912
      region.rooms[7].links = {}
        region.rooms[7].links.ne = {}
          region.rooms[7].links.ne.to = 2911
          region.rooms[7].links.ne.con = ""
      region.rooms[7].exits = "northeast"
      region.rooms[7].desc = "    渡口前就是汹涌澎湃的黄河(he)了。浊流滚滚，泥沙俱下，声震数里。两岸渡船来来往往，在波谷中穿行，甚为凶险。过了黄河，就是陕西了。"
    region.rooms[8] = {}
      region.rooms[8].path = "fly bj;#6 w;w;sw;w"
      region.rooms[8].name = "林间小道"
      region.rooms[8].zone = "黑木崖1"
      region.rooms[8].id = 2913
      region.rooms[8].links = {}
        region.rooms[8].links.e = {}
          region.rooms[8].links.e.to = 2908
          region.rooms[8].links.e.con = ""
        region.rooms[8].links.w = {}
          region.rooms[8].links.w.to = 2914
          region.rooms[8].links.w.con = ""
        region.rooms[8].links.n = {}
          region.rooms[8].links.n.to = 2923
          region.rooms[8].links.n.con = ""
      region.rooms[8].exits = "south|east|north|west"
      region.rooms[8].desc = "    你走在一条阴暗的林间小道上，两旁是阴森森的树林。一阵阵风吹过树梢，发出沙沙的响声，令你不寒而栗。不过西边好象是一个山谷。 "
    region.rooms[9] = {}
      region.rooms[9].path = "fly bj;#6 w;w;sw;w;w"
      region.rooms[9].name = "山谷"
      region.rooms[9].zone = "黑木崖1"
      region.rooms[9].id = 2914
      region.rooms[9].links = {}
        region.rooms[9].links.e = {}
          region.rooms[9].links.e.to = 2913
          region.rooms[9].links.e.con = ""
        region.rooms[9].links.w = {}
          region.rooms[9].links.w.to = 2920
          region.rooms[9].links.w.con = ""
        region.rooms[9].links.su = {}
          region.rooms[9].links.su.to = 2915
          region.rooms[9].links.su.con = ""
      region.rooms[9].exits = "east|southup|west"
      region.rooms[9].desc = "    这里是一处山谷，上面种植着草坪。南面是『日月神教』的青龙堂。向西有一条上山的石道。"
    region.rooms[10] = {}
      region.rooms[10].path = "fly bj;#6 w;w;sw;w;w;su"
      region.rooms[10].name = "青龙堂"
      region.rooms[10].zone = "黑木崖1"
      region.rooms[10].id = 2915
      region.rooms[10].links = {}
        region.rooms[10].links.s = {}
          region.rooms[10].links.s.to = 2916
          region.rooms[10].links.s.con = ""
        region.rooms[10].links.nd = {}
          region.rooms[10].links.nd.to = 2914
          region.rooms[10].links.nd.con = ""
      region.rooms[10].exits = "south|northdown"
      region.rooms[10].desc = "    这是『日月神教』下第三大堂：青龙堂的大厅，十分气派，又或有一条青龙时隐时现。堂梁上有一块匾(bian)。"
    region.rooms[11] = {}
      region.rooms[11].path = "fly bj;#6 w;w;sw;w;w;su;s"
      region.rooms[11].name = "长廊"
      region.rooms[11].zone = "黑木崖1"
      region.rooms[11].id = 2916
      region.rooms[11].links = {}
        region.rooms[11].links.s = {}
          region.rooms[11].links.s.to = 2917
          region.rooms[11].links.s.con = ""
        region.rooms[11].links.n = {}
          region.rooms[11].links.n.to = 2915
          region.rooms[11].links.n.con = ""
      region.rooms[11].exits = "south|north"
      region.rooms[11].desc = "    这里是非常气派的长廊。两边站着数十个刀斧手，警卫森严，透着腾腾杀气。"
    region.rooms[12] = {}
      region.rooms[12].path = "fly bj;#6 w;w;sw;w;w;su;s;s"
      region.rooms[12].name = "长廊"
      region.rooms[12].zone = "黑木崖1"
      region.rooms[12].id = 2917
      region.rooms[12].links = {}
        region.rooms[12].links.s = {}
          region.rooms[12].links.s.to = 2918
          region.rooms[12].links.s.con = ""
        region.rooms[12].links.n = {}
          region.rooms[12].links.n.to = 2916
          region.rooms[12].links.n.con = ""
      region.rooms[12].exits = "south|north"
      region.rooms[12].desc = "    这里是非常气派的长廊。但是却没什么人在这里，南边是青龙堂的大厅。"
    region.rooms[13] = {}
      region.rooms[13].path = "fly bj;#6 w;w;sw;w;w;su;s;s;s"
      region.rooms[13].name = "青龙堂大厅"
      region.rooms[13].zone = "黑木崖1"
      region.rooms[13].id = 2918
      region.rooms[13].links = {}
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 2919
          region.rooms[13].links.e.con = ""
        region.rooms[13].links.n = {}
          region.rooms[13].links.n.to = 2917
          region.rooms[13].links.n.con = ""
      region.rooms[13].exits = "east|north"
      region.rooms[13].desc = "    这是『日月神教』下第三大堂：青龙堂的大厅。一位长者居中，神情恍惚。"
    region.rooms[14] = {}
      region.rooms[14].path = "fly bj;#6 w;w;sw;w;w;su;s;s;s;e"
      region.rooms[14].name = "令牌堂"
      region.rooms[14].zone = "黑木崖1"
      region.rooms[14].id = 2919
      region.rooms[14].links = {}
        region.rooms[14].links.w = {}
          region.rooms[14].links.w.to = 2918
          region.rooms[14].links.w.con = ""
      region.rooms[14].exits = "west"
      region.rooms[14].desc = "    这里是黑木崖的第二大堂白虎堂的令牌室。室内青砖铺地。桌上有一盒子(box1)."
    region.rooms[15] = {}
      region.rooms[15].path = "fly bj;#6 w;w;sw;w;w;w"
      region.rooms[15].name = "石道"
      region.rooms[15].zone = "黑木崖1"
      region.rooms[15].id = 2920
      region.rooms[15].links = {}
        region.rooms[15].links.e = {}
          region.rooms[15].links.e.to = 2914
          region.rooms[15].links.e.con = ""
        region.rooms[15].links.n = {}
          region.rooms[15].links.n.to = 2921
          region.rooms[15].links.n.con = ""
      region.rooms[15].exits = "north|east"
      region.rooms[15].desc = "    一路往北行，中间仅有一道宽约五尺的石道，两边石壁如墙，一路上都有日月教徒模样的人物在走动，对往来的路人都严密监视。"
    region.rooms[16] = {}
      region.rooms[16].path = "fly bj;#6 w;w;sw;w;w;w;n"
      region.rooms[16].name = "石道"
      region.rooms[16].zone = "黑木崖1"
      region.rooms[16].id = 2921
      region.rooms[16].links = {}
        region.rooms[16].links.s = {}
          region.rooms[16].links.s.to = 2920
          region.rooms[16].links.s.con = ""
        region.rooms[16].links.wd = {}
          region.rooms[16].links.wd.to = 2922
          region.rooms[16].links.wd.con = ""
      region.rooms[16].exits = "south|westdown"
      region.rooms[16].desc = "    一路上日月教教众把守严密，经过三处山道，来到一处水滩之前，西面有一道石阶通往水滩。"
    region.rooms[17] = {}
      region.rooms[17].path = "fly bj;#6 w;w;sw;w;w;w;n;wd"
      region.rooms[17].name = "猩猩滩"
      region.rooms[17].zone = "黑木崖1"
      region.rooms[17].id = 2922
      region.rooms[17].links = {}
        region.rooms[17].links.eu = {}
          region.rooms[17].links.eu.to = 2921
          region.rooms[17].links.eu.con = ""
      region.rooms[17].exits = "eastup"
      region.rooms[17].desc = "    只见一片长滩，山石殷红如血，水流湍急，这便是有名的猩猩滩，对面岸边停泊着几艘小船(boat)，要过对面就要靠这几艘小船了。"
    region.rooms[18] = {}
      region.rooms[18].path = "fly bj;#6 w;w;sw;w;n"
      region.rooms[18].name = "林间小道"
      region.rooms[18].zone = "黑木崖1"
      region.rooms[18].id = 2923
      region.rooms[18].links = {}
        region.rooms[18].links.n = {}
          region.rooms[18].links.n.to = 2931
          region.rooms[18].links.n.con = ""
        region.rooms[18].links.su = {}
          region.rooms[18].links.su.to = 2924
          region.rooms[18].links.su.con = ""
      region.rooms[18].exits = "east|north|southup|west"
      region.rooms[18].desc = "    你走在一条阴暗的林间小道上，两旁是阴森森的树林。一阵阵风吹过树梢，发出沙沙的响声，令你不寒而栗。忽然你发现树丛中有两点绿芒，一闪即没！！"
    region.rooms[19] = {}
      region.rooms[19].path = "fly bj;#6 w;w;sw;w;n;su"
      region.rooms[19].name = "堂厅"
      region.rooms[19].zone = "黑木崖1"
      region.rooms[19].id = 2924
      region.rooms[19].links = {}
        region.rooms[19].links.s = {}
          region.rooms[19].links.s.to = 2925
          region.rooms[19].links.s.con = ""
        region.rooms[19].links.nd = {}
          region.rooms[19].links.nd.to = 2923
          region.rooms[19].links.nd.con = ""
      region.rooms[19].exits = "south|northdown"
      region.rooms[19].desc = "    这是『日月神教』下第一大堂：风雷堂的大厅，四目望去，满朴素的，堂梁上有一副联子(vote)。\\n\""
    region.rooms[20] = {}
      region.rooms[20].path = "fly bj;#6 w;w;sw;w;n;su;s"
      region.rooms[20].name = "草地"
      region.rooms[20].zone = "黑木崖1"
      region.rooms[20].id = 2925
      region.rooms[20].links = {}
        region.rooms[20].links.e = {}
          region.rooms[20].links.e.to = 2926
          region.rooms[20].links.e.con = ""
        region.rooms[20].links.s = {}
          region.rooms[20].links.s.to = 2928
          region.rooms[20].links.s.con = ""
        region.rooms[20].links.w = {}
          region.rooms[20].links.w.to = 2927
          region.rooms[20].links.w.con = ""
        region.rooms[20].links.n = {}
          region.rooms[20].links.n.to = 2924
          region.rooms[20].links.n.con = ""
      region.rooms[20].exits = "south|north|east|west"
      region.rooms[20].desc = "    你走在一片草地。草地西边似乎香气四逸，东边好象是一个小花园。"
    region.rooms[21] = {}
      region.rooms[21].path = "fly bj;#6 w;w;sw;w;n;su;s;e"
      region.rooms[21].name = "花园"
      region.rooms[21].zone = "黑木崖1"
      region.rooms[21].id = 2926
      region.rooms[21].links = {}
        region.rooms[21].links.w = {}
          region.rooms[21].links.w.to = 2925
          region.rooms[21].links.w.con = ""
      region.rooms[21].exits = "west"
      region.rooms[21].desc = "    这是一个极精致的小花园。园中，红梅绿竹，青松翠柏，布置得颇具匠心，往西去是一片青草地。"
    region.rooms[22] = {}
      region.rooms[22].path = "fly bj;#6 w;w;sw;w;n;su;s;w"
      region.rooms[22].name = "厨房"
      region.rooms[22].zone = "黑木崖1"
      region.rooms[22].id = 2927
      region.rooms[22].links = {}
        region.rooms[22].links.e = {}
          region.rooms[22].links.e.to = 2925
          region.rooms[22].links.e.con = ""
      region.rooms[22].exits = "east"
      region.rooms[22].desc = "    你走在一条阴暗的林间小道上，两旁是阴森森的树林。一阵这是风雷堂的厨房，一位美丽侍女满脸堆笑。整个房间菜香胭脂香迷漫。墙上贴着一张醒目的启事(note)。"
    region.rooms[23] = {}
      region.rooms[23].path = "fly bj;#6 w;w;sw;w;n;su;s;s"
      region.rooms[23].name = "草地"
      region.rooms[23].zone = "黑木崖1"
      region.rooms[23].id = 2928
      region.rooms[23].links = {}
        region.rooms[23].links.e = {}
          region.rooms[23].links.e.to = 2929
          region.rooms[23].links.e.con = ""
        region.rooms[23].links.s = {}
          region.rooms[23].links.s.to = 2930
          region.rooms[23].links.s.con = ""
        region.rooms[23].links.n = {}
          region.rooms[23].links.n.to = 2925
          region.rooms[23].links.n.con = ""
      region.rooms[23].exits = "south|north|east"
      region.rooms[23].desc = "    你走在一片草地。草地东边有一片墓地。"
    region.rooms[24] = {}
      region.rooms[24].path = "fly bj;#6 w;w;sw;w;n;su;s;s;e"
      region.rooms[24].name = "墓地"
      region.rooms[24].zone = "黑木崖1"
      region.rooms[24].id = 2929
      region.rooms[24].links = {}
        region.rooms[24].links.w = {}
          region.rooms[24].links.w.to = 2928
          region.rooms[24].links.w.con = ""
      region.rooms[24].exits = "west"
      region.rooms[24].desc = "    这里是黑木崖日月神教教众的墓地。墓地周围种了一些矮矮的花树。树上的白花星星点点。白花中间是一高大的石碑(bei)，整个墓地干干净净，显然天天有人打扫。"
    region.rooms[25] = {}
      region.rooms[25].path = "fly bj;#6 w;w;sw;w;n;su;s;s;s"
      region.rooms[25].name = "风雷堂"
      region.rooms[25].zone = "黑木崖1"
      region.rooms[25].id = 2930
      region.rooms[25].links = {}
        region.rooms[25].links.n = {}
          region.rooms[25].links.n.to = 2928
          region.rooms[25].links.n.con = ""
      region.rooms[25].exits = "north"
      region.rooms[25].desc = "    这里是日月神教教下第一大堂。这里距黑目崖不远，教下第一大堂堂主童百威把掌此堂。"
    region.rooms[26] = {}
      region.rooms[26].path = "fly bj;#6 w;w;sw;w;n;n"
      region.rooms[26].name = "林间小道"
      region.rooms[26].zone = "黑木崖1"
      region.rooms[26].id = 2931
      region.rooms[26].links = {}
        region.rooms[26].links.e = {}
          region.rooms[26].links.e.to = 2932
          region.rooms[26].links.e.con = ""
        region.rooms[26].links.s = {}
          region.rooms[26].links.s.to = 2934
          region.rooms[26].links.s.con = ""
        region.rooms[26].links.w = {}
          region.rooms[26].links.w.to = 2923
          region.rooms[26].links.w.con = ""
        region.rooms[26].links.n = {}
          region.rooms[26].links.n.to = 2913
          region.rooms[26].links.n.con = ""
      region.rooms[26].exits = "south|east|north|west"
      region.rooms[26].desc = "    你走在一条阴暗的林间小道上，两旁是阴森森的树林。一阵阵风吹过树梢，发出沙沙的响声，令你不寒而栗。"
    region.rooms[27] = {}
      region.rooms[27].path = "fly bj;#6 w;w;sw;w;n;n;e"
      region.rooms[27].name = "林间小道"
      region.rooms[27].zone = "黑木崖1"
      region.rooms[27].id = 2932
      region.rooms[27].links = {}
        region.rooms[27].links.e = {}
          region.rooms[27].links.e.to = 2932
          region.rooms[27].links.e.con = ""
        region.rooms[27].links.s = {}
          region.rooms[27].links.s.to = 2913
          region.rooms[27].links.s.con = ""
        region.rooms[27].links.w = {}
          region.rooms[27].links.w.to = 2932
          region.rooms[27].links.w.con = ""
        region.rooms[27].links.n = {}
          region.rooms[27].links.n.to = 2933
          region.rooms[27].links.n.con = ""
      region.rooms[27].exits = "south|east|north|west"
      region.rooms[27].desc = "    你走在一条阴暗的林间小道上，两旁是阴森森的树林。一阵阵风吹过树梢，发出沙沙的响声，令你不寒而栗。"
    region.rooms[28] = {}
      region.rooms[28].path = "fly bj;#6 w;w;sw;w;n;n;e;n"
      region.rooms[28].name = "林间小道"
      region.rooms[28].zone = "黑木崖1"
      region.rooms[28].id = 2933
      region.rooms[28].links = {}
        region.rooms[28].links.e = {}
          region.rooms[28].links.e.to = 2923
          region.rooms[28].links.e.con = ""
        region.rooms[28].links.w = {}
          region.rooms[28].links.w.to = 2923
          region.rooms[28].links.w.con = ""
        region.rooms[28].links.s = {}
          region.rooms[28].links.s.to = 2931
          region.rooms[28].links.s.con = ""
        region.rooms[28].links.n = {}
          region.rooms[28].links.n.to = 2932
          region.rooms[28].links.n.con = ""
      region.rooms[28].exits = "south|east|north|west"
      region.rooms[28].desc = "    你走在一条阴暗的林间小道上，两旁是阴森森的树林。一阵阵风吹过树梢，发出沙沙的响声，令你不寒而栗。"
    region.rooms[29] = {}
      region.rooms[29].path = "fly bj;#6 w;w;sw;w;n;n;s"
      region.rooms[29].name = "林间小道"
      region.rooms[29].zone = "黑木崖1"
      region.rooms[29].id = 2934
      region.rooms[29].links = {}
        region.rooms[29].links.e = {}
          region.rooms[29].links.e.to = 2933
          region.rooms[29].links.e.con = ""
        region.rooms[29].links.w = {}
          region.rooms[29].links.w.to = 2935
          region.rooms[29].links.w.con = ""
        region.rooms[29].links.s = {}
          region.rooms[29].links.s.to = 2913
          region.rooms[29].links.s.con = ""
        region.rooms[29].links.n = {}
          region.rooms[29].links.n.to = 2931
          region.rooms[29].links.n.con = ""
      region.rooms[29].exits = "south|east|north|west"
      region.rooms[29].desc = "    你走在一条阴暗的林间小道上，两旁是阴森森的树林。一阵阵风吹过树梢，发出沙沙的响声，令你不寒而栗。"
    region.rooms[30] = {}
      region.rooms[30].path = "fly bj;#6 w;w;sw;w;n;n;s;w"
      region.rooms[30].name = "白虎堂"
      region.rooms[30].zone = "黑木崖1"
      region.rooms[30].id = 2935
      region.rooms[30].links = {}
        region.rooms[30].links.e = {}
          region.rooms[30].links.e.to = 2934
          region.rooms[30].links.e.con = ""
        region.rooms[30].links.w = {}
          region.rooms[30].links.w.to = 2936
          region.rooms[30].links.w.con = ""
      region.rooms[30].exits = "east|west"
      region.rooms[30].desc = "    这是『日月神教』下第二大堂：白虎堂的大厅，四目望去，一地都是鲜血，显然不久前这里有一场大战。堂梁上有一块旧木匾(bian)。堂上北壁上有几个血字(zi)。"
    region.rooms[31] = {}
      region.rooms[31].path = "fly bj;#6 w;w;sw;w;n;n;s;w;w"
      region.rooms[31].name = "长廊"
      region.rooms[31].zone = "黑木崖1"
      region.rooms[31].id = 2936
      region.rooms[31].links = {}
        region.rooms[31].links.e = {}
          region.rooms[31].links.e.to = 2935
          region.rooms[31].links.e.con = ""
        region.rooms[31].links.s = {}
          region.rooms[31].links.s.to = 2937
          region.rooms[31].links.s.con = ""
      region.rooms[31].exits = "south|east"
      region.rooms[31].desc = "    这里是白虎堂的长廊。两边一片狼籍，看样子刚被洗劫一场，遍地横尸，残不忍睹。"
    region.rooms[32] = {}
      region.rooms[32].path = "fly bj;#6 w;w;sw;w;n;n;s;w;w;s"
      region.rooms[32].name = "长廊"
      region.rooms[32].zone = "黑木崖1"
      region.rooms[32].id = 2937
      region.rooms[32].links = {}
        region.rooms[32].links.s = {}
          region.rooms[32].links.s.to = 2938
          region.rooms[32].links.s.con = ""
        region.rooms[32].links.n = {}
          region.rooms[32].links.n.to = 2936
          region.rooms[32].links.n.con = ""
      region.rooms[32].exits = "south|north"
      region.rooms[32].desc = "    这里是白虎堂的长廊。两边一片狼籍，看样子刚被洗劫一场，遍地横尸，残不忍赌。"
    region.rooms[33] = {}
      region.rooms[33].path = "fly bj;#6 w;w;sw;w;n;n;s;w;w;s;s"
      region.rooms[33].name = "白虎堂"
      region.rooms[33].zone = "黑木崖1"
      region.rooms[33].id = 2938
      region.rooms[33].links = {}
        region.rooms[33].links.s = {}
          region.rooms[33].links.s.to = 2939
          region.rooms[33].links.s.con = ""
        region.rooms[33].links.n = {}
          region.rooms[33].links.n.to = 2937
          region.rooms[33].links.n.con = ""
      region.rooms[33].exits = "south|north"
      region.rooms[33].desc = "    这里是黑木崖的第二大堂“白虎堂”。堂内青砖铺地，堂内横尸满地。"
    region.rooms[34] = {}
      region.rooms[34].path = "fly bj;#6 w;w;sw;w;n;n;s;w;w;s;s;s"
      region.rooms[34].name = "池塘"
      region.rooms[34].zone = "黑木崖1"
      region.rooms[34].id = 2939
      region.rooms[34].links = {}
        region.rooms[34].links.e = {}
          region.rooms[34].links.e.to = 2941
          region.rooms[34].links.e.con = ""
        region.rooms[34].links.w = {}
          region.rooms[34].links.w.to = 2940
          region.rooms[34].links.w.con = ""
        region.rooms[34].links.n = {}
          region.rooms[34].links.n.to = 2938
          region.rooms[34].links.n.con = ""
      region.rooms[34].exits = "east|north|west"
      region.rooms[34].desc = "    这是一个小池塘，池塘里有数对鸳鸯悠游其间，池边还有四只白鹤在觅食。"
    region.rooms[35] = {}
      region.rooms[35].path = "fly bj;#6 w;w;sw;w;n;n;s;w;w;s;s;s;w"
      region.rooms[35].name = "圣姑堂"
      region.rooms[35].zone = "黑木崖1"
      region.rooms[35].id = 2940
      region.rooms[35].links = {}
        region.rooms[35].links.e = {}
          region.rooms[35].links.e.to = 2939
          region.rooms[35].links.e.con = ""
      region.rooms[35].exits = "east"
      region.rooms[35].desc = "    这里是黑木崖的圣姑所在地“圣姑堂”。堂上五彩云罗，煞是漂亮。堂中一位妙龄女子，青衫小袖，明艳不可方物。"
    region.rooms[36] = {}
      region.rooms[36].path = "fly bj;#6 w;w;sw;w;n;n;s;w;w;s;s;s;e"
      region.rooms[36].name = "厨房"
      region.rooms[36].zone = "黑木崖1"
      region.rooms[36].id = 2941
      region.rooms[36].links = {}
        region.rooms[36].links.w = {}
          region.rooms[36].links.w.to = 2939
          region.rooms[36].links.w.con = ""
      region.rooms[36].exits = "west"
      region.rooms[36].desc = "    这是圣姑堂的厨房，一位美丽侍女满脸堆笑。整个房间菜香胭脂香迷漫。墙上贴着一张醒目的启事(note)。"
  region.center = 2906

return region
