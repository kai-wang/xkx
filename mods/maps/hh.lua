local region = {}
  region.cmd = "fly wm;e;n;w;w;w;n;n;e;ne;n"
  region.name = "河套地区"
  region.id = "hh"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;e;e;e;ne"
      region.rooms[1].name = "黄河岸边"
      region.rooms[1].zone = "泰山|河套地区"
      region.rooms[1].id = 1271
      region.rooms[1].desc = "    这里是黄河岸边。黄河流淌到这里，河床宽阔。黄色的河水在静静地向东流去，使人忘记它发洪水时的狂威。"
      region.rooms[1].exits = "east|northeast|southwest"
      region.rooms[1].links = {}
        region.rooms[1].links.e = {}
          region.rooms[1].links.e.to = 1270
          region.rooms[1].links.e.con = ""
        region.rooms[1].links.sw = {}
          region.rooms[1].links.sw.to = 2420
          region.rooms[1].links.sw.con = ""
        region.rooms[1].links.ne = {}
          region.rooms[1].links.ne.to = 2421
          region.rooms[1].links.ne.con = ""
    region.rooms[2] = {}
      region.rooms[2].path = "fly wm;e;n;w;w;w;n;n;e;ne;n"
      region.rooms[2].name = "黄河岸边"
      region.rooms[2].zone = "河套地区"
      region.rooms[2].id = 2407
      region.rooms[2].links = {}
        region.rooms[2].links.e = {}
          region.rooms[2].links.e.to = 2418
          region.rooms[2].links.e.con = ""
        region.rooms[2].links.w = {}
          region.rooms[2].links.w.to = 2424
          region.rooms[2].links.w.con = ""
        region.rooms[2].links.s = {}
          region.rooms[2].links.s.to = 2408
          region.rooms[2].links.s.con = ""
        region.rooms[2].links.n = {}
          region.rooms[2].links.n.to = 2427
          region.rooms[2].links.n.con = ""
      region.rooms[2].exits = "south|east|north|west"
      region.rooms[2].desc = "    这里是黄河岸边。黄河流淌到这里，已经泥沙浑浊了。黄色的河水在河床里翻滚着，咆哮着，卷起一个个巨大的漩窝。西边有个寨子。"
    region.rooms[3] = {}
      region.rooms[3].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;s"
      region.rooms[3].name = "田地"
      region.rooms[3].zone = "河套地区"
      region.rooms[3].id = 2408
      region.rooms[3].links = {}
        region.rooms[3].links.sw = {}
          region.rooms[3].links.sw.to = 2409
          region.rooms[3].links.sw.con = ""
        region.rooms[3].links.n = {}
          region.rooms[3].links.n.to = 2407
          region.rooms[3].links.n.con = ""
      region.rooms[3].exits = "north|southwest"
      region.rooms[3].desc = "    这里是一大片农田。不远处有一些村庄，炊烟袅袅升起。村庄周围是一块块的田地，田里有一些正在耕作的农人。村里不时传出一声声的犬吠。"
    region.rooms[4] = {}
      region.rooms[4].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;s;sw"
      region.rooms[4].name = "田地"
      region.rooms[4].zone = "河套地区"
      region.rooms[4].id = 2409
      region.rooms[4].links = {}
        region.rooms[4].links.ne = {}
          region.rooms[4].links.ne.to = 2408
          region.rooms[4].links.ne.con = ""
        region.rooms[4].links.w = {}
          region.rooms[4].links.w.to = 2410
          region.rooms[4].links.w.con = ""
      region.rooms[4].exits = "northeast|west"
      region.rooms[4].desc = ""
    region.rooms[5] = {}
      region.rooms[5].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;s;sw;w"
      region.rooms[5].name = "田地"
      region.rooms[5].zone = "河套地区"
      region.rooms[5].id = 2410
      region.rooms[5].links = {}
        region.rooms[5].links.e = {}
          region.rooms[5].links.e.to = 2409
          region.rooms[5].links.e.con = ""
        region.rooms[5].links.w = {}
          region.rooms[5].links.w.to = 2411
          region.rooms[5].links.w.con = ""
        region.rooms[5].links.s = {}
          region.rooms[5].links.s.to = 2415
          region.rooms[5].links.s.con = ""
      region.rooms[5].exits = "south|east|west"
      region.rooms[5].desc = "    这里林木渐渐稀疏，不远处有一些村庄，炊烟袅袅升起。村庄周围是一块块的田地，田里有一些正在耕作的农人。"
    region.rooms[6] = {}
      region.rooms[6].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;s;sw;w;w"
      region.rooms[6].name = "田地"
      region.rooms[6].zone = "河套地区"
      region.rooms[6].id = 2411
      region.rooms[6].links = {}
        region.rooms[6].links.e = {}
          region.rooms[6].links.e.to = 2410
          region.rooms[6].links.e.con = ""
        region.rooms[6].links.sw = {}
          region.rooms[6].links.sw.to = 2412
          region.rooms[6].links.sw.con = ""
      region.rooms[6].exits = "east|southwest"
      region.rooms[6].desc = "    这里林木渐渐稀疏，不远处有一些村庄，炊烟袅袅升起。村庄周围是一块块的田地，田里有一些正在耕作的农人。"
    region.rooms[7] = {}
      region.rooms[7].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;s;sw;w;w;sw"
      region.rooms[7].name = "树林"
      region.rooms[7].zone = "河套地区"
      region.rooms[7].id = 2412
      region.rooms[7].links = {}
        region.rooms[7].links.ne = {}
          region.rooms[7].links.ne.to = 2411
          region.rooms[7].links.ne.con = ""
        region.rooms[7].links.w = {}
          region.rooms[7].links.w.to = 2413
          region.rooms[7].links.w.con = ""
        region.rooms[7].links.se = {}
          region.rooms[7].links.se.to = 2414
          region.rooms[7].links.se.con = ""
      region.rooms[7].exits = "southeast|northeast|west"
      region.rooms[7].desc = "    树林里光线暗淡，只能听见头顶上传来一些鸟儿的啼鸣。偶而从茂密的叶间透过的一线光伴着落叶在飞舞。朽木腐烂的气味和身後传来野兽的啸声使人不觉犹豫了前进的脚步。"
    region.rooms[8] = {}
      region.rooms[8].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;s;sw;w;w;sw;w"
      region.rooms[8].name = "树林"
      region.rooms[8].zone = "河套地区"
      region.rooms[8].id = 2413
      region.rooms[8].links = {}
        region.rooms[8].links.e = {}
          region.rooms[8].links.e.to = 2412
          region.rooms[8].links.e.con = ""
      region.rooms[8].exits = "east"
      region.rooms[8].desc = "    树林里光线暗淡，只能听见头顶上传来一些鸟儿的啼鸣。偶而从茂密的叶间透过的一线光伴着落叶在飞舞。朽木腐烂的气味和身後传来野兽的啸声使人不觉犹豫了前进的脚步。"
    region.rooms[9] = {}
      region.rooms[9].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;s;sw;w;s;w"
      region.rooms[9].name = "树林"
      region.rooms[9].zone = "河套地区"
      region.rooms[9].id = 2414
      region.rooms[9].links = {}
        region.rooms[9].links.e = {}
          region.rooms[9].links.e.to = 2415
          region.rooms[9].links.e.con = ""
        region.rooms[9].links.nw = {}
          region.rooms[9].links.nw.to = 2412
          region.rooms[9].links.nw.con = ""
        region.rooms[9].links.s = {}
          region.rooms[9].links.s.to = 2417
          region.rooms[9].links.s.con = ""
      region.rooms[9].exits = "south|east|northwest"
      region.rooms[9].desc = "    树林里光线暗淡，只能听见头顶上传来一些鸟儿的啼鸣。偶而从茂密的叶间透过的一线光伴着落叶在飞舞。朽木腐烂的气味和身後传来野兽的啸声使人不觉犹豫了前进的脚步。"
    region.rooms[10] = {}
      region.rooms[10].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;s;sw;w;s"
      region.rooms[10].name = "树林"
      region.rooms[10].zone = "河套地区"
      region.rooms[10].id = 2415
      region.rooms[10].links = {}
        region.rooms[10].links.s = {}
          region.rooms[10].links.s.to = 2416
          region.rooms[10].links.s.con = ""
        region.rooms[10].links.w = {}
          region.rooms[10].links.w.to = 2414
          region.rooms[10].links.w.con = ""
        region.rooms[10].links.n = {}
          region.rooms[10].links.n.to = 2410
          region.rooms[10].links.n.con = ""
      region.rooms[10].exits = "south|north|west"
      region.rooms[10].desc = "    树林里光线暗淡，只能听见头顶上传来一些鸟儿的啼鸣。偶而从茂密的叶间透过的一线光伴着落叶在飞舞。朽木腐烂的气味和身後传来野兽的啸声使人不觉犹豫了前进的脚步。"
    region.rooms[11] = {}
      region.rooms[11].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;s;sw;w;s;s"
      region.rooms[11].name = "树林"
      region.rooms[11].zone = "河套地区"
      region.rooms[11].id = 2416
      region.rooms[11].links = {}
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 2417
          region.rooms[11].links.w.con = ""
        region.rooms[11].links.n = {}
          region.rooms[11].links.n.to = 2415
          region.rooms[11].links.n.con = ""
      region.rooms[11].exits = "north|east|west"
      region.rooms[11].desc = "    树林里光线暗淡，只能听见头顶上传来一些鸟儿的啼鸣。偶而从茂密的叶间透过的一线光伴着落叶在飞舞。朽木腐烂的气味和身後传来野兽的啸声使人不觉犹豫了前进的脚步。林中立着一块牌子(paizi)。"
    region.rooms[12] = {}
      region.rooms[12].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;s;sw;w;s;s;w"
      region.rooms[12].name = "树林"
      region.rooms[12].zone = "河套地区"
      region.rooms[12].id = 2417
      region.rooms[12].links = {}
        region.rooms[12].links.e = {}
          region.rooms[12].links.e.to = 2416
          region.rooms[12].links.e.con = ""
        region.rooms[12].links.n = {}
          region.rooms[12].links.n.to = 2414
          region.rooms[12].links.n.con = ""
      region.rooms[12].exits = "north|east"
      region.rooms[12].desc = "    树林里光线暗淡，只能听见头顶上传来一些鸟儿的啼鸣。偶而从茂密的叶间透过的一线光伴着落叶在飞舞。朽木腐烂的气味和身後传来野兽的啸声使人不觉犹豫了前进的脚步。"
    region.rooms[13] = {}
      region.rooms[13].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;e"
      region.rooms[13].name = "黄河岸边"
      region.rooms[13].zone = "河套地区"
      region.rooms[13].id = 2418
      region.rooms[13].links = {}
        region.rooms[13].links.w = {}
          region.rooms[13].links.w.to = 2407
          region.rooms[13].links.w.con = ""
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 2419
          region.rooms[13].links.e.con = ""
      region.rooms[13].exits = "east|west"
      region.rooms[13].desc = "    这里是黄河岸边。黄河流淌到这里，已经泥沙浑浊了。黄色的河水在河床里翻滚着，咆哮着，卷起一个个巨大的漩窝。"
    region.rooms[14] = {}
      region.rooms[14].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;e;e"
      region.rooms[14].name = "黄河岸边"
      region.rooms[14].zone = "河套地区"
      region.rooms[14].id = 2419
      region.rooms[14].links = {}
        region.rooms[14].links.w = {}
          region.rooms[14].links.w.to = 2418
          region.rooms[14].links.w.con = ""
        region.rooms[14].links.e = {}
          region.rooms[14].links.e.to = 2420
          region.rooms[14].links.e.con = ""
      region.rooms[14].exits = "east|west"
      region.rooms[14].desc = "    这里是黄河岸边。黄河流淌到这里，已经泥沙浑浊了。黄色的河水在河床里翻滚着，咆哮着，卷起一个个巨大的漩窝。"
    region.rooms[15] = {}
      region.rooms[15].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;e;e;e"
      region.rooms[15].name = "黄河岸边"
      region.rooms[15].zone = "河套地区"
      region.rooms[15].id = 2420
      region.rooms[15].links = {}
        region.rooms[15].links.w = {}
          region.rooms[15].links.w.to = 2419
          region.rooms[15].links.w.con = ""
        region.rooms[15].links.ne = {}
          region.rooms[15].links.ne.to = 1271
          region.rooms[15].links.ne.con = ""
      region.rooms[15].exits = "northeast|west"
      region.rooms[15].desc = "    这里是黄河岸边。黄河流淌到这里，已经泥沙浑浊了。黄色的河水在河床里翻滚着，咆哮着，卷起一个个巨大的漩窝。黄河在这里由於受到东面泰山的阻挡，转而向北。"
    region.rooms[16] = {}
      region.rooms[16].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;e;e;e;ne;ne"
      region.rooms[16].name = "黄河岸边"
      region.rooms[16].zone = "河套地区"
      region.rooms[16].id = 2421
      region.rooms[16].links = {}
        region.rooms[16].links.ne = {}
          region.rooms[16].links.ne.to = 2422
          region.rooms[16].links.ne.con = ""
        region.rooms[16].links.sw = {}
          region.rooms[16].links.sw.to = 1271
          region.rooms[16].links.sw.con = ""
      region.rooms[16].exits = "northeast|southwest"
      region.rooms[16].desc = "    这里是黄河岸边。黄河流淌到这里，河床宽阔。黄色的河水在静静地向东流去，使人忘记它发洪水时的狂威。"
    region.rooms[17] = {}
      region.rooms[17].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;e;e;e;ne;ne;ne"
      region.rooms[17].name = "黄河岸边"
      region.rooms[17].zone = "河套地区"
      region.rooms[17].id = 2422
      region.rooms[17].links = {}
        region.rooms[17].links.ne = {}
          region.rooms[17].links.ne.to = 2423
          region.rooms[17].links.ne.con = ""
        region.rooms[17].links.sw = {}
          region.rooms[17].links.sw.to = 2421
          region.rooms[17].links.sw.con = ""
      region.rooms[17].exits = "northeast|southwest"
      region.rooms[17].desc = "    这里是黄河岸边。黄河流淌到这里，河床宽阔。黄色的河水在静静地向东流去，使人忘记它发洪水时的狂威。"
    region.rooms[18] = {}
      region.rooms[18].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;e;e;e;ne;ne;ne;ne"
      region.rooms[18].name = "黄河入海口"
      region.rooms[18].zone = "河套地区"
      region.rooms[18].id = 2423
      region.rooms[18].links = {}
        region.rooms[18].links.sw = {}
          region.rooms[18].links.sw.to = 2422
          region.rooms[18].links.sw.con = ""
      region.rooms[18].exits = "southwest"
      region.rooms[18].desc = "    黄河流经青藏高原、黄土高原、华北平原，总长一万零九百里，在这里汇入大海。"
    region.rooms[19] = {}
      region.rooms[19].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;w"
      region.rooms[19].name = "黄河帮寨门"
      region.rooms[19].zone = "河套地区"
      region.rooms[19].id = 2424
      region.rooms[19].links = {}
        region.rooms[19].links.e = {}
          region.rooms[19].links.e.to = 2407
          region.rooms[19].links.e.con = ""
        region.rooms[19].links.w = {}
          region.rooms[19].links.w.to = 2425
          region.rooms[19].links.w.con = ""
      region.rooms[19].exits = "east|west"
      region.rooms[19].desc = "    这是一所气势壮观的寨门，正中高挂着一面扁额─写着「黄河帮」三个大字。寨里旗帜高挂，规模不小。黄河帮是黄河沿岸的一个大帮会，平日飞扬跋扈，欺压百姓，做恶多端。帮主沙通天武功深湛，并与彭连虎、梁子翁和灵智上人等高手结交，因此声势浩大。据闻其与金人勾结，欲侵略中土。"
    region.rooms[20] = {}
      region.rooms[20].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;w;w"
      region.rooms[20].name = "广场"
      region.rooms[20].zone = "河套地区"
      region.rooms[20].id = 2425
      region.rooms[20].links = {}
        region.rooms[20].links.e = {}
          region.rooms[20].links.e.to = 2424
          region.rooms[20].links.e.con = ""
        region.rooms[20].links.w = {}
          region.rooms[20].links.w.to = 2426
          region.rooms[20].links.w.con = ""
      region.rooms[20].exits = "east|west"
      region.rooms[20].desc = "    广场占地甚大，部置严谨。往西过去可达黄河帮的「侠义厅」。周围则是些房舍，供帮众居住。"
    region.rooms[21] = {}
      region.rooms[21].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;w;w;w"
      region.rooms[21].name = "侠义厅"
      region.rooms[21].zone = "河套地区"
      region.rooms[21].id = 2426
      region.rooms[21].links = {}
        region.rooms[21].links.e = {}
          region.rooms[21].links.e.to = 2425
          region.rooms[21].links.e.con = ""
      region.rooms[21].exits = "east"
      region.rooms[21].desc = "    这是黄河帮议事的大厅，厅上挂着「侠义厅」三字匾额。厅里靠北朝南放着一张虎皮交椅，两边摆设着几副红木桌椅，非常有气派。墙上附庸风雅地挂了几幅丹青书法。"
    region.rooms[22] = {}
      region.rooms[22].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n"
      region.rooms[22].name = "渭汾流域"
      region.rooms[22].zone = "河套地区"
      region.rooms[22].id = 2427
      region.rooms[22].links = {}
        region.rooms[22].links.s = {}
          region.rooms[22].links.s.to = 2407
          region.rooms[22].links.s.con = ""
        region.rooms[22].links.n = {}
          region.rooms[22].links.n.to = 2428
          region.rooms[22].links.n.con = ""
      region.rooms[22].exits = "south|north|northeast|southwest"
      region.rooms[22].desc = "    汾河和渭河汇入黄河，增大了其水势，也带来了更多的泥沙。这里河东是晋，河西是陕。"
    region.rooms[23] = {}
      region.rooms[23].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n"
      region.rooms[23].name = "黄河"
      region.rooms[23].zone = "河套地区"
      region.rooms[23].id = 2428
      region.rooms[23].links = {}
        region.rooms[23].links.s = {}
          region.rooms[23].links.s.to = 2427
          region.rooms[23].links.s.con = ""
        region.rooms[23].links.w = {}
          region.rooms[23].links.w.to = 2429
          region.rooms[23].links.w.con = ""
      region.rooms[23].exits = "south|west"
      region.rooms[23].desc = "    黄河沿蒙古高原南边向东流淌，遇太行山脉的阻拦，便转头南下，形成晋陕的分界。东北方向好象有个渡口。"
    region.rooms[24] = {}
      region.rooms[24].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w"
      region.rooms[24].name = "河套"
      region.rooms[24].zone = "河套地区"
      region.rooms[24].id = 2429
      region.rooms[24].links = {}
        region.rooms[24].links.e = {}
          region.rooms[24].links.e.to = 2428
          region.rooms[24].links.e.con = ""
        region.rooms[24].links.sw = {}
          region.rooms[24].links.sw.to = 2431
          region.rooms[24].links.sw.con = ""
        region.rooms[24].links.w = {}
          region.rooms[24].links.w.to = 2430
          region.rooms[24].links.w.con = ""
      region.rooms[24].exits = "east|west|southwest"
      region.rooms[24].desc = "    常言到“黄河九害，富了一套”。河套地区灌溉系统发达，土地肥沃，是种庄稼的好地方。"
    region.rooms[25] = {}
      region.rooms[25].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;w"
      region.rooms[25].name = "青城"
      region.rooms[25].zone = "河套地区"
      region.rooms[25].id = 2430
      region.rooms[25].links = {}
        region.rooms[25].links.e = {}
          region.rooms[25].links.e.to = 2429
          region.rooms[25].links.e.con = ""
      region.rooms[25].exits = "east|north"
      region.rooms[25].desc = "    青城位于靖远以南三百二十里，西南八十里就是兰州，名为青城，其实只是个小镇，因为地处北去西夏的要冲，许多往来西夏和大宋的商旅都必须经过这儿，人来人往很是热闹。"
    region.rooms[26] = {}
      region.rooms[26].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw"
      region.rooms[26].name = "黄土高原"
      region.rooms[26].zone = "河套地区"
      region.rooms[26].id = 2431
      region.rooms[26].links = {}
        region.rooms[26].links.ne = {}
          region.rooms[26].links.ne.to = 2429
          region.rooms[26].links.ne.con = ""
        region.rooms[26].links.sw = {}
          region.rooms[26].links.sw.to = 2432
          region.rooms[26].links.sw.con = ""
      region.rooms[26].exits = "northeast|southwest"
      region.rooms[26].desc = "    黄河像一把厉刃将黄土高原切开。无数条小溪流夹带着泥沙汇入黄河，形成千沟万壑。沟壑之间的一块块平地叫做台塬。黄河沿蒙古高原南边向东流淌，遇太行山脉的阻拦，便转头南下，形成晋陕的分界。"
    region.rooms[27] = {}
      region.rooms[27].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw"
      region.rooms[27].name = "黄河"
      region.rooms[27].zone = "河套地区"
      region.rooms[27].id = 2432
      region.rooms[27].links = {}
        region.rooms[27].links.ne = {}
          region.rooms[27].links.ne.to = 2431
          region.rooms[27].links.ne.con = ""
        region.rooms[27].links.w = {}
          region.rooms[27].links.w.to = 2433
          region.rooms[27].links.w.con = ""
      region.rooms[27].exits = "northeast|west"
      region.rooms[27].desc = "    黄河出了青海，经甘肃之后，向东受到黄土高原的阻挡，转而向东北流去。在流经黄土高原的过程中泥沙含量猛增，水色澄黄，就被称为黄河。"
    region.rooms[28] = {}
      region.rooms[28].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w"
      region.rooms[28].name = "黄河"
      region.rooms[28].zone = "河套地区"
      region.rooms[28].id = 2433
      region.rooms[28].links = {}
        region.rooms[28].links.e = {}
          region.rooms[28].links.e.to = 2432
          region.rooms[28].links.e.con = ""
        region.rooms[28].links.w = {}
          region.rooms[28].links.w.to = 2434
          region.rooms[28].links.w.con = ""
      region.rooms[28].exits = "east|west"
      region.rooms[28].desc = "    葛水过了古浪，和源于酒泉西北的洪水河于新城合流。到了这里，河水的去势逐渐加强，挟带着千万吨的高原泥沙，势不可挡地向西南奔去。由于此处水流湍急，这里的鱼大多肉厚脂丰。名扬天下的黄河大鲤鱼即产于此。"
    region.rooms[29] = {}
      region.rooms[29].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w"
      region.rooms[29].name = "永登"
      region.rooms[29].zone = "河套地区"
      region.rooms[29].id = 2434
      region.rooms[29].links = {}
        region.rooms[29].links.e = {}
          region.rooms[29].links.e.to = 2433
          region.rooms[29].links.e.con = ""
        region.rooms[29].links.w = {}
          region.rooms[29].links.w.to = 2435
          region.rooms[29].links.w.con = ""
        region.rooms[29].links.n = {}
          region.rooms[29].links.n.to = 2439
          region.rooms[29].links.n.con = ""
      region.rooms[29].exits = "east|north|west"
      region.rooms[29].desc = "    这里就是西北的军事重镇永登。一座孤城耸立在茫茫荒野之上。此城建于汉光武年间，据闻大将军霍去病曾在此练兵三年，后一举平定大西北。历代而来，这里都有军队长驻。"
    region.rooms[30] = {}
      region.rooms[30].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;w"
      region.rooms[30].name = "客店"
      region.rooms[30].zone = "河套地区"
      region.rooms[30].id = 2435
      region.rooms[30].links = {}
        region.rooms[30].links.e = {}
          region.rooms[30].links.e.to = 2434
          region.rooms[30].links.e.con = ""
        region.rooms[30].links.w = {}
          region.rooms[30].links.w.to = 2436
          region.rooms[30].links.w.con = ""
        region.rooms[30].links.u = {}
          region.rooms[30].links.u.to = 2437
          region.rooms[30].links.u.con = ""
      region.rooms[30].exits = "up|east|west"
      region.rooms[30].desc = "    这是一家当地居民开的鸡毛小店，楼下卖些卤菜和劣酒，楼上则是客房。这是在进祈连山区前的唯一休息之处，贩夫走卒，采药客等皆在此休憩，不时还可看见一两个寻仙访道之辈。墙上有一块牌子(paizi)，西面是一间马厩。"
    region.rooms[31] = {}
      region.rooms[31].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;w;w"
      region.rooms[31].name = "马厩"
      region.rooms[31].zone = "河套地区"
      region.rooms[31].id = 2436
      region.rooms[31].links = {}
        region.rooms[31].links.e = {}
          region.rooms[31].links.e.to = 2435
          region.rooms[31].links.e.con = ""
      region.rooms[31].exits = "east"
      region.rooms[31].desc = "    这是客栈边上的马厩，常年供应新鲜草料。据说此地民风淳朴，客人只要住店，马夫们就会把马牵到马厩好生照看，将它们喂饱饮足，再洗刷得干乾净净。一直伺候到客人离店上路。马厩中堆放著几堆草料，正中有一口泔槽。马厩雨檐下的烂木柱上钉着一块破木牌(paizi)。"
    region.rooms[32] = {}
      region.rooms[32].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;w;u"
      region.rooms[32].name = "客店二楼"
      region.rooms[32].zone = "河套地区"
      region.rooms[32].id = 2437
      region.rooms[32].links = {}
        region.rooms[32].links.enter = {}
          region.rooms[32].links.enter.to = 2438
          region.rooms[32].links.enter.con = ""
        region.rooms[32].links.d = {}
          region.rooms[32].links.d.to = 2435
          region.rooms[32].links.d.con = ""
      region.rooms[32].exits = "enter|down"
      region.rooms[32].desc = "    你正走在客店二楼的走廊上，可以听到从客房里不时地呼呼的打酣声，一阵高过一阵。不时有睡意朦胧的旅客进进出出，到楼下的掌柜处付了钱再上来睡觉。"
    region.rooms[33] = {}
      region.rooms[33].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;w;u;enter"
      region.rooms[33].name = "客店二楼"
      region.rooms[33].zone = "河套地区"
      region.rooms[33].id = 2438
      region.rooms[33].links = {}
        region.rooms[33].links.out = {}
          region.rooms[33].links.out.to = 2437
          region.rooms[33].links.out.con = ""
      region.rooms[33].exits = "out"
      region.rooms[33].desc = "    这是一间很大的客房，陈设十分简陋。靠墙放了十几张小木床，不少客人正和衣而卧，满屋子都是呼呼的打酣声。西边有张床是空的，你蹑手蹑脚地走了过去。"
    region.rooms[34] = {}
      region.rooms[34].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n"
      region.rooms[34].name = "古浪"
      region.rooms[34].zone = "河套地区"
      region.rooms[34].id = 2439
      region.rooms[34].links = {}
        region.rooms[34].links.ne = {}
          region.rooms[34].links.ne.to = 2443
          region.rooms[34].links.ne.con = ""
        region.rooms[34].links.s = {}
          region.rooms[34].links.s.to = 2434
          region.rooms[34].links.s.con = ""
        region.rooms[34].links.e = {}
          region.rooms[34].links.e.to = 2441
          region.rooms[34].links.e.con = ""
        region.rooms[34].links.w = {}
          region.rooms[34].links.w.to = 2440
          region.rooms[34].links.w.con = ""
        region.rooms[34].links.n = {}
          region.rooms[34].links.n.to = 2442
          region.rooms[34].links.n.con = ""
      region.rooms[34].exits = "south|east|north|northeast|west"
      region.rooms[34].desc = "    古浪城建于西周，本名鬼武，后整修于汉，更名古浪。古浪是西北地区的毛皮集散地，当初的紫羊羔皮袄，一出于张家口，另一出处就是古浪了，过了古浪再往西四十里，跨过纪水河即到兰州。"
    region.rooms[35] = {}
      region.rooms[35].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;w"
      region.rooms[35].name = "萧家桥"
      region.rooms[35].zone = "河套地区"
      region.rooms[35].id = 2440
      region.rooms[35].links = {}
        region.rooms[35].links.e = {}
          region.rooms[35].links.e.to = 2439
          region.rooms[35].links.e.con = ""
      region.rooms[35].exits = "east"
      region.rooms[35].desc = "    在兰州和古浪中间，纪永河水咆哮而过，河水湍激，河床最宽处九丈四尺，窄处七丈余，度船难过。相传汉年间，本地一位萧姓大财主，穷六年之功，遍集巧匠，费尽家私，方建成桥，欲到兰州，必先度本桥。"
    region.rooms[36] = {}
      region.rooms[36].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;e"
      region.rooms[36].name = "皮货药材店"
      region.rooms[36].zone = "河套地区"
      region.rooms[36].id = 2441
      region.rooms[36].links = {}
        region.rooms[36].links.w = {}
          region.rooms[36].links.w.to = 2439
          region.rooms[36].links.w.con = ""
      region.rooms[36].exits = "west"
      region.rooms[36].desc = "    这是古浪城里唯一的一家店铺，一踏进铺内就可闻到一股淡淡的膻味，隐隐可以看见堆放在后院翻晒的各式皮货，怕有不下千余件。在西墙边，立了一个大红木药柜，里面盛放了草药。"
    region.rooms[37] = {}
      region.rooms[37].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;n"
      region.rooms[37].name = "学馆"
      region.rooms[37].zone = "河套地区"
      region.rooms[37].id = 2442
      region.rooms[37].links = {}
        region.rooms[37].links.s = {}
          region.rooms[37].links.s.to = 2439
          region.rooms[37].links.s.con = ""
      region.rooms[37].exits = "south"
      region.rooms[37].desc = "    一间简陋的私塾，四壁皆空，屋子中摆满了学生从自己家里抬来的方桌、长凳。一张书案放在屋子的一头，案上摆着几本翻开了的〖三字经〗、〖百家姓〗和一把戒尺。至圣先师孔老夫子的石刻拓片侧身像贴在书案的後面。"
    region.rooms[38] = {}
      region.rooms[38].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne"
      region.rooms[38].name = "打柴沟"
      region.rooms[38].zone = "河套地区"
      region.rooms[38].id = 2443
      region.rooms[38].links = {}
        region.rooms[38].links.n = {}
          region.rooms[38].links.n.to = 2444
          region.rooms[38].links.n.con = ""
        region.rooms[38].links.sw = {}
          region.rooms[38].links.sw.to = 2439
          region.rooms[38].links.sw.con = ""
      region.rooms[38].exits = "north|southwest"
      region.rooms[38].desc = "    打柴沟地势不如乌鞘岭那样险要，比较平坦，官道两边全是密林，时常有樵夫砍柴的声音从林中传出。"
    region.rooms[39] = {}
      region.rooms[39].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n"
      region.rooms[39].name = "乌鞘岭"
      region.rooms[39].zone = "河套地区"
      region.rooms[39].id = 2444
      region.rooms[39].links = {}
        region.rooms[39].links.s = {}
          region.rooms[39].links.s.to = 2443
          region.rooms[39].links.s.con = ""
        region.rooms[39].links.nw = {}
          region.rooms[39].links.nw.to = 2445
          region.rooms[39].links.nw.con = ""
      region.rooms[39].exits = "south|northwest"
      region.rooms[39].desc = "    乌鞘岭是武威东南的一个险要地段，黑石山上密林重重，时常有野兽出没。一条官道从山下蜿蜒而过。"
    region.rooms[40] = {}
      region.rooms[40].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n;nw"
      region.rooms[40].name = "武威"
      region.rooms[40].zone = "河套地区"
      region.rooms[40].id = 2445
      region.rooms[40].links = {}
        region.rooms[40].links.n = {}
          region.rooms[40].links.n.to = 2446
          region.rooms[40].links.n.con = ""
        region.rooms[40].links.se = {}
          region.rooms[40].links.se.to = 2444
          region.rooms[40].links.se.con = ""
      region.rooms[40].exits = "north|southeast"
      region.rooms[40].desc = "    武威是西夏国的西南重镇，驻有重兵，城楼高达三丈，门口有两排官兵正在认真的盘查过往行人，城门口的告示上画着最近通缉的江洋大盗的图形，城里头看上去还挺热闹。东南就是去永登的方向了，西南面就是祁连山脉。"
    region.rooms[41] = {}
      region.rooms[41].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n;nw;n"
      region.rooms[41].name = "土门子"
      region.rooms[41].zone = "河套地区"
      region.rooms[41].id = 2446
      region.rooms[41].links = {}
        region.rooms[41].links.s = {}
          region.rooms[41].links.s.to = 2445
          region.rooms[41].links.s.con = ""
        region.rooms[41].links.ne = {}
          region.rooms[41].links.ne.to = 2447
          region.rooms[41].links.ne.con = ""
      region.rooms[41].exits = "south|northeast"
      region.rooms[41].desc = "    土门子也是以前驻军的地方，周围全是沙漠，中间一块小小的绿洲，本来这里有当地的牧民居住，可是前不就来了一伙马贼占据了这里以这里为大本营四出劫掠，无恶不做。"
    region.rooms[42] = {}
      region.rooms[42].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n;nw;n;ne"
      region.rooms[42].name = "石峡子"
      region.rooms[42].zone = "河套地区"
      region.rooms[42].id = 2447
      region.rooms[42].links = {}
        region.rooms[42].links.ne = {}
          region.rooms[42].links.ne.to = 2448
          region.rooms[42].links.ne.con = ""
        region.rooms[42].links.sw = {}
          region.rooms[42].links.sw.to = 2446
          region.rooms[42].links.sw.con = ""
      region.rooms[42].exits = "northeast|southwest"
      region.rooms[42].desc = "    石峡子是以前的黄河故道，现在遍地是大大小小的鹅卵石，两边是数丈高的高坡，千沟万壑，向你诉说着世事的沧桑。要是运气好的话你可以在这里拣到非常漂亮、非常珍贵的雨花石。"
    region.rooms[43] = {}
      region.rooms[43].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n;nw;n;ne;ne"
      region.rooms[43].name = "冰草湾"
      region.rooms[43].zone = "河套地区"
      region.rooms[43].id = 2448
      region.rooms[43].links = {}
        region.rooms[43].links.ne = {}
          region.rooms[43].links.ne.to = 2449
          region.rooms[43].links.ne.con = ""
        region.rooms[43].links.sw = {}
          region.rooms[43].links.sw.to = 2447
          region.rooms[43].links.sw.con = ""
      region.rooms[43].exits = "northeast|southwest"
      region.rooms[43].desc = "    冰草湾在营盘水的西南，平时人迹少至，因为当地沙漠里长着一种神奇的药草----\"冰草\"而得名。据说这种药草能解百毒，所以偶有人来采这种草，不过沙漠里常有毒虫出没，极为危险。"
    region.rooms[44] = {}
      region.rooms[44].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n;nw;n;ne;ne;ne"
      region.rooms[44].name = "营盘水"
      region.rooms[44].zone = "河套地区"
      region.rooms[44].id = 2449
      region.rooms[44].links = {}
        region.rooms[44].links.ne = {}
          region.rooms[44].links.ne.to = 2450
          region.rooms[44].links.ne.con = ""
        region.rooms[44].links.sw = {}
          region.rooms[44].links.sw.to = 2448
          region.rooms[44].links.sw.con = ""
      region.rooms[44].exits = "northeast|southwest"
      region.rooms[44].desc = "    这里是当年蒙恬修长城时驻军的地方，蒙恬治军有方，当年他亲自带人在驻地挖了好几口甜水井，使士卒们不用喝又苦又涩的咸水，后来此地的百姓们叫这里为营盘水，称这里的井为“蒙恬井”。"
    region.rooms[45] = {}
      region.rooms[45].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n;nw;n;ne;ne;ne;ne"
      region.rooms[45].name = "古长城"
      region.rooms[45].zone = "河套地区"
      region.rooms[45].id = 2450
      region.rooms[45].links = {}
        region.rooms[45].links.se = {}
          region.rooms[45].links.se.to = 2451
          region.rooms[45].links.se.con = ""
        region.rooms[45].links.sw = {}
          region.rooms[45].links.sw.to = 2449
          region.rooms[45].links.sw.con = ""
      region.rooms[45].exits = "southeast|southwest"
      region.rooms[45].desc = "    这里是一段古长城。相传是当年秦始皇派他的心腹爱将蒙恬率三十万大军所修。世事变迁、沧海桑田，如今这里已是一片废墟，唯一依稀可见的是夯土制成的烽火台象个小土包一样矗立在那里。黄河从西向东流去，河上有一叶小舟摆渡乘客，你可以叫(yell)一下船家。"
    region.rooms[46] = {}
      region.rooms[46].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n;nw;n;ne;ne;ne;ne;se"
      region.rooms[46].name = "石门"
      region.rooms[46].zone = "河套地区"
      region.rooms[46].id = 2451
      region.rooms[46].links = {}
        region.rooms[46].links.nw = {}
          region.rooms[46].links.nw.to = 2450
          region.rooms[46].links.nw.con = ""
        region.rooms[46].links.s = {}
          region.rooms[46].links.s.to = 2452
          region.rooms[46].links.s.con = ""
        region.rooms[46].links.n = {}
          region.rooms[46].links.n.to = 2455
          region.rooms[46].links.n.con = ""
      region.rooms[46].exits = "south|north|northwest"
      region.rooms[46].desc = "    这里是石门，是西夏的采石场，当地没有别的物产，只有遍地的白玉石，西夏王宫里的玉石地板就是用这里出产的白玉石铺成的。时常有大批的苦力被官府征到这儿来，没日没夜的开采白玉石矿，许多人倒下后就没有再站起来。北面有一座寺庙。"
    region.rooms[47] = {}
      region.rooms[47].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n;nw;n;ne;ne;ne;ne;se;s"
      region.rooms[47].name = "红山峡"
      region.rooms[47].zone = "河套地区"
      region.rooms[47].id = 2452
      region.rooms[47].links = {}
        region.rooms[47].links.s = {}
          region.rooms[47].links.s.to = 2453
          region.rooms[47].links.s.con = ""
        region.rooms[47].links.n = {}
          region.rooms[47].links.n.to = 2451
          region.rooms[47].links.n.con = ""
      region.rooms[47].exits = "south|north"
      region.rooms[47].desc = "    红山峡是个非常险峻的峡谷，两边是数十丈的黄土坡，很是陡峭，中间只有一条可以通行一人一马的窄道，俗称“一线天”。附近没有什么生物，却有商旅常在这里失踪。"
    region.rooms[48] = {}
      region.rooms[48].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n;nw;n;ne;ne;ne;ne;se;s;s"
      region.rooms[48].name = "靖远"
      region.rooms[48].zone = "河套地区"
      region.rooms[48].id = 2453
      region.rooms[48].links = {}
        region.rooms[48].links.s = {}
          region.rooms[48].links.s.to = 2454
          region.rooms[48].links.s.con = ""
        region.rooms[48].links.n = {}
          region.rooms[48].links.n.to = 2452
          region.rooms[48].links.n.con = ""
      region.rooms[48].exits = "south|north"
      region.rooms[48].desc = "    靖远是个不大不小的城镇，黄沙在离城四十里的地方被一排排的钻天白杨树给挡住了。因此这里有了一块较大的绿洲，聚集了不少从别处来的移民。这些白杨据说是当年唐朝李靖赶走了突厥后在这里屯兵时所种。这也是靖远得名的由来。西边不远就是黄河，南面是一大片沙漠。"
    region.rooms[49] = {}
      region.rooms[49].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n;nw;n;ne;ne;ne;ne;se;s;s;s"
      region.rooms[49].name = "沙漠"
      region.rooms[49].zone = "河套地区"
      region.rooms[49].id = 2454
      region.rooms[49].links = {}
        region.rooms[49].links.n = {}
          region.rooms[49].links.n.to = 2453
          region.rooms[49].links.n.con = ""
      region.rooms[49].exits = "south|east|north|west"
      region.rooms[49].desc = "    这是一片没边际的沙漠，到处是近百米高的巨大沙丘。你一走进来就仿佛迷了路。"
    region.rooms[50] = {}
      region.rooms[50].path = "fly wm;e;n;w;w;w;n;n;e;ne;n;n;n;w;sw;sw;w;w;n;ne;n;nw;n;ne;ne;ne;ne;se;n"
      region.rooms[50].name = "五佛寺"
      region.rooms[50].zone = "河套地区"
      region.rooms[50].id = 2455
      region.rooms[50].links = {}
        region.rooms[50].links.s = {}
          region.rooms[50].links.s.to = 2451
          region.rooms[50].links.s.con = ""
      region.rooms[50].exits = "south"
      region.rooms[50].desc = "    这里是一个被废弃的破庙，周围全是沙丘，破庙的寺门已经倒塌，地上有块半埋在沙里的匾，从剥落的金字上你依稀可以辨别出“五佛寺”三个字，唯一尚算完整的建筑是大殿，但屋顶上全是窟窿，强劲的西北风吹过发出难听的“呜---呜---”声。大殿中供奉着五尊佛祖，仔细看去却都模糊不清了，只有中央佛祖坐像（xiang）有些清晰，依稀是西方弥勒尊王佛，看上去好像经常被人搬动。"
  region.center = 2407
return region