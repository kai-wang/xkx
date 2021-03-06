local region = {}
  region.cmd = "fly gyz"
  region.name = "归云庄"
  region.id = "gyz"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly gyz"
      region.rooms[1].name = "前院"
      region.rooms[1].zone = "归云庄"
      region.rooms[1].id = 2608
      region.rooms[1].desc = "    这里是归云庄的前院，相当宽敞。左右靠墙各建有几间低矮的平房，像是家人的住处。正前方几棵树木，湖中清风吹来，落叶萧萧而下。树木再往后是一间大厅。右首有一对白雕(diao)。原来这里是桃花岛为方便弟子回岛的。"
      region.rooms[1].exits = "north|out"
      region.rooms[1].links = {}
        region.rooms[1].links.n = {}
          region.rooms[1].links.n.to = 2609
          region.rooms[1].links.n.con = ""
        region.rooms[1].links.out = {}
          region.rooms[1].links.out.to = 2614
          region.rooms[1].links.out.con = ""
    region.rooms[2] = {}
      region.rooms[2].path = "fly gyz;n"
      region.rooms[2].name = "大厅"
      region.rooms[2].zone = "归云庄"
      region.rooms[2].id = 2609
      region.rooms[2].desc = "    这是归云庄的正厅，由于修建年代久远，看起来已颇为陈旧，但打扫得十分干净，光线也较为充足，完全没有陈年旧宅的阴晦之气。四壁挂着一些古人书画精品，皆为上乘之作，显得主人眼光不凡，胸中大有丘壑。"
      region.rooms[2].exits = "south|east|north"
      region.rooms[2].links = {}
        region.rooms[2].links.e = {}
          region.rooms[2].links.e.to = 2610
          region.rooms[2].links.e.con = ""
        region.rooms[2].links.s = {}
          region.rooms[2].links.s.to = 2608
          region.rooms[2].links.s.con = ""
        region.rooms[2].links.n = {}
          region.rooms[2].links.n.to = 2611
          region.rooms[2].links.n.con = ""
    region.rooms[3] = {}
      region.rooms[3].path = "fly gyz;n;e"
      region.rooms[3].name = "书房"
      region.rooms[3].zone = "归云庄"
      region.rooms[3].id = 2610
      region.rooms[3].desc = "    这是陆庄主的书房，琳琅满目，全是诗书典籍，几上桌上摆着许多铜器玉器，看来尽是古物，壁上挂着一幅水墨画，画的是个中年书生在月明之夜中庭伫立，手按剑柄，仰天长吁，神情寂寞，左上角题着一首『词』(poem)。门楣上歪歪斜斜嵌着一个铁八卦，看起来和房间不太相衬。"
      region.rooms[3].exits = "west"
      region.rooms[3].links = {}
        region.rooms[3].links.w = {}
          region.rooms[3].links.w.to = 2609
          region.rooms[3].links.w.con = ""
    region.rooms[4] = {}
      region.rooms[4].path = "fly gyz;n;n"
      region.rooms[4].name = "花厅"
      region.rooms[4].zone = "归云庄"
      region.rooms[4].id = 2611
      region.rooms[4].desc = "    这是一间四方型的厅亭，没有牌匾，正面两方木柱，柱上挂了幅缺了半阙的『诗词』(poem)。厅内摆设了几张桌椅。一个丫环正在抹拭桌面。"
      region.rooms[4].exits = "south|east|north|west"
      region.rooms[4].links = {}
        region.rooms[4].links.s = {}
          region.rooms[4].links.s.to = 2609
          region.rooms[4].links.s.con = ""
        region.rooms[4].links.n = {}
          region.rooms[4].links.n.to = 2612
          region.rooms[4].links.n.con = ""
    region.rooms[5] = {}
      region.rooms[5].path = "fly gyz;n;n;n"
      region.rooms[5].name = "花园"
      region.rooms[5].zone = "归云庄"
      region.rooms[5].id = 2612
      region.rooms[5].desc = "    这是一处典型的江南园林，规模虽不大，构造得却颇为精致，想必当年建园之人很费了一番心力。园中花气袭人，莺啼燕舞，柳条随风，绿波荡漾，只待得片刻便令人如沐春风，流连忘返。"
      region.rooms[5].exits = "south|east|north"
      region.rooms[5].links = {}
        region.rooms[5].links.s = {}
          region.rooms[5].links.s.to = 2611
          region.rooms[5].links.s.con = ""
        region.rooms[5].links.n = {}
          region.rooms[5].links.n.to = 2613
          region.rooms[5].links.n.con = ""
    region.rooms[6] = {}
      region.rooms[6].path = "fly gyz;n;n;n;n"
      region.rooms[6].name = "厨房"
      region.rooms[6].zone = "归云庄"
      region.rooms[6].id = 2613
      region.rooms[6].desc = "    这里是归云庄的厨房，一个乡下妇人正在灶边忙来忙去，看来她就是这里的厨娘了。如果肚子饿了，就赶快找厨娘要(serve)些吃的吧。"
      region.rooms[6].exits = "south"
      region.rooms[6].links = {}
        region.rooms[6].links.s = {}
          region.rooms[6].links.s.to = 2612
          region.rooms[6].links.s.con = ""
    region.rooms[7] = {}
      region.rooms[7].path = "fly gyz;out"
      region.rooms[7].name = "大门"
      region.rooms[7].zone = "归云庄"
      region.rooms[7].id = 2614
      region.rooms[7].desc = "    面前是一座庄院，门楼不甚高大，青砖绿瓦，灰色底的匾上写着『归云庄』三个大黑字。牌匾较为陈旧，边角处的漆皮已剥落，露出暗黄色的木质。看来挂在那已不下二十个春秋了。"
      region.rooms[7].exits = "south|enter"
      region.rooms[7].links = {}
        region.rooms[7].links.enter = {}
          region.rooms[7].links.enter.to = 2608
          region.rooms[7].links.enter.con = "k1:家丁"
        region.rooms[7].links.s = {}
          region.rooms[7].links.s.to = 2615
          region.rooms[7].links.s.con = ""
    region.rooms[8] = {}
      region.rooms[8].path = "fly gyz;out;s"
      region.rooms[8].name = "码头"
      region.rooms[8].zone = "归云庄"
      region.rooms[8].id = 2615
      region.rooms[8].desc = "    这是一个在江南水乡极常见的码头，由粗糙的大青条石搭成。北面似乎有一个极大的庄院。靠岸停有一艘大渔船(ship)，大篷斜挂，风帆大张，看那样子不是为了出湖，倒象是征战用的。"
      region.rooms[8].exits = "north"
      region.rooms[8].links = {}
        region.rooms[8].links["shang ship"] = {}
          region.rooms[8].links["shang ship"].to = 2616
          region.rooms[8].links["shang ship"].con = ""
        region.rooms[8].links.n = {}
          region.rooms[8].links.n.to = 2614
          region.rooms[8].links.n.con = ""
    region.rooms[9] = {}
      region.rooms[9].path = "fly gyz;out;s;shang ship"
      region.rooms[9].name = "战船"
      region.rooms[9].zone = "归云庄"
      region.rooms[9].id = 2616
      region.rooms[9].desc = "    这是一艘大渔船，船上的人白天打鱼，晚上就干些没本钱的买卖，接济沿湖的百姓。"
      region.rooms[9].exits = "out"
      region.rooms[9].links = {}
        region.rooms[9].links.out = {}
          region.rooms[9].links.out.to = 2617
          region.rooms[9].links.out.con = ""
        region.rooms[9].links["hi;out"] = {}
          region.rooms[9].links["hi;out"].to = 2615
          region.rooms[9].links["hi;out"].con = "a:ask hao jie about 返航"
    region.rooms[10] = {}
      region.rooms[10].path = "fly gyz;out;s;shang ship;out"
      region.rooms[10].name = "金国战船"
      region.rooms[10].zone = "归云庄"
      region.rooms[10].id = 2617
      region.rooms[10].desc = "    这里是大金国钦使的战船，船中旗杆上分明扯着旗号，飞扬跋扈已极。船舱内汉奸们一脸媚笑，金兵一个个都趾高气扬。"
      region.rooms[10].exits = "out"
      region.rooms[10].links = {}
        region.rooms[10].links.out = {}
          region.rooms[10].links.out.to = 2616
          region.rooms[10].links.out.con = ""
  region.center = 2608
return region