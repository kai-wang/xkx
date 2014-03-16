local region = {}
  region.cmd = "fly hmy"
  region.name = "黑木崖"
  region.id = "hmy"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly hmy"
      region.rooms[1].name = "日月坪"
      region.rooms[1].zone = "黑木崖"
      region.rooms[1].id = 2942
      region.rooms[1].desc = "    这里是半山的一片小土坪，离崖顶还有一段路途，可到这已经没有路上去，面前是如境般的峭壁，仰头而望，但见崖顶依稀耸立着楼阁，宛如仙境。可云烟缭绕，看不清晰。从悬崖上垂下一条绳索(rope)，看上去象是悬崖上下互通消息的工具，绳索的上面似乎隐约有一个吊篮(basket)。悬崖的墙上似乎有一个匣子(xiazi) ，你似乎走入一个雾宅，真不知如何是好。"
      region.rooms[1].exits = "eastdown"
      region.rooms[1].links = {}
        region.rooms[1].links.ed = {}
          region.rooms[1].links.ed.to = 2943
          region.rooms[1].links.ed.con = ""
        region.rooms[1].links.hi = {}
          region.rooms[1].links.hi.to = 2949
          region.rooms[1].links.hi.con = "aw:3:give ling to zhang"
    region.rooms[2] = {}
      region.rooms[2].path = "fly hmy;ed"
      region.rooms[2].name = "石门"
      region.rooms[2].zone = "黑木崖"
      region.rooms[2].id = 2943
      region.rooms[2].desc = "    得到一道大石门前，只见两旁刻着两行大字，右首是“文成武德”，左首是“仁义英明”，横额上刻着“日月光明”四个大红字。"
      region.rooms[2].exits = "westup|eastdown"
      region.rooms[2].links = {}
        region.rooms[2].links.ed = {}
          region.rooms[2].links.ed.to = 2944
          region.rooms[2].links.ed.con = ""
        region.rooms[2].links.wu = {}
          region.rooms[2].links.wu.to = 2942
          region.rooms[2].links.wu.con = ""
    region.rooms[3] = {}
      region.rooms[3].path = "fly hmy;ed;ed"
      region.rooms[3].name = "石阶"
      region.rooms[3].zone = "黑木崖"
      region.rooms[3].id = 2944
      region.rooms[3].desc = "    越往上，山势越陡峭，中间的石阶越窄，仅能一人行走，从这里往上望，隐约望见一座石门。"
      region.rooms[3].exits = "westup|eastdown"
      region.rooms[3].links = {}
        region.rooms[3].links.ed = {}
          region.rooms[3].links.ed.to = 2945
          region.rooms[3].links.ed.con = ""
        region.rooms[3].links.wu = {}
          region.rooms[3].links.wu.to = 2943
          region.rooms[3].links.wu.con = ""
    region.rooms[4] = {}
      region.rooms[4].path = "fly hmy;ed;ed;ed"
      region.rooms[4].name = "石阶"
      region.rooms[4].zone = "黑木崖"
      region.rooms[4].id = 2945
      region.rooms[4].desc = "    山路突然陡峭，两旁山峰笔立，中间留出一条窄窄的石阶，仅能两人并肩而行。"
      region.rooms[4].exits = "westup|eastdown"
      region.rooms[4].links = {}
        region.rooms[4].links.ed = {}
          region.rooms[4].links.ed.to = 2946
          region.rooms[4].links.ed.con = ""
        region.rooms[4].links.wu = {}
          region.rooms[4].links.wu.to = 2944
          region.rooms[4].links.wu.con = ""
    region.rooms[5] = {}
      region.rooms[5].path = "fly hmy;ed;ed;ed;ed"
      region.rooms[5].name = "山道"
      region.rooms[5].zone = "黑木崖"
      region.rooms[5].id = 2946
      region.rooms[5].desc = "    这一路上山，地势极险，脚下是万丈深谷，而山道极之陡峭窄小，倘若一不留神，必将命丧于此。"
      region.rooms[5].exits = "westup|eastdown"
      region.rooms[5].links = {}
        region.rooms[5].links.ed = {}
          region.rooms[5].links.ed.to = 2947
          region.rooms[5].links.ed.con = ""
        region.rooms[5].links.wu = {}
          region.rooms[5].links.wu.to = 2945
          region.rooms[5].links.wu.con = ""
    region.rooms[6] = {}
      region.rooms[6].path = "fly hmy;ed;ed;ed;ed;ed"
      region.rooms[6].name = "山道"
      region.rooms[6].zone = "黑木崖"
      region.rooms[6].id = 2947
      region.rooms[6].desc = "    西面是一座高山，地势极之险峻，一条窄小陡峭的山道通往山上，东边山脚是一片长滩。"
      region.rooms[6].exits = "westup|eastdown"
      region.rooms[6].links = {}
        region.rooms[6].links.ed = {}
          region.rooms[6].links.ed.to = 2948
          region.rooms[6].links.ed.con = ""
        region.rooms[6].links.wu = {}
          region.rooms[6].links.wu.to = 2946
          region.rooms[6].links.wu.con = ""
    region.rooms[7] = {}
      region.rooms[7].path = "fly hmy;ed;ed;ed;ed;ed;ed"
      region.rooms[7].name = "长滩"
      region.rooms[7].zone = "黑木崖"
      region.rooms[7].id = 2948
      region.rooms[7].desc = "    这片长滩不时有日月教教众乘船(boat)往来，滩头插着一面日月教的旗帜，表明这里是日月教的所控制的，所以尽管江面上往来的船只很多，但是并没有船敢在这里停留，要过对岸只有靠日月教自己的船只了。"
      region.rooms[7].exits = "westup"
      region.rooms[7].links = {}
        region.rooms[7].links.wu = {}
          region.rooms[7].links.wu.to = 2947
          region.rooms[7].links.wu.con = ""
    region.rooms[8] = {}
      region.rooms[8].path = "fly hmy;|!aw:3:give ling to zhang:hi|"
      region.rooms[8].name = "成德殿"
      region.rooms[8].zone = "黑木崖"
      region.rooms[8].id = 2949
      region.rooms[8].desc = "    这就是日月神教教主平日发号施令的地方，殿中无窗，殿口点着明晃晃的蜡烛，大殿彼端高设一座，坐着一个英俊的中年人，自是名震江湖的东方不败的姘头杨莲亭了！ "
      region.rooms[8].exits = "north|westdown"
      region.rooms[8].links = {}
        region.rooms[8].links["unwield all;n"] = {}
          region.rooms[8].links["unwield all;n"].to = 2950
          region.rooms[8].links["unwield all;n"].con = ""
        region.rooms[8].links.wd = {}
          region.rooms[8].links.wd.to = 2962
          region.rooms[8].links.wd.con = ""
    region.rooms[9] = {}
      region.rooms[9].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n"
      region.rooms[9].name = "成德殿后厅"
      region.rooms[9].zone = "黑木崖"
      region.rooms[9].id = 2950
      region.rooms[9].desc = "    这里是日月神教的后厅。看上去满是灰尘，但中间有一个瓷碗 (wan)，似乎有古怪。"
      region.rooms[9].exits = "south|east|west|down"
      region.rooms[9].links = {}
        region.rooms[9].links.e = {}
          region.rooms[9].links.e.to = 2952
          region.rooms[9].links.e.con = ""
        region.rooms[9].links.d = {}
          region.rooms[9].links.d.to = 2953
          region.rooms[9].links.d.con = ""
        region.rooms[9].links.w = {}
          region.rooms[9].links.w.to = 2951
          region.rooms[9].links.w.con = ""
        region.rooms[9].links.s = {}
          region.rooms[9].links.s.to = 2949
          region.rooms[9].links.s.con = ""
    region.rooms[10] = {}
      region.rooms[10].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n;w"
      region.rooms[10].name = "休息室"
      region.rooms[10].zone = "黑木崖"
      region.rooms[10].id = 2951
      region.rooms[10].desc = "    这里是间休息室，里面有张大床。在这里睡觉非常舒服，没人能打扰。南面是气派的长廊。"
      region.rooms[10].exits = "east"
      region.rooms[10].links = {}
        region.rooms[10].links.e = {}
          region.rooms[10].links.e.to = 2950
          region.rooms[10].links.e.con = ""
    region.rooms[11] = {}
      region.rooms[11].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n;e"
      region.rooms[11].name = "内室"
      region.rooms[11].zone = "黑木崖"
      region.rooms[11].id = 2952
      region.rooms[11].desc = "    这是一个精雅的小舍，一进门便可闻到一阵浓冽的花香。房中挂着一幅五女向凤图，图中绘着五个宫装美女，美目盼兮，艳丽脱俗。屋里还有一张茶几，几张椅子，椅子上铺着绣花锦垫，西面有一扇洞形门通向后厅。"
      region.rooms[11].exits = "west"
      region.rooms[11].links = {}
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 2950
          region.rooms[11].links.w.con = ""
    region.rooms[12] = {}
      region.rooms[12].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n;d"
      region.rooms[12].name = "秘道"
      region.rooms[12].zone = "黑木崖"
      region.rooms[12].id = 2953
      region.rooms[12].desc = "    这是一条异常幽静的走廊，四周漆黑一团，你好象什么都看不见似的走在里面，你不觉想到这似乎在每个角落都藏着无限杀机，太恐怖了，四周毫无声息，好象掉下一根针都可能听到。"
      region.rooms[12].exits = "south|east|west"
      region.rooms[12].links = {}
        region.rooms[12].links.e = {}
          region.rooms[12].links.e.to = 2954
          region.rooms[12].links.e.con = ""
        region.rooms[12].links.w = {}
          region.rooms[12].links.w.to = 2953
          region.rooms[12].links.w.con = ""
        region.rooms[12].links.s = {}
          region.rooms[12].links.s.to = 2955
          region.rooms[12].links.s.con = ""
    region.rooms[13] = {}
      region.rooms[13].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n;d;e"
      region.rooms[13].name = "秘道"
      region.rooms[13].zone = "黑木崖"
      region.rooms[13].id = 2954
      region.rooms[13].desc = "    你来到了一条秘道，看样子它不太平常，若隐若显的几盏油灯，昏暗如豆但是看上去前方似有光亮，你要是觉得害怕，现在回头还是可以的，不过这异常的幽静却也极大激发了你的好奇心，大丈夫死又何足道载，真是勇气可佳。"
      region.rooms[13].exits = "south|west"
      region.rooms[13].links = {}
        region.rooms[13].links.w = {}
          region.rooms[13].links.w.to = 2953
          region.rooms[13].links.w.con = ""
        region.rooms[13].links.s = {}
          region.rooms[13].links.s.to = 2955
          region.rooms[13].links.s.con = ""
    region.rooms[14] = {}
      region.rooms[14].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n;d;s"
      region.rooms[14].name = "秘道"
      region.rooms[14].zone = "黑木崖"
      region.rooms[14].id = 2955
      region.rooms[14].desc = "    走在里面，你不觉想到这似乎在每个角落都藏着无限杀机，你感到近了近了，越来越近了。"
      region.rooms[14].exits = "south|north|east|west"
      region.rooms[14].links = {}
        region.rooms[14].links.e = {}
          region.rooms[14].links.e.to = 2956
          region.rooms[14].links.e.con = ""
        region.rooms[14].links.s = {}
          region.rooms[14].links.s.to = 2953
          region.rooms[14].links.s.con = ""
        region.rooms[14].links.w = {}
          region.rooms[14].links.w.to = 2956
          region.rooms[14].links.w.con = ""
        region.rooms[14].links.n = {}
          region.rooms[14].links.n.to = 2954
          region.rooms[14].links.n.con = ""
    region.rooms[15] = {}
      region.rooms[15].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n;d;s;e"
      region.rooms[15].name = "秘道"
      region.rooms[15].zone = "黑木崖"
      region.rooms[15].id = 2956
      region.rooms[15].desc = "    走在里面，你不觉想到这似乎在每个角落都藏着无限杀机，你感到近了近了，越来越近了。"
      region.rooms[15].exits = "south|north|east|west"
      region.rooms[15].links = {}
        region.rooms[15].links.e = {}
          region.rooms[15].links.e.to = 2956
          region.rooms[15].links.e.con = ""
        region.rooms[15].links.s = {}
          region.rooms[15].links.s.to = 2953
          region.rooms[15].links.s.con = ""
        region.rooms[15].links.w = {}
          region.rooms[15].links.w.to = 2956
          region.rooms[15].links.w.con = ""
        region.rooms[15].links.n = {}
          region.rooms[15].links.n.to = 2957
          region.rooms[15].links.n.con = ""
    region.rooms[16] = {}
      region.rooms[16].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n;d;s;e;n"
      region.rooms[16].name = "秘道尽头"
      region.rooms[16].zone = "黑木崖"
      region.rooms[16].id = 2957
      region.rooms[16].desc = "    你忽觉前方有一亮光，真是别有洞天，前方好想别有地方。"
      region.rooms[16].exits = "south|east|southup|west"
      region.rooms[16].links = {}
        region.rooms[16].links.e = {}
          region.rooms[16].links.e.to = 2953
          region.rooms[16].links.e.con = ""
        region.rooms[16].links.s = {}
          region.rooms[16].links.s.to = 2957
          region.rooms[16].links.s.con = ""
        region.rooms[16].links.w = {}
          region.rooms[16].links.w.to = 2956
          region.rooms[16].links.w.con = ""
        region.rooms[16].links.su = {}
          region.rooms[16].links.su.to = 2958
          region.rooms[16].links.su.con = ""
    region.rooms[17] = {}
      region.rooms[17].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n;d;s;e;n;su"
      region.rooms[17].name = "秘道尽头"
      region.rooms[17].zone = "黑木崖"
      region.rooms[17].id = 2958
      region.rooms[17].desc = "    你忽觉前方一亮，身前真是别有洞天，前方好想有作花园。不知是什么地方。"
      region.rooms[17].exits = "north|northdown"
      region.rooms[17].links = {}
        region.rooms[17].links.nd = {}
          region.rooms[17].links.nd.to = 2957
          region.rooms[17].links.nd.con = ""
        region.rooms[17].links.n = {}
          region.rooms[17].links.n.to = 2959
          region.rooms[17].links.n.con = ""
    region.rooms[18] = {}
      region.rooms[18].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n;d;s;e;n;su;n"
      region.rooms[18].name = "小花园"
      region.rooms[18].zone = "黑木崖"
      region.rooms[18].id = 2959
      region.rooms[18].desc = "    从昏暗的地道中出来，你发现自己竟是置身于一个极精致的小花园中，红梅绿竹，青松翠柏，布置得颇具匠心，往东去是一间精雅小舍。"
      region.rooms[18].exits = "south|enter"
      region.rooms[18].links = {}
        region.rooms[18].links.s = {}
          region.rooms[18].links.s.to = 2958
          region.rooms[18].links.s.con = ""
        region.rooms[18].links.enter = {}
          region.rooms[18].links.enter.to = 2960
          region.rooms[18].links.enter.con = ""
    region.rooms[19] = {}
      region.rooms[19].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n;d;s;e;n;su;n;enter"
      region.rooms[19].name = "小舍"
      region.rooms[19].zone = "黑木崖"
      region.rooms[19].id = 2960
      region.rooms[19].desc = "    这是一间用翠竹搭成的小舍。一进门，便闻到一阵浓烈的花香，房中挂着一幅仕女图，椅上铺了绣花锦垫，东边有一扇门，挂着绣了一丛牡丹的锦缎门帏。难道这是谁家姑娘的闺房？"
      region.rooms[19].exits = "east|out"
      region.rooms[19].links = {}
        region.rooms[19].links.e = {}
          region.rooms[19].links.e.to = 2961
          region.rooms[19].links.e.con = ""
        region.rooms[19].links.out = {}
          region.rooms[19].links.out.to = 2959
          region.rooms[19].links.out.con = ""
    region.rooms[20] = {}
      region.rooms[20].path = "fly hmy;|!aw:3:give ling to zhang:hi|;unwield all;n;d;s;e;n;su;n;enter;e"
      region.rooms[20].name = "小舍内室"
      region.rooms[20].zone = "黑木崖"
      region.rooms[20].id = 2961
      region.rooms[20].desc = "    这里是小舍内室。收拾得精细异常。只是有个大柜子摆在墙角(cabinet)显得很不自然你一进去，就发现床沿坐着一个打扮妖艳的人。那人也诧异地抬头，你发现他居然是个男人，手里执着一枚绣花针！"
      region.rooms[20].exits = "west"
      region.rooms[20].links = {}
        region.rooms[20].links.w = {}
          region.rooms[20].links.w.to = 2960
          region.rooms[20].links.w.con = ""
    region.rooms[21] = {}
      region.rooms[21].path = "fly hmy;|!aw:3:give ling to zhang:hi|;wd"
      region.rooms[21].name = "悬崖"
      region.rooms[21].zone = "黑木崖"
      region.rooms[21].id = 2962
      region.rooms[21].desc = "    又一座陡峭的悬崖立在了你的面前。悬崖上仿佛有座白色的建筑，可云烟缭绕，看不清晰。崖上又垂下一条绳索(rope)，看上去象是悬崖上下互通消息的工具，要想办法找其他的牌子啊。绳索的上面似乎隐约有一个吊篮(basket)，悬崖的墙上似乎有一个匣子(xiazi)。"
      region.rooms[21].exits = "westdown"
      region.rooms[21].links = {}
        region.rooms[21].links.wd = {}
          region.rooms[21].links.wd.to = 2963
          region.rooms[21].links.wd.con = ""
    region.rooms[22] = {}
      region.rooms[22].path = "fly hmy;|!aw:3:give ling to zhang:hi|;wd;wd"
      region.rooms[22].name = "悬崖"
      region.rooms[22].zone = "黑木崖"
      region.rooms[22].id = 2963
      region.rooms[22].desc = "    又一座陡峭的悬崖立在了你的面前。悬崖上仿佛有座白色的建筑，可云烟缭绕，看不清晰。崖上又垂下一条绳索(rope)，看上去象是悬崖上下互通消息的工具，要想办法找其他的牌子啊。绳索的上面似乎隐约有一个吊篮(basket)，悬崖的墙上似乎有一个匣子(xiazi)。"
      region.rooms[22].exits = "westdown"
      region.rooms[22].links = {}
        region.rooms[22].links.wd = {}
          region.rooms[22].links.wd.to = 2964
          region.rooms[22].links.wd.con = ""
    region.rooms[23] = {}
      region.rooms[23].path = "fly hmy;|!aw:3:give ling to zhang:hi|;wd;wd;wd"
      region.rooms[23].name = "悬崖"
      region.rooms[23].zone = "黑木崖"
      region.rooms[23].id = 2964
      region.rooms[23].desc = "    又一座陡峭的悬崖立在了你的面前。悬崖上仿佛有座白色的建筑，可云烟缭绕，看不清晰。崖上又垂下一条绳索(rope)，看上去象是悬崖上下互通消息的工具。绳索的上面似乎隐约有一个吊篮(basket)，悬崖的墙上似乎有一个匣子(xiazi)。"
      region.rooms[23].exits = "westdown"
      region.rooms[23].links = {}
        region.rooms[23].links.wd = {}
          region.rooms[23].links.wd.to = 2942
          region.rooms[23].links.wd.con = ""
  region.center = 2942
return region