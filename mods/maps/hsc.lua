local region = {}
  region.cmd = "fly ws1"
  region.name = "华山村"
  region.id = "hsc"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly ws1"
      region.rooms[1].name = "华山脚下"
      region.rooms[1].zone = "华山村"
      region.rooms[1].id = 2348
      region.rooms[1].desc = "    西岳华山，巍然耸立于陕西省华阴县城南。它北瞰黄河，南连秦岭，五座山峰高低错落，各据一方，其间又有一段若断若续的山岭相连，疏密有度，神韵天成，远远望去，状若巨朵青莲，外围诸峰如莲瓣，中间三峰似莲蕊，因此山便因'花'得名，取名华山。又因其西临少华山，故华山又称太华。它素有「奇峰天下第一山」之称，西面是小村。北是玉泉院。"
      region.rooms[1].exits = "north|southeast|west"
      region.rooms[1].links = {}
        region.rooms[1].links.w = {}
          region.rooms[1].links.w.to = 2350
          region.rooms[1].links.w.con = ""
        region.rooms[1].links.n = {}
          region.rooms[1].links.n.to = 2349
          region.rooms[1].links.n.con = ""
    region.rooms[2] = {}
      region.rooms[2].path = "fly ws1;n"
      region.rooms[2].name = "玉泉院"
      region.rooms[2].zone = "华山村"
      region.rooms[2].id = 2349
      region.rooms[2].desc = "    这里因屋后的玉泉而得名，是宋代陈希夷隐居的地方。周围生着十二株大龙藤，夭矫多姿，枝干中空，就如飞龙相似，相传是希夷先生陈抟老祖所植。院内绿荫蔽日，泉石如画，流水萦回，回廊曲折。院中有清泉一股，泉水甘冽，传与山顶镇岳宫玉井相通，故名玉泉，玉泉院因此得名。"
      region.rooms[2].exits = "south"
      region.rooms[2].links = {}
        region.rooms[2].links.s = {}
          region.rooms[2].links.s.to = 2348
          region.rooms[2].links.s.con = ""
    region.rooms[3] = {}
      region.rooms[3].path = "fly ws1;w"
      region.rooms[3].name = "东村口"
      region.rooms[3].zone = "华山村"
      region.rooms[3].id = 2350
      region.rooms[3].desc = "    这里是华山脚下，虽然远离县城，却没有什麽山贼草寇在附近出没。往东就是上山的路了。西边是一个小村庄，村子里人家并不多，村民们过着日出而作，日落而息的宁静生活。"
      region.rooms[3].exits = "east|west"
      region.rooms[3].links = {}
        region.rooms[3].links.e = {}
          region.rooms[3].links.e.to = 2348
          region.rooms[3].links.e.con = ""
        region.rooms[3].links.w = {}
          region.rooms[3].links.w.to = 2351
          region.rooms[3].links.w.con = ""
    region.rooms[4] = {}
      region.rooms[4].path = "fly ws1;w;w"
      region.rooms[4].name = "碎石路"
      region.rooms[4].zone = "华山村"
      region.rooms[4].id = 2351
      region.rooms[4].desc = "    这是一个宁静的小村子，稀稀落落的分布着几十间土坯泥房，看来村中人家不多，而且大都生活很艰辛。一条碎石路，往西通向村子的中心，往东就是出村的路了。南面是一间很简陋的草棚。"
      region.rooms[4].exits = "south|east|west"
      region.rooms[4].links = {}
        region.rooms[4].links.e = {}
          region.rooms[4].links.e.to = 2350
          region.rooms[4].links.e.con = ""
        region.rooms[4].links.s = {}
          region.rooms[4].links.s.to = 2352
          region.rooms[4].links.s.con = ""
        region.rooms[4].links.w = {}
          region.rooms[4].links.w.to = 2353
          region.rooms[4].links.w.con = ""
    region.rooms[5] = {}
      region.rooms[5].path = "fly ws1;w;w;s"
      region.rooms[5].name = "草棚"
      region.rooms[5].zone = "华山村"
      region.rooms[5].id = 2352
      region.rooms[5].desc = "    这是一个简单的草棚，地上摆著一堆堆的货物，上山的游客可以在这买些上山用品。草棚的墙上贴着个牌子，是个价目表(sign)。"
      region.rooms[5].exits = "north"
      region.rooms[5].links = {}
        region.rooms[5].links.n = {}
          region.rooms[5].links.n.to = 2351
          region.rooms[5].links.n.con = ""
    region.rooms[6] = {}
      region.rooms[6].path = "fly ws1;w;w;w"
      region.rooms[6].name = "碎石路"
      region.rooms[6].zone = "华山村"
      region.rooms[6].id = 2353
      region.rooms[6].desc = "    这是一个宁静的小村子，稀稀落落的分布着几十间土坯泥房，看来村中人家不多，而且大都生活很艰辛。这是一条东西向的碎石路，北面是间结实的民宅。"
      region.rooms[6].exits = "north|east|west"
      region.rooms[6].links = {}
        region.rooms[6].links.e = {}
          region.rooms[6].links.e.to = 2351
          region.rooms[6].links.e.con = ""
        region.rooms[6].links.w = {}
          region.rooms[6].links.w.to = 2355
          region.rooms[6].links.w.con = ""
        region.rooms[6].links.n = {}
          region.rooms[6].links.n.to = 2354
          region.rooms[6].links.n.con = ""
    region.rooms[7] = {}
      region.rooms[7].path = "fly ws1;w;w;w;n"
      region.rooms[7].name = "民宅"
      region.rooms[7].zone = "华山村"
      region.rooms[7].id = 2354
      region.rooms[7].desc = "    这是一间很结实的房子，虽然也是间土坯房，但看的出建造的比村里其他的土坯房要好很多。墙上挂着、地下摆着一些农具。"
      region.rooms[7].exits = "south"
      region.rooms[7].links = {}
        region.rooms[7].links.s = {}
          region.rooms[7].links.s.to = 2353
          region.rooms[7].links.s.con = ""
    region.rooms[8] = {}
      region.rooms[8].path = "fly ws1;w;w;w;w"
      region.rooms[8].name = "碎石路"
      region.rooms[8].zone = "华山村"
      region.rooms[8].id = 2355
      region.rooms[8].desc = "    这是一个宁静的小村子，稀稀落落的分布着几十间土坯泥房，看来村中人家不多，而且大都生活很艰辛。这是一条东西向的碎石路，往西就是村子中心的打谷场了，南面是一间铁匠铺子，北面是家杂货店。"
      region.rooms[8].exits = "south|east|north|west"
      region.rooms[8].links = {}
        region.rooms[8].links.e = {}
          region.rooms[8].links.e.to = 2353
          region.rooms[8].links.e.con = ""
        region.rooms[8].links.s = {}
          region.rooms[8].links.s.to = 2357
          region.rooms[8].links.s.con = ""
        region.rooms[8].links.w = {}
          region.rooms[8].links.w.to = 2359
          region.rooms[8].links.w.con = ""
        region.rooms[8].links.n = {}
          region.rooms[8].links.n.to = 2356
          region.rooms[8].links.n.con = ""
    region.rooms[9] = {}
      region.rooms[9].path = "fly ws1;w;w;w;w;n"
      region.rooms[9].name = "杂货店"
      region.rooms[9].zone = "华山村"
      region.rooms[9].id = 2356
      region.rooms[9].desc = "    这是一间小小的杂货店，经营些油、盐、酱、醋及日用百货，村子里的人多数是很穷，除了生活必需品，这里很少贩卖其它物品。"
      region.rooms[9].exits = "south"
      region.rooms[9].links = {}
        region.rooms[9].links.s = {}
          region.rooms[9].links.s.to = 2355
          region.rooms[9].links.s.con = ""
    region.rooms[10] = {}
      region.rooms[10].path = "fly ws1;w;w;w;w;s"
      region.rooms[10].name = "铁匠铺"
      region.rooms[10].zone = "华山村"
      region.rooms[10].id = 2357
      region.rooms[10].desc = "    这是一间甚是简陋的铁匠铺，入门正中是个大铁砧，满地煤渣碎铁，墙上挂着几张犁头，屋子的角落里堆着几把破锄头、镰刀，靠墙放着几把新出炉的铁锤。东面有一个小门，门上挂著个破布帘。"
      region.rooms[10].exits = "north|east"
      region.rooms[10].links = {}
        region.rooms[10].links.e = {}
          region.rooms[10].links.e.to = 2358
          region.rooms[10].links.e.con = ""
        region.rooms[10].links.n = {}
          region.rooms[10].links.n.to = 2355
          region.rooms[10].links.n.con = ""
    region.rooms[11] = {}
      region.rooms[11].path = "fly ws1;w;w;w;w;s;e"
      region.rooms[11].name = "小房间"
      region.rooms[11].zone = "华山村"
      region.rooms[11].id = 2358
      region.rooms[11].desc = "    这是铁匠的住宅，屋子里十分简单，靠墙有一张木床，墙角摆着个小桌子，桌上胡乱的摆着几个酒杯、茶碗，桌上靠墙放着一把长剑(sword)。西边有个小门，门上挂著个破布帘，出去就是铁匠的铺子了。"
      region.rooms[11].exits = "west"
      region.rooms[11].links = {}
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 2357
          region.rooms[11].links.w.con = ""
    region.rooms[12] = {}
      region.rooms[12].path = "fly ws1;w;w;w;w;w"
      region.rooms[12].name = "打谷场"
      region.rooms[12].zone = "华山村"
      region.rooms[12].id = 2359
      region.rooms[12].desc = "    这里是村子的中心，一个平坦的广场，每年秋收打谷就在这。广场东角有棵大槐树，平日茶余饭後，村里的男女老少都爱聚在这里谈天说地。角上有几个大谷堆(gudui)。"
      region.rooms[12].exits = "south|east|northwest"
      region.rooms[12].links = {}
        region.rooms[12].links.e = {}
          region.rooms[12].links.e.to = 2355
          region.rooms[12].links.e.con = ""
        region.rooms[12].links.nw = {}
          region.rooms[12].links.nw.to = 2360
          region.rooms[12].links.nw.con = ""
        region.rooms[12].links.s = {}
          region.rooms[12].links.s.to = 2368
          region.rooms[12].links.s.con = ""
    region.rooms[13] = {}
      region.rooms[13].path = "fly ws1;w;w;w;w;w;nw"
      region.rooms[13].name = "碎石路"
      region.rooms[13].zone = "华山村"
      region.rooms[13].id = 2360
      region.rooms[13].desc = "    这是一个宁静的小村子，稀稀落落的分布着几十间土坯泥房，看来村中人家不多，而且大都生活很艰辛。东南边就是村子中心的打谷场了，西南是间民房。"
      region.rooms[13].exits = "northwest|southeast|southwest"
      region.rooms[13].links = {}
        region.rooms[13].links.sw = {}
          region.rooms[13].links.sw.to = 2361
          region.rooms[13].links.sw.con = ""
        region.rooms[13].links.nw = {}
          region.rooms[13].links.nw.to = 2362
          region.rooms[13].links.nw.con = ""
        region.rooms[13].links.se = {}
          region.rooms[13].links.se.to = 2359
          region.rooms[13].links.se.con = ""
    region.rooms[14] = {}
      region.rooms[14].path = "fly ws1;w;w;w;w;w;nw;sw"
      region.rooms[14].name = "民房"
      region.rooms[14].zone = "华山村"
      region.rooms[14].id = 2361
      region.rooms[14].desc = "    这是一个小房间，屋子里飘着一股大葱加香粉的味道。靠墙摆着张大床，床头有个小梳妆台。"
      region.rooms[14].exits = "northeast"
      region.rooms[14].links = {}
        region.rooms[14].links.ne = {}
          region.rooms[14].links.ne.to = 2360
          region.rooms[14].links.ne.con = ""
    region.rooms[15] = {}
      region.rooms[15].path = "fly ws1;w;w;w;w;w;nw;nw"
      region.rooms[15].name = "碎石路"
      region.rooms[15].zone = "华山村"
      region.rooms[15].id = 2362
      region.rooms[15].desc = "    这是一个宁静的小村子，稀稀落落的分布着几十间土坯泥房，看来村中人家不多，而且大都生活很艰辛。东北边有间小庙，庙匾上的字早已模糊不清，看不出是什麽庙了。"
      region.rooms[15].exits = "southeast|northeast|west"
      region.rooms[15].links = {}
        region.rooms[15].links.ne = {}
          region.rooms[15].links.ne.to = 2363
          region.rooms[15].links.ne.con = ""
        region.rooms[15].links.w = {}
          region.rooms[15].links.w.to = 2364
          region.rooms[15].links.w.con = ""
        region.rooms[15].links.se = {}
          region.rooms[15].links.se.to = 2360
          region.rooms[15].links.se.con = ""
    region.rooms[16] = {}
      region.rooms[16].path = "fly ws1;w;w;w;w;w;nw;nw;ne"
      region.rooms[16].name = "玄坛庙"
      region.rooms[16].zone = "华山村"
      region.rooms[16].id = 2363
      region.rooms[16].desc = "    这是一间十分破旧的小庙，庙里供的神像(joss)是赵玄坛，神像已经很残破了，神案上也积了很多尘土，看来已有很久没人来上香进供了。大概村民贫困的太久，已不再寄望於财神爷降福给他们了。神像後面的墙上有个半人多高的洞(hole)。"
      region.rooms[16].exits = "southwest"
      region.rooms[16].links = {}
        region.rooms[16].links["enter hole"] = {}
          region.rooms[16].links["enter hole"].to = 2987
          region.rooms[16].links["enter hole"].con = "punk:"
        region.rooms[16].links.sw = {}
          region.rooms[16].links.sw.to = 2362
          region.rooms[16].links.sw.con = ""
    region.rooms[17] = {}
      region.rooms[17].path = "fly ws1;w;w;w;w;w;nw;nw;w"
      region.rooms[17].name = "西村口"
      region.rooms[17].zone = "华山村"
      region.rooms[17].id = 2364
      region.rooms[17].desc = "    这里是华山脚下，虽然远离县城，却没有什麽山贼草寇在附近出没。东面是一个小村庄，看来村子里人家不多，村民们过着日出而作，日落而息的宁静生活。穿过这个小村子，就是上华山的山路了。北边有间破房子。"
      region.rooms[17].exits = "northwest|north|east"
      region.rooms[17].links = {}
        region.rooms[17].links.e = {}
          region.rooms[17].links.e.to = 2362
          region.rooms[17].links.e.con = ""
        region.rooms[17].links.nw = {}
          region.rooms[17].links.nw.to = 2366
          region.rooms[17].links.nw.con = ""
        region.rooms[17].links.n = {}
          region.rooms[17].links.n.to = 2365
          region.rooms[17].links.n.con = ""
    region.rooms[18] = {}
      region.rooms[18].path = "fly ws1;w;w;w;w;w;nw;nw;w;n"
      region.rooms[18].name = "民宅"
      region.rooms[18].zone = "华山村"
      region.rooms[18].id = 2365
      region.rooms[18].desc = "    这是一间十分简陋，四壁漏风的小房子，屋子里连一张象样的床都没有，只有一面门板上面铺着些干草。这屋子的主人一定是贫困潦倒，穷的叮当响。"
      region.rooms[18].exits = "south"
      region.rooms[18].links = {}
        region.rooms[18].links.s = {}
          region.rooms[18].links.s.to = 2364
          region.rooms[18].links.s.con = ""
    region.rooms[19] = {}
      region.rooms[19].path = "fly ws1;w;w;w;w;w;nw;nw;w;nw"
      region.rooms[19].name = "黄土路"
      region.rooms[19].zone = "华山村"
      region.rooms[19].id = 2366
      region.rooms[19].desc = "    你走在一条黄土路上。陕西的地面，就是看不尽的黄土。向南方望，远远有高山插云，近处好象有个小小村落。隐隐传来犬吠鸡啼，给你长途的奔波带来一丝生气。"
      region.rooms[19].exits = "north|southeast"
      region.rooms[19].links = {}
        region.rooms[19].links.se = {}
          region.rooms[19].links.se.to = 2364
          region.rooms[19].links.se.con = ""
        region.rooms[19].links.n = {}
          region.rooms[19].links.n.to = 2367
          region.rooms[19].links.n.con = ""
    region.rooms[20] = {}
      region.rooms[20].path = "fly ws1;w;w;w;w;w;nw;nw;w;nw;n"
      region.rooms[20].name = "黄土路"
      region.rooms[20].zone = "华山村"
      region.rooms[20].id = 2367
      region.rooms[20].desc = "    你走在一条黄土路上。这里已经是陕西地面了，向南一条黄土大道，两边望不尽的黄土高坡，没有一丝吝啬的绿色。东北隐隐传来流水的声响。"
      region.rooms[20].exits = "south|northeast"
      region.rooms[20].links = {}
        region.rooms[20].links.s = {}
          region.rooms[20].links.s.to = 2366
          region.rooms[20].links.s.con = ""
    region.rooms[21] = {}
      region.rooms[21].path = "fly ws1;w;w;w;w;w;s"
      region.rooms[21].name = "碎石路"
      region.rooms[21].zone = "华山村"
      region.rooms[21].id = 2368
      region.rooms[21].desc = "    这是一个宁静的小村子，稀稀落落的分布着几十间土坯泥房，看来村中人家不多，而且大都生活很艰辛。这是一条南北向的碎石路，往北就是村子中心的打谷场了，东面是村里唯一的青砖瓦房。"
      region.rooms[21].exits = "south|east|north"
      region.rooms[21].links = {}
        region.rooms[21].links.e = {}
          region.rooms[21].links.e.to = 2369
          region.rooms[21].links.e.con = ""
        region.rooms[21].links.s = {}
          region.rooms[21].links.s.to = 2371
          region.rooms[21].links.s.con = ""
        region.rooms[21].links.n = {}
          region.rooms[21].links.n.to = 2359
          region.rooms[21].links.n.con = ""
    region.rooms[22] = {}
      region.rooms[22].path = "fly ws1;w;w;w;w;w;s;e"
      region.rooms[22].name = "前厅"
      region.rooms[22].zone = "华山村"
      region.rooms[22].id = 2369
      region.rooms[22].desc = "    这是一间很普通的青砖瓦房，但在这个小村子里已是首屈一指的“豪宅”了。这里是前厅，厅里的摆设很简单，乡下土财主都很财迷，就算有几个钱儿，也是舍不得花。东边是个小门通向内室。"
      region.rooms[22].exits = "east|west"
      region.rooms[22].links = {}
        region.rooms[22].links.w = {}
          region.rooms[22].links.w.to = 2368
          region.rooms[22].links.w.con = ""
        region.rooms[22].links.e = {}
          region.rooms[22].links.e.to = 2370
          region.rooms[22].links.e.con = ""
    region.rooms[23] = {}
      region.rooms[23].path = "fly ws1;w;w;w;w;w;s;e;e"
      region.rooms[23].name = "内室"
      region.rooms[23].zone = "华山村"
      region.rooms[23].id = 2370
      region.rooms[23].desc = "    这里是一间寝室，屋子中间有一张大床，床上的被褥居然是绸缎的，看来这个土财主对自己并不是十分刻薄。屋里摆着几只木箱子，墙角里有一只大柜子(cabinet)。"
      region.rooms[23].exits = "west"
      region.rooms[23].links = {}
        region.rooms[23].links.w = {}
          region.rooms[23].links.w.to = 2369
          region.rooms[23].links.w.con = ""
    region.rooms[24] = {}
      region.rooms[24].path = "fly ws1;w;w;w;w;w;s;s"
      region.rooms[24].name = "碎石路"
      region.rooms[24].zone = "华山村"
      region.rooms[24].id = 2371
      region.rooms[24].desc = "    这是一个宁静的小村子，稀稀落落的分布着几十间土坯泥房，看来村中人家不多，而且大都生活很艰辛。这是一条南北向的碎石路，西边有一条黑黑暗暗的小巷子。"
      region.rooms[24].exits = "south|north|west"
      region.rooms[24].links = {}
        region.rooms[24].links.s = {}
          region.rooms[24].links.s.to = 2374
          region.rooms[24].links.s.con = ""
        region.rooms[24].links.w = {}
          region.rooms[24].links.w.to = 2372
          region.rooms[24].links.w.con = ""
        region.rooms[24].links.n = {}
          region.rooms[24].links.n.to = 2368
          region.rooms[24].links.n.con = ""
    region.rooms[25] = {}
      region.rooms[25].path = "fly ws1;w;w;w;w;w;s;s;w"
      region.rooms[25].name = "小巷"
      region.rooms[25].zone = "华山村"
      region.rooms[25].id = 2372
      region.rooms[25].desc = "    这是一条黑暗、肮脏的小巷，空气中仿佛飘扬着一股罪恶的气息，西北边通向小巷深处，正人君子是不会往那边走去的。往东走就会回到村中大路了。"
      region.rooms[25].exits = "northwest|east"
      region.rooms[25].links = {}
        region.rooms[25].links.e = {}
          region.rooms[25].links.e.to = 2371
          region.rooms[25].links.e.con = ""
        region.rooms[25].links.nw = {}
          region.rooms[25].links.nw.to = 2373
          region.rooms[25].links.nw.con = ""
    region.rooms[26] = {}
      region.rooms[26].path = "fly ws1;w;w;w;w;w;s;s;w;nw"
      region.rooms[26].name = "巷子尽头"
      region.rooms[26].zone = "华山村"
      region.rooms[26].id = 2373
      region.rooms[26].desc = "    这里是小巷的尽头，一只破木箱上摆着几样粗制的赌具，地上乱扔着些鸡骨头，空气中有一股鸡香、酒香和汗臭混杂在一起的味道。看来这里是村内地痞、流氓聚集的地方。"
      region.rooms[26].exits = "southeast"
      region.rooms[26].links = {}
        region.rooms[26].links.se = {}
          region.rooms[26].links.se.to = 2372
          region.rooms[26].links.se.con = ""
    region.rooms[27] = {}
      region.rooms[27].path = "fly ws1;w;w;w;w;w;s;s;s"
      region.rooms[27].name = "碎石路"
      region.rooms[27].zone = "华山村"
      region.rooms[27].id = 2374
      region.rooms[27].desc = "    这是一个宁静的小村子，稀稀落落的分布着几十间土坯泥房，看来村中人家不多，而且大都生活很艰辛。这是一条南北向的碎石路，东面是一间小土房。"
      region.rooms[27].exits = "south|east|north"
      region.rooms[27].links = {}
        region.rooms[27].links.e = {}
          region.rooms[27].links.e.to = 2375
          region.rooms[27].links.e.con = ""
        region.rooms[27].links.s = {}
          region.rooms[27].links.s.to = 2376
          region.rooms[27].links.s.con = ""
        region.rooms[27].links.n = {}
          region.rooms[27].links.n.to = 2371
          region.rooms[27].links.n.con = ""
    region.rooms[28] = {}
      region.rooms[28].path = "fly ws1;w;w;w;w;w;s;s;s;e"
      region.rooms[28].name = "小土房"
      region.rooms[28].zone = "华山村"
      region.rooms[28].id = 2375
      region.rooms[28].desc = "    这是一间用土坯搭成的房屋，屋里只有几件残破的家俱。在靠门口的墙角有一只空空的笼子，大概曾经用来养过鸡、鸭之类的家禽。"
      region.rooms[28].exits = "west"
      region.rooms[28].links = {}
        region.rooms[28].links.w = {}
          region.rooms[28].links.w.to = 2374
          region.rooms[28].links.w.con = ""
    region.rooms[29] = {}
      region.rooms[29].path = "fly ws1;w;w;w;w;w;s;s;s;s"
      region.rooms[29].name = "碎石路"
      region.rooms[29].zone = "华山村"
      region.rooms[29].id = 2376
      region.rooms[29].desc = "    这是一个宁静的小村子，稀稀落落的分布着几十间土坯泥房，看来村中人家不多，而且大都生活很艰辛。一条碎石路，往北通向村子的中心，往南就是出村的路了。"
      region.rooms[29].exits = "south|north"
      region.rooms[29].links = {}
        region.rooms[29].links.s = {}
          region.rooms[29].links.s.to = 2377
          region.rooms[29].links.s.con = ""
        region.rooms[29].links.n = {}
          region.rooms[29].links.n.to = 2374
          region.rooms[29].links.n.con = ""
    region.rooms[30] = {}
      region.rooms[30].path = "fly ws1;w;w;w;w;w;s;s;s;s;s"
      region.rooms[30].name = "南村口"
      region.rooms[30].zone = "华山村"
      region.rooms[30].id = 2377
      region.rooms[30].desc = "    这里是华山脚下，虽然远离县城，却没有什麽山贼草寇在附近出没。西面是一个小村庄，看来村子里人家不多，村民们过着日出而作，日落而息的宁静生活。穿过这个小村子，就是上华山的山路了。"
      region.rooms[30].exits = "south|north"
      region.rooms[30].links = {}
        region.rooms[30].links.s = {}
          region.rooms[30].links.s.to = 2378
          region.rooms[30].links.s.con = ""
        region.rooms[30].links.n = {}
          region.rooms[30].links.n.to = 2376
          region.rooms[30].links.n.con = ""
    region.rooms[31] = {}
      region.rooms[31].path = "fly ws1;w;w;w;w;w;s;s;s;s;s;s"
      region.rooms[31].name = "黄土路"
      region.rooms[31].zone = "华山村"
      region.rooms[31].id = 2378
      region.rooms[31].desc = "    一条坑坑洼洼的土路，弯弯曲曲的通向山里。"
      region.rooms[31].exits = "north|southeast"
      region.rooms[31].links = {}
        region.rooms[31].links.n = {}
          region.rooms[31].links.n.to = 2377
          region.rooms[31].links.n.con = ""
        region.rooms[31].links.se = {}
          region.rooms[31].links.se.to = 2379
          region.rooms[31].links.se.con = ""
    region.rooms[32] = {}
      region.rooms[32].path = "fly ws1;w;w;w;w;w;s;s;s;s;s;s;se"
      region.rooms[32].name = "青石大道"
      region.rooms[32].zone = "华山村"
      region.rooms[32].id = 2379
      region.rooms[32].desc = "    你走在一条青石大道上，南边隐约可见到扬州城的城墙。北面两条土路分岔通向山里。"
      region.rooms[32].exits = "south|northwest|northeast"
      region.rooms[32].links = {}
        region.rooms[32].links.ne = {}
          region.rooms[32].links.ne.to = 2381
          region.rooms[32].links.ne.con = ""
        region.rooms[32].links.s = {}
          region.rooms[32].links.s.to = 2380
          region.rooms[32].links.s.con = ""
        region.rooms[32].links.nw = {}
          region.rooms[32].links.nw.to = 2378
          region.rooms[32].links.nw.con = ""
    region.rooms[33] = {}
      region.rooms[33].path = "fly ws1;w;w;w;w;w;s;s;s;s;s;s;se;s"
      region.rooms[33].name = "青石大道"
      region.rooms[33].zone = "华山村"
      region.rooms[33].id = 2380
      region.rooms[33].desc = "    你走在一条青石大道上，人来人往非常繁忙，不时地有人骑着马匆匆而过。大道两旁有一些小货摊，似乎是一处集市。南边通向扬州城。"
      region.rooms[33].exits = "south|north"
      region.rooms[33].links = {}
        region.rooms[33].links.s = {}
          region.rooms[33].links.s.to = 834
          region.rooms[33].links.s.con = ""
        region.rooms[33].links.n = {}
          region.rooms[33].links.n.to = 2379
          region.rooms[33].links.n.con = ""
    region.rooms[34] = {}
      region.rooms[34].path = "fly ws1;w;w;w;w;w;s;s;s;s;s;s;se;ne"
      region.rooms[34].name = "松树林"
      region.rooms[34].zone = "华山村"
      region.rooms[34].id = 2381
      region.rooms[34].desc = "    这是一片松树林。中间一条小路，两边都是黑森森的几丈高的松树。树上结着不少松果，间或有野兔游悠游而过。"
      region.rooms[34].exits = "east|southwest"
      region.rooms[34].links = {}
        region.rooms[34].links.e = {}
          region.rooms[34].links.e.to = 2382
          region.rooms[34].links.e.con = ""
        region.rooms[34].links.sw = {}
          region.rooms[34].links.sw.to = 2379
          region.rooms[34].links.sw.con = ""
    region.rooms[35] = {}
      region.rooms[35].path = "fly ws1;w;w;w;w;w;s;s;s;s;s;s;se;ne;e"
      region.rooms[35].name = "松树林"
      region.rooms[35].zone = "华山村"
      region.rooms[35].id = 2382
      region.rooms[35].desc = "    这是一片松树林。中间一条小路，两边都是黑森森的几丈高的松树。快出林了，可以看到东边好高的一道大山。"
      region.rooms[35].exits = "east|west"
      region.rooms[35].links = {}
        region.rooms[35].links.w = {}
          region.rooms[35].links.w.to = 2381
          region.rooms[35].links.w.con = ""
        region.rooms[35].links.e = {}
          region.rooms[35].links.e.to = 2383
          region.rooms[35].links.e.con = ""
    region.rooms[36] = {}
      region.rooms[36].path = "fly ws1;w;w;w;w;w;s;s;s;s;s;s;se;ne;e;e"
      region.rooms[36].name = "中条山脚"
      region.rooms[36].zone = "华山村"
      region.rooms[36].id = 2383
      region.rooms[36].desc = "    你来到中条山脚。仰望天空，山势压顶，天边的红霞映透了整个山林，呼啸的穿山风刮个不停。你不禁有些惧意。向东有一条上山小路。"
      region.rooms[36].exits = "eastup|west"
      region.rooms[36].links = {}
        region.rooms[36].links.w = {}
          region.rooms[36].links.w.to = 2382
          region.rooms[36].links.w.con = ""
        region.rooms[36].links.eu = {}
          region.rooms[36].links.eu.to = 2384
          region.rooms[36].links.eu.con = ""
    region.rooms[37] = {}
      region.rooms[37].path = "fly ws1;w;w;w;w;w;s;s;s;s;s;s;se;ne;e;e;eu"
      region.rooms[37].name = "中条山森林"
      region.rooms[37].zone = "华山村"
      region.rooms[37].id = 2384
      region.rooms[37].desc = "    你走在中条山路上。路径狭小，周围茂密森林里，传来阵阵野兽夜禽的嘶鸣，听来让人毛骨悚然。"
      region.rooms[37].exits = "southup|westdown"
      region.rooms[37].links = {}
        region.rooms[37].links.wd = {}
          region.rooms[37].links.wd.to = 2383
          region.rooms[37].links.wd.con = ""
        region.rooms[37].links.su = {}
          region.rooms[37].links.su.to = 2385
          region.rooms[37].links.su.con = ""
    region.rooms[38] = {}
      region.rooms[38].path = "fly ws1;w;w;w;w;w;s;s;s;s;s;s;se;ne;e;e;eu;su"
      region.rooms[38].name = "中条山密林"
      region.rooms[38].zone = "华山村|华山村1"
      region.rooms[38].id = 2385
      region.rooms[38].links = {}
        region.rooms[38].links["use fire;zuan"] = {}
          region.rooms[38].links["use fire;zuan"].to = 2698
          region.rooms[38].links["use fire;zuan"].con = ""
        region.rooms[38].links.nd = {}
          region.rooms[38].links.nd.to = 2384
          region.rooms[38].links.nd.con = ""
      region.rooms[38].exits = "northdown"
      region.rooms[38].desc = "    山路越来越小，周围茂密森林里和脚下的茅草封住了路，上不见天光，后不见归路(road)，你简直绝望了。"
    region.rooms[39] = {}
      region.rooms[39].path = "fly ws1;w;w;w;w;w;nw;nw;ne;|!punk::enter hole|"
      region.rooms[39].name = "小棚子"
      region.rooms[39].zone = "华山村"
      region.rooms[39].id = 2987
      region.rooms[39].desc = "    这是一个临时搭起来的小棚子。"
      region.rooms[39].exits = "west"
      region.rooms[39].links = {}
        region.rooms[39].links.w = {}
          region.rooms[39].links.w.to = 2363
          region.rooms[39].links.w.con = ""
  region.center = 2348
return region