local region = {}
  region.cmd = "fly xs"
  region.name = "血刀门"
  region.id = "xdm"
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
      region.rooms[2].path = "fly xs;ed"
      region.rooms[2].name = "大雪山山路"
      region.rooms[2].zone = "血刀门"
      region.rooms[2].id = 2134
      region.rooms[2].desc = "    大雪山北麓的地势不是甚高，周围还有一些小山丘。西面有一座寺院依山而建。显得异常高大。寺院呈平顶梯型，多由大石砌成，墙体厚实，窗口窄小。"
      region.rooms[2].exits = "westup|north"
      region.rooms[2].links = {}
        region.rooms[2].links.wu = {}
          region.rooms[2].links.wu.to = 2110
          region.rooms[2].links.wu.con = ""
        region.rooms[2].links.n = {}
          region.rooms[2].links.n.to = 2135
          region.rooms[2].links.n.con = ""
    region.rooms[3] = {}
      region.rooms[3].path = "fly xs;ed;n"
      region.rooms[3].name = "大雪山北麓"
      region.rooms[3].zone = "血刀门"
      region.rooms[3].id = 2135
      region.rooms[3].desc = "    这里山势比大雪山东面稍缓，也不是十分的严寒。山道两旁长得有稀稀拉拉的一些野草。四下毫无人迹，只有几只秃鹰在高处盘旋，俯视着茫茫雪山。"
      region.rooms[3].exits = "south|eastdown"
      region.rooms[3].links = {}
        region.rooms[3].links.s = {}
          region.rooms[3].links.s.to = 2134
          region.rooms[3].links.s.con = ""
        region.rooms[3].links.ed = {}
          region.rooms[3].links.ed.to = 2136
          region.rooms[3].links.ed.con = ""
    region.rooms[4] = {}
      region.rooms[4].path = "fly xs;ed;n;ed"
      region.rooms[4].name = "山路"
      region.rooms[4].zone = "血刀门"
      region.rooms[4].id = 2136
      region.rooms[4].desc = "    你走在一山路上，四周有一座座小山丘。能遥望见西南方大雪山的北麓。山前隐隐约约象是有一座寺院。"
      region.rooms[4].exits = "westup|eastdown"
      region.rooms[4].links = {}
        region.rooms[4].links.ed = {}
          region.rooms[4].links.ed.to = 2137
          region.rooms[4].links.ed.con = ""
        region.rooms[4].links.wu = {}
          region.rooms[4].links.wu.to = 2135
          region.rooms[4].links.wu.con = ""
    region.rooms[5] = {}
      region.rooms[5].path = "fly xs;ed;n;ed;ed"
      region.rooms[5].name = "山路"
      region.rooms[5].zone = "血刀门"
      region.rooms[5].id = 2137
      region.rooms[5].desc = "    山路越走越窄，能隐隐望见前方又分出了几条叉路。"
      region.rooms[5].exits = "westup|northdown|southup"
      region.rooms[5].links = {}
        region.rooms[5].links.nd = {}
          region.rooms[5].links.nd.to = 2138
          region.rooms[5].links.nd.con = ""
        region.rooms[5].links.wu = {}
          region.rooms[5].links.wu.to = 2136
          region.rooms[5].links.wu.con = ""
        region.rooms[5].links.su = {}
          region.rooms[5].links.su.to = 2152
          region.rooms[5].links.su.con = ""
    region.rooms[6] = {}
      region.rooms[6].path = "fly xs;ed;n;ed;ed;nd"
      region.rooms[6].name = "山路"
      region.rooms[6].zone = "血刀门"
      region.rooms[6].id = 2138
      region.rooms[6].desc = "    这是一条崎岖的山路，马队到了这里就不能在上去了。山路两旁杂草从生，路开始越来越难走。"
      region.rooms[6].exits = "southup|northdown"
      region.rooms[6].links = {}
        region.rooms[6].links.su = {}
          region.rooms[6].links.su.to = 2137
          region.rooms[6].links.su.con = ""
        region.rooms[6].links.nd = {}
          region.rooms[6].links.nd.to = 2139
          region.rooms[6].links.nd.con = ""
    region.rooms[7] = {}
      region.rooms[7].path = "fly xs;ed;n;ed;ed;nd;nd"
      region.rooms[7].name = "山路"
      region.rooms[7].zone = "血刀门"
      region.rooms[7].id = 2139
      region.rooms[7].desc = "    你走在一山路上，四周有一座座小山丘。远处可以看见终年积雪的山尖。周围的树草已经很难看得到了。"
      region.rooms[7].exits = "north|southup"
      region.rooms[7].links = {}
        region.rooms[7].links.su = {}
          region.rooms[7].links.su.to = 2138
          region.rooms[7].links.su.con = ""
        region.rooms[7].links.n = {}
          region.rooms[7].links.n.to = 2140
          region.rooms[7].links.n.con = ""
    region.rooms[8] = {}
      region.rooms[8].path = "fly xs;ed;n;ed;ed;nd;nd;n"
      region.rooms[8].name = "山路"
      region.rooms[8].zone = "血刀门"
      region.rooms[8].id = 2140
      region.rooms[8].desc = "    你走在一山路上，四周有一座座小山丘。"
      region.rooms[8].exits = "south|eastdown"
      region.rooms[8].links = {}
        region.rooms[8].links.s = {}
          region.rooms[8].links.s.to = 2139
          region.rooms[8].links.s.con = ""
        region.rooms[8].links.ed = {}
          region.rooms[8].links.ed.to = 2141
          region.rooms[8].links.ed.con = ""
    region.rooms[9] = {}
      region.rooms[9].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed"
      region.rooms[9].name = "山脚"
      region.rooms[9].zone = "血刀门"
      region.rooms[9].id = 2141
      region.rooms[9].desc = "    这里是山脚下的一片平地，山上不远处，皑皑白雪映照下的一大片红墙金瓦处，就是远近闻名的雪山寺。"
      region.rooms[9].exits = "south|westup"
      region.rooms[9].links = {}
        region.rooms[9].links.s = {}
          region.rooms[9].links.s.to = 2142
          region.rooms[9].links.s.con = ""
        region.rooms[9].links.wu = {}
          region.rooms[9].links.wu.to = 2140
          region.rooms[9].links.wu.con = ""
    region.rooms[10] = {}
      region.rooms[10].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s"
      region.rooms[10].name = "湖边小路"
      region.rooms[10].zone = "血刀门"
      region.rooms[10].id = 2142
      region.rooms[10].desc = "    这是圣湖边的小路。路侧长草没足, 青绿可喜。"
      region.rooms[10].exits = "south|north"
      region.rooms[10].links = {}
        region.rooms[10].links.s = {}
          region.rooms[10].links.s.to = 2143
          region.rooms[10].links.s.con = ""
        region.rooms[10].links.n = {}
          region.rooms[10].links.n.to = 2141
          region.rooms[10].links.n.con = ""
    region.rooms[11] = {}
      region.rooms[11].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s"
      region.rooms[11].name = "湖边小路"
      region.rooms[11].zone = "血刀门"
      region.rooms[11].id = 2143
      region.rooms[11].desc = "    这是圣湖边的小路。天兰兰的，白白的云朵在湖里漂移，波光潋滟。湖边生长着一些绿绿青青的不知名的矮树。"
      region.rooms[11].exits = "north|southwest"
      region.rooms[11].links = {}
        region.rooms[11].links.n = {}
          region.rooms[11].links.n.to = 2142
          region.rooms[11].links.n.con = ""
        region.rooms[11].links.sw = {}
          region.rooms[11].links.sw.to = 2144
          region.rooms[11].links.sw.con = ""
    region.rooms[12] = {}
      region.rooms[12].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw"
      region.rooms[12].name = "湖边小路"
      region.rooms[12].zone = "血刀门"
      region.rooms[12].id = 2144
      region.rooms[12].desc = "    这是圣湖边的小路。长草越径，虫鸣阵阵，偶尔有白色水禽掠湖点水，激起圈圈涟漪。"
      region.rooms[12].exits = "northeast|west"
      region.rooms[12].links = {}
        region.rooms[12].links.ne = {}
          region.rooms[12].links.ne.to = 2143
          region.rooms[12].links.ne.con = ""
        region.rooms[12].links.w = {}
          region.rooms[12].links.w.to = 2145
          region.rooms[12].links.w.con = ""
    region.rooms[13] = {}
      region.rooms[13].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w"
      region.rooms[13].name = "湖边小路"
      region.rooms[13].zone = "血刀门"
      region.rooms[13].id = 2145
      region.rooms[13].desc = "    这是圣湖边的小路。路侧的湖水极为清澈。阳光下映着白顶雪山显出一片蓝幽幽的宁静。"
      region.rooms[13].exits = "east|west"
      region.rooms[13].links = {}
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 2144
          region.rooms[13].links.e.con = ""
        region.rooms[13].links.w = {}
          region.rooms[13].links.w.to = 2146
          region.rooms[13].links.w.con = ""
    region.rooms[14] = {}
      region.rooms[14].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w"
      region.rooms[14].name = "圣湖"
      region.rooms[14].zone = "血刀门"
      region.rooms[14].id = 2146
      region.rooms[14].desc = "    眼前就是著名的圣湖，碧蓝的湖面倒影着蓝天和白云，浩淼的水面让人心旷神怡。远处金碧辉煌的雪山寺清晰可见，再远处是几座延绵的大雪山，其中最高大的是神山，相传山中有神仙居住。雪山中融化的雪水都汇入湖中。"
      region.rooms[14].exits = "south|east"
      region.rooms[14].links = {}
        region.rooms[14].links.e = {}
          region.rooms[14].links.e.to = 2145
          region.rooms[14].links.e.con = ""
        region.rooms[14].links.s = {}
          region.rooms[14].links.s.to = 2147
          region.rooms[14].links.s.con = ""
    region.rooms[15] = {}
      region.rooms[15].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s"
      region.rooms[15].name = "土路"
      region.rooms[15].zone = "血刀门"
      region.rooms[15].id = 2147
      region.rooms[15].desc = "    这是一条不起眼的土路。尘埃泛起的远方，北边波光潋滟的一大片幽蓝水光处，就是著名的圣湖。"
      region.rooms[15].exits = "south|north"
      region.rooms[15].links = {}
        region.rooms[15].links.s = {}
          region.rooms[15].links.s.to = 2148
          region.rooms[15].links.s.con = ""
        region.rooms[15].links.n = {}
          region.rooms[15].links.n.to = 2146
          region.rooms[15].links.n.con = ""
    region.rooms[16] = {}
      region.rooms[16].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s;s"
      region.rooms[16].name = "土路"
      region.rooms[16].zone = "血刀门"
      region.rooms[16].id = 2148
      region.rooms[16].desc = "    这是一条不起眼的土路，却是连接雪山寺与中原的必经之路。西边点点的炊烟依稀可见。往北可以通往声震西域的雪山寺。"
      region.rooms[16].exits = "north|east|west"
      region.rooms[16].links = {}
        region.rooms[16].links.e = {}
          region.rooms[16].links.e.to = 2150
          region.rooms[16].links.e.con = ""
        region.rooms[16].links.w = {}
          region.rooms[16].links.w.to = 2149
          region.rooms[16].links.w.con = ""
        region.rooms[16].links.n = {}
          region.rooms[16].links.n.to = 2147
          region.rooms[16].links.n.con = ""
    region.rooms[17] = {}
      region.rooms[17].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s;s;w"
      region.rooms[17].name = "客店"
      region.rooms[17].zone = "血刀门"
      region.rooms[17].id = 2149
      region.rooms[17].desc = "    这里是一个路边的小客店。来往的行人都在这里稍事休息。往东的路可以到达中原。"
      region.rooms[17].exits = "east"
      region.rooms[17].links = {}
        region.rooms[17].links.e = {}
          region.rooms[17].links.e.to = 2148
          region.rooms[17].links.e.con = ""
    region.rooms[18] = {}
      region.rooms[18].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s;s;e"
      region.rooms[18].name = "土路"
      region.rooms[18].zone = "血刀门"
      region.rooms[18].id = 2150
      region.rooms[18].desc = "    这是一条不起眼的土路，不宽却也不窄，松散的浮尘显露出来往行商的频繁。它是连接雪山寺与中原的必经之路。"
      region.rooms[18].exits = "east|west"
      region.rooms[18].links = {}
        region.rooms[18].links.w = {}
          region.rooms[18].links.w.to = 2148
          region.rooms[18].links.w.con = ""
        region.rooms[18].links.e = {}
          region.rooms[18].links.e.to = 2151
          region.rooms[18].links.e.con = ""
    region.rooms[19] = {}
      region.rooms[19].path = "fly wm;e;s;s;enter dong;say 天堂有路你不走呀;d;4;w;w;out;sw"
      region.rooms[19].name = "草原"
      region.rooms[19].zone = "血刀门|星宿海"
      region.rooms[19].id = 2151
      region.rooms[19].desc = "    这里是雪山脚下的一片草原。北面是起伏的群山，山顶上积着终年不化的雪。西边有一条土路。"
      region.rooms[19].exits = "northeast|west"
      region.rooms[19].links = {}
        region.rooms[19].links.w = {}
          region.rooms[19].links.w.to = 2150
          region.rooms[19].links.w.con = ""
        region.rooms[19].links.ne = {}
          region.rooms[19].links.ne.to = 2312
          region.rooms[19].links.ne.con = ""
    region.rooms[20] = {}
      region.rooms[20].path = "fly xs;ed;n;ed;ed;su"
      region.rooms[20].name = "山路"
      region.rooms[20].zone = "血刀门"
      region.rooms[20].id = 2152
      region.rooms[20].desc = "    这里是靠近川西的崇山峻岭，怪石嶙峋。再往东去就是川西边缘了。往西有一座雪山高耸入云。路边上有一个大雪坑(hollow)。"
      region.rooms[20].exits = "westup|eastdown|northdown"
      region.rooms[20].links = {}
        region.rooms[20].links.ed = {}
          region.rooms[20].links.ed.to = 2164
          region.rooms[20].links.ed.con = ""
        region.rooms[20].links.nd = {}
          region.rooms[20].links.nd.to = 2137
          region.rooms[20].links.nd.con = ""
        region.rooms[20].links["jump hollow"] = {}
          region.rooms[20].links["jump hollow"].to = 2153
          region.rooms[20].links["jump hollow"].con = ""
        region.rooms[20].links.wu = {}
          region.rooms[20].links.wu.to = 2154
          region.rooms[20].links.wu.con = ""
    region.rooms[21] = {}
      region.rooms[21].path = "fly xs;ed;n;ed;ed;su;jump hollow"
      region.rooms[21].name = "雪坑"
      region.rooms[21].zone = "血刀门"
      region.rooms[21].id = 2153
      region.rooms[21].desc = "    这是大雪山脚下的一个雪坑。丢满了各种杂物， 还有丐帮弟子收集的破铜烂铁等。坑边上有一个小洞(dong)。"
      region.rooms[21].exits = "up"
      region.rooms[21].links = {}
        region.rooms[21].links.u = {}
          region.rooms[21].links.u.to = 2152
          region.rooms[21].links.u.con = ""
    region.rooms[22] = {}
      region.rooms[22].path = "fly xs;ed;n;ed;ed;su;wu"
      region.rooms[22].name = "大雪山口"
      region.rooms[22].zone = "血刀门"
      region.rooms[22].id = 2154
      region.rooms[22].desc = "    这里已经到了藏边，大雪山的山口。大雪山又叫岷山，位于川藏之间，由于山势高峻，山顶有终年不化的积雪，故而得名。四下毫无人迹，只有几只秃鹰在高处盘旋，俯视着茫茫雪山。"
      region.rooms[22].exits = "westup|eastdown"
      region.rooms[22].links = {}
        region.rooms[22].links.ed = {}
          region.rooms[22].links.ed.to = 2152
          region.rooms[22].links.ed.con = ""
        region.rooms[22].links.wu = {}
          region.rooms[22].links.wu.to = 2155
          region.rooms[22].links.wu.con = ""
    region.rooms[23] = {}
      region.rooms[23].path = "fly xs;ed;n;ed;ed;su;wu;wu"
      region.rooms[23].name = "大雪山"
      region.rooms[23].zone = "血刀门"
      region.rooms[23].id = 2155
      region.rooms[23].desc = "    这儿遍地冰雪，你眼前白皑皑的一片。从东边爬上来的，心跳开始加速。"
      region.rooms[23].exits = "eastdown|southup"
      region.rooms[23].links = {}
        region.rooms[23].links.ed = {}
          region.rooms[23].links.ed.to = 2154
          region.rooms[23].links.ed.con = ""
        region.rooms[23].links.su = {}
          region.rooms[23].links.su.to = 2156
          region.rooms[23].links.su.con = ""
    region.rooms[24] = {}
      region.rooms[24].path = "fly xs;ed;n;ed;ed;su;wu;wu;su"
      region.rooms[24].name = "大雪山口"
      region.rooms[24].zone = "血刀门"
      region.rooms[24].id = 2156
      region.rooms[24].desc = "    冰天雪地，寒风刺骨。不是内力高深的人，已然经受不住了。"
      region.rooms[24].exits = "westup|northdown"
      region.rooms[24].links = {}
        region.rooms[24].links.nd = {}
          region.rooms[24].links.nd.to = 2155
          region.rooms[24].links.nd.con = ""
        region.rooms[24].links.wu = {}
          region.rooms[24].links.wu.to = 2157
          region.rooms[24].links.wu.con = ""
    region.rooms[25] = {}
      region.rooms[25].path = "fly xs;ed;n;ed;ed;su;wu;wu;su;wu"
      region.rooms[25].name = "大雪山口"
      region.rooms[25].zone = "血刀门"
      region.rooms[25].id = 2157
      region.rooms[25].desc = "    群山环绕，四周积雪终年不化。南边不远处有一个山谷。"
      region.rooms[25].exits = "eastdown|southup"
      region.rooms[25].links = {}
        region.rooms[25].links.ed = {}
          region.rooms[25].links.ed.to = 2156
          region.rooms[25].links.ed.con = ""
        region.rooms[25].links.su = {}
          region.rooms[25].links.su.to = 2158
          region.rooms[25].links.su.con = ""
    region.rooms[26] = {}
      region.rooms[26].path = "fly xs;ed;n;ed;ed;su;wu;wu;su;wu;su"
      region.rooms[26].name = "大雪山山谷"
      region.rooms[26].zone = "血刀门"
      region.rooms[26].id = 2158
      region.rooms[26].desc = "    一个宽大山谷, 群山环绕, 山顶上全是白闪闪的积雪, 山谷南方有两个山洞。"
      region.rooms[26].exits = "north|enter|northdown"
      region.rooms[26].links = {}
        region.rooms[26].links.enter = {}
          region.rooms[26].links.enter.to = 2159
          region.rooms[26].links.enter.con = ""
        region.rooms[26].links.nd = {}
          region.rooms[26].links.nd.to = 2157
          region.rooms[26].links.nd.con = ""
        region.rooms[26].links.n = {}
          region.rooms[26].links.n.to = 2160
          region.rooms[26].links.n.con = ""
    region.rooms[27] = {}
      region.rooms[27].path = "fly xs;ed;n;ed;ed;su;wu;wu;su;wu;su;enter"
      region.rooms[27].name = "山洞"
      region.rooms[27].zone = "血刀门"
      region.rooms[27].id = 2159
      region.rooms[27].desc = "    空空荡荡一个山洞，倒也还算干净，尽头摆了一张石床。"
      region.rooms[27].exits = "out"
      region.rooms[27].links = {}
        region.rooms[27].links.out = {}
          region.rooms[27].links.out.to = 2158
          region.rooms[27].links.out.con = ""
    region.rooms[28] = {}
      region.rooms[28].path = "fly xs;ed;n;ed;ed;su;wu;wu;su;wu;su;n"
      region.rooms[28].name = "忘忧谷"
      region.rooms[28].zone = "血刀门"
      region.rooms[28].id = 2160
      region.rooms[28].desc = "    这里乃是大轮寺外一处僻静所在，四下绝无人迹。前前後後，大大小小几百座佛塔，被白得耀眼的雪被披盖着。银白色的山野、雪地里闪耀着红色和蓝色的光带，五彩缤纷，迷宫一样的琼楼仙阁在你眼前出现。南面一条小径不知通往何处。"
      region.rooms[28].exits = "south|southup"
      region.rooms[28].links = {}
        region.rooms[28].links.s = {}
          region.rooms[28].links.s.to = 2158
          region.rooms[28].links.s.con = ""
        region.rooms[28].links.su = {}
          region.rooms[28].links.su.to = 2161
          region.rooms[28].links.su.con = ""
    region.rooms[29] = {}
      region.rooms[29].path = "fly xs;ed;n;ed;ed;su;wu;wu;su;wu;su;n;su"
      region.rooms[29].name = "大雪山山谷"
      region.rooms[29].zone = "血刀门"
      region.rooms[29].id = 2161
      region.rooms[29].desc = "    山谷里遍地积雪，四周都是峭壁。只北面有一个出口，东面似乎有个山洞。"
      region.rooms[29].exits = "east|northdown"
      region.rooms[29].links = {}
        region.rooms[29].links.e = {}
          region.rooms[29].links.e.to = 2162
          region.rooms[29].links.e.con = ""
        region.rooms[29].links.nd = {}
          region.rooms[29].links.nd.to = 2160
          region.rooms[29].links.nd.con = ""
    region.rooms[30] = {}
      region.rooms[30].path = "fly xs;ed;n;ed;ed;su;wu;wu;su;wu;su;n;su;e"
      region.rooms[30].name = "洞口"
      region.rooms[30].zone = "血刀门"
      region.rooms[30].id = 2162
      region.rooms[30].desc = "    山谷里积雪被拢成几个雪堆，这里时常有人扫除积雪。你前面的峭壁下隐隐约约有一个山洞。"
      region.rooms[30].exits = "enter|west"
      region.rooms[30].links = {}
        region.rooms[30].links.w = {}
          region.rooms[30].links.w.to = 2161
          region.rooms[30].links.w.con = ""
        region.rooms[30].links.enter = {}
          region.rooms[30].links.enter.to = 2163
          region.rooms[30].links.enter.con = ""
    region.rooms[31] = {}
      region.rooms[31].path = "fly xs;ed;n;ed;ed;su;wu;wu;su;wu;su;n;su;e;enter"
      region.rooms[31].name = "山洞"
      region.rooms[31].zone = "血刀门"
      region.rooms[31].id = 2163
      region.rooms[31].desc = "    这是一个小小的山洞，血刀老祖的藏身之地。由於此地比较隐秘，仇家很难寻到这来。洞底有一张供桌，上面供了什麽东西，你看不清。壁上画了一些模糊不清的文字图案，也不知道是些什么。"
      region.rooms[31].exits = "out"
      region.rooms[31].links = {}
        region.rooms[31].links.out = {}
          region.rooms[31].links.out.to = 2162
          region.rooms[31].links.out.con = ""
    region.rooms[32] = {}
      region.rooms[32].path = "fly xs;ed;n;ed;ed;su;ed"
      region.rooms[32].name = "山路"
      region.rooms[32].zone = "血刀门"
      region.rooms[32].id = 2164
      region.rooms[32].desc = "    一条山路蜿蜒在山间。向西望去，可以见到大雪山的银色的雪顶在熠熠生辉。"
      region.rooms[32].exits = "westup|eastdown"
      region.rooms[32].links = {}
        region.rooms[32].links.ed = {}
          region.rooms[32].links.ed.to = 698
          region.rooms[32].links.ed.con = ""
        region.rooms[32].links.wu = {}
          region.rooms[32].links.wu.to = 2152
          region.rooms[32].links.wu.con = ""
  region.center = 2110
return region