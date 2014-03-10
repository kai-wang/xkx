local region = {}
  region.cmd = "fly gm"
  region.name = "古墓"
  region.id = "gm"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly gm;s;tang coffin;niu lock;e;s;s;e;out;enter dong;say 天堂有路你不走呀;d;c;ne;ne;out;sd;sd;sd;s;se;e;s;sd;sd;ed;ed;sd;sd;sd;w;nw;w;s;enter"
      region.rooms[1].name = "山洞"
      region.rooms[1].zone = "终南山|古墓"
      region.rooms[1].id = 1114
      region.rooms[1].links = {}
        region.rooms[1].links.out = {}
          region.rooms[1].links.out.to = 1113
          region.rooms[1].links.out.con = ""
      region.rooms[1].exits = "westdown|out"
      region.rooms[1].desc = "    在这小山洞的深处，一股强大的水流自地上流出，形成一条小河流向洞外。如果想再进一步深入的话，就得要跳入水中了。往外可到小河边。往里就要潜水了。"
    region.rooms[2] = {}
      region.rooms[2].path = "fly gm;s;tang coffin;niu lock;e;s;s;e;out;enter dong;say 天堂有路你不走呀;d;c;ne;ne;out;wu;wu"
      region.rooms[2].name = "山路"
      region.rooms[2].zone = "终南山|古墓"
      region.rooms[2].id = 1157
      region.rooms[2].links = {}
        region.rooms[2].links.ed = {}
          region.rooms[2].links.ed.to = 1148
          region.rooms[2].links.ed.con = ""
        region.rooms[2].links.sd = {}
          region.rooms[2].links.sd.to = 1158
          region.rooms[2].links.sd.con = ""
        region.rooms[2].links.nu = {}
          region.rooms[2].links.nu.to = 1159
          region.rooms[2].links.nu.con = ""
      region.rooms[2].exits = "eastdown|northup|southdown"
      region.rooms[2].desc = "    这条山路盘终南山主峰而上，山路贴着石璧凿出，只容一人可过，形势极为险峻。往远处望去。群山环绕，列於脚下，百里美景尽收眼底，顿时令人豪气陡声，想要长啸一声。往东下和北上各是一条山路。往南下是白马潭。"
    region.rooms[3] = {}
      region.rooms[3].path = "fly gm;s;tang coffin;niu lock;e;s;s;e;out;enter dong;say 天堂有路你不走呀;d;c;ne;ne;out;wu;wu;sd"
      region.rooms[3].name = "白马潭"
      region.rooms[3].zone = "终南山|古墓"
      region.rooms[3].id = 1158
      region.rooms[3].links = {}
        region.rooms[3].links.nu = {}
          region.rooms[3].links.nu.to = 1157
          region.rooms[3].links.nu.con = ""
      region.rooms[3].exits = "northup"
      region.rooms[3].desc = "    这个潭为於终南山主峰一带，一条名叫库峪河的上游。潭边有一块比三间房子还要大的白石头，这石头中间低两头高，石头的前半截伸在水里，後半截留在岸上。由伸在水中的那半截石头下面还不时冒出一串串白沫，老远看去活似一匹腾空欲飞的烈马，因此当地人都叫此潭为白马潭。往北是一条崎岖的山路。"
    region.rooms[4] = {}
      region.rooms[4].path = "fly gm;s;tang coffin;niu lock;e;s;s;e;out;enter dong;say 天堂有路你不走呀;d;c;ne;ne;out;wu;wu;nu"
      region.rooms[4].name = "山路"
      region.rooms[4].zone = "终南山|古墓"
      region.rooms[4].id = 1159
      region.rooms[4].links = {}
        region.rooms[4].links.sd = {}
          region.rooms[4].links.sd.to = 1157
          region.rooms[4].links.sd.con = ""
        region.rooms[4].links.wu = {}
          region.rooms[4].links.wu.to = 1160
          region.rooms[4].links.wu.con = ""
      region.rooms[4].exits = "westup|southdown"
      region.rooms[4].desc = "    这条山路盘终南山主峰而上，山路贴着石璧凿出，只容一人可过，形势极为险峻。往远处望去。群山环绕，列於脚下，百里美景尽收眼底，顿时令人豪气陡声，想要长啸一声。往南下和西上各是一条山路。"
    region.rooms[5] = {}
      region.rooms[5].path = "fly gm;n;n;n;n;n;ne;ne;nd;n;n;nu;nu;wd;nd;ed"
      region.rooms[5].name = "山路"
      region.rooms[5].zone = "终南山|古墓"
      region.rooms[5].id = 1160
      region.rooms[5].links = {}
        region.rooms[5].links.ed = {}
          region.rooms[5].links.ed.to = 1159
          region.rooms[5].links.ed.con = ""
        region.rooms[5].links.wu = {}
          region.rooms[5].links.wu.to = 1161
          region.rooms[5].links.wu.con = ""
      region.rooms[5].exits = "westup|eastdown"
      region.rooms[5].desc = "    这条山路盘终南山主峰而上，山路贴着石璧凿出，只容一人可过，形势极为险峻。往远处望去。群山环绕，列於脚下，百里美景尽收眼底，顿时令人豪气陡声，想要长啸一声。往东下和西上各是一条山路。"
    region.rooms[6] = {}
      region.rooms[6].path = "fly gm;n;n;n;n;n;ne;ne;nd;n;n;nu;nu;wd;nd"
      region.rooms[6].name = "山路"
      region.rooms[6].zone = "终南山|古墓"
      region.rooms[6].id = 1161
      region.rooms[6].links = {}
        region.rooms[6].links.ed = {}
          region.rooms[6].links.ed.to = 1160
          region.rooms[6].links.ed.con = ""
        region.rooms[6].links.su = {}
          region.rooms[6].links.su.to = 1162
          region.rooms[6].links.su.con = ""
      region.rooms[6].exits = "eastdown|southup"
      region.rooms[6].desc = "    这条山路盘终南山主峰而上，山路贴着石璧凿出，只容一人可过，形势极为险峻。往远处望去。群山环绕，列於脚下，百里美景尽收眼底，顿时令人豪气陡声，想要长啸一声。往东下和南上各是一条山路。"
    region.rooms[7] = {}
      region.rooms[7].path = "fly gm;n;n;n;n;n;ne;ne;nd;n;n;nu;nu;wd"
      region.rooms[7].name = "山路"
      region.rooms[7].zone = "终南山|古墓"
      region.rooms[7].id = 1162
      region.rooms[7].links = {}
        region.rooms[7].links.eu = {}
          region.rooms[7].links.eu.to = 1163
          region.rooms[7].links.eu.con = ""
        region.rooms[7].links.nd = {}
          region.rooms[7].links.nd.to = 1161
          region.rooms[7].links.nd.con = ""
      region.rooms[7].exits = "eastup|northdown"
      region.rooms[7].desc = "    这条山路盘终南山主峰而上，山路贴着石璧凿出，只容一人可过，形势极为险峻。往远处望去。群山环绕，列於脚下，百里美景尽收眼底，顿时令人豪气陡声，想要长啸一声。往北下是一条山路。往东上就是终南山主峰。"
    region.rooms[8] = {}
      region.rooms[8].path = "fly gm;n;n;n;n;n;ne;ne;nd;n;n;nu;nu"
      region.rooms[8].name = "终南山主峰"
      region.rooms[8].zone = "终南山|古墓"
      region.rooms[8].id = 1163
      region.rooms[8].links = {}
        region.rooms[8].links.wd = {}
          region.rooms[8].links.wd.to = 1162
          region.rooms[8].links.wd.con = ""
        region.rooms[8].links.sd = {}
          region.rooms[8].links.sd.to = 1164
          region.rooms[8].links.sd.con = ""
      region.rooms[8].exits = "southdown|westdown"
      region.rooms[8].desc = "    此时你已身在终南山主峰，视野更为广阔。往低望去，群山尽皆匍匐在脚下。重阳宫的翠绿琉瓦在山腰处，晶莹生辉。只见不少殿宇散布於山坳间，景色颇为美妙。一块巨石 (shi)立在一旁，似乎刻了什麽东西。往西和南各是一条山路。"
    region.rooms[9] = {}
      region.rooms[9].path = "fly gm;n;n;n;n;n;ne;ne;nd;n;n;nu"
      region.rooms[9].name = "山路"
      region.rooms[9].zone = "终南山|古墓"
      region.rooms[9].id = 1164
      region.rooms[9].links = {}
        region.rooms[9].links.nu = {}
          region.rooms[9].links.nu.to = 1163
          region.rooms[9].links.nu.con = ""
        region.rooms[9].links.sd = {}
          region.rooms[9].links.sd.to = 1165
          region.rooms[9].links.sd.con = ""
      region.rooms[9].exits = "northup|southdown"
      region.rooms[9].desc = "    这条山路盘终南山主峰而上，山路贴着石璧凿出，只容一人可过，形势极为险峻。往远处望去。群山环绕，列於脚下，百里美景尽收眼底，顿时令人豪气陡声，想要长啸一声。往南下是一片空地。往北上就是终南山主峰。"
    region.rooms[10] = {}
      region.rooms[10].path = "fly gm;n;n;n;n;n;ne;ne;nd;n;n"
      region.rooms[10].name = "空地"
      region.rooms[10].zone = "终南山|古墓"
      region.rooms[10].id = 1165
      region.rooms[10].links = {}
        region.rooms[10].links.nu = {}
          region.rooms[10].links.nu.to = 1164
          region.rooms[10].links.nu.con = ""
        region.rooms[10].links.s = {}
          region.rooms[10].links.s.to = 1166
          region.rooms[10].links.s.con = ""
      region.rooms[10].exits = "south|northup|west"
      region.rooms[10].desc = "    这是终南山山腰处的一块空地，地势平坦。北面一条小路直攀山璧而上，通往是终南山主峰。南边和西边一大片密林，只闻阵阵琴声自林中传出。往北是一条山路。往南和西各有一条小径。"
    region.rooms[11] = {}
      region.rooms[11].path = "fly gm;n;n;n;n;n;ne;ne;nd;n"
      region.rooms[11].name = "小树林"
      region.rooms[11].zone = "古墓"
      region.rooms[11].id = 1166
      region.rooms[11].desc = "    走在林中，你只闻铮铮琴声，一股淡淡白烟，带着极甜的花香，自密林深处传出。一群乳白色的蜜蜂在你身旁飞来飞去。不论往哪ㄦ走尽是茂密的树林。"
      region.rooms[11].exits = "south|east|north|west"
      region.rooms[11].links = {}
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 1169
          region.rooms[11].links.w.con = ""
        region.rooms[11].links.s = {}
          region.rooms[11].links.s.to = 1167
          region.rooms[11].links.s.con = ""
        region.rooms[11].links.n = {}
          region.rooms[11].links.n.to = 1165
          region.rooms[11].links.n.con = ""
    region.rooms[12] = {}
      region.rooms[12].path = "fly gm;n;n;n;n;n;ne;ne;nd"
      region.rooms[12].name = "小树林"
      region.rooms[12].zone = "古墓"
      region.rooms[12].id = 1167
      region.rooms[12].desc = "    走在林中，你只闻铮铮琴声，一股淡淡白烟，带着极甜的花香，自密林深处传出。一群乳白色的蜜蜂在你身旁飞来飞去。只见一块石碑(shibei)立在当眼ㄦ处。往东是一块空地。其它方向尽是茂密的树林。"
      region.rooms[12].exits = "east|north|southup|west"
      region.rooms[12].links = {}
        region.rooms[12].links.e = {}
          region.rooms[12].links.e.to = 1170
          region.rooms[12].links.e.con = ""
        region.rooms[12].links.n = {}
          region.rooms[12].links.n.to = 1166
          region.rooms[12].links.n.con = ""
        region.rooms[12].links.w = {}
          region.rooms[12].links.w.to = 1169
          region.rooms[12].links.w.con = ""
        region.rooms[12].links.su = {}
          region.rooms[12].links.su.to = 1168
          region.rooms[12].links.su.con = ""
    region.rooms[13] = {}
      region.rooms[13].path = "fly gm;n;n;n;n;n;ne;ne"
      region.rooms[13].name = "小树林"
      region.rooms[13].zone = "古墓"
      region.rooms[13].id = 1168
      region.rooms[13].desc = "    这是一片小树林，周围的树木都很高。间杂着一些叫不出名字的鲜花，五彩缤纷。你隐隐地有些担心起来：不会迷路了吧，转头间却看见东南边似乎有一条小路，隐藏在树丛之中。"
      region.rooms[13].exits = "northdown|southwest"
      region.rooms[13].links = {}
        region.rooms[13].links.nd = {}
          region.rooms[13].links.nd.to = 1167
          region.rooms[13].links.nd.con = ""
        region.rooms[13].links.sw = {}
          region.rooms[13].links.sw.to = 1171
          region.rooms[13].links.sw.con = ""
    region.rooms[14] = {}
      region.rooms[14].path = "fly gm;n;n;n;n;n;ne;ne;nd;w"
      region.rooms[14].name = "小树林"
      region.rooms[14].zone = "古墓"
      region.rooms[14].id = 1169
      region.rooms[14].desc = "    走在林中，你只闻铮铮琴声，一股淡淡白烟，带着极甜的花香，自密林深处传出。一群乳白色的蜜蜂在你身旁飞来飞去。不论往哪ㄦ走尽是茂密的树林。"
      region.rooms[14].exits = "south|north|east|west"
      region.rooms[14].links = {}
        region.rooms[14].links.e = {}
          region.rooms[14].links.e.to = 1167
          region.rooms[14].links.e.con = ""
        region.rooms[14].links.s = {}
          region.rooms[14].links.s.to = 1166
          region.rooms[14].links.s.con = ""
        region.rooms[14].links.w = {}
          region.rooms[14].links.w.to = 1169
          region.rooms[14].links.w.con = ""
        region.rooms[14].links.n = {}
          region.rooms[14].links.n.to = 1169
          region.rooms[14].links.n.con = ""
    region.rooms[15] = {}
      region.rooms[15].path = "fly gm;n;n;n;n;n;ne;ne;nd;e"
      region.rooms[15].name = "小树林"
      region.rooms[15].zone = "古墓"
      region.rooms[15].id = 1170
      region.rooms[15].desc = "    走在林中，你只闻铮铮琴声，一股淡淡白烟，带着极甜的花香，自密林深处传出。一群乳白色的蜜蜂在你身旁飞来飞去。不论往哪ㄦ走尽是茂密的树林。"
      region.rooms[15].exits = "south|east|north|west"
      region.rooms[15].links = {}
        region.rooms[15].links.e = {}
          region.rooms[15].links.e.to = 1170
          region.rooms[15].links.e.con = ""
        region.rooms[15].links.w = {}
          region.rooms[15].links.w.to = 1167
          region.rooms[15].links.w.con = ""
        region.rooms[15].links.s = {}
          region.rooms[15].links.s.to = 1170
          region.rooms[15].links.s.con = ""
        region.rooms[15].links.n = {}
          region.rooms[15].links.n.to = 1166
          region.rooms[15].links.n.con = ""
    region.rooms[16] = {}
      region.rooms[16].path = "fly gm;n;n;n;n;n;ne"
      region.rooms[16].name = "小树林"
      region.rooms[16].zone = "古墓"
      region.rooms[16].id = 1171
      region.rooms[16].desc = "    你走在一条林间的小道上，四周都是树。远处似乎有一角建筑的飞檐从树丛中露了出来，也许附近的山上有一座道观之类。这些树你大都叫不出名字来，树龄都已经很长了。"
      region.rooms[16].exits = "northeast|southwest"
      region.rooms[16].links = {}
        region.rooms[16].links.ne = {}
          region.rooms[16].links.ne.to = 1168
          region.rooms[16].links.ne.con = ""
        region.rooms[16].links.sw = {}
          region.rooms[16].links.sw.to = 1172
          region.rooms[16].links.sw.con = ""
    region.rooms[17] = {}
      region.rooms[17].path = "fly gm;n;n;n;n;n"
      region.rooms[17].name = "小树林"
      region.rooms[17].zone = "古墓"
      region.rooms[17].id = 1172
      region.rooms[17].desc = "    这里是树林的边缘，参天古树已经很稀少了。东面有一座高山，隐约看见山间云雾缭绕中，似乎有什么廊檐的建筑。山势缓和，但山上郁郁葱葱地栽满了树木。"
      region.rooms[17].exits = "south|northeast"
      region.rooms[17].links = {}
        region.rooms[17].links.ne = {}
          region.rooms[17].links.ne.to = 1171
          region.rooms[17].links.ne.con = ""
        region.rooms[17].links.s = {}
          region.rooms[17].links.s.to = 1173
          region.rooms[17].links.s.con = ""
    region.rooms[18] = {}
      region.rooms[18].path = "fly gm;n;n;n;n"
      region.rooms[18].name = "草地"
      region.rooms[18].zone = "古墓"
      region.rooms[18].id = 1173
      region.rooms[18].desc = "    这里是一片草地，草很深，几乎淹没了小腿。草间散布着一些奇花，微风吹过，芬芳扑鼻。你听到时而有“嗡嗡嗡”的声音，看见有一些个头奇大的白色的蜜蜂在草地上飞舞盘旋。"
      region.rooms[18].exits = "south|north|east"
      region.rooms[18].links = {}
        region.rooms[18].links.e = {}
          region.rooms[18].links.e.to = 1174
          region.rooms[18].links.e.con = ""
        region.rooms[18].links.s = {}
          region.rooms[18].links.s.to = 1176
          region.rooms[18].links.s.con = ""
        region.rooms[18].links.n = {}
          region.rooms[18].links.n.to = 1172
          region.rooms[18].links.n.con = ""
    region.rooms[19] = {}
      region.rooms[19].path = "fly gm;n;n;n;n;e"
      region.rooms[19].name = "草地"
      region.rooms[19].zone = "古墓"
      region.rooms[19].id = 1174
      region.rooms[19].desc = "    这里是一片草地，草很深，几乎淹没了小腿。草间散布着一些奇花，微风吹过，芬芳扑鼻。你听到时而有“嗡嗡嗡”的声音，看见有一些个头奇大的白色的蜜蜂在草地上飞舞盘旋。"
      region.rooms[19].exits = "southeast|west"
      region.rooms[19].links = {}
        region.rooms[19].links.w = {}
          region.rooms[19].links.w.to = 1173
          region.rooms[19].links.w.con = ""
        region.rooms[19].links.se = {}
          region.rooms[19].links.se.to = 1175
          region.rooms[19].links.se.con = ""
    region.rooms[20] = {}
      region.rooms[20].path = "fly gm;n;n;n;n;e;se"
      region.rooms[20].name = "寒水潭"
      region.rooms[20].zone = "古墓"
      region.rooms[20].id = 1175
      region.rooms[20].desc = "    这里是草地的边缘，青草已经很稀疏了，仍然有一二玉蜂来回地飞过寻觅食物。你的面前是一个清波荡漾的大水潭 (tan)，水很清，隐约可以见过水底的怪石嶙峋，一二游鱼倏地从水底游过，又不知道躲到哪块石头后面藏身去了。阳光映照下，水面泛起了一道七色彩虹，望着这般美景，你俗念尽消。"
      region.rooms[20].exits = "northwest"
      region.rooms[20].links = {}
        region.rooms[20].links.nw = {}
          region.rooms[20].links.nw.to = 1174
          region.rooms[20].links.nw.con = ""
        region.rooms[20].links["qian tan"] = {}
          region.rooms[20].links["qian tan"].to = 2995
          region.rooms[20].links["qian tan"].con = ""
    region.rooms[21] = {}
      region.rooms[21].path = "fly gm;n;n;n"
      region.rooms[21].name = "墓门"
      region.rooms[21].zone = "古墓"
      region.rooms[21].id = 1176
      region.rooms[21].desc = "    你走过了草地，眼前突然了一片开阔地，突兀地耸立着一座大墓，墓上砌的石头已经班驳了，看的出来这是座古墓。墓前没有立碑，也没有任何的标记，不知道这是前朝哪位王公大臣的墓穴。墓门口被一块黑黝黝的大石头(shi)封闭得丝毫不透。"
      region.rooms[21].exits = "north|west"
      region.rooms[21].links = {}
        region.rooms[21].links.w = {}
          region.rooms[21].links.w.to = 1177
          region.rooms[21].links.w.con = ""
        region.rooms[21].links.n = {}
          region.rooms[21].links.n.to = 1173
          region.rooms[21].links.n.con = ""
    region.rooms[22] = {}
      region.rooms[22].path = "fly gm;n;n;n;w"
      region.rooms[22].name = "黄沙岭"
      region.rooms[22].zone = "古墓"
      region.rooms[22].id = 1177
      region.rooms[22].desc = "    此处位於终南山西部。只见远处王曲原上，孤立着一座由荒沙堆积而成的山岭，波纹为奇特。据当地人说，这是在商朝，一位名叫陆亚仙的人，用法力遣来一股黄沙而成。往东是一片密林。"
      region.rooms[22].exits = "east"
      region.rooms[22].links = {}
        region.rooms[22].links.e = {}
          region.rooms[22].links.e.to = 1176
          region.rooms[22].links.e.con = ""
    region.rooms[23] = {}
      region.rooms[23].path = "fly gm"
      region.rooms[23].name = "正厅"
      region.rooms[23].zone = "古墓"
      region.rooms[23].id = 1178
      region.rooms[23].desc = "    这里是古墓的正厅，本来应该停放灵柩棺木之类的东西，却不知道被人般到哪里去了。厅正中端坐着一位白衣少女，厅角上摆放着一张石头做成的大床(chuang)，厅中横系着一条绳子，不知道做什么用的，除此之外，别无摆设。"
      region.rooms[23].exits = "south|north|west"
      region.rooms[23].links = {}
        region.rooms[23].links.w = {}
          region.rooms[23].links.w.to = 1179
          region.rooms[23].links.w.con = ""
        region.rooms[23].links.s = {}
          region.rooms[23].links.s.to = 1181
          region.rooms[23].links.s.con = ""
        region.rooms[23].links.n = {}
          region.rooms[23].links.n.to = 1182
          region.rooms[23].links.n.con = ""
    region.rooms[24] = {}
      region.rooms[24].path = "fly gm;w"
      region.rooms[24].name = "练功室"
      region.rooms[24].zone = "古墓"
      region.rooms[24].id = 1179
      region.rooms[24].desc = "    这座石室形状甚是奇特，前窄後宽，成为梯形，东边半圆，西边却作三角形状，原来这是以前重阳祖师的练功室，前窄练掌，後宽使拳，东圆研剑，西角发镖。"
      region.rooms[24].exits = "north|east"
      region.rooms[24].links = {}
        region.rooms[24].links.e = {}
          region.rooms[24].links.e.to = 1178
          region.rooms[24].links.e.con = ""
        region.rooms[24].links.n = {}
          region.rooms[24].links.n.to = 1180
          region.rooms[24].links.n.con = ""
    region.rooms[25] = {}
      region.rooms[25].path = "fly gm;w;n"
      region.rooms[25].name = "休息室"
      region.rooms[25].zone = "古墓"
      region.rooms[25].id = 1180
      region.rooms[25].desc = "    这是间很大的房间，光线非常昏暗。房里没有什么别的东西，只有中间放着一张收拾得舒舒服服的大床，床上的被褥也整理得整整洁洁，看着就让人想睡觉。"
      region.rooms[25].exits = "south|east|southeast"
      region.rooms[25].links = {}
        region.rooms[25].links.e = {}
          region.rooms[25].links.e.to = 1186
          region.rooms[25].links.e.con = ""
        region.rooms[25].links.s = {}
          region.rooms[25].links.s.to = 1179
          region.rooms[25].links.s.con = ""
        region.rooms[25].links.se = {}
          region.rooms[25].links.se.to = 1183
          region.rooms[25].links.se.con = ""
    region.rooms[26] = {}
      region.rooms[26].path = "fly gm;s"
      region.rooms[26].name = "后厅"
      region.rooms[26].zone = "古墓"
      region.rooms[26].id = 1181
      region.rooms[26].desc = "    这里是古墓的后厅，密封得严严实实，没有一丝的缝隙。在昏暗的灯光下，你发现墙上悬挂着一幅画 (picture)，似乎是一幅人物的肖像。在厅的中央，摆放着几具棺材(coffin)，其中只有一具棺材的棺板没有合上，棺材中好象空空如也。"
      region.rooms[26].exits = "north"
      region.rooms[26].links = {}
        region.rooms[26].links["tang coffin;niu lock"] = {}
          region.rooms[26].links["tang coffin;niu lock"].to = 1187
          region.rooms[26].links["tang coffin;niu lock"].con = ""
        region.rooms[26].links.n = {}
          region.rooms[26].links.n.to = 1178
          region.rooms[26].links.n.con = ""
    region.rooms[27] = {}
      region.rooms[27].path = "fly gm;n"
      region.rooms[27].name = "小厅"
      region.rooms[27].zone = "古墓"
      region.rooms[27].id = 1182
      region.rooms[27].desc = "    这里是一个小小的厅堂，也许是为了连接前厅与正厅用的。你走到这里，周围的光线亮了一些，你发觉壁上燃点着一些油灯。厅里的布置整洁而不简陋，一桌一椅都收拾的井井有条。"
      region.rooms[27].exits = "south|east|north|west"
      region.rooms[27].links = {}
        region.rooms[27].links.e = {}
          region.rooms[27].links.e.to = 1184
          region.rooms[27].links.e.con = ""
        region.rooms[27].links.w = {}
          region.rooms[27].links.w.to = 1183
          region.rooms[27].links.w.con = ""
        region.rooms[27].links.s = {}
          region.rooms[27].links.s.to = 1178
          region.rooms[27].links.s.con = ""
        region.rooms[27].links.n = {}
          region.rooms[27].links.n.to = 1186
          region.rooms[27].links.n.con = ""
    region.rooms[28] = {}
      region.rooms[28].path = "fly gm;n;w"
      region.rooms[28].name = "小屋"
      region.rooms[28].zone = "古墓"
      region.rooms[28].id = 1183
      region.rooms[28].desc = "    你走进了一间小屋，房间很小，除了一张小床放不下别的东西了。床上好象有几件叠得整整齐齐的粗布衫，洗的干干净净。"
      region.rooms[28].exits = "east|northwest"
      region.rooms[28].links = {}
        region.rooms[28].links.e = {}
          region.rooms[28].links.e.to = 1182
          region.rooms[28].links.e.con = ""
        region.rooms[28].links.nw = {}
          region.rooms[28].links.nw.to = 1180
          region.rooms[28].links.nw.con = ""
    region.rooms[29] = {}
      region.rooms[29].path = "fly gm;n;e"
      region.rooms[29].name = "蜂屋"
      region.rooms[29].zone = "古墓"
      region.rooms[29].id = 1184
      region.rooms[29].desc = "    这里是小龙女喂养训练玉蜂的蜂屋，屋角上挂着很多个六角形的蜂巢，还未进门，就闻得到一阵蜂蜜的甜香。"
      region.rooms[29].exits = "east|west"
      region.rooms[29].links = {}
        region.rooms[29].links.w = {}
          region.rooms[29].links.w.to = 1182
          region.rooms[29].links.w.con = ""
        region.rooms[29].links.e = {}
          region.rooms[29].links.e.to = 1185
          region.rooms[29].links.e.con = ""
    region.rooms[30] = {}
      region.rooms[30].path = "fly gm;n;e;e"
      region.rooms[30].name = "小屋"
      region.rooms[30].zone = "古墓"
      region.rooms[30].id = 1185
      region.rooms[30].desc = "    这里是远离正厅的一间小屋，收拾得整整洁洁一尘不染。摆设就如普通人家一般，红木的桌椅，细磁的杯壶，沉香的大床。你简直想象不到这幽深的古墓之中还有这等摆设。"
      region.rooms[30].exits = "west"
      region.rooms[30].links = {}
        region.rooms[30].links.w = {}
          region.rooms[30].links.w.to = 1184
          region.rooms[30].links.w.con = ""
    region.rooms[31] = {}
      region.rooms[31].path = "fly gm;n;n"
      region.rooms[31].name = "前厅"
      region.rooms[31].zone = "古墓"
      region.rooms[31].id = 1186
      region.rooms[31].desc = "    这里是古墓的前厅，黑黝黝的，你几乎什么也看不清。全靠大厅正中间的梁上悬挂着一颗夜明珠，映射出淡淡的黄光。厅柱都是由硕大的石柱砌成的，上面似乎还写着一些什么字--你怎么也看不清楚了。"
      region.rooms[31].exits = "south|north|west"
      region.rooms[31].links = {}
        region.rooms[31].links.w = {}
          region.rooms[31].links.w.to = 1180
          region.rooms[31].links.w.con = ""
        region.rooms[31].links.s = {}
          region.rooms[31].links.s.to = 1182
          region.rooms[31].links.s.con = ""
        region.rooms[31].links.n = {}
          region.rooms[31].links.n.to = 1176
          region.rooms[31].links.n.con = ""
    region.rooms[32] = {}
      region.rooms[32].path = "fly gm;s;tang coffin;niu lock"
      region.rooms[32].name = "密室"
      region.rooms[32].zone = "古墓"
      region.rooms[32].id = 1187
      region.rooms[32].desc = "    这里是古墓中的密室，四周密不透风，你只能借着墙上昏暗的灯光来勉强分辨方向。墙是用整块的青石砌合起来的，接合的甚是完美，你难以从中找出一丝缝隙。墙上好象雕有一些花纹。"
      region.rooms[32].exits = "up|south|north|east"
      region.rooms[32].links = {}
        region.rooms[32].links.e = {}
          region.rooms[32].links.e.to = 1188
          region.rooms[32].links.e.con = ""
        region.rooms[32].links.u = {}
          region.rooms[32].links.u.to = 1181
          region.rooms[32].links.u.con = ""
        region.rooms[32].links.s = {}
          region.rooms[32].links.s.to = 1187
          region.rooms[32].links.s.con = ""
        region.rooms[32].links.n = {}
          region.rooms[32].links.n.to = 1187
          region.rooms[32].links.n.con = ""
    region.rooms[33] = {}
      region.rooms[33].path = "fly gm;s;tang coffin;niu lock;e"
      region.rooms[33].name = "密室"
      region.rooms[33].zone = "古墓"
      region.rooms[33].id = 1188
      region.rooms[33].desc = "    这里是古墓中的密室，四周密不透风，你只能借着墙上昏暗的灯光来勉强分辨方向。墙是用整块的青石砌合起来的，接合的甚是完美，你难以从中找出一丝缝隙。墙上好象雕有一些图形。"
      region.rooms[33].exits = "south|north|east|west"
      region.rooms[33].links = {}
        region.rooms[33].links.e = {}
          region.rooms[33].links.e.to = 1189
          region.rooms[33].links.e.con = ""
        region.rooms[33].links.w = {}
          region.rooms[33].links.w.to = 1187
          region.rooms[33].links.w.con = ""
        region.rooms[33].links.s = {}
          region.rooms[33].links.s.to = 1191
          region.rooms[33].links.s.con = ""
        region.rooms[33].links.n = {}
          region.rooms[33].links.n.to = 1190
          region.rooms[33].links.n.con = ""
    region.rooms[34] = {}
      region.rooms[34].path = "fly gm;s;tang coffin;niu lock;e;e"
      region.rooms[34].name = "密室"
      region.rooms[34].zone = "古墓"
      region.rooms[34].id = 1189
      region.rooms[34].desc = "    这里是古墓中的密室，四周密不透风，你只能借着墙上昏暗的灯光来勉强分辨方向。墙是用整块的青石砌合起来的，接合的甚是完美，你难以从中找出一丝缝隙。墙上好象雕有一些诗句。"
      region.rooms[34].exits = "south|north|east|west"
      region.rooms[34].links = {}
        region.rooms[34].links.e = {}
          region.rooms[34].links.e.to = 1189
          region.rooms[34].links.e.con = ""
        region.rooms[34].links.w = {}
          region.rooms[34].links.w.to = 1188
          region.rooms[34].links.w.con = ""
        region.rooms[34].links.s = {}
          region.rooms[34].links.s.to = 1189
          region.rooms[34].links.s.con = ""
        region.rooms[34].links.n = {}
          region.rooms[34].links.n.to = 1189
          region.rooms[34].links.n.con = ""
    region.rooms[35] = {}
      region.rooms[35].path = "fly gm;s;tang coffin;niu lock;e;n"
      region.rooms[35].name = "密室"
      region.rooms[35].zone = "古墓"
      region.rooms[35].id = 1190
      region.rooms[35].desc = "    这里是古墓中的密室，四周密不透风，你只能借着墙上昏暗的灯光来勉强分辨方向。墙是用整块的青石砌合起来的，接合的甚是完美，你难以从中找出一丝缝隙。墙上好象雕有一些符号。"
      region.rooms[35].exits = "south|east|north|west"
      region.rooms[35].links = {}
        region.rooms[35].links.e = {}
          region.rooms[35].links.e.to = 1190
          region.rooms[35].links.e.con = ""
        region.rooms[35].links.s = {}
          region.rooms[35].links.s.to = 1188
          region.rooms[35].links.s.con = ""
        region.rooms[35].links.w = {}
          region.rooms[35].links.w.to = 1190
          region.rooms[35].links.w.con = ""
        region.rooms[35].links.n = {}
          region.rooms[35].links.n.to = 1190
          region.rooms[35].links.n.con = ""
    region.rooms[36] = {}
      region.rooms[36].path = "fly gm;s;tang coffin;niu lock;e;s"
      region.rooms[36].name = "密室"
      region.rooms[36].zone = "古墓"
      region.rooms[36].id = 1191
      region.rooms[36].desc = "    这里是古墓中的密室，四周密不透风，你只能借着墙上昏暗的灯光来勉强分辨方向。墙是用整块的青石砌合起来的，接合的甚是完美，你难以从中找出一丝缝隙。墙上好象雕有一些浮雕。"
      region.rooms[36].exits = "south|north|east|west"
      region.rooms[36].links = {}
        region.rooms[36].links.e = {}
          region.rooms[36].links.e.to = 1191
          region.rooms[36].links.e.con = ""
        region.rooms[36].links.w = {}
          region.rooms[36].links.w.to = 1191
          region.rooms[36].links.w.con = ""
        region.rooms[36].links.s = {}
          region.rooms[36].links.s.to = 1192
          region.rooms[36].links.s.con = ""
        region.rooms[36].links.n = {}
          region.rooms[36].links.n.to = 1188
          region.rooms[36].links.n.con = ""
    region.rooms[37] = {}
      region.rooms[37].path = "fly gm;s;tang coffin;niu lock;e;s;s"
      region.rooms[37].name = "密室"
      region.rooms[37].zone = "古墓"
      region.rooms[37].id = 1192
      region.rooms[37].desc = "    这里是古墓中的密室，四周密不透风，你只能借着墙上昏暗的灯光来勉强分辨方向。墙是用整块的青石砌合起来的，接合的甚是完美，你难以从中找出一丝缝隙。墙上好象雕有一些飞禽。"
      region.rooms[37].exits = "south|north|east|west"
      region.rooms[37].links = {}
        region.rooms[37].links.e = {}
          region.rooms[37].links.e.to = 1193
          region.rooms[37].links.e.con = ""
        region.rooms[37].links.w = {}
          region.rooms[37].links.w.to = 1192
          region.rooms[37].links.w.con = ""
        region.rooms[37].links.s = {}
          region.rooms[37].links.s.to = 1192
          region.rooms[37].links.s.con = ""
        region.rooms[37].links.n = {}
          region.rooms[37].links.n.to = 1191
          region.rooms[37].links.n.con = ""
    region.rooms[38] = {}
      region.rooms[38].path = "fly gm;s;tang coffin;niu lock;e;s;s;e"
      region.rooms[38].name = "密室"
      region.rooms[38].zone = "古墓"
      region.rooms[38].id = 1193
      region.rooms[38].desc = "    这里是古墓中的密室，四周密不透风，你只能借着墙上昏暗的灯光来勉强分辨方向。墙是用整块的青石砌合起来的，接合的甚是完美，你难以从中找出一丝缝隙。密室中摆放着一些简单的家居用具(zhuozi)，原来这是古墓派祖师林朝英的居室。"
      region.rooms[38].exits = "out|west"
      region.rooms[38].links = {}
        region.rooms[38].links.w = {}
          region.rooms[38].links.w.to = 1192
          region.rooms[38].links.w.con = ""
        region.rooms[38].links.out = {}
          region.rooms[38].links.out.to = 40
          region.rooms[38].links.out.con = ""
    region.rooms[39] = {}
      region.rooms[39].path = "fly gm;n;n;n;n;e;se;qian tan"
      region.rooms[39].name = "密室"
      region.rooms[39].zone = "古墓"
      region.rooms[39].id = 2995
      region.rooms[39].links = {}
        region.rooms[39].links.u = {}
          region.rooms[39].links.u.to = 1175
          region.rooms[39].links.u.con = ""
      region.rooms[39].exits = "up"
      region.rooms[39].desc = "    这里是古墓中的密室，四周密不透风，你只能借着墙上昏暗的灯光来勉强分辨方向。墙是用整块的青石砌合起来的，接合的甚是完美，你难以从中找出一丝缝隙。你正在欣赏，突然间发觉墙上似乎有几块砖 (brick)高高凸起，与周围的砖很不和谐。"
  region.center = 1178
return region