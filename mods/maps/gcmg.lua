local region = {}
  region.cmd = "fly xx;su;s;ed;se;e;pushaside grass;n"
  region.name = "高昌迷宫"
  region.id = "gcmg"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly xx;su;s;ed;se;e;pushaside grass;n"
      region.rooms[1].name = "阴深小路"
      region.rooms[1].zone = "高昌迷宫"
      region.rooms[1].id = 2321
      region.rooms[1].links = {}
        region.rooms[1].links.n = {}
          region.rooms[1].links.n.to = 2322
          region.rooms[1].links.n.con = ""
      region.rooms[1].exits = "south|north"
      region.rooms[1].desc = "    注意：由此处向北！将进入高昌迷宫地域，不知走法和没有作好准备的游客千万要考虑清楚是否还要向北行。                    高   昌   迷   宫"
    region.rooms[2] = {}
      region.rooms[2].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n"
      region.rooms[2].name = "高昌迷宫"
      region.rooms[2].zone = "高昌迷宫"
      region.rooms[2].id = 2322
	  region.rooms[2].danger = 3
      region.rooms[2].links = {}
        region.rooms[2].links.s = {}
          region.rooms[2].links.s.to = 2321
          region.rooms[2].links.s.con = ""
        region.rooms[2].links.e = {}
          region.rooms[2].links.e.to = 2323
          region.rooms[2].links.e.con = ""
      region.rooms[2].exits = "south|north|east|west"
      region.rooms[2].desc = "    这是条黑沈沈的长甬道,甬道前出现了三条岔道。迷宫之内并无足迹指引，你不知道要往哪条路走。俯身细看，见左首，右首和前方三条路上都有淡淡的足迹。"
    region.rooms[3] = {}
      region.rooms[3].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e"
      region.rooms[3].name = "高昌迷宫"
      region.rooms[3].zone = "高昌迷宫"
      region.rooms[3].id = 2323
      region.rooms[3].links = {}
        region.rooms[3].links.e = {}
          region.rooms[3].links.e.to = 2324
          region.rooms[3].links.e.con = ""
      region.rooms[3].exits = "south|north|east|west"
      region.rooms[3].desc = "    这是条黑沈沈的长甬道,甬道前出现了三条岔道。迷宫之内并无足迹指引，你不知道要往哪条路走。俯身细看，见左首，右首和前方三条路上都有淡淡的足迹。你似乎迷失了方向，象没头苍蝇般到处乱闯。"
    region.rooms[4] = {}
      region.rooms[4].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e"
      region.rooms[4].name = "高昌迷宫"
      region.rooms[4].zone = "高昌迷宫"
      region.rooms[4].id = 2324
      region.rooms[4].links = {}
        region.rooms[4].links.s = {}
          region.rooms[4].links.s.to = 2325
          region.rooms[4].links.s.con = ""
      region.rooms[4].exits = "south|north|east|west"
      region.rooms[4].desc = "    这是条黑沈沈的长甬道,甬道前出现了三条岔道。迷宫之内并无足迹指引，你不知道要往哪条路走。俯身细看，见左首，右首和前方三条路上都有淡淡的足迹。你似乎迷失了方向，象没头苍蝇般到处乱闯。"
    region.rooms[5] = {}
      region.rooms[5].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s"
      region.rooms[5].name = "高昌迷宫"
      region.rooms[5].zone = "高昌迷宫"
      region.rooms[5].id = 2325
      region.rooms[5].links = {}
        region.rooms[5].links.w = {}
          region.rooms[5].links.w.to = 2326
          region.rooms[5].links.w.con = ""
      region.rooms[5].exits = "south|north|east|west"
      region.rooms[5].desc = "    这是条黑沈沈的长甬道,甬道前出现了三条岔道。迷宫之内并无足迹指引，你不知道要往哪条路走。俯身细看，见左首，右首和前方三条路上都有淡淡的足迹。你似乎迷失了方向，象没头苍蝇般到处乱闯。"
    region.rooms[6] = {}
      region.rooms[6].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w"
      region.rooms[6].name = "高昌迷宫"
      region.rooms[6].zone = "高昌迷宫"
      region.rooms[6].id = 2326
      region.rooms[6].links = {}
        region.rooms[6].links.n = {}
          region.rooms[6].links.n.to = 2327
          region.rooms[6].links.n.con = ""
      region.rooms[6].exits = "south|north|east|west"
      region.rooms[6].desc = "    这是条黑沈沈的长甬道,甬道前出现了三条岔道。迷宫之内并无足迹指引，你不知道要往哪条路走。俯身细看，见左首，右首和前方三条路上都有淡淡的足迹。你似乎迷失了方向，象没头苍蝇般到处乱闯。"
    region.rooms[7] = {}
      region.rooms[7].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n"
      region.rooms[7].name = "高昌迷宫"
      region.rooms[7].zone = "高昌迷宫"
      region.rooms[7].id = 2327
      region.rooms[7].links = {}
        region.rooms[7].links.n = {}
          region.rooms[7].links.n.to = 2328
          region.rooms[7].links.n.con = ""
      region.rooms[7].exits = "south|north|east|west"
      region.rooms[7].desc = "    这是条黑沈沈的长甬道,甬道前出现了三条岔道。迷宫之内并无足迹指引，你不知道要往哪条路走。俯身细看，见左首，右首和前方三条路上都有淡淡的足迹。你似乎迷失了方向，象没头苍蝇般到处乱闯。"
    region.rooms[8] = {}
      region.rooms[8].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n"
      region.rooms[8].name = "高昌迷宫"
      region.rooms[8].zone = "高昌迷宫"
      region.rooms[8].id = 2328
      region.rooms[8].links = {}
        region.rooms[8].links.e = {}
          region.rooms[8].links.e.to = 2329
          region.rooms[8].links.e.con = ""
      region.rooms[8].exits = "south|north|east|west"
      region.rooms[8].desc = "    这是条黑沈沈的长甬道,甬道前出现了三条岔道。迷宫之内并无足迹指引，你不知道要往哪条路走。俯身细看，见左首，右首和前方三条路上都有淡淡的足迹。你似乎迷失了方向，象没头苍蝇般到处乱闯。"
    region.rooms[9] = {}
      region.rooms[9].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e"
      region.rooms[9].name = "高昌迷宫"
      region.rooms[9].zone = "高昌迷宫"
      region.rooms[9].id = 2329
	  region.rooms[9].danger = 3
      region.rooms[9].links = {}
        region.rooms[9].links.e = {}
          region.rooms[9].links.e.to = 2330
          region.rooms[9].links.e.con = ""
      region.rooms[9].exits = "south|north|east|west"
      region.rooms[9].desc = "    这是条黑沈沈的长甬道,甬道前出现了三条岔道。迷宫之内并无足迹指引，你不知道要往哪条路走。俯身细看，见左首，右首和前方三条路上都有淡淡的足迹。你似乎迷失了方向，象没头苍蝇般到处乱闯。"
    region.rooms[10] = {}
      region.rooms[10].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e"
      region.rooms[10].name = "高昌迷宫"
      region.rooms[10].zone = "高昌迷宫"
      region.rooms[10].id = 2330
      region.rooms[10].links = {}
        region.rooms[10].links.s = {}
          region.rooms[10].links.s.to = 2331
          region.rooms[10].links.s.con = ""
      region.rooms[10].exits = "south|north|east|west"
      region.rooms[10].desc = "    这是条黑沈沈的长甬道,甬道前出现了三条岔道。迷宫之内并无足迹指引，你不知道要往哪条路走。俯身细看，见左首，右首和前方三条路上都有淡淡的足迹。你似乎迷失了方向，象没头苍蝇般到处乱闯。"
    region.rooms[11] = {}
      region.rooms[11].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s"
      region.rooms[11].name = "空地"
      region.rooms[11].zone = "高昌迷宫"
      region.rooms[11].id = 2331
      region.rooms[11].links = {}
        region.rooms[11].links.e = {}
          region.rooms[11].links.e.to = 2332
          region.rooms[11].links.e.con = ""
        region.rooms[11].links.n = {}
          region.rooms[11].links.n.to = 2330
          region.rooms[11].links.n.con = ""
      region.rooms[11].exits = "east|north"
      region.rooms[11].desc = "    突然之间，眼前豁然开朗，出现一大片空地，尽头处又有两扇铁门，嵌在大山岩中。"
    region.rooms[12] = {}
      region.rooms[12].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e"
      region.rooms[12].name = "石阶"
      region.rooms[12].zone = "高昌迷宫"
      region.rooms[12].id = 2332
      region.rooms[12].links = {}
        region.rooms[12].links.w = {}
          region.rooms[12].links.w.to = 2331
          region.rooms[12].links.w.con = ""
        region.rooms[12].links.nu = {}
          region.rooms[12].links.nu.to = 2333
          region.rooms[12].links.nu.con = ""
      region.rooms[12].exits = "northup|west"
      region.rooms[12].desc = "    眼前遽然出现一大片松林。松林长得极密，石阶上铺满了厚厚的朽黄的松针。踩在脚下，发出察察的响声。一只小松鼠吱地在眼前闪过，消失在林海里。"
    region.rooms[13] = {}
      region.rooms[13].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu"
      region.rooms[13].name = "石阶"
      region.rooms[13].zone = "高昌迷宫"
      region.rooms[13].id = 2333
      region.rooms[13].links = {}
        region.rooms[13].links.sd = {}
          region.rooms[13].links.sd.to = 2332
          region.rooms[13].links.sd.con = ""
        region.rooms[13].links.nu = {}
          region.rooms[13].links.nu.to = 2334
          region.rooms[13].links.nu.con = ""
      region.rooms[13].exits = "northup|southdown"
      region.rooms[13].desc = "    眼前遽然出现一大片松林。松林长得极密，石阶上铺满了厚厚的朽黄的松针。踩在脚下，发出察察的响声。一只小松鼠吱地在眼前闪过，消失在林海里。"
    region.rooms[14] = {}
      region.rooms[14].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu"
      region.rooms[14].name = "石阶"
      region.rooms[14].zone = "高昌迷宫"
      region.rooms[14].id = 2334
      region.rooms[14].links = {}
        region.rooms[14].links.nu = {}
          region.rooms[14].links.nu.to = 2335
          region.rooms[14].links.nu.con = ""
        region.rooms[14].links.sd = {}
          region.rooms[14].links.sd.to = 2333
          region.rooms[14].links.sd.con = ""
      region.rooms[14].exits = "northup|southdown"
      region.rooms[14].desc = "    眼前遽然出现一大片松林。松林长得极密，石阶上铺满了厚厚的朽黄的松针。踩在脚下，发出察察的响声。一只小松鼠吱地在眼前闪过，消失在林海里。"
    region.rooms[15] = {}
      region.rooms[15].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu"
      region.rooms[15].name = "高昌大门"
      region.rooms[15].zone = "高昌迷宫"
      region.rooms[15].id = 2335
      region.rooms[15].desc = "    转过了一排树木，只见一座石山上嵌著两扇铁铸的大门,大门看样子重逾千钧，据说是古代高昌国王为了抵御强敌而设计的。门上铁锈斑驳，显是历时已久的旧物。但是门上的门环(huan)似乎可以扭(niu).门上写着：               ****************               *              *               *  高 昌 大 殿 *               *              *               ****************"
      region.rooms[15].exits = "southdown"
      region.rooms[15].links = {}
        region.rooms[15].links.sd = {}
          region.rooms[15].links.sd.to = 2334
          region.rooms[15].links.sd.con = ""
        region.rooms[15].links["#2 (niu huan left);#5 (niu huan right);d"] = {}
          region.rooms[15].links["#2 (niu huan left);#5 (niu huan right);d"].to = 2336
          region.rooms[15].links["#2 (niu huan left);#5 (niu huan right);d"].con = ""
    region.rooms[16] = {}
      region.rooms[16].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d"
      region.rooms[16].name = "高昌大殿"
      region.rooms[16].zone = "高昌迷宫"
      region.rooms[16].id = 2336
      region.rooms[16].desc = "    这里就是传说中埋藏着无数宝藏高昌迷宫的大殿，四壁供的都是泥塑木雕的佛像.大殿之上有一个大大的龙椅，大堂之上透着一股威严，有一块大匾，上书：                ****************                *              *                 *   文成武德   *                *              *                ****************东西两面都是殿堂。"
      region.rooms[16].exits = "up|east|west"
      region.rooms[16].links = {}
        region.rooms[16].links.e = {}
          region.rooms[16].links.e.to = 2337
          region.rooms[16].links.e.con = ""
        region.rooms[16].links["climb up"] = {}
          region.rooms[16].links["climb up"].to = 2335
          region.rooms[16].links["climb up"].con = ""
        region.rooms[16].links.w = {}
          region.rooms[16].links.w.to = 2347
          region.rooms[16].links.w.con = ""
    region.rooms[17] = {}
      region.rooms[17].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d;e"
      region.rooms[17].name = "东大殿"
      region.rooms[17].zone = "高昌迷宫"
      region.rooms[17].id = 2337
      region.rooms[17].desc = "    每一间房中大都供有佛像。偶然在壁上见到几个汉文，写的是「高昌国国王」，「文泰」，「大唐贞观十三年」等等字样。有一座殿堂中供的都是汉人塑像，匾上写的是「大成至圣先师孔子位」，左右各有数十人，写著「颜回」、「子路」、「子贡」、「子夏」、「子张」等名字。"
      region.rooms[17].exits = "north|west"
      region.rooms[17].links = {}
        region.rooms[17].links.w = {}
          region.rooms[17].links.w.to = 2336
          region.rooms[17].links.w.con = ""
        region.rooms[17].links.n = {}
          region.rooms[17].links.n.to = 2338
          region.rooms[17].links.n.con = ""
    region.rooms[18] = {}
      region.rooms[18].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d;e;n"
      region.rooms[18].name = "东大殿"
      region.rooms[18].zone = "高昌迷宫"
      region.rooms[18].id = 2338
      region.rooms[18].desc = "    每一间房中大都供有佛像。偶然在壁上见到几个汉文，写的是「高昌国国王」，「文泰」，「大唐贞观十三年」等等字样。有一座殿堂中供的都是汉人塑像，匾上写的是「大成至圣先师孔子位」，左右各有数十人，写著「颜回」、「子路」、「子贡」、「子夏」、「子张」等名字。"
      region.rooms[18].exits = "south|north"
      region.rooms[18].links = {}
        region.rooms[18].links.s = {}
          region.rooms[18].links.s.to = 2337
          region.rooms[18].links.s.con = ""
        region.rooms[18].links.n = {}
          region.rooms[18].links.n.to = 2339
          region.rooms[18].links.n.con = ""
    region.rooms[19] = {}
      region.rooms[19].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d;e;n;n"
      region.rooms[19].name = "东大殿"
      region.rooms[19].zone = "高昌迷宫"
      region.rooms[19].id = 2339
      region.rooms[19].desc = "    每一间房中大都供有佛像。偶然在壁上见到几个汉文，写的是「高昌国国王」，「文泰」，「大唐贞观十三年」等等字样。有一座殿堂中供的都是汉人塑像，匾上写的是「大成至圣先师孔子位」，左右各有数十人，写著「颜回」、「子路」、「子贡」、「子夏」、「子张」等名字。"
      region.rooms[19].exits = "south|northeast"
      region.rooms[19].links = {}
        region.rooms[19].links.s = {}
          region.rooms[19].links.s.to = 2338
          region.rooms[19].links.s.con = ""
        region.rooms[19].links.ne = {}
          region.rooms[19].links.ne.to = 2340
          region.rooms[19].links.ne.con = ""
    region.rooms[20] = {}
      region.rooms[20].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d;e;n;n;ne"
      region.rooms[20].name = "东走廊"
      region.rooms[20].zone = "高昌迷宫"
      region.rooms[20].id = 2340
      region.rooms[20].desc = "    这里是后殿走廊。房顶一侧支在南面的高墙上，另一侧则与北边般若堂的屋顶相连。彩梁画栋，连顶棚也用彩漆绘满了各种飞天的图形，每幅画似乎都在诉说一个娓娓动人的佛经故事。南边墙上题着一个字(writing)。"
      region.rooms[20].exits = "northwest|southwest"
      region.rooms[20].links = {}
        region.rooms[20].links.nw = {}
          region.rooms[20].links.nw.to = 2341
          region.rooms[20].links.nw.con = ""
        region.rooms[20].links.sw = {}
          region.rooms[20].links.sw.to = 2339
          region.rooms[20].links.sw.con = ""
    region.rooms[21] = {}
      region.rooms[21].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d;e;n;n;ne;nw"
      region.rooms[21].name = "北走廊"
      region.rooms[21].zone = "高昌迷宫"
      region.rooms[21].id = 2341
      region.rooms[21].desc = "    这里是殿堂走廊。房顶一侧支在南面的高墙上，另一侧则与北边殿堂的屋顶相连。彩梁画栋，连顶棚也用彩漆绘满了各种飞天的图形，每幅画似乎都在诉说一个娓娓动人的故事。"
      region.rooms[21].exits = "north|southeast|southwest"
      region.rooms[21].links = {}
        region.rooms[21].links.sw = {}
          region.rooms[21].links.sw.to = 2344
          region.rooms[21].links.sw.con = ""
        region.rooms[21].links.se = {}
          region.rooms[21].links.se.to = 2340
          region.rooms[21].links.se.con = ""
        region.rooms[21].links.n = {}
          region.rooms[21].links.n.to = 2342
          region.rooms[21].links.n.con = "gcdt:"
    region.rooms[22] = {}
      region.rooms[22].path = "|!c:ditu:hi|;fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d;e;n;n;ne;nw;|!gcdt::n|"
      region.rooms[22].name = "高昌后殿"
      region.rooms[22].zone = "高昌迷宫"
      region.rooms[22].id = 2342
      region.rooms[22].desc = "    大厅里有几具白骨骷髅 只见大半宫室已然毁圯，殿堂中堆满了黄沙;往北边似乎还有路，在阴暗处站有一人正好挡住了去路。"
      region.rooms[22].exits = "south|north"
      region.rooms[22].links = {}
        region.rooms[22].links.s = {}
          region.rooms[22].links.s.to = 2341
          region.rooms[22].links.s.con = ""
        region.rooms[22].links.n = {}
          region.rooms[22].links.n.to = 2343
          region.rooms[22].links.n.con = ""
    region.rooms[23] = {}
      region.rooms[23].path = "|!c:ditu:hi|;fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d;e;n;n;ne;nw;|!gcdt::n|;n"
      region.rooms[23].name = "地下室"
      region.rooms[23].zone = "高昌迷宫"
      region.rooms[23].id = 2343
      region.rooms[23].desc = "    这里是宫殿底下的地下密室。密室虽小，却也五脏俱全，石桌石椅，石几石床，连室内放的几件器皿，也都是石制的。看来似乎很久以前有人在这里住过。正中的石桌(table)上平放着一块薄薄的石板，上面好象刻着些什么。"
      region.rooms[23].exits = "south"
      region.rooms[23].links = {}
        region.rooms[23].links.s = {}
          region.rooms[23].links.s.to = 2342
          region.rooms[23].links.s.con = ""
    region.rooms[24] = {}
      region.rooms[24].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d;w;n;n;nw"
      region.rooms[24].name = "西走廊"
      region.rooms[24].zone = "高昌迷宫"
      region.rooms[24].id = 2344
      region.rooms[24].desc = "    这里是殿堂走廊。房顶一侧支在南面的高墙上，另一侧则与北边殿堂的屋顶相连。彩梁画栋，连顶棚也用彩漆绘满了各种飞天的图形，每幅画似乎都在诉说一个娓娓动人的佛经故事。南边墙上题着一个字(writing)。"
      region.rooms[24].exits = "southeast|northeast"
      region.rooms[24].links = {}
        region.rooms[24].links.ne = {}
          region.rooms[24].links.ne.to = 2341
          region.rooms[24].links.ne.con = ""
        region.rooms[24].links.se = {}
          region.rooms[24].links.se.to = 2345
          region.rooms[24].links.se.con = ""
    region.rooms[25] = {}
      region.rooms[25].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d;w;n;n"
      region.rooms[25].name = "西大殿"
      region.rooms[25].zone = "高昌迷宫"
      region.rooms[25].id = 2345
      region.rooms[25].desc = "    每一间房中大都供有佛像。偶然在壁上见到几个汉文，写的是「高昌国国王」，「文泰」，「大唐贞观十三年」等等字样。有一座殿堂中供的都是汉人塑像，匾上写的是「大成至圣先师孔子位」，左右各有数十人，写著「颜回」、「子路」、「子贡」、「子夏」、「子张」等名字。"
      region.rooms[25].exits = "south|northwest"
      region.rooms[25].links = {}
        region.rooms[25].links.nw = {}
          region.rooms[25].links.nw.to = 2344
          region.rooms[25].links.nw.con = ""
        region.rooms[25].links.s = {}
          region.rooms[25].links.s.to = 2346
    region.rooms[26] = {}
      region.rooms[26].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d;w;n"
      region.rooms[26].name = "西大殿"
      region.rooms[26].zone = "高昌迷宫"
      region.rooms[26].id = 2346
      region.rooms[26].desc = "    每一间房中大都供有佛像。偶然在壁上见到几个汉文，写的是「高昌国国王」，「文泰」，「大唐贞观十三年」等等字样。有一座殿堂中供的都是汉人塑像，匾上写的是「大成至圣先师孔子位」，左右各有数十人，写著「颜回」、「子路」、「子贡」、「子夏」、「子张」等名字。"
      region.rooms[26].exits = "south|north"
      region.rooms[26].links = {}
        region.rooms[26].links.s = {}
          region.rooms[26].links.s.to = 2347
          region.rooms[26].links.s.con = ""
        region.rooms[26].links.n = {}
          region.rooms[26].links.n.to = 2345
          region.rooms[26].links.n.con = ""
    region.rooms[27] = {}
      region.rooms[27].path = "fly xx;su;s;ed;se;e;pushaside grass;n;n;e;e;s;w;n;n;e;e;s;e;nu;nu;nu;|!aw:1:hi:|;#2 (niu huan left);#5 (niu huan right);d;w"
      region.rooms[27].name = "西大殿"
      region.rooms[27].zone = "高昌迷宫"
      region.rooms[27].id = 2347
      region.rooms[27].desc = "    每一间房中大都供有佛像。偶然在壁上见到几个汉文，写的是「高昌国国王」，「文泰」，「大唐贞观十三年」等等字样。有一座殿堂中供的都是汉人塑像，匾上写的是「大成至圣先师孔子位」，左右各有数十人，写著「颜回」、「子路」、「子贡」、「子夏」、「子张」等名字。"
      region.rooms[27].exits = "north|east"
      region.rooms[27].links = {}
        region.rooms[27].links.e = {}
          region.rooms[27].links.e.to = 2336
          region.rooms[27].links.e.con = ""
        region.rooms[27].links.n = {}
          region.rooms[27].links.n.to = 2346
          region.rooms[27].links.n.con = ""
  region.center = 2321
return region