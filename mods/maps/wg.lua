local region = {}
  region.cmd = "fly wg"
  region.name = "武功"
  region.id = "wg"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly wg;s;e;e;e;e"
      region.rooms[1].name = "大官道"
      region.rooms[1].zone = "长安|武功"
      region.rooms[1].id = 836
      region.rooms[1].desc = "    这是一条宽阔笔直的官道，足可容得下十马并驰。往东通向函谷关，往西北则直达长安城。"
      region.rooms[1].exits = "east|northwest|west"
      region.rooms[1].links = {}
        region.rooms[1].links.e = {}
          region.rooms[1].links.e.to = 835
          region.rooms[1].links.e.con = ""
        region.rooms[1].links.nw = {}
          region.rooms[1].links.nw.to = 837
          region.rooms[1].links.nw.con = ""
        region.rooms[1].links.w = {}
          region.rooms[1].links.w.to = 854
          region.rooms[1].links.w.con = ""
    region.rooms[2] = {}
      region.rooms[2].path = "fly wg;s;e;e;e"
      region.rooms[2].name = "官道"
      region.rooms[2].zone = "武功"
      region.rooms[2].id = 854
      region.rooms[2].desc = "    这是一条大道，西面通往武功镇。道上的行人很多，大多是低着头自己赶自己的路。忽然在你的身后响起得得的马蹄声，不一会儿，几匹骏马从你身边飞驰而过，掠起了一片黄沙。"
      region.rooms[2].exits = "east|west"
      region.rooms[2].links = {}
        region.rooms[2].links.e = {}
          region.rooms[2].links.e.to = 836
          region.rooms[2].links.e.con = ""
        region.rooms[2].links.w = {}
          region.rooms[2].links.w.to = 855
          region.rooms[2].links.w.con = ""
    region.rooms[3] = {}
      region.rooms[3].path = "fly wg;s;e;e"
      region.rooms[3].name = "官道"
      region.rooms[3].zone = "武功"
      region.rooms[3].id = 855
      region.rooms[3].desc = "    这是一条官府修建的大道，西面隐约可以看见武功镇的东门。远处好象可以看见巍峨的城墙。往东是通往中原的路。走在这里，你似乎有了一种‘劝君更进一杯酒，西出阳关无故人’的感觉。"
      region.rooms[3].exits = "east|west"
      region.rooms[3].links = {}
        region.rooms[3].links.e = {}
          region.rooms[3].links.e.to = 854
          region.rooms[3].links.e.con = ""
        region.rooms[3].links.w = {}
          region.rooms[3].links.w.to = 856
          region.rooms[3].links.w.con = ""
    region.rooms[4] = {}
      region.rooms[4].path = "fly wg;s;e"
      region.rooms[4].name = "东门"
      region.rooms[4].zone = "武功"
      region.rooms[4].id = 856
      region.rooms[4].desc = "    这里是武功镇的东门，眼前城墙高耸，墙上的箭垛里好象还有人走来走去。阳光照来，城墙上闪过几道白光，似乎是兵器反射出的光。城门上题着‘东门’两个大字，门口站着一些官兵，正手持兵刃盘问着来往的行人们。"
      region.rooms[4].exits = "east|west"
      region.rooms[4].links = {}
        region.rooms[4].links.e = {}
          region.rooms[4].links.e.to = 855
          region.rooms[4].links.e.con = ""
        region.rooms[4].links.w = {}
          region.rooms[4].links.w.to = 857
          region.rooms[4].links.w.con = ""
    region.rooms[5] = {}
      region.rooms[5].path = "fly wg;s"
      region.rooms[5].name = "东街"
      region.rooms[5].zone = "武功"
      region.rooms[5].id = 857
      region.rooms[5].desc = "    这里是武功镇的东街，往东走就是武功东门了。武功镇是个小城镇，不算繁华，街上的行人也很稀少。北面是一家客栈，客栈门口挂着半副‘鸡鸣早看天’的对联，上联已经被撕掉了。南面是一座大宅院，朱红大门上布满铜钉。从这里往西走，就是武功镇的中心了。"
      region.rooms[5].exits = "south|north|east|west"
      region.rooms[5].links = {}
        region.rooms[5].links.e = {}
          region.rooms[5].links.e.to = 856
          region.rooms[5].links.e.con = ""
        region.rooms[5].links.w = {}
          region.rooms[5].links.w.to = 875
          region.rooms[5].links.w.con = ""
        region.rooms[5].links.s = {}
          region.rooms[5].links.s.to = 860
          region.rooms[5].links.s.con = ""
        region.rooms[5].links.n = {}
          region.rooms[5].links.n.to = 858
          region.rooms[5].links.n.con = ""
    region.rooms[6] = {}
      region.rooms[6].path = "fly wg"
      region.rooms[6].name = "客店"
      region.rooms[6].zone = "武功"
      region.rooms[6].id = 858
      region.rooms[6].desc = "    这是一家价钱低廉的客栈，生意非常兴隆。外地游客多选择这里落脚，你可以在这里打听到各地的风土人情。店小二里里外外忙得团团转，接待着南腔北调的客人。客店的主人从不露面，他究竟是谁，有各种各样的猜测。墙上挂着一个牌子(paizi)。"
      region.rooms[6].exits = "up|south"
      region.rooms[6].links = {}
        region.rooms[6].links.s = {}
          region.rooms[6].links.s.to = 857
          region.rooms[6].links.s.con = ""
        region.rooms[6].links.u = {}
          region.rooms[6].links.u.to = 859
          region.rooms[6].links.u.con = ""
    region.rooms[7] = {}
      region.rooms[7].path = "fly wg;u"
      region.rooms[7].name = "客店二楼"
      region.rooms[7].zone = "武功"
      region.rooms[7].id = 859
      region.rooms[7].desc = "    这是一间很大的客房，陈设十分简陋。靠墙放了十几张小木床，不少客人正和衣而卧，满屋子都是呼呼的打酣声。西边有张床是空的，你蹑手蹑脚地走了过去。"
      region.rooms[7].exits = "down"
      region.rooms[7].links = {}
        region.rooms[7].links.d = {}
          region.rooms[7].links.d.to = 858
          region.rooms[7].links.d.con = ""
    region.rooms[8] = {}
      region.rooms[8].path = "fly wg;s;s"
      region.rooms[8].name = "富家大门"
      region.rooms[8].zone = "武功"
      region.rooms[8].id = 860
      region.rooms[8].desc = "    这里是武功镇上首富--侯员外家的大门，门上挂着一块大横匾，上面写着‘侯府’两个大字。门内立着一面朱红的影壁，模模糊糊好象题着一些诗句之类的东西。几个横眉立眼的家丁正挺胸凸肚地站在门口耀武扬威，看来这是一家为富不仁的乡绅列霸。"
      region.rooms[8].exits = "south|north"
      region.rooms[8].links = {}
        region.rooms[8].links.s = {}
          region.rooms[8].links.s.to = 861
          region.rooms[8].links.s.con = ""
        region.rooms[8].links.n = {}
          region.rooms[8].links.n.to = 857
          region.rooms[8].links.n.con = ""
    region.rooms[9] = {}
      region.rooms[9].path = "fly wg;s;s;s"
      region.rooms[9].name = "富家小院"
      region.rooms[9].zone = "武功"
      region.rooms[9].id = 861
      region.rooms[9].links = {}
        region.rooms[9].links.e = {}
          region.rooms[9].links.e.to = 862
          region.rooms[9].links.e.con = ""
        region.rooms[9].links.w = {}
          region.rooms[9].links.w.to = 866
          region.rooms[9].links.w.con = ""
        region.rooms[9].links.s = {}
          region.rooms[9].links.s.to = 864
          region.rooms[9].links.s.con = ""
        region.rooms[9].links.n = {}
          region.rooms[9].links.n.to = 860
          region.rooms[9].links.n.con = ""
      region.rooms[9].exits = "south|east|north|west"
      region.rooms[9].desc = "    这是进门后的一个小院落。西面是一道侧门，东面是一扇月形门好象通往花厅，北面是大门，南面就是大堂了。几个穷汉正垂头丧气地站在小院中，可能是因为缴不起租被抓来了。"
    region.rooms[10] = {}
      region.rooms[10].path = "fly wg;s;s;s;e"
      region.rooms[10].name = "花厅"
      region.rooms[10].zone = "武功"
      region.rooms[10].id = 862
      region.rooms[10].links = {}
        region.rooms[10].links.w = {}
          region.rooms[10].links.w.to = 861
          region.rooms[10].links.w.con = ""
        region.rooms[10].links.s = {}
          region.rooms[10].links.s.to = 863
          region.rooms[10].links.s.con = ""
      region.rooms[10].exits = "south|west"
      region.rooms[10].desc = "    这里是这户人家喝酒赏月的所在，一个小亭子建造在厅的中央，四周围绕着一些葡萄藤(teng)。一阵微风吹过，空气中似乎有隐隐的花香飘来，中人欲醉。"
    region.rooms[11] = {}
      region.rooms[11].path = "fly wg;s;s;s;e;s"
      region.rooms[11].name = "侧厅"
      region.rooms[11].zone = "武功"
      region.rooms[11].id = 863
      region.rooms[11].links = {}
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 864
          region.rooms[11].links.w.con = ""
        region.rooms[11].links.n = {}
          region.rooms[11].links.n.to = 862
          region.rooms[11].links.n.con = ""
      region.rooms[11].exits = "north|west"
      region.rooms[11].desc = "    这是正堂旁边的一间小厅，本来是用作书房的，只是侯员外家实在找不出多少书来装点门面，所以就整治成了招待熟客的地方。厅中摆放着一张八仙桌和几把椅子，桌上刚沏好的茶还在冒着热气。"
    region.rooms[12] = {}
      region.rooms[12].path = "fly wg;s;s;s;s"
      region.rooms[12].name = "富家大堂"
      region.rooms[12].zone = "武功"
      region.rooms[12].id = 864
      region.rooms[12].links = {}
        region.rooms[12].links.e = {}
          region.rooms[12].links.e.to = 863
          region.rooms[12].links.e.con = ""
        region.rooms[12].links.s = {}
          region.rooms[12].links.s.to = 868
          region.rooms[12].links.s.con = ""
        region.rooms[12].links.w = {}
          region.rooms[12].links.w.to = 865
          region.rooms[12].links.w.con = ""
        region.rooms[12].links.n = {}
          region.rooms[12].links.n.to = 861
          region.rooms[12].links.n.con = ""
      region.rooms[12].exits = "south|north|east|west"
      region.rooms[12].desc = "    这里是侯员外家的大堂，堂梁上挂着一块匾(bian)。堂内摆放着一些八仙桌和椅子，堂壁上梅兰竹菊的竹帘被挂成了兰竹菊梅，看来这家也不过是附庸风雅的暴发户而已。"
    region.rooms[13] = {}
      region.rooms[13].path = "fly wg;s;s;s;s;w"
      region.rooms[13].name = "帐房"
      region.rooms[13].zone = "武功"
      region.rooms[13].id = 865
      region.rooms[13].links = {}
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 864
          region.rooms[13].links.e.con = ""
      region.rooms[13].exits = "east"
      region.rooms[13].desc = "    这里是侯员外家的帐房。屋内青砖铺地，进门处横摆着一张桌子，一个管家正坐在桌后，小眼睛不住地跟着你转，好象又在打什么坏主意。"
    region.rooms[14] = {}
      region.rooms[14].path = "fly wg;s;w;s;se"
      region.rooms[14].name = "富家侧门"
      region.rooms[14].zone = "武功"
      region.rooms[14].id = 866
      region.rooms[14].links = {}
        region.rooms[14].links.e = {}
          region.rooms[14].links.e.to = 861
          region.rooms[14].links.e.con = ""
        region.rooms[14].links.nw = {}
          region.rooms[14].links.nw.to = 867
          region.rooms[14].links.nw.con = ""
      region.rooms[14].exits = "east|northwest"
      region.rooms[14].desc = "    这里是一道小门，可能是由于怕进出不方便而修建的。门虽然小，但还修饰得人模人样，门上嵌着两个大铜环。几条大狼狗懒洋洋躺在门边，一看见有人进来就‘汪汪’地乱吠。出了门就是武功镇的南街了，进门后是富家的小院。"
    region.rooms[15] = {}
      region.rooms[15].path = "fly wg;s;w;s"
      region.rooms[15].name = "南街"
      region.rooms[15].zone = "武功"
      region.rooms[15].id = 867
      region.rooms[15].links = {}
        region.rooms[15].links.n = {}
          region.rooms[15].links.n.to = 875
          region.rooms[15].links.n.con = ""
        region.rooms[15].links.se = {}
          region.rooms[15].links.se.to = 866
          region.rooms[15].links.se.con = ""
      region.rooms[15].exits = "north|southeast"
      region.rooms[15].desc = "    这里是武功的南街，说是街，不过是一条小胡同而已。路上一个人也没有。街的尽头有一扇小门。从这里往北，就是武功镇的中心了。"
    region.rooms[16] = {}
      region.rooms[16].path = "fly wg;s;s;s;s;s"
      region.rooms[16].name = "后院"
      region.rooms[16].zone = "武功"
      region.rooms[16].id = 868
      region.rooms[16].links = {}
        region.rooms[16].links.se = {}
          region.rooms[16].links.se.to = 872
          region.rooms[16].links.se.con = ""
        region.rooms[16].links.s = {}
          region.rooms[16].links.s.to = 869
          region.rooms[16].links.s.con = ""
        region.rooms[16].links.n = {}
          region.rooms[16].links.n.to = 864
          region.rooms[16].links.n.con = ""
      region.rooms[16].exits = "south|north|southeast"
      region.rooms[16].desc = "    这里是后院。走到这里，花香味更加浓烈了。你仔细一看，东南边有一道圆形门，似乎花香是从那里传出来的。从这里再往南走，就是侯员外的卧室了。"
    region.rooms[17] = {}
      region.rooms[17].path = "fly wg;s;s;s;s;s;s"
      region.rooms[17].name = "卧室"
      region.rooms[17].zone = "武功"
      region.rooms[17].id = 869
      region.rooms[17].links = {}
        region.rooms[17].links.d = {}
          region.rooms[17].links.d.to = 870
          region.rooms[17].links.d.con = ""
        region.rooms[17].links.n = {}
          region.rooms[17].links.n.to = 868
          region.rooms[17].links.n.con = ""
      region.rooms[17].exits = "north"
      region.rooms[17].desc = "    这里是侯员外的卧室，卧室中央横拉着一道大帘子。在帘后有一张雕着八仙过海的大床，床头有一个抽屉(drawer)。床上铺丝陈缎，厚厚的锦被看起来很舒服，你不禁想在这里安然大睡了。"
    region.rooms[18] = {}
      region.rooms[18].path = "fly wg;s;s;s;s;s;s;d"
      region.rooms[18].name = "密道"
      region.rooms[18].zone = "武功"
      region.rooms[18].id = 870
      region.rooms[18].links = {}
        region.rooms[18].links.se = {}
          region.rooms[18].links.se.to = 871
          region.rooms[18].links.se.con = ""
      region.rooms[18].exits = "southeast"
      region.rooms[18].desc = "    这里是侯员外卧室下的密道，听说许多佃户由于缴不起租，被侯员外的爪牙抓到这里来拷打。四周好象有一些浅褐色干的血渍，空气中夹杂着一种令人毛骨悚然的腥气。你不由地有些害怕起来，心想还是赶快离开这里吧。"
    region.rooms[19] = {}
      region.rooms[19].path = "fly wg;s;s;s;s;s;s;d;se"
      region.rooms[19].name = "密室"
      region.rooms[19].zone = "武功"
      region.rooms[19].id = 871
      region.rooms[19].links = {}
        region.rooms[19].links.nw = {}
          region.rooms[19].links.nw.to = 870
          region.rooms[19].links.nw.con = ""
        region.rooms[19].links.u = {}
          region.rooms[19].links.u.to = 869
          region.rooms[19].links.u.con = ""
      region.rooms[19].exits = "up|northwest"
      region.rooms[19].desc = "    这里是一间密室，四周散布着几条带血的鞭子，还有一些各种各样的刑具。看来传说果然不虚，这侯员外果真是个鱼肉乡里的恶霸。"
    region.rooms[20] = {}
      region.rooms[20].path = "fly wg;s;s;s;s;s;se"
      region.rooms[20].name = "后花园"
      region.rooms[20].zone = "武功"
      region.rooms[20].id = 872
      region.rooms[20].links = {}
        region.rooms[20].links.e = {}
          region.rooms[20].links.e.to = 874
          region.rooms[20].links.e.con = ""
        region.rooms[20].links.s = {}
          region.rooms[20].links.s.to = 873
          region.rooms[20].links.s.con = ""
        region.rooms[20].links.nw = {}
          region.rooms[20].links.nw.to = 868
          region.rooms[20].links.nw.con = ""
      region.rooms[20].exits = "south|east|northwest"
      region.rooms[20].desc = "    这里是一个小花园，杂乱地种着各种花草，看来无人打理，杂草已经长得很高了。有一些红的，白的鲜花夹杂在草丛中，阵阵花香不断地飘过。东面有一道小门，南面是一座两层小楼。"
    region.rooms[21] = {}
      region.rooms[21].path = "fly wg;s;s;s;s;s;se;s"
      region.rooms[21].name = "观景楼"
      region.rooms[21].zone = "武功"
      region.rooms[21].id = 873
      region.rooms[21].links = {}
        region.rooms[21].links.n = {}
          region.rooms[21].links.n.to = 872
          region.rooms[21].links.n.con = ""
      region.rooms[21].exits = "north"
      region.rooms[21].desc = "    这里是一座两层的小楼，是建筑在庄园边缘用来登高凭拦看风景的。你轻轻靠在栏杆上，竟朽的吱吱做响。看来已经很久没有人有这个雅兴来这里看风景了。窗户(window)上的窗纸已经破了不少，风一吹哗哗的响。"
    region.rooms[22] = {}
      region.rooms[22].path = "fly wg;s;s;s;s;s;se;e"
      region.rooms[22].name = "后花园"
      region.rooms[22].zone = "武功"
      region.rooms[22].id = 874
      region.rooms[22].links = {}
        region.rooms[22].links.w = {}
          region.rooms[22].links.w.to = 872
          region.rooms[22].links.w.con = ""
      region.rooms[22].exits = "west"
      region.rooms[22].desc = "    这是一片荒废了的花园，本来这里有一片小池塘，养着一些金鱼之类，现在池塘差不多也干涸了。池塘边立着一座假山，山上长满了青苔，看来已经很久没有人来过了。"
    region.rooms[23] = {}
      region.rooms[23].path = "fly wg;s;w"
      region.rooms[23].name = "中心广场"
      region.rooms[23].zone = "武功"
      region.rooms[23].id = 875
      region.rooms[23].links = {}
        region.rooms[23].links.e = {}
          region.rooms[23].links.e.to = 857
          region.rooms[23].links.e.con = ""
        region.rooms[23].links.w = {}
          region.rooms[23].links.w.to = 880
          region.rooms[23].links.w.con = ""
        region.rooms[23].links.s = {}
          region.rooms[23].links.s.to = 867
          region.rooms[23].links.s.con = ""
        region.rooms[23].links.n = {}
          region.rooms[23].links.n.to = 876
          region.rooms[23].links.n.con = ""
      region.rooms[23].exits = "south|north|east|west"
      region.rooms[23].desc = "    这里是武功镇的中心广场，武功镇是个小镇，只有四条大街--分别是东街，西街，南街和北街，都在这里汇合。走到这里，路上的行人多了些，见了你都和和气气地拱手为礼。"
    region.rooms[24] = {}
      region.rooms[24].path = "fly wg;s;w;n"
      region.rooms[24].name = "北街"
      region.rooms[24].zone = "武功"
      region.rooms[24].id = 876
      region.rooms[24].links = {}
        region.rooms[24].links.s = {}
          region.rooms[24].links.s.to = 875
          region.rooms[24].links.s.con = ""
        region.rooms[24].links.w = {}
          region.rooms[24].links.w.to = 877
          region.rooms[24].links.w.con = ""
        region.rooms[24].links.n = {}
          region.rooms[24].links.n.to = 878
          region.rooms[24].links.n.con = ""
      region.rooms[24].exits = "south|north|west"
      region.rooms[24].desc = "    北街是武功镇最繁华的街道，每逢初一十五，还要在这里举行些庙会之类的聚会。街北面是一家酒楼，楼前挂着一条蓝幅，上面写了个大大的‘酒’字。西面是一户人家。几个小孩在街上笑着闹着互相追逐。"
    region.rooms[25] = {}
      region.rooms[25].path = "fly wg;s;w;n;w"
      region.rooms[25].name = "民居"
      region.rooms[25].zone = "武功"
      region.rooms[25].id = 877
      region.rooms[25].links = {}
        region.rooms[25].links.e = {}
          region.rooms[25].links.e.to = 876
          region.rooms[25].links.e.con = ""
      region.rooms[25].exits = "east"
      region.rooms[25].desc = "    这好象是一家相对殷实的小康人家，屋内铺着青砖，摆着一套红木桌椅。墙上挂着几幅山水画(hua)， 主人不在家里。"
    region.rooms[26] = {}
      region.rooms[26].path = "fly wg;s;w;n;n"
      region.rooms[26].name = "酒楼"
      region.rooms[26].zone = "武功"
      region.rooms[26].id = 878
      region.rooms[26].links = {}
        region.rooms[26].links.s = {}
          region.rooms[26].links.s.to = 876
          region.rooms[26].links.s.con = ""
        region.rooms[26].links.u = {}
          region.rooms[26].links.u.to = 879
          region.rooms[26].links.u.con = ""
      region.rooms[26].exits = "up|south"
      region.rooms[26].desc = "    这家酒楼是武功镇方圆百里内的唯一一家，不过连名字都没有。楼下布置简易，顾客多是匆匆的行人，买点包子、鸡腿、米酒就赶路去了。楼上是雅座。"
    region.rooms[27] = {}
      region.rooms[27].path = "fly wg;s;w;n;n;u"
      region.rooms[27].name = "酒楼二楼"
      region.rooms[27].zone = "武功"
      region.rooms[27].id = 879
      region.rooms[27].links = {}
        region.rooms[27].links.d = {}
          region.rooms[27].links.d.to = 878
          region.rooms[27].links.d.con = ""
      region.rooms[27].exits = "down"
      region.rooms[27].desc = "    这里是雅座，文人学士经常在这里吟诗作画，富商土豪也在这里边吃喝边作交易。这里也是城里举办喜宴的最佳场所。你站在楼上眺望，只觉得心怀坦荡。四周全是漫漫的黄沙，比之江南的花香鸟语，气势更是浩荡。酒楼的墙上挂着一块牌子(paizi)。"
    region.rooms[28] = {}
      region.rooms[28].path = "fly wg;s;w;w"
      region.rooms[28].name = "西街"
      region.rooms[28].zone = "武功"
      region.rooms[28].id = 880
      region.rooms[28].links = {}
        region.rooms[28].links.e = {}
          region.rooms[28].links.e.to = 875
          region.rooms[28].links.e.con = ""
        region.rooms[28].links.w = {}
          region.rooms[28].links.w.to = 883
          region.rooms[28].links.w.con = ""
        region.rooms[28].links.s = {}
          region.rooms[28].links.s.to = 882
          region.rooms[28].links.s.con = ""
        region.rooms[28].links.n = {}
          region.rooms[28].links.n.to = 881
          region.rooms[28].links.n.con = ""
      region.rooms[28].exits = "south|north|east|west"
      region.rooms[28].desc = "    武功镇的西面是贫苦百姓的聚居区，西街比起其他几条街道来也显得破朽杂乱得多。街南面是一座年久失修的小庙，已经摇摇欲坠了。北面是一户低矮的茅屋，西面是武功的西门。从这里转而往东，就走到武功镇的中心了。"
    region.rooms[29] = {}
      region.rooms[29].path = "fly wg;s;w;w;n"
      region.rooms[29].name = "民居"
      region.rooms[29].zone = "武功"
      region.rooms[29].id = 881
      region.rooms[29].links = {}
        region.rooms[29].links.s = {}
          region.rooms[29].links.s.to = 880
          region.rooms[29].links.s.con = ""
      region.rooms[29].exits = "south"
      region.rooms[29].desc = "    这是一家用茅草搭的房屋，家徒四壁，屋角的米缸是空的，厨房内的水缸也是空的。几个缺胳膊少腿的桌椅靠墙立着。看来主人已经把所有能值钱的东西全都变卖了。"
    region.rooms[30] = {}
      region.rooms[30].path = "fly wg;s;w;w;s"
      region.rooms[30].name = "土地庙"
      region.rooms[30].zone = "武功"
      region.rooms[30].id = 882
      region.rooms[30].links = {}
        region.rooms[30].links.n = {}
          region.rooms[30].links.n.to = 880
          region.rooms[30].links.n.con = ""
      region.rooms[30].exits = "north"
      region.rooms[30].desc = "    这座庙宇原本是武功镇中的土地庙，不过因为很久没有修缮过，已经破烂不堪。土地爷的金身也只剩下了半截，供桌只剩下了三条腿，窗框已经全被下光了，被附近的贫苦百姓拿回家去生火取暖。这里平常是没有人来的，只有一些游手好闲的地痞流氓之类把这里当做了家。"
    region.rooms[31] = {}
      region.rooms[31].path = "fly wg;s;w;w;w"
      region.rooms[31].name = "西门"
      region.rooms[31].zone = "武功"
      region.rooms[31].id = 883
      region.rooms[31].links = {}
        region.rooms[31].links.e = {}
          region.rooms[31].links.e.to = 880
          region.rooms[31].links.e.con = ""
        region.rooms[31].links.ne = {}
          region.rooms[31].links.ne.to = 884
          region.rooms[31].links.ne.con = ""
      region.rooms[31].exits = "east|northeast"
      region.rooms[31].desc = "    这里是武功镇的西门，眼前城墙高耸，墙上的箭垛里好象还有人走来走去。阳光照来，城墙上闪过几道白光，似乎是兵器反射出的光。城门上题着‘西门’两个大字，门口站着一些官兵，正手持兵刃盘问着来往的行人们。从这里折而向北，就是终南山脚了。"
    region.rooms[32] = {}
      region.rooms[32].path = "fly wg;s;w;w;w;ne"
      region.rooms[32].name = "山路"
      region.rooms[32].zone = "武功|终南山"
      region.rooms[32].id = 884
      region.rooms[32].links = {}
        region.rooms[32].links.nu = {}
          region.rooms[32].links.nu.to = 885
          region.rooms[32].links.nu.con = ""
        region.rooms[32].links.sw = {}
          region.rooms[32].links.sw.to = 883
          region.rooms[32].links.sw.con = ""
        region.rooms[32].links.eu = {}
          region.rooms[32].links.eu.to = 1099
          region.rooms[32].links.eu.con = ""
      region.rooms[32].exits = "eastup|northup|southwest"
      region.rooms[32].desc = "    从武功西门出来，路势变急了，这是一条用石块铺成的山路。路两旁光秃秃的，没有什么树木，全是一块块的大石头。这条路好象通往前面的终南山上。北面有一个小村庄，村中正升起冉冉的炊烟。"
    region.rooms[33] = {}
      region.rooms[33].path = "fly wg;s;w;w;w;ne;nu"
      region.rooms[33].name = "小村庄"
      region.rooms[33].zone = "武功"
      region.rooms[33].id = 885
      region.rooms[33].links = {}
        region.rooms[33].links.sd = {}
          region.rooms[33].links.sd.to = 884
          region.rooms[33].links.sd.con = ""
        region.rooms[33].links.nw = {}
          region.rooms[33].links.nw.to = 886
          region.rooms[33].links.nw.con = ""
      region.rooms[33].exits = "northwest|southdown"
      region.rooms[33].desc = "    这是一片小村庄，隐藏在一个小山坳里。这里的居民们都很少到城里去，虽然离武功镇不过是五、六里的山路，他们宁愿秉承着男耕女纺织、日出而作日落而歇的老传统。日子虽然清贫，却还算逍遥。"
    region.rooms[34] = {}
      region.rooms[34].path = "fly wg;s;w;w;w;ne;nu;nw"
      region.rooms[34].name = "晒谷场"
      region.rooms[34].zone = "武功"
      region.rooms[34].id = 886
      region.rooms[34].links = {}
        region.rooms[34].links.n = {}
          region.rooms[34].links.n.to = 887
          region.rooms[34].links.n.con = ""
        region.rooms[34].links.sw = {}
          region.rooms[34].links.sw.to = 888
          region.rooms[34].links.sw.con = ""
        region.rooms[34].links.nw = {}
          region.rooms[34].links.nw.to = 889
          region.rooms[34].links.nw.con = ""
        region.rooms[34].links.se = {}
          region.rooms[34].links.se.to = 885
          region.rooms[34].links.se.con = ""
      region.rooms[34].exits = "northwest|north|southeast|southwest"
      region.rooms[34].desc = "    这里是村庄中心的晒谷场，地方不大，不过村里也就五、六户人家，种的谷子也够晒了。现在正是收获的季节，谷场中堆满了谷子，几个男女童子正在场中嬉闹，不时地扬起一捧谷子相互撒去。"
    region.rooms[35] = {}
      region.rooms[35].path = "fly wg;s;w;w;w;ne;nu;nw;n"
      region.rooms[35].name = "村长家"
      region.rooms[35].zone = "武功"
      region.rooms[35].id = 887
      region.rooms[35].links = {}
        region.rooms[35].links.s = {}
          region.rooms[35].links.s.to = 886
          region.rooms[35].links.s.con = ""
      region.rooms[35].exits = "south"
      region.rooms[35].desc = "    这里是村长的家，堂屋里堆放着一些锄头、镰刀之类的农耕用具，有一些是村中村民家里坏了，来央求村长给修的。屋檐前吊着数十串鲜红的辣椒，还有一些风干的野味。"
    region.rooms[36] = {}
      region.rooms[36].path = "fly wg;s;w;w;w;ne;nu;nw;sw"
      region.rooms[36].name = "民居"
      region.rooms[36].zone = "武功"
      region.rooms[36].id = 888
      region.rooms[36].links = {}
        region.rooms[36].links.ne = {}
          region.rooms[36].links.ne.to = 886
          region.rooms[36].links.ne.con = ""
      region.rooms[36].exits = "northeast"
      region.rooms[36].desc = "    这间屋子你一进来就看见屋角大袋小袋地堆满了粮食，看得出来今年的收成确实不错。屋内坐着一位村民，正笑嘻嘻地看着自己的积粮，也许正在盘算这个冬天又不愁了。"
    region.rooms[37] = {}
      region.rooms[37].path = "fly wg;s;w;w;w;ne;nu;nw;nw"
      region.rooms[37].name = "民居"
      region.rooms[37].zone = "武功"
      region.rooms[37].id = 889
      region.rooms[37].links = {}
        region.rooms[37].links.se = {}
          region.rooms[37].links.se.to = 886
          region.rooms[37].links.se.con = ""
      region.rooms[37].exits = "southeast"
      region.rooms[37].desc = "    这是一所乡间民居，桌椅都很旧了，而且看得出来是自己敲敲打打给拼补下来的，不过擦拭得很干净。墙壁上斜倚着一支猎叉，也许这家的主人还是个捕猎高手。"
  region.center = 858
return region