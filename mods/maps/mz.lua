local region = {}
  region.cmd = "fly mz"
  region.name = "梅庄"
  region.id = "mz"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly mz;open gate;s;s;s;ed"
      region.rooms[1].name = "孤山"
      region.rooms[1].zone = "杭州|梅庄"
      region.rooms[1].id = 276
      region.rooms[1].desc = "    通过林荫道向前，迎面石壁上刻有“孤山”两个丹红大字。朝南拾级登山便是平台。东北边便是发鹤亭。东南边则是平湖秋月。西北边通往西泠桥。"
      region.rooms[1].exits = "westup|northwest|east|northeast|southup"
      region.rooms[1].links = {}
        region.rooms[1].links.ne = {}
          region.rooms[1].links.ne.to = 278
          region.rooms[1].links.ne.con = ""
        region.rooms[1].links.wu = {}
          region.rooms[1].links.wu.to = 282
          region.rooms[1].links.wu.con = ""
        region.rooms[1].links.e = {}
          region.rooms[1].links.e.to = 279
          region.rooms[1].links.e.con = ""
        region.rooms[1].links.nw = {}
          region.rooms[1].links.nw.to = 275
          region.rooms[1].links.nw.con = ""
        region.rooms[1].links.su = {}
          region.rooms[1].links.su.to = 277
          region.rooms[1].links.su.con = ""
    region.rooms[2] = {}
      region.rooms[2].path = "fly mz;open gate;s;s;s"
      region.rooms[2].name = "孤山石阶"
      region.rooms[2].zone = "杭州|梅庄"
      region.rooms[2].id = 282
      region.rooms[2].desc = "    你向孤山边的石阶上行去，一路欣赏着湖边长曳的杨柳。不知不觉地转了几个弯，却见遍地都是梅树，老干横斜，枝叶茂密，想像初春梅花盛开之日，香雪如海，定然观赏不尽。"
      region.rooms[2].exits = "north|eastdown"
      region.rooms[2].links = {}
        region.rooms[2].links.ed = {}
          region.rooms[2].links.ed.to = 276
          region.rooms[2].links.ed.con = ""
        region.rooms[2].links.n = {}
          region.rooms[2].links.n.to = 2741
          region.rooms[2].links.n.con = ""
    region.rooms[3] = {}
      region.rooms[3].path = "fly mz"
      region.rooms[3].name = "大天井"
      region.rooms[3].zone = "梅庄"
      region.rooms[3].id = 2703
      region.rooms[3].desc = "    你走过一个大天井，天井左右各植一棵老梅，枝干如铁，极是苍劲。往南是梅庄大门，北面是大厅。"
      region.rooms[3].exits = "north"
      region.rooms[3].links = {}
        region.rooms[3].links["open gate;s"] = {}
          region.rooms[3].links["open gate;s"].to = 2740
          region.rooms[3].links["open gate;s"].con = ""
        region.rooms[3].links.n = {}
          region.rooms[3].links.n.to = 2704
          region.rooms[3].links.n.con = ""
    region.rooms[4] = {}
      region.rooms[4].path = "fly mz;n"
      region.rooms[4].name = "四雅清风"
      region.rooms[4].zone = "梅庄"
      region.rooms[4].id = 2704
      region.rooms[4].desc = "    你已经到了梅庄的大厅门口，门内的匾额(bian)龙飞凤舞的写着“四雅清风”四个大字，笔法娟秀中透着挺拔，不失为一笔好字。透过后门，你看到里面一尘不染，一张石桌和几个石凳都安放得整整齐齐。"
      region.rooms[4].exits = "south|north"
      region.rooms[4].links = {}
        region.rooms[4].links.s = {}
          region.rooms[4].links.s.to = 2703
          region.rooms[4].links.s.con = ""
        region.rooms[4].links.n = {}
          region.rooms[4].links.n.to = 2705
          region.rooms[4].links.n.con = ""
    region.rooms[5] = {}
      region.rooms[5].path = "fly mz;n;n"
      region.rooms[5].name = "迎客亭"
      region.rooms[5].zone = "梅庄"
      region.rooms[5].id = 2705
      region.rooms[5].desc = "    通过四雅清风，你来到了梅庄的迎客亭，这里虽然只有一张石桌几个石凳，但却是一尘不染，石凳和石桌之间的空隙很大，显是方便来客与主人相互寒暄。一位汉子正站在亭前，冲你拱手微笑。"
      region.rooms[5].exits = "south|north"
      region.rooms[5].links = {}
        region.rooms[5].links["zuan table"] = {}
          region.rooms[5].links["zuan table"].to = 2731
          region.rooms[5].links["zuan table"].con = ""
        region.rooms[5].links.s = {}
          region.rooms[5].links.s.to = 2704
          region.rooms[5].links.s.con = ""
        region.rooms[5].links.n = {}
          region.rooms[5].links.n.to = 2706
          region.rooms[5].links.n.con = ""
    region.rooms[6] = {}
      region.rooms[6].path = "fly mz;n;n;n"
      region.rooms[6].name = "百木园"
      region.rooms[6].zone = "梅庄"
      region.rooms[6].id = 2706
      region.rooms[6].desc = "    这里是梅庄的百木园，你一走到这里，就象走到了一个连绵无尽的小森林一样，这里无数的松树，柏树，白杨，还有很多叫不出来名字的异种苗木，其中有一株黄松(huang song)特别的粗壮，在它的茂密的枝叶后面，似乎藏着什么秘密。旁边立着一块牌子(pai zi)。"
      region.rooms[6].exits = "south|east|north|southup|west"
      region.rooms[6].links = {}
        region.rooms[6].links.s = {}
          region.rooms[6].links.s.to = 2705
          region.rooms[6].links.s.con = ""
        region.rooms[6].links["climb huang song"] = {}
          region.rooms[6].links["climb huang song"].to = 2719
          region.rooms[6].links["climb huang song"].con = ""
        region.rooms[6].links.e = {}
          region.rooms[6].links.e.to = 2720
          region.rooms[6].links.e.con = ""
        region.rooms[6].links.n = {}
          region.rooms[6].links.n.to = 2707
          region.rooms[6].links.n.con = ""
        region.rooms[6].links.w = {}
          region.rooms[6].links.w.to = 2716
          region.rooms[6].links.w.con = ""
        region.rooms[6].links.su = {}
          region.rooms[6].links.su.to = 2726
          region.rooms[6].links.su.con = ""
    region.rooms[7] = {}
      region.rooms[7].path = "fly mz;n;n;n;n"
      region.rooms[7].name = "内院"
      region.rooms[7].zone = "梅庄"
      region.rooms[7].id = 2707
      region.rooms[7].desc = "    这里是梅庄的内院，从这里走过去就可以找到四位庄主，这里似乎非常安静，可以听见落叶触地的声音，但又似乎非常吵闹，经常可以听到嘈杂的琴声，但这琴声又可以将你的心弦打乱，你真不知道该怎么形容这个地方。有一位壮年的汉子，腰悬宝剑守在院门口。"
      region.rooms[7].exits = "south|north"
      region.rooms[7].links = {}
        region.rooms[7].links.s = {}
          region.rooms[7].links.s.to = 2706
          region.rooms[7].links.s.con = ""
        region.rooms[7].links.n = {}
          region.rooms[7].links.n.to = 2708
          region.rooms[7].links.n.con = ""
    region.rooms[8] = {}
      region.rooms[8].path = "fly mz;n;n;n;n;n"
      region.rooms[8].name = "走廊"
      region.rooms[8].zone = "梅庄"
      region.rooms[8].id = 2708
      region.rooms[8].desc = "    这是一条长长的走廊，走廊两边是四位庄主中的其他三位平时休息和练功的地方，这里的左边是书室，右边是画室，三庄主秃笔翁和四庄主丹青生在闲来无事的时候，便到那里面去挥毫，泼墨。"
      region.rooms[8].exits = "south|north|east|west"
      region.rooms[8].links = {}
        region.rooms[8].links.e = {}
          region.rooms[8].links.e.to = 2709
          region.rooms[8].links.e.con = ""
        region.rooms[8].links.s = {}
          region.rooms[8].links.s.to = 2707
          region.rooms[8].links.s.con = ""
        region.rooms[8].links.w = {}
          region.rooms[8].links.w.to = 2710
          region.rooms[8].links.w.con = ""
        region.rooms[8].links.n = {}
          region.rooms[8].links.n.to = 2711
          region.rooms[8].links.n.con = ""
    region.rooms[9] = {}
      region.rooms[9].path = "fly mz;n;n;n;n;n;e"
      region.rooms[9].name = "画室"
      region.rooms[9].zone = "梅庄"
      region.rooms[9].id = 2709
      region.rooms[9].desc = "    这里是丹青生的画室，俗话说：书画不分家，所以丹青生的书法也有相当的功力，虽然不及他三哥秃笔翁很多，但他将他的剑法融于他的书法当中，也可谓是银钩铁画了。这里的陈设和书室差不多，唯一不同的是这里的墙上并没有挂丹青生的丹青妙笔，而是挂了许多前朝名家的名画，属于丹青生自己的是一幅写着《兵车行》的中堂。"
      region.rooms[9].exits = "west"
      region.rooms[9].links = {}
        region.rooms[9].links.w = {}
          region.rooms[9].links.w.to = 2708
          region.rooms[9].links.w.con = ""
    region.rooms[10] = {}
      region.rooms[10].path = "fly mz;n;n;n;n;n;w"
      region.rooms[10].name = "书室"
      region.rooms[10].zone = "梅庄"
      region.rooms[10].id = 2710
      region.rooms[10].desc = "    这里是秃笔翁的书室，房中有一个大案，案上放着一个笔筒，笔筒中插着几管大小不同的毛笔，毛笔的质料也有所不同，有狼毫，有羊毫，有猪鬃，有鼠须，还有一支世上很难见到的獭毫笔，案上平铺着一张四尺中堂大小的宣纸，一方端砚，一柄徽墨，一对白玉镇纸，一个寿山笔架，都显出主人对书法的爱好。墙上挂满了主人书写的一幅幅条幅，中堂，对联。 "
      region.rooms[10].exits = "east"
      region.rooms[10].links = {}
        region.rooms[10].links.e = {}
          region.rooms[10].links.e.to = 2708
          region.rooms[10].links.e.con = ""
    region.rooms[11] = {}
      region.rooms[11].path = "fly mz;n;n;n;n;n;n"
      region.rooms[11].name = "走廊"
      region.rooms[11].zone = "梅庄"
      region.rooms[11].id = 2711
      region.rooms[11].desc = "    这是一条长长的走廊，走廊两边是四位庄主中的其他三位平时休息和练功的地方，这里的左边是棋室，右边则是梅庄弟子感觉劳顿的时候休息的地方，二庄主黑白子不分昼夜都在棋室里研究他那些不知道哪儿找来的古棋谱。 "
      region.rooms[11].exits = "south|north|east|west"
      region.rooms[11].links = {}
        region.rooms[11].links.e = {}
          region.rooms[11].links.e.to = 2712
          region.rooms[11].links.e.con = ""
        region.rooms[11].links.s = {}
          region.rooms[11].links.s.to = 2708
          region.rooms[11].links.s.con = ""
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 2713
          region.rooms[11].links.w.con = ""
        region.rooms[11].links.n = {}
          region.rooms[11].links.n.to = 2714
          region.rooms[11].links.n.con = ""
    region.rooms[12] = {}
      region.rooms[12].path = "fly mz;n;n;n;n;n;n;e"
      region.rooms[12].name = "休息室"
      region.rooms[12].zone = "梅庄"
      region.rooms[12].id = 2712
      region.rooms[12].desc = "    这里是梅庄弟子练功劳累的时候，休息的地方，这里经常可以听到如雷的鼾声，这里简单的放着几张垫子，几床棉被，几个枕头，而且梅庄弟子虽然经常打扫这里，但这里仍然凌乱不堪，很多梅庄弟子一进这里，倒头便睡，显是过于疲劳的缘故。 "
      region.rooms[12].exits = "west"
      region.rooms[12].links = {}
        region.rooms[12].links.w = {}
          region.rooms[12].links.w.to = 2711
          region.rooms[12].links.w.con = ""
    region.rooms[13] = {}
      region.rooms[13].path = "fly mz;n;n;n;n;n;n;w"
      region.rooms[13].name = "棋室"
      region.rooms[13].zone = "梅庄"
      region.rooms[13].id = 2713
      region.rooms[13].desc = "    这里便是二庄主黑白子的棋室了，棋室里两张石凳，一张石几，石几上用黑白子的指力刻着纵横九九八十一道，这里除了简单的放着两盒用玉做成的棋子外，什么都没有，显是怕双方对弈时分心。"
      region.rooms[13].exits = "east"
      region.rooms[13].links = {}
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 2711
          region.rooms[13].links.e.con = ""
    region.rooms[14] = {}
      region.rooms[14].path = "fly mz;n;n;n;n;n;n;n"
      region.rooms[14].name = "走廊"
      region.rooms[14].zone = "梅庄"
      region.rooms[14].id = 2714
      region.rooms[14].desc = "    走廊到了这里似乎就到了尽头，从走廊的那一头传来阵阵的烧饭的香味，饥肠漉漉的你，走到这里，再也忍受不了那种扑面而来的香气的诱惑，只有加快脚步，去看个究竟。 "
      region.rooms[14].exits = "south|north"
      region.rooms[14].links = {}
        region.rooms[14].links.s = {}
          region.rooms[14].links.s.to = 2711
          region.rooms[14].links.s.con = ""
        region.rooms[14].links.n = {}
          region.rooms[14].links.n.to = 2715
          region.rooms[14].links.n.con = ""
    region.rooms[15] = {}
      region.rooms[15].path = "fly mz;n;n;n;n;n;n;n;n"
      region.rooms[15].name = "厨房"
      region.rooms[15].zone = "梅庄"
      region.rooms[15].id = 2715
      region.rooms[15].desc = "    你顺着香味走到了梅庄的厨房，一位厨师正站在灶台后面笑眯眯的看着你，他手上拿着一柄铁勺，用力的把锅里煮着的一大堆食物搅匀，梅庄的弟子们如果饿了，就到这里来问这位厨师能不能吃饭，一般来说，他们都不会遭到拒绝的。"
      region.rooms[15].exits = "south"
      region.rooms[15].links = {}
        region.rooms[15].links.s = {}
          region.rooms[15].links.s.to = 2714
          region.rooms[15].links.s.con = ""
    region.rooms[16] = {}
      region.rooms[16].path = "fly mz;n;n;n;w"
      region.rooms[16].name = "偏房"
      region.rooms[16].zone = "梅庄"
      region.rooms[16].id = 2716
      region.rooms[16].desc = "    这是一间没有任何东西的房子，四壁空荡荡的，好象是一间刚修好的，还没有来得及进行装饰的房间，正中的墙上画着一幅壁画，相当的醒目，画着九天十万神魔歃血为盟，十万滴魔血化做了一只鲜红的鹦鹉，鹦鹉的眼睛竟然是用非常罕见的朱雀石做成的。"
      region.rooms[16].exits = "east"
      region.rooms[16].links = {}
        region.rooms[16].links.e = {}
          region.rooms[16].links.e.to = 2706
          region.rooms[16].links.e.con = ""
        region.rooms[16].links["push eye"] = {}
          region.rooms[16].links["push eye"].to = 2717
          region.rooms[16].links["push eye"].con = ""
    region.rooms[17] = {}
      region.rooms[17].path = "fly mz;n;n;n;w;push eye"
      region.rooms[17].name = "密室"
      region.rooms[17].zone = "梅庄"
      region.rooms[17].id = 2717
      region.rooms[17].desc = "    这是一间不大的房间，房间里摆着一排排的书架(shu jia)和很多书(book)，在书架的两旁靠着几具死人的骸骨，有一具的胸骨之中还插着一柄剑。"
      region.rooms[17].exits = "out"
      region.rooms[17].links = {}
        region.rooms[17].links["climb ti zi;jump shu jia"] = {}
          region.rooms[17].links["climb ti zi;jump shu jia"].to = 2718
          region.rooms[17].links["climb ti zi;jump shu jia"].con = ""
        region.rooms[17].links.out = {}
          region.rooms[17].links.out.to = 2716
          region.rooms[17].links.out.con = ""
    region.rooms[18] = {}
      region.rooms[18].path = "fly mz;n;n;n;w;push eye;climb ti zi;jump shu jia"
      region.rooms[18].name = "书架顶部"
      region.rooms[18].zone = "梅庄"
      region.rooms[18].id = 2718
      region.rooms[18].desc = "    你现在在书架的顶部，从这里你可以看见整个密室的情况，除了几具白骨以外，确实没有什么值得你怀疑的东西，但你发现书架的顶部非常不合适的铺着一块红绸。"
      region.rooms[18].exits = "down"
      region.rooms[18].links = {}
        region.rooms[18].links.d = {}
          region.rooms[18].links.d.to = 2717
          region.rooms[18].links.d.con = ""
    region.rooms[19] = {}
      region.rooms[19].path = "fly mz;n;n;n;climb huang song"
      region.rooms[19].name = "松树顶"
      region.rooms[19].zone = "梅庄"
      region.rooms[19].id = 2719
      region.rooms[19].desc = "    你终于爬上了松树的顶端，在这里你可以看见一片密密厚厚的树林，你踩在这里，如同踩在一块草地上一样，远处可以看见隐隐约约的一座巍峨的高山。"
      region.rooms[19].exits = "down"
      region.rooms[19].links = {}
        region.rooms[19].links.d = {}
          region.rooms[19].links.d.to = 2706
          region.rooms[19].links.d.con = ""
    region.rooms[20] = {}
      region.rooms[20].path = "fly mz;n;n;n;e"
      region.rooms[20].name = "百木园"
      region.rooms[20].zone = "梅庄"
      region.rooms[20].id = 2720
      region.rooms[20].desc = "    这里是梅庄的百木园，你一走到这里，就象走到了一个连绵无尽的小森林一样，这里无数的松树，柏树，白杨，还有很多叫不出来名字的异种苗木，你走在其中，只想把这片树林尽情的欣赏一遍，永不出去才好。"
      region.rooms[20].exits = "south|east|north|west"
      region.rooms[20].links = {}
        region.rooms[20].links.s = {}
          region.rooms[20].links.s.to = 2721
          region.rooms[20].links.s.con = ""
    region.rooms[21] = {}
      region.rooms[21].path = "fly mz;n;n;n;e;s"
      region.rooms[21].name = "百木园"
      region.rooms[21].zone = "梅庄"
      region.rooms[21].id = 2721
      region.rooms[21].desc = "    这里是梅庄的百木园，你一走到这里，就象走到了一个连绵无尽的小森林一样，这里无数的松树，柏树，白杨，还有很多叫不出来名字的异种苗木，你走在其中，只想把这片树林尽情的欣赏一遍，永不出去才好。"
      region.rooms[21].exits = "south|east|north|west"
      region.rooms[21].links = {}
        region.rooms[21].links.s = {}
          region.rooms[21].links.s.to = 2722
          region.rooms[21].links.s.con = ""
    region.rooms[22] = {}
      region.rooms[22].path = "fly mz;n;n;n;e;s;s"
      region.rooms[22].name = "百木园"
      region.rooms[22].zone = "梅庄"
      region.rooms[22].id = 2722
      region.rooms[22].desc = "    这里是梅庄的百木园，你一走到这里，就象走到了一个连绵无尽的小森林一样，这里无数的松树，柏树，白杨，还有很多叫不出来名字的异种苗木，你走在其中，只想把这片树林尽情的欣赏一遍，永不出去才好。 "
      region.rooms[22].exits = "south|east|north|west"
      region.rooms[22].links = {}
        region.rooms[22].links.w = {}
          region.rooms[22].links.w.to = 2723
          region.rooms[22].links.w.con = ""
    region.rooms[23] = {}
      region.rooms[23].path = "fly mz;n;n;n;e;s;s;w"
      region.rooms[23].name = "百木园"
      region.rooms[23].zone = "梅庄"
      region.rooms[23].id = 2723
      region.rooms[23].desc = "    这里是梅庄的百木园，你一走到这里，就象走到了一个连绵无尽的小森林一样，这里无数的松树，柏树，白杨，还有很多叫不出来名字的异种苗木，你走在其中，只想把这片树林尽情的欣赏一遍，永不出去才好。"
      region.rooms[23].exits = "north|southwest|south|northwest|east|southeast|northeast|west"
      region.rooms[23].links = {}
        region.rooms[23].links.sw = {}
          region.rooms[23].links.sw.to = 2724
          region.rooms[23].links.sw.con = ""
    region.rooms[24] = {}
      region.rooms[24].path = "fly mz;n;n;n;e;s;s;w;sw"
      region.rooms[24].name = "百木园"
      region.rooms[24].zone = "梅庄"
      region.rooms[24].id = 2724
      region.rooms[24].desc = "    这里是梅庄的百木园，你一走到这里，就象走到了一个连绵无尽的小森林一样，这里无数的松树，柏树，白杨，还有很多叫不出来名字的异种苗木，你走在其中，只想把这片树林尽情的欣赏一遍，永不出去才好。"
      region.rooms[24].exits = "south|east|north|west"
      region.rooms[24].links = {}
        region.rooms[24].links.e = {}
          region.rooms[24].links.e.to = 2725
          region.rooms[24].links.e.con = ""
    region.rooms[25] = {}
      region.rooms[25].path = "fly mz;n;n;n;e;s;s;w;sw;e"
      region.rooms[25].name = "百木园"
      region.rooms[25].zone = "梅庄"
      region.rooms[25].id = 2725
      region.rooms[25].desc = "    这里是梅庄的百木园，你一走到这里，就象走到了一个连绵无尽的小森林一样，这里无数的松树，柏树，白杨，还有很多叫不出来名字的异种苗木，你走在其中，只想把这片树林尽情的欣赏一遍，永不出去才好。 "
      region.rooms[25].exits = "south|east|north|west"
      region.rooms[25].links = {}
        region.rooms[25].links.s = {}
          region.rooms[25].links.s.to = 2726
          region.rooms[25].links.s.con = ""
    region.rooms[26] = {}
      region.rooms[26].path = "fly mz;n;n;n;su"
      region.rooms[26].name = "奇槐坡"
      region.rooms[26].zone = "梅庄"
      region.rooms[26].id = 2726
      region.rooms[26].desc = "    这里就是奇槐坡了，这里种着大大小小，千奇百怪的槐树，有的槐树一直向天，有的又曲折盘绕，你从这里隐隐约约听到一阵阵的琴声，似有似无，若隐若现。"
      region.rooms[26].exits = "eastup|northdown"
      region.rooms[26].links = {}
        region.rooms[26].links.eu = {}
          region.rooms[26].links.eu.to = 2727
          region.rooms[26].links.eu.con = ""
        region.rooms[26].links.nd = {}
          region.rooms[26].links.nd.to = 2706
          region.rooms[26].links.nd.con = ""
    region.rooms[27] = {}
      region.rooms[27].path = "fly mz;n;n;n;su;eu"
      region.rooms[27].name = "小路"
      region.rooms[27].zone = "梅庄"
      region.rooms[27].id = 2727
      region.rooms[27].desc = "    你走到这条小路上，前面已经可以隐隐约约看到一座小小的院落的影子，你可以非常的肯定，琴声就是从这个小院里发出来的，想到立刻就可以见到大庄主黄钟公了，你不禁一阵紧张。 "
      region.rooms[27].exits = "north|westdown"
      region.rooms[27].links = {}
        region.rooms[27].links.wd = {}
          region.rooms[27].links.wd.to = 2726
          region.rooms[27].links.wd.con = ""
        region.rooms[27].links["unwield all;n"] = {}
          region.rooms[27].links["unwield all;n"].to = 2728
          region.rooms[27].links["unwield all;n"].con = ""
    region.rooms[28] = {}
      region.rooms[28].path = "fly mz;n;n;n;su;eu;n"
      region.rooms[28].name = "琴音小院"
      region.rooms[28].zone = "梅庄"
      region.rooms[28].id = 2728
      region.rooms[28].desc = "    这是一座看起来非常普通的小小的院落，院子的中间建着一间小屋，小屋也很普通，就是用茅草为顶，砖土为墙，院子里没有什么摆设，只有几堆干木柴(wood)放在角落里，其中有一捆特别引人注目。"
      region.rooms[28].exits = "south|enter"
      region.rooms[28].links = {}
        region.rooms[28].links.enter = {}
          region.rooms[28].links.enter.to = 2729
          region.rooms[28].links.enter.con = ""
        region.rooms[28].links.s = {}
          region.rooms[28].links.s.to = 2727
          region.rooms[28].links.s.con = ""
        region.rooms[28].links.e = {}
          region.rooms[28].links.e.to = 2730
          region.rooms[28].links.e.con = "k1:丁坚"
    region.rooms[29] = {}
      region.rooms[29].path = "fly mz;n;n;n;su;eu;n;enter"
      region.rooms[29].name = "小屋"
      region.rooms[29].zone = "梅庄"
      region.rooms[29].id = 2729
      region.rooms[29].desc = "    你进了这间小屋以后，发现这里竟然和你想象的差别很大，这里虽然不能说是金碧辉煌，但到处都是玉制的物器，玉桌，玉椅，玉屏风，玉茶壶，玉杯......数不胜数。墙上挂着一根绿玉萧和一具白玉瑶琴。"
      region.rooms[29].exits = "out"
      region.rooms[29].links = {}
        region.rooms[29].links.out = {}
          region.rooms[29].links.out.to = 2728
          region.rooms[29].links.out.con = ""
    region.rooms[30] = {}
      region.rooms[30].path = "fly mz;n;n;n;su;eu;n;|!k1:丁坚:e|"
      region.rooms[30].name = "柳园"
      region.rooms[30].zone = "梅庄"
      region.rooms[30].id = 2730
      region.rooms[30].desc = "    这是一座小小的园子，里面种满了大大小小的柳树，柳枝有的长可及地，有的还是新枝嫩叶，但中间有一株灌木(guanmu)低低矮矮的，长在那里，非常惹人注目，你不禁朝那里多看了两眼。"
      region.rooms[30].exits = "west"
      region.rooms[30].links = {}
        region.rooms[30].links.w = {}
          region.rooms[30].links.w.to = 2728
          region.rooms[30].links.w.con = ""
    region.rooms[31] = {}
      region.rooms[31].path = "fly mz;n;n;zuan table"
      region.rooms[31].name = "梅庄密道"
      region.rooms[31].zone = "梅庄"
      region.rooms[31].id = 2731
      region.rooms[31].desc = "    这是一条昏暗潮湿的地道，地道很长，两边点着两根不太明亮的火把，地道两旁的墙壁上画着很多不知道出自何人之手的壁画，而且画得相当难看，你加快脚步，想知道地道的尽头是什么地方。 "
      region.rooms[31].exits = "south|east|north|west"
      region.rooms[31].links = {}
        region.rooms[31].links.e = {}
          region.rooms[31].links.e.to = 2731
          region.rooms[31].links.e.con = ""
        region.rooms[31].links.w = {}
          region.rooms[31].links.w.to = 2732
          region.rooms[31].links.w.con = ""
        region.rooms[31].links.s = {}
          region.rooms[31].links.s.to = 2735
          region.rooms[31].links.s.con = ""
        region.rooms[31].links.n = {}
          region.rooms[31].links.n.to = 2732
          region.rooms[31].links.n.con = ""
    region.rooms[32] = {}
      region.rooms[32].path = "fly mz;n;n;zuan table;w"
      region.rooms[32].name = "梅庄密道"
      region.rooms[32].zone = "梅庄"
      region.rooms[32].id = 2732
      region.rooms[32].desc = "    这是一条昏暗潮湿的地道，地道很长，两边点着两根不太明亮的火把，地道两旁的墙壁上画着很多不知道出自何人之手的壁画，而且画得相当难看，你加快脚步，想知道地道的尽头是什么地方。 "
      region.rooms[32].exits = "south|east|north|west"
      region.rooms[32].links = {}
        region.rooms[32].links.e = {}
          region.rooms[32].links.e.to = 2731
          region.rooms[32].links.e.con = ""
        region.rooms[32].links.w = {}
          region.rooms[32].links.w.to = 2732
          region.rooms[32].links.w.con = ""
        region.rooms[32].links.s = {}
          region.rooms[32].links.s.to = 2731
          region.rooms[32].links.s.con = ""
        region.rooms[32].links.n = {}
          region.rooms[32].links.n.to = 2733
          region.rooms[32].links.n.con = ""
    region.rooms[33] = {}
      region.rooms[33].path = "fly mz;n;n;zuan table;w;n"
      region.rooms[33].name = "梅庄密道"
      region.rooms[33].zone = "梅庄"
      region.rooms[33].id = 2733
      region.rooms[33].desc = "    这是一条昏暗潮湿的地道，地道很长，两边点着两根不太明亮的火把，地道两旁的墙壁上画着很多不知道出自何人之手的壁画，而且画得相当难看，你加快脚步，想知道地道的尽头是什么地方。 "
      region.rooms[33].exits = "south|east"
      region.rooms[33].links = {}
        region.rooms[33].links.e = {}
          region.rooms[33].links.e.to = 2733
          region.rooms[33].links.e.con = ""
        region.rooms[33].links.s = {}
          region.rooms[33].links.s.to = 2734
          region.rooms[33].links.s.con = ""
    region.rooms[34] = {}
      region.rooms[34].path = "fly mz;n;n;zuan table;w;n;s"
      region.rooms[34].name = "梅庄密道"
      region.rooms[34].zone = "梅庄"
      region.rooms[34].id = 2734
      region.rooms[34].desc = "    这是一条昏暗潮湿的地道，地道很长，两边点着两根不太明亮的火把，地道两旁的墙壁上画着很多不知道出自何人之手的壁画，而且画得相当难看，你加快脚步，想知道地道的尽头是什么地方。"
      region.rooms[34].exits = "south|east|north|west"
      region.rooms[34].links = {}
        region.rooms[34].links.e = {}
          region.rooms[34].links.e.to = 2735
          region.rooms[34].links.e.con = ""
        region.rooms[34].links.w = {}
          region.rooms[34].links.w.to = 2733
          region.rooms[34].links.w.con = ""
        region.rooms[34].links.s = {}
          region.rooms[34].links.s.to = 2735
          region.rooms[34].links.s.con = ""
        region.rooms[34].links.n = {}
          region.rooms[34].links.n.to = 2731
          region.rooms[34].links.n.con = ""
    region.rooms[35] = {}
      region.rooms[35].path = "fly mz;n;n;zuan table;s"
      region.rooms[35].name = "梅庄密道"
      region.rooms[35].zone = "梅庄"
      region.rooms[35].id = 2735
      region.rooms[35].desc = "    这是一条昏暗潮湿的地道，地道很长，两边点着两根不太明亮的火把，地道两旁的墙壁上画着很多不知道出自何人之手的壁画，而且画得相当难看，你加快脚步，想知道地道的尽头是什么地方。突然之间你发现这里的地面已经是木板拼成的了。"
      region.rooms[35].exits = "south"
      region.rooms[35].links = {}
        region.rooms[35].links.s = {}
          region.rooms[35].links.s.to = 2732
          region.rooms[35].links.s.con = ""
        region.rooms[35].links["pull floor;d"] = {}
          region.rooms[35].links["pull floor;d"].to = 2736
          region.rooms[35].links["pull floor;d"].con = ""
    region.rooms[36] = {}
      region.rooms[36].path = "fly mz;n;n;zuan table;s;pull floor;d"
      region.rooms[36].name = "甬道"
      region.rooms[36].zone = "梅庄"
      region.rooms[36].id = 2736
      region.rooms[36].desc = "    你一到这里，迎面就闻到一股腐烂的泥土的味道，不过从前面的亮光中，你又看到了希望，你不禁开始加快脚步，想看看那里到底有些什么东西。 "
      region.rooms[36].exits = "up|north"
      region.rooms[36].links = {}
        region.rooms[36].links.u = {}
          region.rooms[36].links.u.to = 2735
          region.rooms[36].links.u.con = ""
        region.rooms[36].links.n = {}
          region.rooms[36].links.n.to = 2737
          region.rooms[36].links.n.con = ""
    region.rooms[37] = {}
      region.rooms[37].path = "fly mz;n;n;zuan table;s;pull floor;d;n"
      region.rooms[37].name = "甬道"
      region.rooms[37].zone = "梅庄"
      region.rooms[37].id = 2737
      region.rooms[37].desc = "    你一到这里，迎面就闻到一股腐烂的泥土的味道，不过从前面的亮光中，你又看到了希望，你不禁开始加快脚步，想看看那里到底有些什么东西。 "
      region.rooms[37].exits = "south|north"
      region.rooms[37].links = {}
        region.rooms[37].links.s = {}
          region.rooms[37].links.s.to = 2736
          region.rooms[37].links.s.con = ""
        region.rooms[37].links.n = {}
          region.rooms[37].links.n.to = 2738
          region.rooms[37].links.n.con = ""
    region.rooms[38] = {}
      region.rooms[38].path = "fly mz;n;n;zuan table;s;pull floor;d;n;n"
      region.rooms[38].name = "古皇陵"
      region.rooms[38].zone = "梅庄"
      region.rooms[38].id = 2738
      region.rooms[38].desc = "    你一走到这里，突然一片明亮，原来这里竟然是古代蚕丛王的陵墓，中间停放着一具棺木，棺木的上方悬挂着一颗鹅蛋一般大小的夜明珠，把这里照得异常明亮，棺木的正中放着一本书，书看起来很陈旧，似乎是一位前辈异人留下的。 "
      region.rooms[38].exits = "south|out"
      region.rooms[38].links = {}
        region.rooms[38].links.s = {}
          region.rooms[38].links.s.to = 2737
          region.rooms[38].links.s.con = ""
        region.rooms[38].links.out = {}
          region.rooms[38].links.out.to = 2739
          region.rooms[38].links.out.con = ""
    region.rooms[39] = {}
      region.rooms[39].path = "fly mz;n;n;zuan table;s;pull floor;d;n;n;out"
      region.rooms[39].name = "西湖湖畔"
      region.rooms[39].zone = "梅庄"
      region.rooms[39].id = 2739
      region.rooms[39].desc = "    顺着西湖一直走过去，你欣赏着湖边的杨柳，不知不觉地已经走到西湖的尽头，这里有一条蜿蜒的小路向前延伸着，隐隐约约可以看到一座庄园，你不禁想走过去看看那里是什么地方．"
      region.rooms[39].exits = "northeast"
      region.rooms[39].links = {}
    region.rooms[40] = {}
      region.rooms[40].path = "fly mz;open gate;s"
      region.rooms[40].name = "梅庄大门"
      region.rooms[40].zone = "梅庄"
      region.rooms[40].id = 2740
      region.rooms[40].desc = "    走过一大片梅林，走上一条青石板大路，来到一座朱门白墙的大庄院外，行到近处，见大门外写着“梅庄”两个大字，旁边署着“虞允文题”四字。那虞允文是南宋破金的大功臣，这几个字儒雅之中透着勃勃英气。"
      region.rooms[40].exits = "south|north"
      region.rooms[40].links = {}
        region.rooms[40].links.s = {}
          region.rooms[40].links.s.to = 2741
          region.rooms[40].links.s.con = ""
        region.rooms[40].links["knock 4;knock 2;knock 5;knock 3;n"] = {}
          region.rooms[40].links["knock 4;knock 2;knock 5;knock 3;n"].to = 2703
          region.rooms[40].links["knock 4;knock 2;knock 5;knock 3;n"].con = ""
    region.rooms[41] = {}
      region.rooms[41].path = "fly mz;open gate;s;s"
      region.rooms[41].name = "蜿蜒小径"
      region.rooms[41].zone = "梅庄"
      region.rooms[41].id = 2741
      region.rooms[41].desc = "    这条小路的两旁种着无数的梅花，虽然还没到梅花盛开的季节，但透过这密密的梅林，你似乎已经闻到了阵阵的梅花的幽香，这时你已经发现你快走到庄园的门口，你暗地里加快了脚步．"
      region.rooms[41].exits = "south|north"
      region.rooms[41].links = {}
        region.rooms[41].links.s = {}
          region.rooms[41].links.s.to = 282
          region.rooms[41].links.s.con = ""
        region.rooms[41].links.n = {}
          region.rooms[41].links.n.to = 2740
          region.rooms[41].links.n.con = ""
  region.center = 2703
return region