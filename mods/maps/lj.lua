local region = {}
  region.cmd = "fly lj"
  region.name = "灵鹫宫"
  region.id = "lj"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly lj"
      region.rooms[1].name = "独尊厅"
      region.rooms[1].zone = "灵鹫宫"
      region.rooms[1].id = 2052
      region.rooms[1].links = {}
        region.rooms[1].links.s = {}
          region.rooms[1].links.s.to = 2053
          region.rooms[1].links.s.con = ""
        region.rooms[1].links.n = {}
          region.rooms[1].links.n.to = 2061
          region.rooms[1].links.n.con = ""
      region.rooms[1].exits = "south|north"
      region.rooms[1].desc = "    这就是『灵鹫宫』独尊厅。大厅全是以巨石砌成，石块之间竟无半点缝隙，令人称奇。厅内矗立着四根石柱，皆为坚硬的花岗石所制。"
    region.rooms[2] = {}
      region.rooms[2].path = "fly lj;s"
      region.rooms[2].name = "独尊厅大门"
      region.rooms[2].zone = "灵鹫宫"
      region.rooms[2].id = 2053
      region.rooms[2].links = {}
        region.rooms[2].links.s = {}
          region.rooms[2].links.s.to = 2054
          region.rooms[2].links.s.con = ""
        region.rooms[2].links.n = {}
          region.rooms[2].links.n.to = 2052
          region.rooms[2].links.n.con = ""
      region.rooms[2].exits = "south|north"
      region.rooms[2].desc = "    这就是通向『灵鹫宫』独尊厅的大门。大门左右各有一头石雕的猛鹫，高达三丈有余，尖喙巨爪，神骏非凡，栩栩如生，似乎随时要腾空而去。"
    region.rooms[3] = {}
      region.rooms[3].path = "fly lj;s;s"
      region.rooms[3].name = "青石大道"
      region.rooms[3].zone = "灵鹫宫"
      region.rooms[3].id = 2054
      region.rooms[3].links = {}
        region.rooms[3].links.s = {}
          region.rooms[3].links.s.to = 2055
          region.rooms[3].links.s.con = ""
        region.rooms[3].links.n = {}
          region.rooms[3].links.n.to = 2053
          region.rooms[3].links.n.con = ""
      region.rooms[3].exits = "south|north"
      region.rooms[3].desc = "    这是一条青石铺成的宽敞大道，每块青石都是长约八尺，宽约三尺，甚是整齐，堪称巧夺天工。道旁是郁郁葱葱的松树林，不时可以看到一两只松鼠蹦蹦跳跳地跃向树林深处。往北望去，一座巨大的石堡巍然耸立。"
    region.rooms[4] = {}
      region.rooms[4].path = "fly lj;s;s;s"
      region.rooms[4].name = "青石大道"
      region.rooms[4].zone = "灵鹫宫"
      region.rooms[4].id = 2055
      region.rooms[4].links = {}
        region.rooms[4].links.wd = {}
          region.rooms[4].links.wd.to = 2056
          region.rooms[4].links.wd.con = ""
        region.rooms[4].links.n = {}
          region.rooms[4].links.n.to = 2054
          region.rooms[4].links.n.con = ""
      region.rooms[4].exits = "north|westdown"
      region.rooms[4].desc = "    这是一条青石铺成的宽敞大道，每块青石都是长约八尺，宽约三尺，甚是整齐，堪称巧夺天工。道旁是郁郁葱葱的松树林，不时可以看到一两只松鼠蹦蹦跳跳地跃向树林深处。往北望去，一座巨大的石堡巍然耸立。"
    region.rooms[5] = {}
      region.rooms[5].path = "fly lj;s;s;s;wd"
      region.rooms[5].name = "仙愁门"
      region.rooms[5].zone = "灵鹫宫"
      region.rooms[5].id = 2056
      region.rooms[5].links = {}
        region.rooms[5].links.sd = {}
          region.rooms[5].links.sd.to = 2057
          region.rooms[5].links.sd.con = ""
        region.rooms[5].links.eu = {}
          region.rooms[5].links.eu.to = 2055
          region.rooms[5].links.eu.con = ""
      region.rooms[5].exits = "eastup|southdown"
      region.rooms[5].desc = "    这里就快到缥缈峰绝顶了，越往上走，山势越高，缭绕在你身边的白雾愈来愈浓，往南则是下山的路。沿着山道没走几步，在你眼前出现一个石坊，上书『仙愁门』三个大字，盖因上山之艰辛吧。"
    region.rooms[6] = {}
      region.rooms[6].path = "fly lj;s;s;s;wd;sd"
      region.rooms[6].name = "百丈涧"
      region.rooms[6].zone = "灵鹫宫"
      region.rooms[6].id = 2057
      region.rooms[6].links = {}
        region.rooms[6].links["zou tiesuo"] = {}
          region.rooms[6].links["zou tiesuo"].to = 2056
          region.rooms[6].links["zou tiesuo"].con = ""
        region.rooms[6].links.sd = {}
          region.rooms[6].links.sd.to = 2058
          region.rooms[6].links.sd.con = ""
      region.rooms[6].exits = "southdown"
      region.rooms[6].desc = "    山道到此突然消失，在你面前是一条山涧，山涧之中云雾缭绕，你根本无法看清对面。一条铁索(tiesuo)深入云中，旁边有一块石碑(bei)。"
    region.rooms[7] = {}
      region.rooms[7].path = "fly lj;s;s;s;wd;sd;sd"
      region.rooms[7].name = "失足岩"
      region.rooms[7].zone = "灵鹫宫"
      region.rooms[7].id = 2058
      region.rooms[7].links = {}
        region.rooms[7].links.nu = {}
          region.rooms[7].links.nu.to = 2057
          region.rooms[7].links.nu.con = ""
        region.rooms[7].links.ed = {}
          region.rooms[7].links.ed.to = 2059
          region.rooms[7].links.ed.con = ""
      region.rooms[7].exits = "eastdown|northup"
      region.rooms[7].desc = "    这是通向『灵鹫宫』的必经之路，山道被一块如鹰喙突出的巨岩截断，巨岩光可鉴人，只有中间凿出了一条窄窄的石阶通向山道的那一头。你小心翼翼地试着踏了上去，心想：我能过去吧。"
    region.rooms[8] = {}
      region.rooms[8].path = "fly lj;s;s;s;wd;sd;sd;ed"
      region.rooms[8].name = "断魂崖"
      region.rooms[8].zone = "灵鹫宫"
      region.rooms[8].id = 2059
      region.rooms[8].links = {}
        region.rooms[8].links.ed = {}
          region.rooms[8].links.ed.to = 2060
          region.rooms[8].links.ed.con = ""
        region.rooms[8].links.wu = {}
          region.rooms[8].links.wu.to = 2058
          region.rooms[8].links.wu.con = ""
      region.rooms[8].exits = "westup|eastdown"
      region.rooms[8].desc = "    这是通向[灵鹫宫]的必经之路，一条小道蜿蜒曲折地通向缥缈峰顶。路的右侧是一条陡峭的山崖，一阵山风吹过，你似乎听见从下面传来几声惨号，你心中一凛，不禁加快脚步赶紧离开这里。"
    region.rooms[9] = {}
      region.rooms[9].path = "fly lj;s;s;s;wd;sd;sd;ed;ed"
      region.rooms[9].name = "缥缈峰山脚"
      region.rooms[9].zone = "灵鹫宫"
      region.rooms[9].id = 2060
      region.rooms[9].links = {}
        region.rooms[9].links.wu = {}
          region.rooms[9].links.wu.to = 2059
          region.rooms[9].links.wu.con = ""
      region.rooms[9].exits = "westup|southdown"
      region.rooms[9].desc = "    这里是缥缈峰山脚, 抬头上望, 缥缈峰耸入云天, 峰顶白云缭绕, 宛若仙境. 白云深处隐约可见琼楼玉宇, 那就是令江湖人物闻名丧胆的『灵鹫宫』。听说宫中住着一些武艺高强的女侠, 而且只收女弟子为徒。"
    region.rooms[10] = {}
      region.rooms[10].path = "fly lj;n"
      region.rooms[10].name = "画廊"
      region.rooms[10].zone = "灵鹫宫"
      region.rooms[10].id = 2061
      region.rooms[10].links = {}
        region.rooms[10].links.e = {}
          region.rooms[10].links.e.to = 2062
          region.rooms[10].links.e.con = ""
        region.rooms[10].links.w = {}
          region.rooms[10].links.w.to = 2065
          region.rooms[10].links.w.con = ""
        region.rooms[10].links.s = {}
          region.rooms[10].links.s.to = 2052
          region.rooms[10].links.s.con = ""
        region.rooms[10].links.n = {}
          region.rooms[10].links.n.to = 2071
          region.rooms[10].links.n.con = ""
      region.rooms[10].exits = "south|north|east|west"
      region.rooms[10].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。一阵阵花香从北边传来。"
    region.rooms[11] = {}
      region.rooms[11].path = "fly lj;n;e"
      region.rooms[11].name = "画廊"
      region.rooms[11].zone = "灵鹫宫"
      region.rooms[11].id = 2062
      region.rooms[11].links = {}
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 2061
          region.rooms[11].links.w.con = ""
        region.rooms[11].links.e = {}
          region.rooms[11].links.e.to = 2063
          region.rooms[11].links.e.con = ""
      region.rooms[11].exits = "east|west"
      region.rooms[11].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。西边通向大厅。"
    region.rooms[12] = {}
      region.rooms[12].path = "fly lj;n;e;e"
      region.rooms[12].name = "画廊"
      region.rooms[12].zone = "灵鹫宫"
      region.rooms[12].id = 2063
      region.rooms[12].links = {}
        region.rooms[12].links.e = {}
          region.rooms[12].links.e.to = 2064
          region.rooms[12].links.e.con = ""
        region.rooms[12].links.w = {}
          region.rooms[12].links.w.to = 2062
          region.rooms[12].links.w.con = ""
        region.rooms[12].links.n = {}
          region.rooms[12].links.n.to = 2073
          region.rooms[12].links.n.con = ""
      region.rooms[12].exits = "east|north|west"
      region.rooms[12].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。走廊东面是一间房间，里面不时传出几声女子的娇叱。"
    region.rooms[13] = {}
      region.rooms[13].path = "fly lj;n;e;e;e"
      region.rooms[13].name = "戏凤阁"
      region.rooms[13].zone = "灵鹫宫"
      region.rooms[13].id = 2064
      region.rooms[13].links = {}
        region.rooms[13].links.w = {}
          region.rooms[13].links.w.to = 2063
          region.rooms[13].links.w.con = ""
      region.rooms[13].exits = "west"
      region.rooms[13].desc = "    这里是灵鹫宫弟子练功的地方。有几个妙龄女子正在专心致致地练武，有几个手持竹剑,在互相拆招,身法灵动，犹如穿花蝴蝶一般，你不禁看花了眼，别的人则坐在地上的蒲团上苦练内力。"
    region.rooms[14] = {}
      region.rooms[14].path = "fly lj;n;w"
      region.rooms[14].name = "画廊"
      region.rooms[14].zone = "灵鹫宫"
      region.rooms[14].id = 2065
      region.rooms[14].links = {}
        region.rooms[14].links.e = {}
          region.rooms[14].links.e.to = 2061
          region.rooms[14].links.e.con = ""
        region.rooms[14].links.w = {}
          region.rooms[14].links.w.to = 2066
          region.rooms[14].links.w.con = ""
      region.rooms[14].exits = "east|west"
      region.rooms[14].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。东边通向大厅。"
    region.rooms[15] = {}
      region.rooms[15].path = "fly lj;n;w;w"
      region.rooms[15].name = "画廊"
      region.rooms[15].zone = "灵鹫宫"
      region.rooms[15].id = 2066
      region.rooms[15].links = {}
        region.rooms[15].links.e = {}
          region.rooms[15].links.e.to = 2065
          region.rooms[15].links.e.con = ""
        region.rooms[15].links.w = {}
          region.rooms[15].links.w.to = 2067
          region.rooms[15].links.w.con = ""
        region.rooms[15].links.n = {}
          region.rooms[15].links.n.to = 2068
          region.rooms[15].links.n.con = ""
      region.rooms[15].exits = "east|north|west"
      region.rooms[15].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。"
    region.rooms[16] = {}
      region.rooms[16].path = "fly lj;n;w;w;w"
      region.rooms[16].name = "藕香榭"
      region.rooms[16].zone = "灵鹫宫"
      region.rooms[16].id = 2067
      region.rooms[16].links = {}
        region.rooms[16].links.e = {}
          region.rooms[16].links.e.to = 2066
          region.rooms[16].links.e.con = ""
      region.rooms[16].exits = "east"
      region.rooms[16].desc = "    这是间厨房，浓郁的饭菜香味一个劲地钻进你的鼻子，你仿佛听到“咕咕”的响声，环顾四周不知来源。原来是你的肚子作怪。"
    region.rooms[17] = {}
      region.rooms[17].path = "fly lj;n;w;w;n"
      region.rooms[17].name = "画廊"
      region.rooms[17].zone = "灵鹫宫"
      region.rooms[17].id = 2068
      region.rooms[17].links = {}
        region.rooms[17].links.e = {}
          region.rooms[17].links.e.to = 2070
          region.rooms[17].links.e.con = ""
        region.rooms[17].links.s = {}
          region.rooms[17].links.s.to = 2066
          region.rooms[17].links.s.con = ""
        region.rooms[17].links.w = {}
          region.rooms[17].links.w.to = 2069
          region.rooms[17].links.w.con = ""
        region.rooms[17].links.n = {}
          region.rooms[17].links.n.to = 2075
          region.rooms[17].links.n.con = ""
      region.rooms[17].exits = "south|north|east|west"
      region.rooms[17].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。走廊西面是兵器库。"
    region.rooms[18] = {}
      region.rooms[18].path = "fly lj;n;w;w;n;w"
      region.rooms[18].name = "蓼风轩"
      region.rooms[18].zone = "灵鹫宫"
      region.rooms[18].id = 2069
      region.rooms[18].links = {}
        region.rooms[18].links.e = {}
          region.rooms[18].links.e.to = 2068
          region.rooms[18].links.e.con = ""
      region.rooms[18].exits = "east"
      region.rooms[18].desc = "    这是『灵鹫宫』弟子的兵器库，你环顾四周，发现墙上嵌满了各式兵器，仔细一看，原来满墙满壁竟随依各般兵器之形抠出槽子，兵刃就悬于槽内。你不由暗赞：“好精致的想头！”"
    region.rooms[19] = {}
      region.rooms[19].path = "fly lj;n;n;w"
      region.rooms[19].name = "画廊"
      region.rooms[19].zone = "灵鹫宫"
      region.rooms[19].id = 2070
      region.rooms[19].links = {}
        region.rooms[19].links.w = {}
          region.rooms[19].links.w.to = 2068
          region.rooms[19].links.w.con = ""
        region.rooms[19].links.e = {}
          region.rooms[19].links.e.to = 2071
          region.rooms[19].links.e.con = ""
      region.rooms[19].exits = "east|west"
      region.rooms[19].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。一阵阵花香从东边传来。"
    region.rooms[20] = {}
      region.rooms[20].path = "fly lj;n;n"
      region.rooms[20].name = "花园"
      region.rooms[20].zone = "灵鹫宫"
      region.rooms[20].id = 2071
      region.rooms[20].links = {}
        region.rooms[20].links.s = {}
          region.rooms[20].links.s.to = 2061
          region.rooms[20].links.s.con = ""
        region.rooms[20].links.e = {}
          region.rooms[20].links.e.to = 2072
          region.rooms[20].links.e.con = ""
        region.rooms[20].links["move jiashan;enter"] = {}
          region.rooms[20].links["move jiashan;enter"].to = 2092
          region.rooms[20].links["move jiashan;enter"].con = ""
        region.rooms[20].links.w = {}
          region.rooms[20].links.w.to = 2070
          region.rooms[20].links.w.con = ""
        region.rooms[20].links.n = {}
          region.rooms[20].links.n.to = 2088
          region.rooms[20].links.n.con = ""
      region.rooms[20].exits = "south|east|north|west"
      region.rooms[20].desc = "    你的眼前出现了一个美丽的花园，花园里种着一些花，花从中隐约可见飘渺的倩影，那是宫中的姐妹们在玩耍。花园中央有一座假山(jiashan)。花园的东西两头是长廊，北边有一条小道通向天山童姥修练之处。"
    region.rooms[21] = {}
      region.rooms[21].path = "fly lj;n;n;e"
      region.rooms[21].name = "画廊"
      region.rooms[21].zone = "灵鹫宫"
      region.rooms[21].id = 2072
      region.rooms[21].links = {}
        region.rooms[21].links.w = {}
          region.rooms[21].links.w.to = 2071
          region.rooms[21].links.w.con = ""
        region.rooms[21].links.e = {}
          region.rooms[21].links.e.to = 2073
          region.rooms[21].links.e.con = ""
      region.rooms[21].exits = "east|west"
      region.rooms[21].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。一阵阵花香从西边传来。"
    region.rooms[22] = {}
      region.rooms[22].path = "fly lj;n;e;e;n"
      region.rooms[22].name = "画廊"
      region.rooms[22].zone = "灵鹫宫"
      region.rooms[22].id = 2073
      region.rooms[22].links = {}
        region.rooms[22].links.e = {}
          region.rooms[22].links.e.to = 2074
          region.rooms[22].links.e.con = ""
        region.rooms[22].links.s = {}
          region.rooms[22].links.s.to = 2063
          region.rooms[22].links.s.con = ""
        region.rooms[22].links.w = {}
          region.rooms[22].links.w.to = 2072
          region.rooms[22].links.w.con = ""
        region.rooms[22].links.n = {}
          region.rooms[22].links.n.to = 2082
          region.rooms[22].links.n.con = ""
      region.rooms[22].exits = "south|north|east|west"
      region.rooms[22].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。走廊东面是憩凤阁，是灵鹫宫弟子休息的地方。"
    region.rooms[23] = {}
      region.rooms[23].path = "fly lj;n;e;e;n;e"
      region.rooms[23].name = "憩凤阁"
      region.rooms[23].zone = "灵鹫宫"
      region.rooms[23].id = 2074
      region.rooms[23].links = {}
        region.rooms[23].links.w = {}
          region.rooms[23].links.w.to = 2073
          region.rooms[23].links.w.con = ""
      region.rooms[23].exits = "west"
      region.rooms[23].desc = "    这里是灵鹫宫弟子睡觉的地方，一进门就闻到一阵悠悠的香气，只见房中点了一支大红烛,照的满室生春,床上珠罗纱的帐子，白色缎被上绣着一只黄色的凤凰，壁上挂着一幅工笔仕女图。西首一张几上供着一盆兰花，架子上停着一只白鹦鹉。"
    region.rooms[24] = {}
      region.rooms[24].path = "fly lj;n;w;w;n;n"
      region.rooms[24].name = "画廊"
      region.rooms[24].zone = "灵鹫宫"
      region.rooms[24].id = 2075
      region.rooms[24].links = {}
        region.rooms[24].links.e = {}
          region.rooms[24].links.e.to = 2079
          region.rooms[24].links.e.con = ""
        region.rooms[24].links.w = {}
          region.rooms[24].links.w.to = 2076
          region.rooms[24].links.w.con = ""
        region.rooms[24].links.s = {}
          region.rooms[24].links.s.to = 2068
          region.rooms[24].links.s.con = ""
      region.rooms[24].exits = "south|east|west"
      region.rooms[24].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。"
    region.rooms[25] = {}
      region.rooms[25].path = "fly lj;n;w;w;n;n;w"
      region.rooms[25].name = "画廊"
      region.rooms[25].zone = "灵鹫宫"
      region.rooms[25].id = 2076
      region.rooms[25].links = {}
        region.rooms[25].links.e = {}
          region.rooms[25].links.e.to = 2075
          region.rooms[25].links.e.con = ""
        region.rooms[25].links.w = {}
          region.rooms[25].links.w.to = 2077
          region.rooms[25].links.w.con = ""
      region.rooms[25].exits = "east|west"
      region.rooms[25].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。西面是天山童姥关押犯人的地方，那里是本派禁地，没有童姥的许可，谁也不能进去。"
    region.rooms[26] = {}
      region.rooms[26].path = "fly lj;n;w;w;n;n;w;w"
      region.rooms[26].name = "囚室大门"
      region.rooms[26].zone = "灵鹫宫"
      region.rooms[26].id = 2077
      region.rooms[26].links = {}
        region.rooms[26].links.e = {}
          region.rooms[26].links.e.to = 2076
          region.rooms[26].links.e.con = ""
        region.rooms[26].links.w = {}
          region.rooms[26].links.w.to = 2078
          region.rooms[26].links.w.con = ""
      region.rooms[26].exits = "east|west"
      region.rooms[26].desc = "    这是囚室东边,西面有一扇紧闭的大门(door)。"
    region.rooms[27] = {}
      region.rooms[27].path = "fly lj;n;w;w;n;n;w;w;w"
      region.rooms[27].name = "囚室"
      region.rooms[27].zone = "灵鹫宫"
      region.rooms[27].id = 2078
      region.rooms[27].links = {}
        region.rooms[27].links.e = {}
          region.rooms[27].links.e.to = 2077
          region.rooms[27].links.e.con = ""
      region.rooms[27].exits = "east"
      region.rooms[27].desc = "    这是『灵鹫宫』关押犯人的地方，屋中光线昏暗，气味难闻。屋角隐隐约约有个人影。"
    region.rooms[28] = {}
      region.rooms[28].path = "fly lj;n;w;w;n;n;e"
      region.rooms[28].name = "画廊"
      region.rooms[28].zone = "灵鹫宫"
      region.rooms[28].id = 2079
      region.rooms[28].links = {}
        region.rooms[28].links.w = {}
          region.rooms[28].links.w.to = 2075
          region.rooms[28].links.w.con = ""
        region.rooms[28].links.e = {}
          region.rooms[28].links.e.to = 2080
          region.rooms[28].links.e.con = ""
      region.rooms[28].exits = "east|west"
      region.rooms[28].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。走廊东面通往书房。"
    region.rooms[29] = {}
      region.rooms[29].path = "fly lj;n;w;w;n;n;e;e"
      region.rooms[29].name = "书房大门"
      region.rooms[29].zone = "灵鹫宫"
      region.rooms[29].id = 2080
      region.rooms[29].links = {}
        region.rooms[29].links.w = {}
          region.rooms[29].links.w.to = 2079
          region.rooms[29].links.w.con = ""
        region.rooms[29].links.e = {}
          region.rooms[29].links.e.to = 2081
          region.rooms[29].links.e.con = ""
      region.rooms[29].exits = "east|west"
      region.rooms[29].desc = "    这是书房门口，只看见大门两旁贴着一副对联(duilian)，抬头上望。门楣上一块大匾(bian)上写着几个大字。"
    region.rooms[30] = {}
      region.rooms[30].path = "fly lj;n;w;w;n;n;e;e;e"
      region.rooms[30].name = "沁芳轩"
      region.rooms[30].zone = "灵鹫宫"
      region.rooms[30].id = 2081
      region.rooms[30].links = {}
        region.rooms[30].links.w = {}
          region.rooms[30].links.w.to = 2080
          region.rooms[30].links.w.con = ""
      region.rooms[30].exits = "west"
      region.rooms[30].desc = "    这是『灵鹫宫』的书房，靠墙摆放着一溜书架，上面整齐地排列着各种书籍。屋子正中是一张墨色小几，几上的香炉冒出缕缕轻烟，几前有个蒲团可供你盘坐而读，除此之外别无他物。你不由低呼：“好一个雅静所在！”"
    region.rooms[31] = {}
      region.rooms[31].path = "fly lj;n;e;e;n;n"
      region.rooms[31].name = "画廊"
      region.rooms[31].zone = "灵鹫宫"
      region.rooms[31].id = 2082
      region.rooms[31].links = {}
        region.rooms[31].links.e = {}
          region.rooms[31].links.e.to = 2083
          region.rooms[31].links.e.con = ""
        region.rooms[31].links.w = {}
          region.rooms[31].links.w.to = 2085
          region.rooms[31].links.w.con = ""
        region.rooms[31].links.s = {}
          region.rooms[31].links.s.to = 2073
          region.rooms[31].links.s.con = ""
        region.rooms[31].links.n = {}
          region.rooms[31].links.n.to = 2087
          region.rooms[31].links.n.con = ""
      region.rooms[31].exits = "south|north|east|west"
      region.rooms[31].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。"
    region.rooms[32] = {}
      region.rooms[32].path = "fly lj;n;e;e;n;n;e"
      region.rooms[32].name = "画廊"
      region.rooms[32].zone = "灵鹫宫"
      region.rooms[32].id = 2083
      region.rooms[32].links = {}
        region.rooms[32].links.w = {}
          region.rooms[32].links.w.to = 2082
          region.rooms[32].links.w.con = ""
        region.rooms[32].links.e = {}
          region.rooms[32].links.e.to = 2084
          region.rooms[32].links.e.con = ""
      region.rooms[32].exits = "east|west"
      region.rooms[32].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。走廊东面通往梳妆楼。"
    region.rooms[33] = {}
      region.rooms[33].path = "fly lj;n;e;e;n;n;e;e"
      region.rooms[33].name = "缀锦阁"
      region.rooms[33].zone = "灵鹫宫"
      region.rooms[33].id = 2084
      region.rooms[33].links = {}
        region.rooms[33].links.w = {}
          region.rooms[33].links.w.to = 2083
          region.rooms[33].links.w.con = ""
      region.rooms[33].exits = "west"
      region.rooms[33].desc = "    这是日常梳妆打扮的地方，放着一张红木梳妆台 ， 正对着你的是一面光润的铜镜(jingzi)，梳妆台上散落着一些胭脂花粉。台旁摆着斗大的一个汝瓷花囊，插着满满的水晶球儿般的白菊。"
    region.rooms[34] = {}
      region.rooms[34].path = "fly lj;n;e;e;n;n;w"
      region.rooms[34].name = "画廊"
      region.rooms[34].zone = "灵鹫宫"
      region.rooms[34].id = 2085
      region.rooms[34].links = {}
        region.rooms[34].links.e = {}
          region.rooms[34].links.e.to = 2082
          region.rooms[34].links.e.con = ""
        region.rooms[34].links.w = {}
          region.rooms[34].links.w.to = 2086
          region.rooms[34].links.w.con = ""
      region.rooms[34].exits = "east|west"
      region.rooms[34].desc = "    这是一条非常精美的长廊，柱子和栏杆是用华贵的紫檀木制成，上面雕饰着美丽的图画，画工精巧，美不胜收。地板不知是用什么材料做的，走在上面毫无声息，你只感到脚下软软的，非常舒服。走廊西面通往本派的练功宝地--『玄冰室』！"
    region.rooms[35] = {}
      region.rooms[35].path = "fly lj;n;e;e;n;n;w;w"
      region.rooms[35].name = "玄冰室"
      region.rooms[35].zone = "灵鹫宫"
      region.rooms[35].id = 2086
      region.rooms[35].links = {}
        region.rooms[35].links.e = {}
          region.rooms[35].links.e.to = 2085
          region.rooms[35].links.e.con = ""
      region.rooms[35].exits = "east"
      region.rooms[35].desc = "    这是修练内功的地方。屋子正中有一块千年玄冰(ice)，冰上冒出丝丝寒气，屋里因此寒气逼人，你不由得打了一个寒颤。"
    region.rooms[36] = {}
      region.rooms[36].path = "fly lj;n;e;e;n;n;n"
      region.rooms[36].name = "潇湘馆"
      region.rooms[36].zone = "灵鹫宫"
      region.rooms[36].id = 2087
      region.rooms[36].links = {}
        region.rooms[36].links.s = {}
          region.rooms[36].links.s.to = 2082
          region.rooms[36].links.s.con = ""
      region.rooms[36].exits = "south"
      region.rooms[36].desc = "    这是『灵鹫宫』的裁缝室。几个女子围坐在一块，飞针走线，苦练女红，难道她们是为了以后找一个好婆家吗？ "
    region.rooms[37] = {}
      region.rooms[37].path = "fly lj;n;n;n"
      region.rooms[37].name = "小道"
      region.rooms[37].zone = "灵鹫宫"
      region.rooms[37].id = 2088
      region.rooms[37].links = {}
        region.rooms[37].links.s = {}
          region.rooms[37].links.s.to = 2071
          region.rooms[37].links.s.con = ""
        region.rooms[37].links.n = {}
          region.rooms[37].links.n.to = 2089
          region.rooms[37].links.n.con = ""
      region.rooms[37].exits = "south|north"
      region.rooms[37].desc = "    一条小道蜿延曲折地通向远方, 两旁是郁郁葱葱的树林，微风吹过，树叶发出奚索的声音。"
    region.rooms[38] = {}
      region.rooms[38].path = "fly lj;n;n;n;n"
      region.rooms[38].name = "小道"
      region.rooms[38].zone = "灵鹫宫"
      region.rooms[38].id = 2089
      region.rooms[38].links = {}
        region.rooms[38].links.s = {}
          region.rooms[38].links.s.to = 2088
          region.rooms[38].links.s.con = ""
        region.rooms[38].links.n = {}
          region.rooms[38].links.n.to = 2090
          region.rooms[38].links.n.con = ""
      region.rooms[38].exits = "south|north"
      region.rooms[38].desc = "    一条小道蜿延曲折地通向远方, 两旁是郁郁葱葱的树林，微风吹过，树叶发出奚索的声音."
    region.rooms[39] = {}
      region.rooms[39].path = "fly lj;n;n;n;n;n"
      region.rooms[39].name = "闭关室大门"
      region.rooms[39].zone = "灵鹫宫"
      region.rooms[39].id = 2090
      region.rooms[39].links = {}
        region.rooms[39].links.s = {}
          region.rooms[39].links.s.to = 2089
          region.rooms[39].links.s.con = ""
        region.rooms[39].links.n = {}
          region.rooms[39].links.n.to = 2091
          region.rooms[39].links.n.con = ""
      region.rooms[39].exits = "south|north"
      region.rooms[39].desc = "    这是闭关室南边，北面有一扇大门。"
    region.rooms[40] = {}
      region.rooms[40].path = "fly lj;n;n;n;n;n;n"
      region.rooms[40].name = "闭关室"
      region.rooms[40].zone = "灵鹫宫"
      region.rooms[40].id = 2091
      region.rooms[40].links = {}
        region.rooms[40].links.s = {}
          region.rooms[40].links.s.to = 2090
          region.rooms[40].links.s.con = ""
      region.rooms[40].exits = "south"
      region.rooms[40].desc = "    这是天山童姥闭关修练的地方，只见一个身材娇小, 貌如处子的十八九岁的女子盘膝而坐，她就是闻名天下的天山童姥。如果不是她的亲传弟子，千万不要轻易打搅。"
    region.rooms[41] = {}
      region.rooms[41].path = "fly lj;n;n;move jiashan;enter"
      region.rooms[41].name = "密道"
      region.rooms[41].zone = "灵鹫宫"
      region.rooms[41].id = 2092
      region.rooms[41].links = {}
        region.rooms[41].links.u = {}
          region.rooms[41].links.u.to = 2071
          region.rooms[41].links.u.con = ""
        region.rooms[41].links.nd = {}
          region.rooms[41].links.nd.to = 2093
          region.rooms[41].links.nd.con = ""
      region.rooms[41].exits = "up|northdown"
      region.rooms[41].desc = "    你的眼前是一条用汉白玉铺成的台阶，一直向下延伸，两边的墙壁都是花岗岩，墙上隔十来步就有一盏油灯，使你能看清周围。"
    region.rooms[42] = {}
      region.rooms[42].path = "fly lj;n;n;move jiashan;enter;nd"
      region.rooms[42].name = "密道"
      region.rooms[42].zone = "灵鹫宫"
      region.rooms[42].id = 2093
      region.rooms[42].links = {}
        region.rooms[42].links.nd = {}
          region.rooms[42].links.nd.to = 2094
          region.rooms[42].links.nd.con = ""
        region.rooms[42].links.su = {}
          region.rooms[42].links.su.to = 2092
          region.rooms[42].links.su.con = ""
      region.rooms[42].exits = "northdown|southup"
      region.rooms[42].desc = "    你的眼前是一条用汉白玉铺成的台阶，一直向下延伸，两边的墙壁都是花岗岩，墙上隔十来步就有一盏油灯，使你能看清周围。"
    region.rooms[43] = {}
      region.rooms[43].path = "fly lj;n;n;move jiashan;enter;nd;nd"
      region.rooms[43].name = "密道"
      region.rooms[43].zone = "灵鹫宫"
      region.rooms[43].id = 2094
      region.rooms[43].links = {}
        region.rooms[43].links.ed = {}
          region.rooms[43].links.ed.to = 2095
          region.rooms[43].links.ed.con = ""
        region.rooms[43].links.su = {}
          region.rooms[43].links.su.to = 2093
          region.rooms[43].links.su.con = ""
      region.rooms[43].exits = "eastdown|southup"
      region.rooms[43].desc = "    你的眼前是一条用汉白玉铺成的台阶，一直向下延伸，两边的墙壁都是花岗岩，墙上隔十来步就有一盏油灯，使你能看清周围。"
    region.rooms[44] = {}
      region.rooms[44].path = "fly lj;n;n;move jiashan;enter;nd;nd;ed"
      region.rooms[44].name = "密道"
      region.rooms[44].zone = "灵鹫宫"
      region.rooms[44].id = 2095
      region.rooms[44].links = {}
        region.rooms[44].links.n = {}
          region.rooms[44].links.n.to = 2096
          region.rooms[44].links.n.con = ""
        region.rooms[44].links.wu = {}
          region.rooms[44].links.wu.to = 2094
          region.rooms[44].links.wu.con = ""
      region.rooms[44].exits = "westup|north"
      region.rooms[44].desc = "    台阶终于走到了头，眼前是一间小小的石室，周围墙壁上插着几盏油灯，照得石室里一片昏黄。北边有一条通道。"
    region.rooms[45] = {}
      region.rooms[45].path = "fly lj;n;n;move jiashan;enter;nd;nd;ed;n"
      region.rooms[45].name = "密道"
      region.rooms[45].zone = "灵鹫宫"
      region.rooms[45].id = 2096
      region.rooms[45].links = {}
        region.rooms[45].links.w = {}
          region.rooms[45].links.w.to = 2097
          region.rooms[45].links.w.con = ""
        region.rooms[45].links.n = {}
          region.rooms[45].links.n.to = 2098
          region.rooms[45].links.n.con = ""
      region.rooms[45].exits = "south|east|north|west"
      region.rooms[45].desc = "    你走着走着，突然发现你迷失了方向，你往回走的时候却发现那已不是你来的道路了，你不禁心中一阵发麻。突然你在昏黄的灯光下，隐约发现两边的汉白玉墙壁上刻着一些奇形怪状的符号(fuhao)。"
    region.rooms[46] = {}
      region.rooms[46].path = "fly lj;n;n;move jiashan;enter;nd;nd;ed;n;w"
      region.rooms[46].name = "密道"
      region.rooms[46].zone = "灵鹫宫"
      region.rooms[46].id = 2097
      region.rooms[46].links = {}
        region.rooms[46].links.e = {}
          region.rooms[46].links.e.to = 2096
          region.rooms[46].links.e.con = ""
      region.rooms[46].exits = "south|east|north|west"
      region.rooms[46].desc = "    你走着走着，突然发现你迷失了方向，你往回走的时候却发现那已不是你来的道路了，你不禁心中一阵发麻。突然你在昏黄的灯光下，隐约发现两边的汉白玉墙壁上刻着一些奇形怪状的符号(fuhao)。"
    region.rooms[47] = {}
      region.rooms[47].path = "fly lj;n;n;move jiashan;enter;nd;nd;ed;n;n"
      region.rooms[47].name = "密道"
      region.rooms[47].zone = "灵鹫宫"
      region.rooms[47].id = 2098
      region.rooms[47].links = {}
        region.rooms[47].links.s = {}
          region.rooms[47].links.s.to = 2096
          region.rooms[47].links.s.con = ""
        region.rooms[47].links.n = {}
          region.rooms[47].links.n.to = 2099
          region.rooms[47].links.n.con = ""
      region.rooms[47].exits = "south|east|north|west"
      region.rooms[47].desc = "    你走着走着，突然发现你迷失了方向，你往回走的时候却发现那已不是你来的道路了，你不禁心中一阵发麻。突然你在昏黄的灯光下，隐约发现两边的汉白玉墙壁上刻着一些奇形怪状的符号(fuhao)。"
    region.rooms[48] = {}
      region.rooms[48].path = "fly lj;n;n;move jiashan;enter;nd;nd;ed;n;n;n"
      region.rooms[48].name = "密道"
      region.rooms[48].zone = "灵鹫宫"
      region.rooms[48].id = 2099
      region.rooms[48].links = {}
        region.rooms[48].links.n = {}
          region.rooms[48].links.n.to = 2100
          region.rooms[48].links.n.con = ""
      region.rooms[48].exits = "south|east|north|west"
      region.rooms[48].desc = "    你走着走着，突然发现你迷失了方向，你往回走的时候却发现那已不是你来的道路了，你不禁心中一阵发麻。突然你在昏黄的灯光下，隐约发现两边的汉白玉墙壁上刻着一些奇形怪状的符号(fuhao)。"
    region.rooms[49] = {}
      region.rooms[49].path = "fly lj;n;n;move jiashan;enter;nd;nd;ed;n;n;n;n"
      region.rooms[49].name = "密道"
      region.rooms[49].zone = "灵鹫宫"
      region.rooms[49].id = 2100
      region.rooms[49].links = {}
        region.rooms[49].links.n = {}
          region.rooms[49].links.n.to = 2101
          region.rooms[49].links.n.con = ""
      region.rooms[49].exits = "south|east|north|west"
      region.rooms[49].desc = "    你走着走着，突然发现你迷失了方向，你往回走的时候却发现那已不是你来的道路了，你不禁心中一阵发麻。突然你在昏黄的灯光下，隐约发现两边的汉白玉墙壁上刻着一些奇形怪状的符号(fuhao)。"
    region.rooms[50] = {}
      region.rooms[50].path = "fly lj;n;n;move jiashan;enter;nd;nd;ed;n;n;n;n;n"
      region.rooms[50].name = "密道"
      region.rooms[50].zone = "灵鹫宫"
      region.rooms[50].id = 2101
      region.rooms[50].links = {}
        region.rooms[50].links.e = {}
          region.rooms[50].links.e.to = 2102
          region.rooms[50].links.e.con = ""
      region.rooms[50].exits = "south|east|north|west"
      region.rooms[50].desc = "    你走着走着，突然发现你迷失了方向，你往回走的时候却发现那已不是你来的道路了，你不禁心中一阵发麻。突然你在昏黄的灯光下，隐约发现两边的汉白玉墙壁上刻着一些奇形怪状的符号(fuhao)。"
    region.rooms[51] = {}
      region.rooms[51].path = "fly lj;n;n;move jiashan;enter;nd;nd;ed;n;n;n;n;n;e"
      region.rooms[51].name = "密道"
      region.rooms[51].zone = "灵鹫宫"
      region.rooms[51].id = 2102
      region.rooms[51].links = {}
        region.rooms[51].links.n = {}
          region.rooms[51].links.n.to = 2103
          region.rooms[51].links.n.con = ""
      region.rooms[51].exits = "south|east|north|west"
      region.rooms[51].desc = "    你走着走着，突然发现你迷失了方向，你往回走的时候却发现那已不是你来的道路了，你不禁心中一阵发麻。突然你在昏黄的灯光下，隐约发现两边的汉白玉墙壁上刻着一些奇形怪状的符号(fuhao)。"
    region.rooms[52] = {}
      region.rooms[52].path = "fly lj;n;n;move jiashan;enter;nd;nd;ed;n;n;n;n;n;e;n"
      region.rooms[52].name = "密道"
      region.rooms[52].zone = "灵鹫宫"
      region.rooms[52].id = 2103
      region.rooms[52].links = {}
        region.rooms[52].links.w = {}
          region.rooms[52].links.w.to = 2104
          region.rooms[52].links.w.con = ""
      region.rooms[52].exits = "south|east|north|west"
      region.rooms[52].desc = "    你走着走着，突然发现你迷失了方向，你往回走的时候却发现那已不是你来的道路了，你不禁心中一阵发麻。突然你在昏黄的灯光下，隐约发现两边的汉白玉墙壁上刻着一些奇形怪状的符号(fuhao)。"
    region.rooms[53] = {}
      region.rooms[53].path = "fly lj;n;n;move jiashan;enter;nd;nd;ed;n;n;n;n;n;e;n;w"
      region.rooms[53].name = "密室"
      region.rooms[53].zone = "灵鹫宫"
      region.rooms[53].id = 2104
      region.rooms[53].links = {}
        region.rooms[53].links.u = {}
          region.rooms[53].links.u.to = 2071
          region.rooms[53].links.u.con = ""
      region.rooms[53].exits = "up"
      region.rooms[53].desc = "    这是个阴暗的密室，墙上的油灯发出昏暗的黄光。"
  region.center = 2052
return region