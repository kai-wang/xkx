local region = {}
  region.cmd = "fly xs"
  region.name = "雪山寺"
  region.id = "xs"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly xs"
      region.rooms[1].name = "雪山寺山门"
      region.rooms[1].zone = "雪山寺|血刀门"
      region.rooms[1].id = 2110
      region.rooms[1].desc = "    这里是大轮寺的山门，门前是络绎不绝的进香朝圣的信徒，有的甚至来自乌丝藏西南的波丝。山门(gate)前站了个手持法器的葛伦布在维持秩序，东方是一条青石板铺成的山路。"
      region.rooms[1].exits = "north|eastdown"
      region.rooms[1].links = {}
        region.rooms[1].links.ed = {}
          region.rooms[1].links.ed.to = 2134
          region.rooms[1].links.ed.con = ""
        region.rooms[1].links.n = {}
          region.rooms[1].links.n.to = 2111
          region.rooms[1].links.n.con = ""
    region.rooms[2] = {}
      region.rooms[2].path = "fly xs;n"
      region.rooms[2].name = "广场"
      region.rooms[2].zone = "雪山寺"
      region.rooms[2].id = 2111
      region.rooms[2].desc = "    这里是雪山寺内的广场。广场石埕铺就，黄土垫砌，平整而坚实。广场的北面就是依山而建的雪山寺大殿。往西是块练武场，南面是山门。寺内有一些手持僧棍的僧兵在巡逻。"
      region.rooms[2].exits = "south|north|east|west"
      region.rooms[2].links = {}
        region.rooms[2].links.e = {}
          region.rooms[2].links.e.to = 2112
          region.rooms[2].links.e.con = ""
        region.rooms[2].links.s = {}
          region.rooms[2].links.s.to = 2110
          region.rooms[2].links.s.con = ""
        region.rooms[2].links.w = {}
          region.rooms[2].links.w.to = 2114
          region.rooms[2].links.w.con = ""
        region.rooms[2].links.n = {}
          region.rooms[2].links.n.to = 2119
          region.rooms[2].links.n.con = ""
    region.rooms[3] = {}
      region.rooms[3].path = "fly xs;n;e"
      region.rooms[3].name = "小院"
      region.rooms[3].zone = "雪山寺"
      region.rooms[3].id = 2112
      region.rooms[3].desc = "    这里是寺内的小院，收拾的相当干净利索。来来往往的香客和喇嘛，一边在暗示着雪山寺香火之盛，一边也好象在表示喇嘛的口福也真不坏。因为北边就是个厨房。"
      region.rooms[3].exits = "north|west"
      region.rooms[3].links = {}
        region.rooms[3].links.w = {}
          region.rooms[3].links.w.to = 2111
          region.rooms[3].links.w.con = ""
        region.rooms[3].links.n = {}
          region.rooms[3].links.n.to = 2113
          region.rooms[3].links.n.con = ""
    region.rooms[4] = {}
      region.rooms[4].path = "fly xs;n;e;n"
      region.rooms[4].name = "厨房"
      region.rooms[4].zone = "雪山寺"
      region.rooms[4].id = 2113
      region.rooms[4].desc = "    这里是雪山寺的厨房，新来的僧人可以在此打杂。房中醒目的位置有一块牌子（paizi）。"
      region.rooms[4].exits = "south"
      region.rooms[4].links = {}
        region.rooms[4].links.s = {}
          region.rooms[4].links.s.to = 2112
          region.rooms[4].links.s.con = ""
    region.rooms[5] = {}
      region.rooms[5].path = "fly xs;n;w"
      region.rooms[5].name = "练武场"
      region.rooms[5].zone = "雪山寺"
      region.rooms[5].id = 2114
      region.rooms[5].desc = "    这里是雪山寺练武场，树着好多木桩和沙袋，僧人们日常均在此习武。东边是广场，西边有个小库房，南边一大片开阔地，就是雪山闻名海内的祭坛了。"
      region.rooms[5].exits = "south|north|east|west"
      region.rooms[5].links = {}
        region.rooms[5].links.e = {}
          region.rooms[5].links.e.to = 2111
          region.rooms[5].links.e.con = ""
        region.rooms[5].links.w = {}
          region.rooms[5].links.w.to = 2115
          region.rooms[5].links.w.con = ""
        region.rooms[5].links.n = {}
          region.rooms[5].links.n.to = 2116
          region.rooms[5].links.n.con = ""
    region.rooms[6] = {}
      region.rooms[6].path = "fly xs;n;w;w"
      region.rooms[6].name = "库房"
      region.rooms[6].zone = "雪山寺"
      region.rooms[6].id = 2115
      region.rooms[6].desc = "    这里是练武场旁边的小库房，房里密不通风，只有一丝光线从屋檐小缝中投射进来。房中有些备用的武器，都是雪山弟子日常练功需要用到的兵器。"
      region.rooms[6].exits = "east"
      region.rooms[6].links = {}
        region.rooms[6].links.e = {}
          region.rooms[6].links.e.to = 2114
          region.rooms[6].links.e.con = ""
    region.rooms[7] = {}
      region.rooms[7].path = "fly xs;n;w;n"
      region.rooms[7].name = "后院"
      region.rooms[7].zone = "雪山寺"
      region.rooms[7].id = 2116
      region.rooms[7].desc = "    这里是雪山寺的后院，后院不大，栽了几株参天雪松，在白晃晃的雪山背景下，竟是飘然出世的心动。南边是练武场，北边是后门。"
      region.rooms[7].exits = "south|north|eastdown"
      region.rooms[7].links = {}
        region.rooms[7].links.ed = {}
          region.rooms[7].links.ed.to = 2118
          region.rooms[7].links.ed.con = ""
        region.rooms[7].links.s = {}
          region.rooms[7].links.s.to = 2114
          region.rooms[7].links.s.con = ""
        region.rooms[7].links.n = {}
          region.rooms[7].links.n.to = 2117
          region.rooms[7].links.n.con = ""
    region.rooms[8] = {}
      region.rooms[8].path = "fly xs;n;w;n;n"
      region.rooms[8].name = "后门"
      region.rooms[8].zone = "雪山寺"
      region.rooms[8].id = 2117
      region.rooms[8].desc = "    这是雪山寺的后门。一片破落而萧索模样。喇嘛们香火也足，花用也大。这是后门，虽然未免寒酸，可也总可以掖着。"
      region.rooms[8].exits = "south"
      region.rooms[8].links = {}
        region.rooms[8].links.s = {}
          region.rooms[8].links.s.to = 2116
          region.rooms[8].links.s.con = ""
    region.rooms[9] = {}
      region.rooms[9].path = "fly xs;n;w;n;ed"
      region.rooms[9].name = "地牢"
      region.rooms[9].zone = "雪山寺"
      region.rooms[9].id = 2118
      region.rooms[9].desc = "    这是一个阴暗、潮湿的牢房。你感到奇怪的是怎麽会不时听到一点怪声却怎么也找不到人呢? "
      region.rooms[9].exits = "westup"
      region.rooms[9].links = {}
        region.rooms[9].links.wu = {}
          region.rooms[9].links.wu.to = 2116
          region.rooms[9].links.wu.con = ""
    region.rooms[10] = {}
      region.rooms[10].path = "fly xs;n;n"
      region.rooms[10].name = "大殿"
      region.rooms[10].zone = "雪山寺"
      region.rooms[10].id = 2119
      region.rooms[10].desc = "    这里是雪山寺的大殿，中央供奉着佛祖塑像。僧人们在念着经文。远来的香客们在这里虔诚地膜拜。大殿两侧都是侧殿。"
      region.rooms[10].exits = "south|east|west"
      region.rooms[10].links = {}
        region.rooms[10].links.e = {}
          region.rooms[10].links.e.to = 2120
          region.rooms[10].links.e.con = ""
        region.rooms[10].links.s = {}
          region.rooms[10].links.s.to = 2111
          region.rooms[10].links.s.con = ""
        region.rooms[10].links.w = {}
          region.rooms[10].links.w.to = 2121
          region.rooms[10].links.w.con = ""
    region.rooms[11] = {}
      region.rooms[11].path = "fly xs;n;n;e"
      region.rooms[11].name = "侧殿"
      region.rooms[11].zone = "雪山寺"
      region.rooms[11].id = 2120
      region.rooms[11].desc = "    这里是雪山寺的东侧殿。殿内有神态各异的十八罗汉塑像，金旒玉镶，很是庄严。"
      region.rooms[11].exits = "up|west"
      region.rooms[11].links = {}
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 2119
          region.rooms[11].links.w.con = ""
        region.rooms[11].links.u = {}
          region.rooms[11].links.u.to = 2126
          region.rooms[11].links.u.con = ""
    region.rooms[12] = {}
      region.rooms[12].path = "fly xs;n;n;w"
      region.rooms[12].name = "侧殿"
      region.rooms[12].zone = "雪山寺"
      region.rooms[12].id = 2121
      region.rooms[12].desc = "    这里是雪山寺的西侧殿。墙壁上描绘着佛祖传道的故事，佛祖手拈金花宝相庄严。"
      region.rooms[12].exits = "up|east"
      region.rooms[12].links = {}
        region.rooms[12].links.e = {}
          region.rooms[12].links.e.to = 2119
          region.rooms[12].links.e.con = ""
        region.rooms[12].links.u = {}
          region.rooms[12].links.u.to = 2122
          region.rooms[12].links.u.con = ""
    region.rooms[13] = {}
      region.rooms[13].path = "fly xs;n;n;w;u"
      region.rooms[13].name = "走廊"
      region.rooms[13].zone = "雪山寺"
      region.rooms[13].id = 2122
      region.rooms[13].desc = "    这里是雪山寺内的走廊。这里有点幽暗，天花板上有一些不知道确切含义的雕刻，墙壁上则是很通俗的佛经故事壁画了。壁上点着几碗大海灯照明。"
      region.rooms[13].exits = "east|eastup|down"
      region.rooms[13].links = {}
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 2123
          region.rooms[13].links.e.con = ""
        region.rooms[13].links.d = {}
          region.rooms[13].links.d.to = 2121
          region.rooms[13].links.d.con = ""
        region.rooms[13].links.eu = {}
          region.rooms[13].links.eu.to = 2128
          region.rooms[13].links.eu.con = ""
    region.rooms[14] = {}
      region.rooms[14].path = "fly xs;n;n;e;u;w"
      region.rooms[14].name = "大厅"
      region.rooms[14].zone = "雪山寺"
      region.rooms[14].id = 2123
      region.rooms[14].desc = "    这里是寺内的大厅，几位有道的高僧在高声辩论。看来正在引经据典，争斗机锋。"
      region.rooms[14].exits = "northwest|east|southeast|northeast|west"
      region.rooms[14].links = {}
        region.rooms[14].links.ne = {}
          region.rooms[14].links.ne.to = 2127
          region.rooms[14].links.ne.con = ""
        region.rooms[14].links.se = {}
          region.rooms[14].links.se.to = 2125
          region.rooms[14].links.se.con = ""
        region.rooms[14].links.e = {}
          region.rooms[14].links.e.to = 2126
          region.rooms[14].links.e.con = ""
        region.rooms[14].links.nw = {}
          region.rooms[14].links.nw.to = 2124
          region.rooms[14].links.nw.con = ""
        region.rooms[14].links.w = {}
          region.rooms[14].links.w.to = 2122
          region.rooms[14].links.w.con = ""
    region.rooms[15] = {}
      region.rooms[15].path = "fly xs;n;n;e;u;w;nw"
      region.rooms[15].name = "雪山藏经室"
      region.rooms[15].zone = "雪山寺"
      region.rooms[15].id = 2124
      region.rooms[15].desc = "    这里是雪山寺的藏经室，靠墙是一排书架，摆满了各种拳谱、书籍。大多是当年掌门人鸠摩智翻译的佛经和从少林寺取来的武学典籍。"
      region.rooms[15].exits = "southeast"
      region.rooms[15].links = {}
        region.rooms[15].links.se = {}
          region.rooms[15].links.se.to = 2123
          region.rooms[15].links.se.con = ""
    region.rooms[16] = {}
      region.rooms[16].path = "fly xs;n;n;e;u;w;se"
      region.rooms[16].name = "藏经阁"
      region.rooms[16].zone = "雪山寺"
      region.rooms[16].id = 2125
      region.rooms[16].desc = "    这里是雪山寺的藏经之处。书架上林林总总都是梵文典籍。你一个字也看不懂。"
      region.rooms[16].exits = "northwest"
      region.rooms[16].links = {}
        region.rooms[16].links.nw = {}
          region.rooms[16].links.nw.to = 2123
          region.rooms[16].links.nw.con = ""
    region.rooms[17] = {}
      region.rooms[17].path = "fly xs;n;n;e;u"
      region.rooms[17].name = "走廊"
      region.rooms[17].zone = "雪山寺"
      region.rooms[17].id = 2126
      region.rooms[17].desc = "    这里是雪山寺内的走廊。这里有点幽暗，天花板上有一些不知道确切含义的雕刻，墙壁上则是很通俗的佛经故事壁画了。壁上点着几碗大海灯照明。"
      region.rooms[17].exits = "westup|west|down"
      region.rooms[17].links = {}
        region.rooms[17].links.d = {}
          region.rooms[17].links.d.to = 2120
          region.rooms[17].links.d.con = ""
        region.rooms[17].links.w = {}
          region.rooms[17].links.w.to = 2123
          region.rooms[17].links.w.con = ""
        region.rooms[17].links.wu = {}
          region.rooms[17].links.wu.to = 2128
          region.rooms[17].links.wu.con = ""
    region.rooms[18] = {}
      region.rooms[18].path = "fly xs;n;n;e;u;w;ne"
      region.rooms[18].name = "禅室"
      region.rooms[18].zone = "雪山寺"
      region.rooms[18].id = 2127
      region.rooms[18].desc = "    这里是僧人门参禅打坐的地方。侧壁一列禅床让人看了就想到该想的事。"
      region.rooms[18].exits = "southwest"
      region.rooms[18].links = {}
        region.rooms[18].links.sw = {}
          region.rooms[18].links.sw.to = 2123
          region.rooms[18].links.sw.con = ""
    region.rooms[19] = {}
      region.rooms[19].path = "fly xs;n;n;e;u;wu"
      region.rooms[19].name = "走廊"
      region.rooms[19].zone = "雪山寺"
      region.rooms[19].id = 2128
      region.rooms[19].desc = "    这里是雪山寺内的走廊。这里有点幽暗，天花板上有一些不知道确切含义的雕刻，墙壁上则是很通俗的佛经故事壁画了。壁上点着几碗大海灯照明。"
      region.rooms[19].exits = "north|eastdown|westdown"
      region.rooms[19].links = {}
        region.rooms[19].links.ed = {}
          region.rooms[19].links.ed.to = 2126
          region.rooms[19].links.ed.con = ""
        region.rooms[19].links.wd = {}
          region.rooms[19].links.wd.to = 2122
          region.rooms[19].links.wd.con = ""
        region.rooms[19].links.n = {}
          region.rooms[19].links.n.to = 2129
          region.rooms[19].links.n.con = ""
    region.rooms[20] = {}
      region.rooms[20].path = "fly xs;n;n;e;u;wu;n"
      region.rooms[20].name = "内殿"
      region.rooms[20].zone = "雪山寺"
      region.rooms[20].id = 2129
      region.rooms[20].desc = "    这里是雪山寺的内殿，也是掌门人见客的地方。雪山寺的掌门人、大轮明王、吐蕃国师鸠摩智是西域一代高僧，也是西域不世出的武林宗师。他驻锡本寺后，雪山寺方声名远播。"
      region.rooms[20].exits = "south|north|east|west"
      region.rooms[20].links = {}
        region.rooms[20].links.e = {}
          region.rooms[20].links.e.to = 2130
          region.rooms[20].links.e.con = ""
        region.rooms[20].links.s = {}
          region.rooms[20].links.s.to = 2128
          region.rooms[20].links.s.con = ""
        region.rooms[20].links.w = {}
          region.rooms[20].links.w.to = 2131
          region.rooms[20].links.w.con = ""
        region.rooms[20].links.n = {}
          region.rooms[20].links.n.to = 2133
          region.rooms[20].links.n.con = ""
    region.rooms[21] = {}
      region.rooms[21].path = "fly xs;n;n;e;u;wu;n;e"
      region.rooms[21].name = "天台"
      region.rooms[21].zone = "雪山寺"
      region.rooms[21].id = 2130
      region.rooms[21].desc = "    这里是雪山寺的高处。北边可见雄伟的大雪山，南边可以俯瞰美丽如镜的圣湖。"
      region.rooms[21].exits = "west"
      region.rooms[21].links = {}
        region.rooms[21].links.w = {}
          region.rooms[21].links.w.to = 2129
          region.rooms[21].links.w.con = ""
    region.rooms[22] = {}
      region.rooms[22].path = "fly xs;n;n;e;u;wu;n;w"
      region.rooms[22].name = "密道"
      region.rooms[22].zone = "雪山寺"
      region.rooms[22].id = 2131
      region.rooms[22].desc = "    这是一条狭窄的暗道。阴森可怕，到处积满了灰尘，结满了蛛网，也不知道通往何处。"
      region.rooms[22].exits = "east|north"
      region.rooms[22].links = {}
        region.rooms[22].links.e = {}
          region.rooms[22].links.e.to = 2129
          region.rooms[22].links.e.con = ""
        region.rooms[22].links.n = {}
          region.rooms[22].links.n.to = 2132
          region.rooms[22].links.n.con = ""
    region.rooms[23] = {}
      region.rooms[23].path = "fly xs;n;n;e;u;wu;n;w;n"
      region.rooms[23].name = "密室"
      region.rooms[23].zone = "雪山寺"
      region.rooms[23].id = 2132
      region.rooms[23].desc = "    这是一条小房间。什么东西都没有。"
      region.rooms[23].exits = "south|down"
      region.rooms[23].links = {}
        region.rooms[23].links.s = {}
          region.rooms[23].links.s.to = 2131
          region.rooms[23].links.s.con = ""
        region.rooms[23].links.d = {}
          region.rooms[23].links.d.to = 40
          region.rooms[23].links.d.con = ""
    region.rooms[24] = {}
      region.rooms[24].path = "fly xs;n;n;e;u;wu;n;n"
      region.rooms[24].name = "后殿"
      region.rooms[24].zone = "雪山寺"
      region.rooms[24].id = 2133
      region.rooms[24].desc = "    这里是雪山寺的后殿，也是雪山弟子闭门练功的地方。殿内是一些练功的蒲团和木人，还有一些吊挂着的沙袋和直竖的木桩。"
      region.rooms[24].exits = "south"
      region.rooms[24].links = {}
        region.rooms[24].links.s = {}
          region.rooms[24].links.s.to = 2129
          region.rooms[24].links.s.con = ""
    region.rooms[25] = {}
      region.rooms[25].path = "fly xs;ed"
      region.rooms[25].name = "大雪山山路"
      region.rooms[25].zone = "血刀门|雪山寺"
      region.rooms[25].id = 2134
      region.rooms[25].desc = "    大雪山北麓的地势不是甚高，周围还有一些小山丘。西面有一座寺院依山而建。显得异常高大。寺院呈平顶梯型，多由大石砌成，墙体厚实，窗口窄小。"
      region.rooms[25].exits = "westup|north"
      region.rooms[25].links = {}
        region.rooms[25].links.wu = {}
          region.rooms[25].links.wu.to = 2110
          region.rooms[25].links.wu.con = ""
        region.rooms[25].links.n = {}
          region.rooms[25].links.n.to = 2135
          region.rooms[25].links.n.con = ""
    region.rooms[26] = {}
      region.rooms[26].path = "fly xs;ed;n"
      region.rooms[26].name = "大雪山北麓"
      region.rooms[26].zone = "血刀门|雪山寺"
      region.rooms[26].id = 2135
      region.rooms[26].desc = "    这里山势比大雪山东面稍缓，也不是十分的严寒。山道两旁长得有稀稀拉拉的一些野草。四下毫无人迹，只有几只秃鹰在高处盘旋，俯视着茫茫雪山。"
      region.rooms[26].exits = "south|eastdown"
      region.rooms[26].links = {}
        region.rooms[26].links.s = {}
          region.rooms[26].links.s.to = 2134
          region.rooms[26].links.s.con = ""
        region.rooms[26].links.ed = {}
          region.rooms[26].links.ed.to = 2136
          region.rooms[26].links.ed.con = ""
    region.rooms[27] = {}
      region.rooms[27].path = "fly xs;ed;n;ed"
      region.rooms[27].name = "山路"
      region.rooms[27].zone = "血刀门|雪山寺"
      region.rooms[27].id = 2136
      region.rooms[27].desc = "    你走在一山路上，四周有一座座小山丘。能遥望见西南方大雪山的北麓。山前隐隐约约象是有一座寺院。"
      region.rooms[27].exits = "westup|eastdown"
      region.rooms[27].links = {}
        region.rooms[27].links.ed = {}
          region.rooms[27].links.ed.to = 2137
          region.rooms[27].links.ed.con = ""
        region.rooms[27].links.wu = {}
          region.rooms[27].links.wu.to = 2135
          region.rooms[27].links.wu.con = ""
    region.rooms[28] = {}
      region.rooms[28].path = "fly xs;ed;n;ed;ed"
      region.rooms[28].name = "山路"
      region.rooms[28].zone = "血刀门|雪山寺"
      region.rooms[28].id = 2137
      region.rooms[28].desc = "    山路越走越窄，能隐隐望见前方又分出了几条叉路。"
      region.rooms[28].exits = "westup|northdown|southup"
      region.rooms[28].links = {}
        region.rooms[28].links.nd = {}
          region.rooms[28].links.nd.to = 2138
          region.rooms[28].links.nd.con = ""
        region.rooms[28].links.wu = {}
          region.rooms[28].links.wu.to = 2136
          region.rooms[28].links.wu.con = ""
        region.rooms[28].links.su = {}
          region.rooms[28].links.su.to = 2152
          region.rooms[28].links.su.con = ""
    region.rooms[29] = {}
      region.rooms[29].path = "fly xs;ed;n;ed;ed;nd"
      region.rooms[29].name = "山路"
      region.rooms[29].zone = "血刀门|雪山寺"
      region.rooms[29].id = 2138
      region.rooms[29].desc = "    这是一条崎岖的山路，马队到了这里就不能在上去了。山路两旁杂草从生，路开始越来越难走。"
      region.rooms[29].exits = "southup|northdown"
      region.rooms[29].links = {}
        region.rooms[29].links.su = {}
          region.rooms[29].links.su.to = 2137
          region.rooms[29].links.su.con = ""
        region.rooms[29].links.nd = {}
          region.rooms[29].links.nd.to = 2139
          region.rooms[29].links.nd.con = ""
    region.rooms[30] = {}
      region.rooms[30].path = "fly xs;ed;n;ed;ed;nd;nd"
      region.rooms[30].name = "山路"
      region.rooms[30].zone = "血刀门|雪山寺"
      region.rooms[30].id = 2139
      region.rooms[30].desc = "    你走在一山路上，四周有一座座小山丘。远处可以看见终年积雪的山尖。周围的树草已经很难看得到了。"
      region.rooms[30].exits = "north|southup"
      region.rooms[30].links = {}
        region.rooms[30].links.su = {}
          region.rooms[30].links.su.to = 2138
          region.rooms[30].links.su.con = ""
        region.rooms[30].links.n = {}
          region.rooms[30].links.n.to = 2140
          region.rooms[30].links.n.con = ""
    region.rooms[31] = {}
      region.rooms[31].path = "fly xs;ed;n;ed;ed;nd;nd;n"
      region.rooms[31].name = "山路"
      region.rooms[31].zone = "血刀门|雪山寺"
      region.rooms[31].id = 2140
      region.rooms[31].desc = "    你走在一山路上，四周有一座座小山丘。"
      region.rooms[31].exits = "south|eastdown"
      region.rooms[31].links = {}
        region.rooms[31].links.s = {}
          region.rooms[31].links.s.to = 2139
          region.rooms[31].links.s.con = ""
        region.rooms[31].links.ed = {}
          region.rooms[31].links.ed.to = 2141
          region.rooms[31].links.ed.con = ""
    region.rooms[32] = {}
      region.rooms[32].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed"
      region.rooms[32].name = "山脚"
      region.rooms[32].zone = "血刀门|雪山寺"
      region.rooms[32].id = 2141
      region.rooms[32].desc = "    这里是山脚下的一片平地，山上不远处，皑皑白雪映照下的一大片红墙金瓦处，就是远近闻名的雪山寺。"
      region.rooms[32].exits = "south|westup"
      region.rooms[32].links = {}
        region.rooms[32].links.s = {}
          region.rooms[32].links.s.to = 2142
          region.rooms[32].links.s.con = ""
        region.rooms[32].links.wu = {}
          region.rooms[32].links.wu.to = 2140
          region.rooms[32].links.wu.con = ""
    region.rooms[33] = {}
      region.rooms[33].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s"
      region.rooms[33].name = "湖边小路"
      region.rooms[33].zone = "血刀门|雪山寺"
      region.rooms[33].id = 2142
      region.rooms[33].desc = "    这是圣湖边的小路。路侧长草没足, 青绿可喜。"
      region.rooms[33].exits = "south|north"
      region.rooms[33].links = {}
        region.rooms[33].links.s = {}
          region.rooms[33].links.s.to = 2143
          region.rooms[33].links.s.con = ""
        region.rooms[33].links.n = {}
          region.rooms[33].links.n.to = 2141
          region.rooms[33].links.n.con = ""
    region.rooms[34] = {}
      region.rooms[34].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s"
      region.rooms[34].name = "湖边小路"
      region.rooms[34].zone = "血刀门|雪山寺"
      region.rooms[34].id = 2143
      region.rooms[34].desc = "    这是圣湖边的小路。天兰兰的，白白的云朵在湖里漂移，波光潋滟。湖边生长着一些绿绿青青的不知名的矮树。"
      region.rooms[34].exits = "north|southwest"
      region.rooms[34].links = {}
        region.rooms[34].links.n = {}
          region.rooms[34].links.n.to = 2142
          region.rooms[34].links.n.con = ""
        region.rooms[34].links.sw = {}
          region.rooms[34].links.sw.to = 2144
          region.rooms[34].links.sw.con = ""
    region.rooms[35] = {}
      region.rooms[35].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw"
      region.rooms[35].name = "湖边小路"
      region.rooms[35].zone = "血刀门|雪山寺"
      region.rooms[35].id = 2144
      region.rooms[35].desc = "    这是圣湖边的小路。长草越径，虫鸣阵阵，偶尔有白色水禽掠湖点水，激起圈圈涟漪。"
      region.rooms[35].exits = "northeast|west"
      region.rooms[35].links = {}
        region.rooms[35].links.ne = {}
          region.rooms[35].links.ne.to = 2143
          region.rooms[35].links.ne.con = ""
        region.rooms[35].links.w = {}
          region.rooms[35].links.w.to = 2145
          region.rooms[35].links.w.con = ""
    region.rooms[36] = {}
      region.rooms[36].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w"
      region.rooms[36].name = "湖边小路"
      region.rooms[36].zone = "血刀门|雪山寺"
      region.rooms[36].id = 2145
      region.rooms[36].desc = "    这是圣湖边的小路。路侧的湖水极为清澈。阳光下映着白顶雪山显出一片蓝幽幽的宁静。"
      region.rooms[36].exits = "east|west"
      region.rooms[36].links = {}
        region.rooms[36].links.e = {}
          region.rooms[36].links.e.to = 2144
          region.rooms[36].links.e.con = ""
        region.rooms[36].links.w = {}
          region.rooms[36].links.w.to = 2146
          region.rooms[36].links.w.con = ""
    region.rooms[37] = {}
      region.rooms[37].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w"
      region.rooms[37].name = "圣湖"
      region.rooms[37].zone = "血刀门|雪山寺"
      region.rooms[37].id = 2146
      region.rooms[37].desc = "    眼前就是著名的圣湖，碧蓝的湖面倒影着蓝天和白云，浩淼的水面让人心旷神怡。远处金碧辉煌的雪山寺清晰可见，再远处是几座延绵的大雪山，其中最高大的是神山，相传山中有神仙居住。雪山中融化的雪水都汇入湖中。"
      region.rooms[37].exits = "south|east"
      region.rooms[37].links = {}
        region.rooms[37].links.e = {}
          region.rooms[37].links.e.to = 2145
          region.rooms[37].links.e.con = ""
        region.rooms[37].links.s = {}
          region.rooms[37].links.s.to = 2147
          region.rooms[37].links.s.con = ""
    region.rooms[38] = {}
      region.rooms[38].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s"
      region.rooms[38].name = "土路"
      region.rooms[38].zone = "血刀门|雪山寺"
      region.rooms[38].id = 2147
      region.rooms[38].desc = "    这是一条不起眼的土路。尘埃泛起的远方，北边波光潋滟的一大片幽蓝水光处，就是著名的圣湖。"
      region.rooms[38].exits = "south|north"
      region.rooms[38].links = {}
        region.rooms[38].links.s = {}
          region.rooms[38].links.s.to = 2148
          region.rooms[38].links.s.con = ""
        region.rooms[38].links.n = {}
          region.rooms[38].links.n.to = 2146
          region.rooms[38].links.n.con = ""
    region.rooms[39] = {}
      region.rooms[39].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s;s"
      region.rooms[39].name = "土路"
      region.rooms[39].zone = "血刀门|雪山寺"
      region.rooms[39].id = 2148
      region.rooms[39].desc = "    这是一条不起眼的土路，却是连接雪山寺与中原的必经之路。西边点点的炊烟依稀可见。往北可以通往声震西域的雪山寺。"
      region.rooms[39].exits = "north|east|west"
      region.rooms[39].links = {}
        region.rooms[39].links.e = {}
          region.rooms[39].links.e.to = 2150
          region.rooms[39].links.e.con = ""
        region.rooms[39].links.w = {}
          region.rooms[39].links.w.to = 2149
          region.rooms[39].links.w.con = ""
        region.rooms[39].links.n = {}
          region.rooms[39].links.n.to = 2147
          region.rooms[39].links.n.con = ""
    region.rooms[40] = {}
      region.rooms[40].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s;s;w"
      region.rooms[40].name = "客店"
      region.rooms[40].zone = "血刀门|雪山寺"
      region.rooms[40].id = 2149
      region.rooms[40].desc = "    这里是一个路边的小客店。来往的行人都在这里稍事休息。往东的路可以到达中原。"
      region.rooms[40].exits = "east"
      region.rooms[40].links = {}
        region.rooms[40].links.e = {}
          region.rooms[40].links.e.to = 2148
          region.rooms[40].links.e.con = ""
    region.rooms[41] = {}
      region.rooms[41].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s;s;e"
      region.rooms[41].name = "土路"
      region.rooms[41].zone = "血刀门|雪山寺"
      region.rooms[41].id = 2150
      region.rooms[41].desc = "    这是一条不起眼的土路，不宽却也不窄，松散的浮尘显露出来往行商的频繁。它是连接雪山寺与中原的必经之路。"
      region.rooms[41].exits = "east|west"
      region.rooms[41].links = {}
        region.rooms[41].links.w = {}
          region.rooms[41].links.w.to = 2148
          region.rooms[41].links.w.con = ""
        region.rooms[41].links.e = {}
          region.rooms[41].links.e.to = 2151
          region.rooms[41].links.e.con = ""
    region.rooms[42] = {}
      region.rooms[42].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s;s;e;e"
      region.rooms[42].name = "草原"
      region.rooms[42].zone = "血刀门|雪山寺"
      region.rooms[42].id = 2151
      region.rooms[42].desc = "    这里是雪山脚下的一片草原。北面是起伏的群山，山顶上积着终年不化的雪。西边有一条土路。"
      region.rooms[42].exits = "northeast|west"
      region.rooms[42].links = {}
        region.rooms[42].links.w = {}
          region.rooms[42].links.w.to = 2150
          region.rooms[42].links.w.con = ""
  region.center = 2110
return region