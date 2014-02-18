local region = {}
  region.cmd = "fly sz;w;s;s;s;s;s;s;s;sw"
  region.name = "燕子坞1"
  region.id = "yzw1"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly sz;w;s;s;s;s;s;s;s;sw"
      region.rooms[1].name = "湖边"
      region.rooms[1].zone = "苏州|燕子坞1"
      region.rooms[1].id = 189
      region.rooms[1].links = {}
        region.rooms[1].links.ne = {}
          region.rooms[1].links.ne.to = 188
          region.rooms[1].links.ne.con = ""
        region.rooms[1].links.nw = {}
          region.rooms[1].links.nw.to = 2547
          region.rooms[1].links.nw.con = ""
      region.rooms[1].exits = "northwest|northeast"
      region.rooms[1].desc = "    俗话说：上有天堂，下有苏杭。这里正是大大有名的太湖。湖面绿波上漂着一叶叶的小舟, 一阵阵悦耳的小曲儿随着湖上的轻风不时漂入你的耳中。"
    region.rooms[2] = {}
      region.rooms[2].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw"
      region.rooms[2].name = "湖边"
      region.rooms[2].zone = "燕子坞1"
      region.rooms[2].id = 2547
      region.rooms[2].links = {}
        region.rooms[2].links.sw = {}
          region.rooms[2].links.sw.to = 2548
          region.rooms[2].links.sw.con = ""
        region.rooms[2].links.se = {}
          region.rooms[2].links.se.to = 189
          region.rooms[2].links.se.con = ""
      region.rooms[2].exits = "southeast|southwest"
      region.rooms[2].desc = "    俗话说：上有天堂，下有苏杭。这里正是大大有名的太湖。湖面绿波上漂着一叶叶的小舟, 一阵阵悦耳的小曲儿随着湖上的轻风不时漂入你的耳中。"
    region.rooms[3] = {}
      region.rooms[3].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw"
      region.rooms[3].name = "湖边"
      region.rooms[3].zone = "燕子坞1"
      region.rooms[3].id = 2548
      region.rooms[3].links = {}
        region.rooms[3].links.ne = {}
          region.rooms[3].links.ne.to = 2547
          region.rooms[3].links.ne.con = ""
        region.rooms[3].links.se = {}
          region.rooms[3].links.se.to = 2549
          region.rooms[3].links.se.con = ""
      region.rooms[3].exits = "southeast|northeast"
      region.rooms[3].desc = "    俗话说：上有天堂，下有苏杭。这里正是大大有名的太湖。湖面绿波上漂着一叶叶的小舟, 一阵阵悦耳的小曲儿随着湖上的轻风不时漂入你的耳中。"
    region.rooms[4] = {}
      region.rooms[4].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se"
      region.rooms[4].name = "小石桥"
      region.rooms[4].zone = "燕子坞1"
      region.rooms[4].id = 2549
      region.rooms[4].links = {}
        region.rooms[4].links.nw = {}
          region.rooms[4].links.nw.to = 2548
          region.rooms[4].links.nw.con = ""
        region.rooms[4].links.s = {}
          region.rooms[4].links.s.to = 2550
          region.rooms[4].links.s.con = ""
      region.rooms[4].exits = "south|northwest"
      region.rooms[4].desc = "    这是一座小小的白石拱桥。桥下碧绿的湖水正荡着微波。远处的湖面上传来阵阵歌声，不远处两只鸳鸯在一起戏水，岸边的柳树随着湖面上吹来的微风时不时地摇摆着。"
    region.rooms[5] = {}
      region.rooms[5].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s"
      region.rooms[5].name = "码头"
      region.rooms[5].zone = "燕子坞1"
      region.rooms[5].id = 2550
      region.rooms[5].links = {}
        region.rooms[5].links.n = {}
          region.rooms[5].links.n.to = 2549
          region.rooms[5].links.n.con = ""
        region.rooms[5].links.out = {}
          region.rooms[5].links.out.to = 2551
          region.rooms[5].links.out.con = "a:qu mr"
      region.rooms[5].exits = "north"
      region.rooms[5].desc = "    这里是慕容家的家仆和丫鬟出入太湖的水上码头，只见人们来来往往，一个个风尘仆仆，码头边的老船夫见到你走过来，马上笑呵呵的迎了上去。价格表(sign)。"
    region.rooms[6] = {}
      region.rooms[6].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s;|!a:qu mr:out|"
      region.rooms[6].name = "小岛边"
      region.rooms[6].zone = "燕子坞1"
      region.rooms[6].id = 2551
      region.rooms[6].links = {}
        region.rooms[6].links.s = {}
          region.rooms[6].links.s.to = 2552
          region.rooms[6].links.s.con = ""
      region.rooms[6].exits = "south"
      region.rooms[6].desc = "    你一跨上岸去, 见疏疏落落四五座房舍, 建造在一个不知名的小岛或半岛上。岛上树木葱绿，亭宇轩榭错落有秩，处处飘来一阵幽香。这里的一切无一不透出江南水秀山清，建筑小巧别致的特色。一位老艄公左在岸边(bian)。"
    region.rooms[7] = {}
      region.rooms[7].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s;|!a:qu mr:out|;s"
      region.rooms[7].name = "小舍"
      region.rooms[7].zone = "燕子坞1"
      region.rooms[7].id = 2552
      region.rooms[7].links = {}
        region.rooms[7].links.e = {}
          region.rooms[7].links.e.to = 2556
          region.rooms[7].links.e.con = ""
        region.rooms[7].links.w = {}
          region.rooms[7].links.w.to = 2553
          region.rooms[7].links.w.con = ""
        region.rooms[7].links.n = {}
          region.rooms[7].links.n.to = 2551
          region.rooms[7].links.n.con = ""
      region.rooms[7].exits = "north|east|west"
      region.rooms[7].desc = "    这间房舍小巧玲珑, 颇为精雅。小舍匾额上写着「琴韵」两字笔致,致颇为潇洒。远处的小屋露出一檐屋角。东西两边各有一条小径不知通向哪里。"
    region.rooms[8] = {}
      region.rooms[8].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s;|!a:qu mr:out|;s;w"
      region.rooms[8].name = "小径"
      region.rooms[8].zone = "燕子坞1"
      region.rooms[8].id = 2553
      region.rooms[8].links = {}
        region.rooms[8].links.e = {}
          region.rooms[8].links.e.to = 2552
          region.rooms[8].links.e.con = ""
        region.rooms[8].links.w = {}
          region.rooms[8].links.w.to = 2554
          region.rooms[8].links.w.con = ""
      region.rooms[8].exits = "east|west"
      region.rooms[8].desc = "    一条曲曲折折用鹅卵石铺成的小径, 路两旁绿柳成阴, 一处处山石花木点缀在其中。你走在石地上，啪嗒啪嗒的发出清脆的响声，往西面去是这条小径的延伸。"
    region.rooms[9] = {}
      region.rooms[9].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s;|!a:qu mr:out|;s;w;w"
      region.rooms[9].name = "小径"
      region.rooms[9].zone = "燕子坞1"
      region.rooms[9].id = 2554
      region.rooms[9].links = {}
        region.rooms[9].links.e = {}
          region.rooms[9].links.e.to = 2553
          region.rooms[9].links.e.con = ""
        region.rooms[9].links.nw = {}
          region.rooms[9].links.nw.to = 2555
          region.rooms[9].links.nw.con = ""
      region.rooms[9].exits = "northwest|east"
      region.rooms[9].desc = "    一条曲曲折折用鹅卵石铺成的小径, 路两旁绿柳成阴, 一处处山石花木点缀在其中。你走在石地上，啪嗒啪嗒的发出清脆的响声，往西北面去是听雨居。"
    region.rooms[10] = {}
      region.rooms[10].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s;|!a:qu mr:out|;s;w;w;nw"
      region.rooms[10].name = "听雨居"
      region.rooms[10].zone = "燕子坞1"
      region.rooms[10].id = 2555
      region.rooms[10].links = {}
        region.rooms[10].links["[mr:]"] = {}
          region.rooms[10].links["[mr:]"].to = 2503
          region.rooms[10].links["[mr:]"].con = ""
        region.rooms[10].links.se = {}
          region.rooms[10].links.se.to = 2554
          region.rooms[10].links.se.con = ""
      region.rooms[10].exits = "southeast"
      region.rooms[10].desc = "    「听雨居」三面环水, 从窗中望出去, 湖上烟波尽收眼底。屋正中摆着一张大圆桌, 上面摆满了蔬果点心, 每一样都十分精致。 圆桌四周放了数把椅子。墙边的小柜上放着一把「琴」。"
    region.rooms[11] = {}
      region.rooms[11].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s;|!a:qu mr:out|;s;e"
      region.rooms[11].name = "小径"
      region.rooms[11].zone = "燕子坞1"
      region.rooms[11].id = 2556
      region.rooms[11].links = {}
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 2552
          region.rooms[11].links.w.con = ""
        region.rooms[11].links.ne = {}
          region.rooms[11].links.ne.to = 2557
          region.rooms[11].links.ne.con = ""
      region.rooms[11].exits = "northeast|west"
      region.rooms[11].desc = "    一条曲曲折折用鹅卵石铺成的小径, 路两旁绿柳成阴, 一处处山石花木点缀在其中。远处的一座小屋子映入你的眼帘，阵阵炊烟从小屋后面的烟囱中冒出。"
    region.rooms[12] = {}
      region.rooms[12].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s;|!a:qu mr:out|;s;e;ne"
      region.rooms[12].name = "小径"
      region.rooms[12].zone = "燕子坞1"
      region.rooms[12].id = 2557
      region.rooms[12].links = {}
        region.rooms[12].links.e = {}
          region.rooms[12].links.e.to = 2558
          region.rooms[12].links.e.con = ""
        region.rooms[12].links.sw = {}
          region.rooms[12].links.sw.to = 2556
          region.rooms[12].links.sw.con = ""
      region.rooms[12].exits = "east|southwest"
      region.rooms[12].desc = "    一条曲曲折折用鹅卵石铺成的小径, 路两旁绿柳成阴, 一处处山石花木点缀在其中。前面就是小厅了，一位美丽的少女站在厅前，你被她的容貌所吸引，如果不是亲眼所见，不可想象世上还有这等如此美貌的少女。"
    region.rooms[13] = {}
      region.rooms[13].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s;|!a:qu mr:out|;s;e;ne;e"
      region.rooms[13].name = "小厅"
      region.rooms[13].zone = "燕子坞1"
      region.rooms[13].id = 2558
      region.rooms[13].links = {}
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 2561
          region.rooms[13].links.e.con = ""
        region.rooms[13].links.s = {}
          region.rooms[13].links.s.to = 2560
          region.rooms[13].links.s.con = ""
        region.rooms[13].links.w = {}
          region.rooms[13].links.w.to = 2557
          region.rooms[13].links.w.con = ""
        region.rooms[13].links.n = {}
          region.rooms[13].links.n.to = 2559
          region.rooms[13].links.n.con = ""
      region.rooms[13].exits = "south|north|east|west"
      region.rooms[13].desc = "    你走进这间小小的厅室, 看到里面放着一张紫檀木茶几和几张湘妃竹椅子，紫檀木的茶几上摆放着茶壶和几只白玉杯，专供客人饮用。你忍不住想坐在竹椅上，让疲惫的身心得到充分的休息。"
    region.rooms[14] = {}
      region.rooms[14].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s;|!a:qu mr:out|;s;e;ne;e;n"
      region.rooms[14].name = "厨房"
      region.rooms[14].zone = "燕子坞1"
      region.rooms[14].id = 2559
      region.rooms[14].links = {}
        region.rooms[14].links.s = {}
          region.rooms[14].links.s.to = 2558
          region.rooms[14].links.s.con = ""
      region.rooms[14].exits = "south"
      region.rooms[14].desc = "    这是一间小厨房, 虽然不大, 但是锅碗瓢盆, 油盐酱醋, 到很奇全。灶台上堆满了新鲜瓜果蔬菜, 活鱼活虾, 不仅不脏不乱, 还十分干净整齐。"
    region.rooms[15] = {}
      region.rooms[15].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s;|!a:qu mr:out|;s;e;ne;e;s"
      region.rooms[15].name = "后堂"
      region.rooms[15].zone = "燕子坞1"
      region.rooms[15].id = 2560
      region.rooms[15].links = {}
        region.rooms[15].links.n = {}
          region.rooms[15].links.n.to = 2558
          region.rooms[15].links.n.con = ""
      region.rooms[15].exits = "north"
      region.rooms[15].desc = "    这里摆着一张小床，床头是一张女人用的梳妆台，上面放着许多胭脂粉盒。靠窗是一张长长的红木书桌，只要抬眼望去，太湖的万顷碧波，尽收眼底。"
    region.rooms[16] = {}
      region.rooms[16].path = "fly sz;w;s;s;s;s;s;s;s;sw;nw;sw;se;s;|!a:qu mr:out|;s;e;ne;e;e"
      region.rooms[16].name = "厢房"
      region.rooms[16].zone = "燕子坞1"
      region.rooms[16].id = 2561
      region.rooms[16].links = {}
        region.rooms[16].links.w = {}
          region.rooms[16].links.w.to = 2558
          region.rooms[16].links.w.con = ""
      region.rooms[16].exits = "west"
      region.rooms[16].desc = "    这是一间厢房, 里面摆设简单, 只有一张床, 一张书桌和一把椅子。"
  region.center = 189
return region