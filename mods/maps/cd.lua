local region = {}
  region.cmd = "fly cd"
  region.name = "成都"
  region.id = "cd"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly cd;e;e;se;e"
      region.rooms[1].name = "青石阶"
      region.rooms[1].zone = "成都|峨眉山"
      region.rooms[1].id = 664
      region.rooms[1].links = {}
        region.rooms[1].links.sw = {}
          region.rooms[1].links.sw.to = 643
          region.rooms[1].links.sw.con = ""
        region.rooms[1].links.w = {}
          region.rooms[1].links.w.to = 665
          region.rooms[1].links.w.con = ""
        region.rooms[1].links.n = {}
          region.rooms[1].links.n.to = 1737
          region.rooms[1].links.n.con = ""
      region.rooms[1].exits = "north|west|southwest"
      region.rooms[1].desc = "    快到峨嵋山了。这是一条通往峨嵋山的青石阶，两旁绿树荫蔽，空气十分清新。时常能见到些游人香客。"
    region.rooms[2] = {}
      region.rooms[2].path = "fly cd;e;e;se"
      region.rooms[2].name = "青石大道"
      region.rooms[2].zone = "成都"
      region.rooms[2].id = 665
      region.rooms[2].desc = "    这是一条通往成都的大青石道，两旁绿树荫蔽，空气十分清新。成都平原向称天府之国，这里四周田野稻浪滚滚，平平展展的大地上，偶尔会出现一大丛翠竹浓荫，细细认去，都是人家居处。"
      region.rooms[2].exits = "northwest|east"
      region.rooms[2].links = {}
        region.rooms[2].links.e = {}
          region.rooms[2].links.e.to = 664
          region.rooms[2].links.e.con = ""
        region.rooms[2].links.nw = {}
          region.rooms[2].links.nw.to = 666
          region.rooms[2].links.nw.con = ""
    region.rooms[3] = {}
      region.rooms[3].path = "fly cd;e;e"
      region.rooms[3].name = "青石大道"
      region.rooms[3].zone = "成都"
      region.rooms[3].id = 666
      region.rooms[3].desc = "    这是一条通往成都的大青石道，两旁绿树荫蔽，空气十分清新。成都平原向称天府之国，四野鸡鸣犬吠，交替起落，一派安乐气息。西面隐隐可以看到成都城门了。"
      region.rooms[3].exits = "southeast|west"
      region.rooms[3].links = {}
        region.rooms[3].links.w = {}
          region.rooms[3].links.w.to = 667
          region.rooms[3].links.w.con = ""
        region.rooms[3].links.se = {}
          region.rooms[3].links.se.to = 665
          region.rooms[3].links.se.con = ""
    region.rooms[4] = {}
      region.rooms[4].path = "fly cd;e"
      region.rooms[4].name = "府河桥"
      region.rooms[4].zone = "成都"
      region.rooms[4].id = 667
      region.rooms[4].desc = "    这里是成都东门外府河桥。成都自古就是川中首府，府河和南河夹城而过，成为天然的护城河。由于四川外有峡江，秦岭之险，内仗绵渝坚城之固，成都却因之自来无坐守成功之绩。往往兵到城下，降旗高扯了。"
      region.rooms[4].exits = "east|west"
      region.rooms[4].links = {}
        region.rooms[4].links.e = {}
          region.rooms[4].links.e.to = 666
          region.rooms[4].links.e.con = ""
        region.rooms[4].links.w = {}
          region.rooms[4].links.w.to = 668
          region.rooms[4].links.w.con = ""
    region.rooms[5] = {}
      region.rooms[5].path = "fly cd"
      region.rooms[5].name = "东门"
      region.rooms[5].zone = "成都"
      region.rooms[5].id = 668
      region.rooms[5].desc = "    这是成都东城门，城门正上方刻着“东门”两个楷书大字，城墙上贴着几张官府告示(gaoshi)。一条笔直的青石板大道向东西两边延伸。东边是郊外，一片平平展展的平原风光，真是不愧天府之国的美称。西边是城里。"
      region.rooms[5].exits = "east|west"
      region.rooms[5].links = {}
        region.rooms[5].links.e = {}
          region.rooms[5].links.e.to = 667
          region.rooms[5].links.e.con = ""
        region.rooms[5].links.w = {}
          region.rooms[5].links.w.to = 669
          region.rooms[5].links.w.con = ""
    region.rooms[6] = {}
      region.rooms[6].path = "fly cd;w"
      region.rooms[6].name = "东大街"
      region.rooms[6].zone = "成都"
      region.rooms[6].id = 669
      region.rooms[6].desc = "    你走在东大街上，踩着坚实的青石板地面。东边是东城门，可以听到守城官兵的吆喝声。西边是蜀都大道，那边一派肃静。原来是因为提督府在那头。南北是一条宽直的大道。"
      region.rooms[6].exits = "south|north|east|west"
      region.rooms[6].links = {}
        region.rooms[6].links.e = {}
          region.rooms[6].links.e.to = 668
          region.rooms[6].links.e.con = ""
        region.rooms[6].links.s = {}
          region.rooms[6].links.s.to = 685
          region.rooms[6].links.s.con = ""
        region.rooms[6].links.w = {}
          region.rooms[6].links.w.to = 690
          region.rooms[6].links.w.con = ""
        region.rooms[6].links.n = {}
          region.rooms[6].links.n.to = 670
          region.rooms[6].links.n.con = ""
    region.rooms[7] = {}
      region.rooms[7].path = "fly cd;w;n"
      region.rooms[7].name = "东大街"
      region.rooms[7].zone = "成都"
      region.rooms[7].id = 670
      region.rooms[7].desc = "    你走在东大街坚实的青石板地面上。南边可以通向东城门，路边有一个简陋的茶摊，一块洗得发白了的旧帆布正顶着头顶火辣辣的阳光，一张长几上放着几只大号粗瓷碗 (Wan)。碗中盛满着可口的茶水。    往西北通往北大街，东北方一座大店面里传出阵阵划拳的喧闹。"
      region.rooms[7].exits = "south|northwest|northeast"
      region.rooms[7].links = {}
        region.rooms[7].links.ne = {}
          region.rooms[7].links.ne.to = 671
          region.rooms[7].links.ne.con = ""
        region.rooms[7].links.s = {}
          region.rooms[7].links.s.to = 669
          region.rooms[7].links.s.con = ""
        region.rooms[7].links.nw = {}
          region.rooms[7].links.nw.to = 672
          region.rooms[7].links.nw.con = ""
    region.rooms[8] = {}
      region.rooms[8].path = "fly cd;w;n;ne"
      region.rooms[8].name = "蜀都酒楼"
      region.rooms[8].zone = "成都"
      region.rooms[8].id = 671
      region.rooms[8].desc = "    这是一座有着三开间门面的大酒楼，虽说不上雕梁画栋，却也气派不凡。正首门梁上挂着一幅黑漆匾，上写着“蜀都酒楼”四个金漆大字。楼中桌洁椅净，座中客人衣饰豪奢，十九是富商大贾。这是一家百年老店，传到现在的这位掌柜已经是第四代，据说和提督大人有点不清楚，却也保佑了这间酒楼的日进斗金。东南角有一道方梯通往楼上雅座，往西南则可以出到东大街。"
      region.rooms[8].exits = "southwest"
      region.rooms[8].links = {}
        region.rooms[8].links.sw = {}
          region.rooms[8].links.sw.to = 670
          region.rooms[8].links.sw.con = ""
    region.rooms[9] = {}
      region.rooms[9].path = "fly cd;w;n;nw"
      region.rooms[9].name = "北大街"
      region.rooms[9].zone = "成都"
      region.rooms[9].id = 672
      region.rooms[9].desc = "    你走在北大街的青石地上，发现这里热闹非凡。原来东北角就是金牛武馆，据说每个武师都有绝活。许多江湖人物都慕名前来，搬运行李被褥的人不绝如缕。往东南是东大街，一直向西的是北大街。"
      region.rooms[9].exits = "southeast|northeast|west"
      region.rooms[9].links = {}
        region.rooms[9].links.ne = {}
          region.rooms[9].links.ne.to = 673
          region.rooms[9].links.ne.con = ""
        region.rooms[9].links.w = {}
          region.rooms[9].links.w.to = 679
          region.rooms[9].links.w.con = ""
        region.rooms[9].links.se = {}
          region.rooms[9].links.se.to = 670
          region.rooms[9].links.se.con = ""
    region.rooms[10] = {}
      region.rooms[10].path = "fly cd;w;n;nw;ne"
      region.rooms[10].name = "金牛武馆"
      region.rooms[10].zone = "成都"
      region.rooms[10].id = 673
      region.rooms[10].desc = "    「金牛武馆」在江湖中很有名声，很多大侠自小就是从这里走进江湖。虽然他们在江湖早已成名立万，这里的师傅年纪也都大了，却是他们的启蒙业师，他们也常回来看望师傅们，因此这里长久得到黑白两道的尊重，不容侵犯。这里是武馆大厅。馆主马五德在此请授：基本轻功，基本内功，基本招架，基本手法，基本刀法。    墙上贴着个贴子(tiezi)。"
      region.rooms[10].exits = "up|south|north|east|west|southwest"
      region.rooms[10].links = {}
        region.rooms[10].links.s = {}
          region.rooms[10].links.s.to = 675
          region.rooms[10].links.s.con = ""
        region.rooms[10].links.u = {}
          region.rooms[10].links.u.to = 678
          region.rooms[10].links.u.con = ""
        region.rooms[10].links.e = {}
          region.rooms[10].links.e.to = 677
          region.rooms[10].links.e.con = ""
        region.rooms[10].links.sw = {}
          region.rooms[10].links.sw.to = 672
          region.rooms[10].links.sw.con = ""
        region.rooms[10].links.w = {}
          region.rooms[10].links.w.to = 676
          region.rooms[10].links.w.con = ""
        region.rooms[10].links.n = {}
          region.rooms[10].links.n.to = 674
          region.rooms[10].links.n.con = ""
    region.rooms[11] = {}
      region.rooms[11].path = "fly cd;w;n;nw;ne;n"
      region.rooms[11].name = "金牛武馆四部"
      region.rooms[11].zone = "成都"
      region.rooms[11].id = 674
      region.rooms[11].desc = "    这里是「金牛武馆」教授四部，师傅刘虹瑛教授如下技能：基本轻功，基本内功，基本招架，基本掌法，基本剑法。"
      region.rooms[11].exits = "south"
      region.rooms[11].links = {}
        region.rooms[11].links.s = {}
          region.rooms[11].links.s.to = 673
          region.rooms[11].links.s.con = ""
    region.rooms[12] = {}
      region.rooms[12].path = "fly cd;w;n;nw;ne;s"
      region.rooms[12].name = "金牛武馆二部"
      region.rooms[12].zone = "成都"
      region.rooms[12].id = 675
      region.rooms[12].desc = "    这里是「金牛武馆」教授二部，师傅龙铨教授如下技能：基本轻功，基本内功，基本招架，基本爪法，基本刀法。"
      region.rooms[12].exits = "north"
      region.rooms[12].links = {}
        region.rooms[12].links.n = {}
          region.rooms[12].links.n.to = 673
          region.rooms[12].links.n.con = ""
    region.rooms[13] = {}
      region.rooms[13].path = "fly cd;w;n;nw;ne;w"
      region.rooms[13].name = "金牛武馆三部"
      region.rooms[13].zone = "成都"
      region.rooms[13].id = 676
      region.rooms[13].desc = "    这里是「金牛武馆」教授三部，师傅萧飞教授如下技能：基本轻功，基本内功，基本招架，基本指法，基本暗器。"
      region.rooms[13].exits = "east"
      region.rooms[13].links = {}
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 673
          region.rooms[13].links.e.con = ""
    region.rooms[14] = {}
      region.rooms[14].path = "fly cd;w;n;nw;ne;e"
      region.rooms[14].name = "金牛武馆一部"
      region.rooms[14].zone = "成都"
      region.rooms[14].id = 677
      region.rooms[14].desc = "    这里是「金牛武馆」教授一部，师傅陈浒教授如下技能：基本轻功，基本内功，基本招架，基本拳法，基本杖法，基本棒法。"
      region.rooms[14].exits = "west"
      region.rooms[14].links = {}
        region.rooms[14].links.w = {}
          region.rooms[14].links.w.to = 673
          region.rooms[14].links.w.con = ""
    region.rooms[15] = {}
      region.rooms[15].path = "fly cd;w;n;nw;ne;u"
      region.rooms[15].name = "武馆操练房"
      region.rooms[15].zone = "成都"
      region.rooms[15].id = 678
      region.rooms[15].desc = "    这里摆满了石锁簸箕、大刀长剑、沙袋绑腿等，还有几个精心扎制的橡皮人，是武馆弟子日常练功的地方。"
      region.rooms[15].exits = "down"
      region.rooms[15].links = {}
        region.rooms[15].links.d = {}
          region.rooms[15].links.d.to = 673
          region.rooms[15].links.d.con = ""
    region.rooms[16] = {}
      region.rooms[16].path = "fly cd;w;n;nw;w"
      region.rooms[16].name = "北大街"
      region.rooms[16].zone = "成都"
      region.rooms[16].id = 679
      region.rooms[16].desc = "    这里一条北大街横贯东西。望向北边，是出城的北门。号称 \"天下幽\" 的青城山，就是从这里出去。这里地当当道，行人却都过往匆匆，小心翼翼，恨不得销声匿迹。因为南边一幢古色古香的建筑，就是让天下武林闻风色变的川中唐门。"
      region.rooms[16].exits = "south|north|east|west"
      region.rooms[16].links = {}
        region.rooms[16].links.e = {}
          region.rooms[16].links.e.to = 672
          region.rooms[16].links.e.con = ""
        region.rooms[16].links.s = {}
          region.rooms[16].links.s.to = 683
          region.rooms[16].links.s.con = ""
        region.rooms[16].links.w = {}
          region.rooms[16].links.w.to = 684
          region.rooms[16].links.w.con = ""
        region.rooms[16].links.n = {}
          region.rooms[16].links.n.to = 680
          region.rooms[16].links.n.con = ""
    region.rooms[17] = {}
      region.rooms[17].path = "fly cd;w;n;nw;w;n"
      region.rooms[17].name = "北门"
      region.rooms[17].zone = "成都"
      region.rooms[17].id = 680
      region.rooms[17].desc = "    这是成都北城门，城门正上方刻着“北门”两个楷书大字，城墙上贴着几张官府告示(gaoshi)。一条笔直的青石板大道向北延伸。北边望去，一片绿油油的田野夹着随风摇曳的高树，长竹。城门边两行官兵仔细盘查进出人等。"
      region.rooms[17].exits = "south|north"
      region.rooms[17].links = {}
        region.rooms[17].links.s = {}
          region.rooms[17].links.s.to = 679
          region.rooms[17].links.s.con = ""
        region.rooms[17].links.n = {}
          region.rooms[17].links.n.to = 681
          region.rooms[17].links.n.con = ""
    region.rooms[18] = {}
      region.rooms[18].path = "fly cd;w;n;nw;w;n;n"
      region.rooms[18].name = "府河桥"
      region.rooms[18].zone = "成都"
      region.rooms[18].id = 681
      region.rooms[18].desc = "    这里是成都北门外府河桥。成都虽是川中首府，却无险可守，一旦敌方兵至成都平原，即使府南两河水涨，也就只有祷告对方慈悲的选择了。"
      region.rooms[18].exits = "south|north"
      region.rooms[18].links = {}
        region.rooms[18].links.s = {}
          region.rooms[18].links.s.to = 680
          region.rooms[18].links.s.con = ""
        region.rooms[18].links.n = {}
          region.rooms[18].links.n.to = 682
          region.rooms[18].links.n.con = ""
    region.rooms[19] = {}
      region.rooms[19].path = "fly cd;w;n;nw;w;n;n;n"
      region.rooms[19].name = "青石大道"
      region.rooms[19].zone = "成都|青城"
      region.rooms[19].id = 682
      region.rooms[19].links = {}
        region.rooms[19].links.s = {}
          region.rooms[19].links.s.to = 681
          region.rooms[19].links.s.con = ""
        region.rooms[19].links.w = {}
          region.rooms[19].links.w.to = 1246
          region.rooms[19].links.w.con = ""
      region.rooms[19].exits = "south|west"
      region.rooms[19].desc = "    你走在青石大道上。两边是稀硫的树林和连片的田野。一条条小溪和路平行，溪流清澈见底，水流甚急。"
    region.rooms[20] = {}
      region.rooms[20].path = "fly cd;w;n;nw;w;s"
      region.rooms[20].name = "唐门大门"
      region.rooms[20].zone = "成都"
      region.rooms[20].id = 683
      region.rooms[20].desc = "    这里就是名闻天下的唐门的大门(gate)。唐门建的十分巍峨，青墙碧瓦下的铜包大门紧紧关闭，两边唐门弟子一溜排开，这个架势看来是不好进去了。"
      region.rooms[20].exits = "north"
      region.rooms[20].links = {}
        region.rooms[20].links.n = {}
          region.rooms[20].links.n.to = 679
          region.rooms[20].links.n.con = ""
    region.rooms[21] = {}
      region.rooms[21].path = "fly cd;w;n;nw;w;w"
      region.rooms[21].name = "北大街"
      region.rooms[21].zone = "成都"
      region.rooms[21].id = 684
      region.rooms[21].desc = "    这里就是北大街了，空气中有着一种怪怪的气味，不是太好闻。路很宽，但人却不多，尤其是在黄昏以后。西南是另一条大街，北大街从此一直往东，西北有一家兵器铺，进进出出的人都面无表情，死气沉沉。"
      region.rooms[21].exits = "northwest|east|southwest"
      region.rooms[21].links = {}
        region.rooms[21].links.e = {}
          region.rooms[21].links.e.to = 679
          region.rooms[21].links.e.con = ""
        region.rooms[21].links.sw = {}
          region.rooms[21].links.sw.to = 712
          region.rooms[21].links.sw.con = ""
        region.rooms[21].links.nw = {}
          region.rooms[21].links.nw.to = 714
          region.rooms[21].links.nw.con = ""
    region.rooms[22] = {}
      region.rooms[22].path = "fly cd;w;s"
      region.rooms[22].name = "东大街"
      region.rooms[22].zone = "成都"
      region.rooms[22].id = 685
      region.rooms[22].desc = "    你走在东大街上，踩着坚实的青石板地面。向北是一条宽直的大道。北边可以通往东城门，西南边通向南大街，东南方就是有名的望江楼了。"
      region.rooms[22].exits = "north|southeast|southwest"
      region.rooms[22].links = {}
        region.rooms[22].links.sw = {}
          region.rooms[22].links.sw.to = 687
          region.rooms[22].links.sw.con = ""
        region.rooms[22].links.n = {}
          region.rooms[22].links.n.to = 669
          region.rooms[22].links.n.con = ""
        region.rooms[22].links.se = {}
          region.rooms[22].links.se.to = 686
          region.rooms[22].links.se.con = ""
    region.rooms[23] = {}
      region.rooms[23].path = "fly cd;w;s;se"
      region.rooms[23].name = "望江楼"
      region.rooms[23].zone = "成都"
      region.rooms[23].id = 686
      region.rooms[23].desc = "    望江楼又名崇丽阁。下两层四角，上两层八角，朱柱琉瓦，翘角飞甍，雕梁画栋，登临其上，远眺府南河，清风扑面，舟火穿梭，实为胜景。楼的周遭，翠竹千茎朝天，每当雨雾氤氲，轻烟笼翠，竹籁鸟音，动人心魄。楼前薛涛井，传说因为薛涛漂洗一种红色诗笺而流芳千古: 无波古井因涛重，有色遗笺举世珍。这也是这一才女的传世的唯一遗泽。"
      region.rooms[23].exits = "northwest"
      region.rooms[23].links = {}
        region.rooms[23].links.nw = {}
          region.rooms[23].links.nw.to = 685
          region.rooms[23].links.nw.con = ""
    region.rooms[24] = {}
      region.rooms[24].path = "fly cd;w;s;sw"
      region.rooms[24].name = "南大街"
      region.rooms[24].zone = "成都"
      region.rooms[24].id = 687
      region.rooms[24].desc = "    你走在南大街上，踩着坚实的青石板地面。这里显得热闹多了。东北方向是东大街，往西一直走都是南大街。东南方向传来阵阵喧闹，那里有个客店，杏帘分明: 锦城驿。"
      region.rooms[24].exits = "southeast|northeast|west"
      region.rooms[24].links = {}
        region.rooms[24].links.ne = {}
          region.rooms[24].links.ne.to = 685
          region.rooms[24].links.ne.con = ""
        region.rooms[24].links.w = {}
          region.rooms[24].links.w.to = 695
          region.rooms[24].links.w.con = ""
        region.rooms[24].links.se = {}
          region.rooms[24].links.se.to = 688
          region.rooms[24].links.se.con = ""
    region.rooms[25] = {}
      region.rooms[25].path = "fly cd;w;s;sw;se"
      region.rooms[25].name = "锦城驿"
      region.rooms[25].zone = "成都"
      region.rooms[25].id = 688
      region.rooms[25].desc = "    锦城驿是全西南最大的客店，生意非常兴隆。外地游客多选择这里落脚，你可以在这里打听到各地的风土人情。店小二里里外外忙得团团转，沉重的川味官话你是实在听不顺耳。这是成都督府官办的客栈，接待着各地入川的官差浪人。墙上挂着一个牌子(paizi)。"
      region.rooms[25].exits = "up|northwest"
      region.rooms[25].links = {}
        region.rooms[25].links.nw = {}
          region.rooms[25].links.nw.to = 687
          region.rooms[25].links.nw.con = ""
        region.rooms[25].links.u = {}
          region.rooms[25].links.u.to = 689
          region.rooms[25].links.u.con = ""
    region.rooms[26] = {}
      region.rooms[26].path = "fly cd;w;s;sw;se;u"
      region.rooms[26].name = "锦城驿二楼"
      region.rooms[26].zone = "成都"
      region.rooms[26].id = 689
      region.rooms[26].desc = "    这是一间很大的客房，陈设十分简陋。靠墙放了十几张小木床，不少客人正和衣而卧，满屋子都是呼呼的打酣声。你看到西边有张床是空的，就蹑手蹑脚地走了过去。"
      region.rooms[26].exits = "down"
      region.rooms[26].links = {}
        region.rooms[26].links.d = {}
          region.rooms[26].links.d.to = 688
          region.rooms[26].links.d.con = ""
    region.rooms[27] = {}
      region.rooms[27].path = "fly cd;w;w"
      region.rooms[27].name = "蜀都大道"
      region.rooms[27].zone = "成都"
      region.rooms[27].id = 690
      region.rooms[27].desc = "    这里是蜀都大道，向西就可以到提督府了。过往的车马卷起阵阵尘土，来去的官差阵步如飞，有一些官兵在路上巡哨。你感到一点点害怕，真后悔拐进这里来。"
      region.rooms[27].exits = "east|west"
      region.rooms[27].links = {}
        region.rooms[27].links.e = {}
          region.rooms[27].links.e.to = 669
          region.rooms[27].links.e.con = ""
        region.rooms[27].links.w = {}
          region.rooms[27].links.w.to = 691
          region.rooms[27].links.w.con = ""
    region.rooms[28] = {}
      region.rooms[28].path = "fly cd;w;w;w"
      region.rooms[28].name = "蜀都广场"
      region.rooms[28].zone = "成都"
      region.rooms[28].id = 691
      region.rooms[28].desc = "    这里是成都提督府前广场。好空旷的地方，只有稀稀落落几个没精打采的行人。北面就是提督府了，南边是提督街。广场周围种了一圈遮阳树，但骄阳仍把青石广场地面晒得滚烫冒烟。"
      region.rooms[28].exits = "south|north|east|west"
      region.rooms[28].links = {}
        region.rooms[28].links.e = {}
          region.rooms[28].links.e.to = 690
          region.rooms[28].links.e.con = ""
        region.rooms[28].links.s = {}
          region.rooms[28].links.s.to = 694
          region.rooms[28].links.s.con = ""
        region.rooms[28].links.w = {}
          region.rooms[28].links.w.to = 706
          region.rooms[28].links.w.con = ""
        region.rooms[28].links.n = {}
          region.rooms[28].links.n.to = 692
          region.rooms[28].links.n.con = ""
    region.rooms[29] = {}
      region.rooms[29].path = "fly cd;w;w;w;n"
      region.rooms[29].name = "提督府门"
      region.rooms[29].zone = "成都"
      region.rooms[29].id = 692
      region.rooms[29].desc = "    这便是提督府门。巍峨雄伟的城墙上， \"成都提督府\" 五个大字十分显眼，气势辉煌。几名亲兵立在两旁。"
      region.rooms[29].exits = "south|north"
      region.rooms[29].links = {}
        region.rooms[29].links.s = {}
          region.rooms[29].links.s.to = 691
          region.rooms[29].links.s.con = ""
        region.rooms[29].links.n = {}
          region.rooms[29].links.n.to = 693
          region.rooms[29].links.n.con = "k1:亲兵"
    region.rooms[30] = {}
      region.rooms[30].path = "fly cd;w;w;w;n;|!k1:亲兵:n|"
      region.rooms[30].name = "提督府"
      region.rooms[30].zone = "成都"
      region.rooms[30].id = 693
      region.rooms[30].desc = "    这里便是提督大人办公事的地方。正前方 (front)大红楠木案桌后正经端坐着的，就是成都提督吴天德。两边站立纹风不动的是他的亲兵侍从，看上去都十分彪悍。"
      region.rooms[30].exits = "south"
      region.rooms[30].links = {}
        region.rooms[30].links.s = {}
          region.rooms[30].links.s.to = 692
          region.rooms[30].links.s.con = ""
    region.rooms[31] = {}
      region.rooms[31].path = "fly cd;w;w;w;s"
      region.rooms[31].name = "提督街"
      region.rooms[31].zone = "成都"
      region.rooms[31].id = 694
      region.rooms[31].desc = "    提督街就是因为通往提督府而得名。这一带来往行人很少，做生意的就更是绝迹了。提督大人好象有甚麽想不开的，派了好多兵在这里守卫，连江湖人物都不敢轻率踏入。"
      region.rooms[31].exits = "south|north"
      region.rooms[31].links = {}
        region.rooms[31].links.s = {}
          region.rooms[31].links.s.to = 695
          region.rooms[31].links.s.con = ""
        region.rooms[31].links.n = {}
          region.rooms[31].links.n.to = 691
          region.rooms[31].links.n.con = ""
    region.rooms[32] = {}
      region.rooms[32].path = "fly cd;w;s;sw;w"
      region.rooms[32].name = "南大街"
      region.rooms[32].zone = "成都"
      region.rooms[32].id = 695
      region.rooms[32].desc = "    你正走在成都府的南大街上，这是一条宽敞开阔的大路，一直向两边延伸。路上行人来来往往，好不热闹。一些小商小贩常在这里做些小买卖。南面是南门，北边一条大道名叫提督街，你一看就知到为啥那麽安静了。"
      region.rooms[32].exits = "south|east|north|west"
      region.rooms[32].links = {}
        region.rooms[32].links.e = {}
          region.rooms[32].links.e.to = 687
          region.rooms[32].links.e.con = ""
        region.rooms[32].links.s = {}
          region.rooms[32].links.s.to = 696
          region.rooms[32].links.s.con = ""
        region.rooms[32].links.w = {}
          region.rooms[32].links.w.to = 699
          region.rooms[32].links.w.con = ""
        region.rooms[32].links.n = {}
          region.rooms[32].links.n.to = 694
          region.rooms[32].links.n.con = ""
    region.rooms[33] = {}
      region.rooms[33].path = "fly cd;w;s;sw;w;s"
      region.rooms[33].name = "南门"
      region.rooms[33].zone = "成都"
      region.rooms[33].id = 696
      region.rooms[33].desc = "    这是成都南城门，城门正上方刻着“南门”两个楷书大字，城墙上贴着几张官府告示(gaoshi)。一条笔直的青石板大道向南延伸。南边是郊外，遍地麦浪金黄迷人。北边是城里。"
      region.rooms[33].exits = "south|north"
      region.rooms[33].links = {}
        region.rooms[33].links.s = {}
          region.rooms[33].links.s.to = 697
          region.rooms[33].links.s.con = ""
        region.rooms[33].links.n = {}
          region.rooms[33].links.n.to = 695
          region.rooms[33].links.n.con = ""
    region.rooms[34] = {}
      region.rooms[34].path = "fly cd;w;s;sw;w;s;s"
      region.rooms[34].name = "南河桥"
      region.rooms[34].zone = "成都"
      region.rooms[34].id = 697
      region.rooms[34].desc = "    这里是成都南门外南河桥。府河和南河夹城流过，成为天然的护城河，滋润着这个天府之国的川中首府。向北就进城了，向南又是一条小路。"
      region.rooms[34].exits = "south|north"
      region.rooms[34].links = {}
        region.rooms[34].links.s = {}
          region.rooms[34].links.s.to = 698
          region.rooms[34].links.s.con = ""
        region.rooms[34].links.n = {}
          region.rooms[34].links.n.to = 696
          region.rooms[34].links.n.con = ""
    region.rooms[35] = {}
      region.rooms[35].path = "fly cd;w;s;sw;w;s;s;s"
      region.rooms[35].name = "山路"
      region.rooms[35].zone = "成都"
      region.rooms[35].id = 698
      region.rooms[35].desc = "    川西多是崇山峻岭，交通不便。一条山路蜿蜒在山间，连接着藏边和中原。"
      region.rooms[35].exits = "westup|north"
      region.rooms[35].links = {}
        region.rooms[35].links.n = {}
          region.rooms[35].links.n.to = 697
          region.rooms[35].links.n.con = ""
    region.rooms[36] = {}
      region.rooms[36].path = "fly cd;w;s;sw;w;w"
      region.rooms[36].name = "南大街"
      region.rooms[36].zone = "成都"
      region.rooms[36].id = 699
      region.rooms[36].desc = "    你走在南大街坚实的青石板地面上，各色人等往来其中，很是喧闹。有时你可能会见到一些江湖装束的人物，他们口音各异，服饰也五花八门，可是中气都很足，可不是好惹的。往东长长的大道就是南大街。西南方是个很巍峨的建筑群，人进人出，十分热闹。西北通往西大街。"
      region.rooms[36].exits = "east|northwest|southwest"
      region.rooms[36].links = {}
        region.rooms[36].links.e = {}
          region.rooms[36].links.e.to = 695
          region.rooms[36].links.e.con = ""
        region.rooms[36].links.sw = {}
          region.rooms[36].links.sw.to = 700
          region.rooms[36].links.sw.con = ""
        region.rooms[36].links.nw = {}
          region.rooms[36].links.nw.to = 703
          region.rooms[36].links.nw.con = ""
    region.rooms[37] = {}
      region.rooms[37].path = "fly cd;w;s;sw;w;w;sw"
      region.rooms[37].name = "武侯祠大门"
      region.rooms[37].zone = "成都"
      region.rooms[37].id = 700
      region.rooms[37].desc = "    这里原来是武侯祠。大门人进人出，大多缠着武侯巾。原来武侯生前治蜀，造福两川，这武侯巾乃是他去世川人为其带孝之俗。由于武侯遗爱甚深，虽千载以下，川人头巾仍不去首。"
      region.rooms[37].exits = "north|northeast"
      region.rooms[37].links = {}
        region.rooms[37].links.ne = {}
          region.rooms[37].links.ne.to = 699
          region.rooms[37].links.ne.con = ""
        region.rooms[37].links.n = {}
          region.rooms[37].links.n.to = 701
          region.rooms[37].links.n.con = ""
    region.rooms[38] = {}
      region.rooms[38].path = "fly cd;w;s;sw;w;w;sw;n"
      region.rooms[38].name = "刘备殿"
      region.rooms[38].zone = "成都"
      region.rooms[38].id = 701
      region.rooms[38].desc = "    这里是武侯祠的刘备殿。正中供着汉昭烈帝，高可丈许。后主却没得供奉，所谓 \"扶不起来\" 的阿斗吧。而哭庙玉碎的北地王刘谌得能和英父同祀，令人不胜唏嘘。"
      region.rooms[38].exits = "south|northup"
      region.rooms[38].links = {}
        region.rooms[38].links.s = {}
          region.rooms[38].links.s.to = 700
          region.rooms[38].links.s.con = ""
        region.rooms[38].links.nu = {}
          region.rooms[38].links.nu.to = 702
          region.rooms[38].links.nu.con = ""
    region.rooms[39] = {}
      region.rooms[39].path = "fly cd;w;s;sw;w;w;sw;n;nu"
      region.rooms[39].name = "诸葛亮殿"
      region.rooms[39].zone = "成都"
      region.rooms[39].id = 702
      region.rooms[39].desc = "    这里是武侯祠的正殿诸葛亮殿。武侯羽扇纶巾一如生前。两边诸葛瞻和诸葛尚父子塑像也栩栩如生。挂在殿门两壁的，由诗圣杜甫笔下流露的千古名联：“三顾频繁天下事，两朝开济老臣心。”道尽了这个千古风范的一生心事。"
      region.rooms[39].exits = "southdown"
      region.rooms[39].links = {}
        region.rooms[39].links.sd = {}
          region.rooms[39].links.sd.to = 701
          region.rooms[39].links.sd.con = ""
    region.rooms[40] = {}
      region.rooms[40].path = "fly cd;w;s;sw;w;w;nw"
      region.rooms[40].name = "西大街"
      region.rooms[40].zone = "成都"
      region.rooms[40].id = 703
      region.rooms[40].desc = "    你正走在成都府的西大街上，这是一条宽敞开阔的大路，往北面一直延伸。路上行人来来往往，好不热闹。小商小贩常在这里做些小买卖，常常可见有人骑着高头大马穿行其间。    西南边却显得特别清静，好象是个清幽所在，东南方向通往南大街。"
      region.rooms[40].exits = "north|southeast|southwest"
      region.rooms[40].links = {}
        region.rooms[40].links.sw = {}
          region.rooms[40].links.sw.to = 704
          region.rooms[40].links.sw.con = ""
        region.rooms[40].links.se = {}
          region.rooms[40].links.se.to = 699
          region.rooms[40].links.se.con = ""
        region.rooms[40].links.n = {}
          region.rooms[40].links.n.to = 705
          region.rooms[40].links.n.con = ""
    region.rooms[41] = {}
      region.rooms[41].path = "fly cd;w;s;sw;w;w;nw;sw"
      region.rooms[41].name = "青羊宫"
      region.rooms[41].zone = "成都"
      region.rooms[41].id = 704
      region.rooms[41].desc = "    青羊宫是天下第一大道观。观中林木婆娑，冠盖亭亭观中道士匆匆来去，没人得空理你，更没人接待你。你觉得到一种宽松的失落。"
      region.rooms[41].exits = "northeast"
      region.rooms[41].links = {}
        region.rooms[41].links.ne = {}
          region.rooms[41].links.ne.to = 703
          region.rooms[41].links.ne.con = ""
    region.rooms[42] = {}
      region.rooms[42].path = "fly cd;w;w;w;w;w"
      region.rooms[42].name = "西大街"
      region.rooms[42].zone = "成都"
      region.rooms[42].id = 705
      region.rooms[42].desc = "    一条青石铺成的大道通向南北。路上行人络绎不绝，只见南面不远处的古树下有一个简陋的摊子，摊子一角的招牌在风中摇晃着，上面写着“诸葛再世”，居然也围了一堆人。往西就是西门了，东边是蜀都大道。"
      region.rooms[42].exits = "south|north|east|west"
      region.rooms[42].links = {}
        region.rooms[42].links.e = {}
          region.rooms[42].links.e.to = 706
          region.rooms[42].links.e.con = ""
        region.rooms[42].links.s = {}
          region.rooms[42].links.s.to = 703
          region.rooms[42].links.s.con = ""
        region.rooms[42].links.w = {}
          region.rooms[42].links.w.to = 707
          region.rooms[42].links.w.con = ""
        region.rooms[42].links.n = {}
          region.rooms[42].links.n.to = 712
          region.rooms[42].links.n.con = ""
    region.rooms[43] = {}
      region.rooms[43].path = "fly cd;w;w;w;w"
      region.rooms[43].name = "蜀都大道"
      region.rooms[43].zone = "成都"
      region.rooms[43].id = 706
      region.rooms[43].desc = "    这里是蜀都大道，它横贯整个锦官城。向东就可以到提督府了。平头百姓少了，路上大多是有头有脸的爷们。几个官兵顶盔贯甲打量着过往行人。"
      region.rooms[43].exits = "east|west"
      region.rooms[43].links = {}
        region.rooms[43].links.w = {}
          region.rooms[43].links.w.to = 705
          region.rooms[43].links.w.con = ""
        region.rooms[43].links.e = {}
          region.rooms[43].links.e.to = 691
          region.rooms[43].links.e.con = ""
    region.rooms[44] = {}
      region.rooms[44].path = "fly cd;w;w;w;w;w;w"
      region.rooms[44].name = "西门"
      region.rooms[44].zone = "成都"
      region.rooms[44].id = 707
      region.rooms[44].desc = "    你来到了西城门外，只见高大的城墙厚实凝重，卫兵仔细地盘查着过往行人，一切都显得井井有条。城墙上贴着几张告示(gaoshi)。西面远远可以看到城外的清溪碧水。东边是城里。"
      region.rooms[44].exits = "east|west"
      region.rooms[44].links = {}
        region.rooms[44].links.e = {}
          region.rooms[44].links.e.to = 705
          region.rooms[44].links.e.con = ""
        region.rooms[44].links.w = {}
          region.rooms[44].links.w.to = 708
          region.rooms[44].links.w.con = ""
    region.rooms[45] = {}
      region.rooms[45].path = "fly cd;w;w;w;w;w;w;w"
      region.rooms[45].name = "南河桥"
      region.rooms[45].zone = "成都"
      region.rooms[45].id = 708
      region.rooms[45].desc = "    这里是成都西门外南河桥。府河和南河夹城流过，呵护着这个天府之国的首府之地。河水清新碧透。东面是西城门，往西就是浣花溪了。"
      region.rooms[45].exits = "east|west"
      region.rooms[45].links = {}
        region.rooms[45].links.e = {}
          region.rooms[45].links.e.to = 707
          region.rooms[45].links.e.con = ""
        region.rooms[45].links.w = {}
          region.rooms[45].links.w.to = 709
          region.rooms[45].links.w.con = ""
    region.rooms[46] = {}
      region.rooms[46].path = "fly cd;w;w;w;w;w;w;w;w"
      region.rooms[46].name = "溪岸小路"
      region.rooms[46].zone = "成都"
      region.rooms[46].id = 709
      region.rooms[46].desc = "    你走在浣花溪岸的小路上，浣花溪水晶莹剔透，岸草如茵，远远就能闻到水气的清香。许多睡莲散布在溪岸附近，水面飘著数不尽的浮萍，浮萍下有不少艳红锦鲤穿梭来去。溪岸小路随溪流曲折盘绕，芳草没足，花飘似海，使人不饮自醉。古人所谓 \"如行春郊\" ，诚不我欺。"
      region.rooms[46].exits = "east|north"
      region.rooms[46].links = {}
        region.rooms[46].links.e = {}
          region.rooms[46].links.e.to = 708
          region.rooms[46].links.e.con = ""
        region.rooms[46].links.n = {}
          region.rooms[46].links.n.to = 710
          region.rooms[46].links.n.con = ""
    region.rooms[47] = {}
      region.rooms[47].path = "fly cd;w;w;w;w;w;w;w;w;n"
      region.rooms[47].name = "溪岸小路"
      region.rooms[47].zone = "成都"
      region.rooms[47].id = 710
      region.rooms[47].desc = "    溪源转北，阵阵水响带着你来到草堂前。站在草堂照壁前，回首浣花溪，想象万红漂坠，少女清歌浣花时节，别是一般滋味。北边就是“万里桥西宅，百花潭北庄”的杜甫草堂了。"
      region.rooms[47].exits = "south|north"
      region.rooms[47].links = {}
        region.rooms[47].links.s = {}
          region.rooms[47].links.s.to = 709
          region.rooms[47].links.s.con = ""
        region.rooms[47].links.n = {}
          region.rooms[47].links.n.to = 711
          region.rooms[47].links.n.con = ""
    region.rooms[48] = {}
      region.rooms[48].path = "fly cd;w;w;w;w;w;w;w;w;n;n"
      region.rooms[48].name = "杜甫草堂"
      region.rooms[48].zone = "成都"
      region.rooms[48].id = 711
      region.rooms[48].desc = "    这里是杜甫流寓成都的故居。草堂里流水回萦，小桥勾连，竹树掩映，显得既庄严肃穆，古朴典雅，又不失幽深静谧，秀丽清朗。"
      region.rooms[48].exits = "south"
      region.rooms[48].links = {}
        region.rooms[48].links.s = {}
          region.rooms[48].links.s.to = 710
          region.rooms[48].links.s.con = ""
    region.rooms[49] = {}
      region.rooms[49].path = "fly cd;w;w;w;w;w;n"
      region.rooms[49].name = "西大街"
      region.rooms[49].zone = "成都"
      region.rooms[49].id = 712
      region.rooms[49].desc = "    你不知不觉地就来到了成都西北角，从这里往北望，显得格外冷清。青石大道上只有零零落落的几个人，在慢悠悠闲逛。往南是西大街，东北方向是另一条大街，西北角有个好大的药店，卖一些武林中人常用的药，唐门弟子常来此配药。"
      region.rooms[49].exits = "south|northwest|northeast"
      region.rooms[49].links = {}
        region.rooms[49].links.ne = {}
          region.rooms[49].links.ne.to = 684
          region.rooms[49].links.ne.con = ""
        region.rooms[49].links.nw = {}
          region.rooms[49].links.nw.to = 713
          region.rooms[49].links.nw.con = ""
        region.rooms[49].links.s = {}
          region.rooms[49].links.s.to = 705
          region.rooms[49].links.s.con = ""
    region.rooms[50] = {}
      region.rooms[50].path = "fly cd;w;w;w;w;w;n;nw"
      region.rooms[50].name = "济世堂药店"
      region.rooms[50].zone = "成都"
      region.rooms[50].id = 713
      region.rooms[50].desc = "    济世堂药店卖很多中原买不到的药。托唐门的福，生意一直都很好。一走进这家药店，就闻到一股股浓烈刺鼻的药味。你正奇怪药店伙计怎麽能忍受，就看到药店里还有一些人正拿奇怪的眼光看你。他们的腰间鼓鼓囊囊的，显然不是好惹的。"
      region.rooms[50].exits = "southeast"
      region.rooms[50].links = {}
        region.rooms[50].links.se = {}
          region.rooms[50].links.se.to = 712
          region.rooms[50].links.se.con = ""
    region.rooms[51] = {}
      region.rooms[51].path = "fly cd;w;n;nw;w;w;nw"
      region.rooms[51].name = "兵器铺"
      region.rooms[51].zone = "成都"
      region.rooms[51].id = 714
      region.rooms[51].desc = "    这着是一家小小店面的兵器铺，可是卖的兵器可不寻常。种类固然中土难得一见，能用的人更是稀少。掌柜的拿着眼瞟得你直发毛。你转脸就看到墙上的招牌(zhaopai)。"
      region.rooms[51].exits = "southeast"
      region.rooms[51].links = {}
        region.rooms[51].links.se = {}
          region.rooms[51].links.se.to = 684
          region.rooms[51].links.se.con = ""
  region.center = 668
return region