local region = {}
  region.cmd = "fly xx"
  region.name = "���޺�"
  region.id = "xx"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly ca"
      region.rooms[1].name = "ʮ�ֽ�ͷ"
      region.rooms[1].zone = "����|���޺�"
      region.rooms[1].id = 839
      region.rooms[1].links = {}
        region.rooms[1].links.e = {}
          region.rooms[1].links.e.to = 838
          region.rooms[1].links.e.con = ""
        region.rooms[1].links.w = {}
          region.rooms[1].links.w.to = 841
          region.rooms[1].links.w.con = ""
        region.rooms[1].links.s = {}
          region.rooms[1].links.s.to = 840
          region.rooms[1].links.s.con = ""
        region.rooms[1].links.n = {}
          region.rooms[1].links.n.to = 844
          region.rooms[1].links.n.con = ""
      region.rooms[1].exits = "south|east|north|west"
      region.rooms[1].desc = "    ������ǳ����ǵ����ģ�������ֽ����ڴˡ�һ��Ρ��ߴ����¥������ǰ��������Щ���ơ�ÿ���峿�����������������ŵ����������򳤰��ǵĴ��С�·�ڳ�ˮ�����������˳����ϡ�"
    region.rooms[2] = {}
      region.rooms[2].path = "fly ca;w"
      region.rooms[2].name = "����������"
      region.rooms[2].zone = "����|���޺�"
      region.rooms[2].id = 841
      region.rooms[2].links = {}
        region.rooms[2].links.e = {}
          region.rooms[2].links.e.to = 839
          region.rooms[2].links.e.con = ""
        region.rooms[2].links.w = {}
          region.rooms[2].links.w.to = 842
          region.rooms[2].links.w.con = ""
      region.rooms[2].exits = "east|west"
      region.rooms[2].desc = "    �����ǳ����ǵ����š�����͵��˳��У�Զ����ɽ�˺����������˳�������������һ����·ͨ��Զ������������һЩִ�ڵı�ʿ��ʱ����������̫ƽ����һ�ɱ�������Ӣ�˲���������Ķ���������ʿ��"
    region.rooms[3] = {}
      region.rooms[3].path = "fly ca;w;w"
      region.rooms[3].name = "���"
      region.rooms[3].zone = "����|���޺�"
      region.rooms[3].id = 842
      region.rooms[3].links = {}
        region.rooms[3].links.e = {}
          region.rooms[3].links.e.to = 841
          region.rooms[3].links.e.con = ""
        region.rooms[3].links.w = {}
          region.rooms[3].links.w.to = 843
          region.rooms[3].links.w.con = ""
      region.rooms[3].exits = "east|west"
      region.rooms[3].desc = "    ������һ����ʯ����ϣ��������������һ����ǳأ�����ǽ������Ʈ�������ǳ����ˡ�������ȥһƬ�����ͻ�Ұ��"
    region.rooms[4] = {}
      region.rooms[4].path = "fly ca;w;w;w"
      region.rooms[4].name = "���"
      region.rooms[4].zone = "����|���޺�"
      region.rooms[4].id = 843
      region.rooms[4].links = {}
        region.rooms[4].links.e = {}
          region.rooms[4].links.e.to = 842
          region.rooms[4].links.e.con = ""
        region.rooms[4].links.nu = {}
          region.rooms[4].links.nu.to = 2317
          region.rooms[4].links.nu.con = ""
      region.rooms[4].exits = "east|northup"
      region.rooms[4].desc = "    ����һ����ʯ�����������Լ���Կ��������ǵĳ�ǽ����������Сɽ��"
    region.rooms[5] = {}
      region.rooms[5].path = "fly xx;su;s;ed;se;sw"
      region.rooms[5].name = "��ԭ"
      region.rooms[5].zone = "Ѫ����|���޺�"
      region.rooms[5].id = 2151
      region.rooms[5].links = {}
        region.rooms[5].links.w = {}
          region.rooms[5].links.w.to = 2150
          region.rooms[5].links.w.con = ""
        region.rooms[5].links.ne = {}
          region.rooms[5].links.ne.to = 2312
          region.rooms[5].links.ne.con = ""
      region.rooms[5].exits = "northeast|west"
      region.rooms[5].desc = "    ������ѩɽ���µ�һƬ��ԭ�������������Ⱥɽ��ɽ���ϻ������겻����ѩ��������һ����·��"
    region.rooms[6] = {}
      region.rooms[6].path = "fly xx"
      region.rooms[6].name = "���޺�"
      region.rooms[6].zone = "���޺�"
      region.rooms[6].id = 2285
      region.rooms[6].desc = "    ���������޺��ߡ�˵�Ǻ�����ʵ��Ƭ���������󣬵���ʮ���ն񡣶���ʯ����һ���ѷ�ͨ��һ��ɽ����������һ���ݾ���ͨ������ɽ��"
      region.rooms[6].exits = "westup|south|north|southup"
      region.rooms[6].links = {}
        region.rooms[6].links.n = {}
          region.rooms[6].links.n.to = 2286
          region.rooms[6].links.n.con = "k1:ժ����"
        region.rooms[6].links.wu = {}
          region.rooms[6].links.wu.to = 2298
          region.rooms[6].links.wu.con = "k1:ժ����"
        region.rooms[6].links.su = {}
          region.rooms[6].links.su.to = 2303
          region.rooms[6].links.su.con = ""
    region.rooms[7] = {}
      region.rooms[7].path = "fly xx;|!k1:ժ����:n|"
      region.rooms[7].name = "���޺�"
      region.rooms[7].zone = "���޺�"
      region.rooms[7].id = 2286
      region.rooms[7].desc = "    ���������޺��ߡ�˵�Ǻ�����ʵ��Ƭ���������󣬵���ʮ���ն�������������ͨ�����޺��������ͨ���������ܶ橤�����¶�����������һ������(paizi)��"
      region.rooms[7].exits = "south|northwest|north|northeast"
      region.rooms[7].links = {}
        region.rooms[7].links.ne = {}
          region.rooms[7].links.ne.to = 2296
          region.rooms[7].links.ne.con = "aw:3:flatter ��������"
        region.rooms[7].links.s = {}
          region.rooms[7].links.s.to = 2285
          region.rooms[7].links.s.con = ""
        region.rooms[7].links.nw = {}
          region.rooms[7].links.nw.to = 2288
          region.rooms[7].links.nw.con = "aw:3:flatter ��������"
        region.rooms[7].links.n = {}
          region.rooms[7].links.n.to = 2287
          region.rooms[7].links.n.con = "aw:3:flatter ��������"
    region.rooms[8] = {}
      region.rooms[8].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:n|"
      region.rooms[8].name = "���¶�"
      region.rooms[8].zone = "���޺�"
      region.rooms[8].id = 2287
      region.rooms[8].desc = "    �������������ܶ����ڵ����¶������ڵƻ�ͨ��������һ�ѻ�Ƥ���϶����������������˶����������װ���Ż�Ƥ��¹ͷ�����𣬼�һЩ�ֻ�(zihua)�����������������ܣ��������еĴ���Ǹ��ֹ�����"
      region.rooms[8].exits = "south"
      region.rooms[8].links = {}
        region.rooms[8].links.s = {}
          region.rooms[8].links.s.to = 2286
          region.rooms[8].links.s.con = ""
    region.rooms[9] = {}
      region.rooms[9].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:nw|"
      region.rooms[9].name = "���޺�"
      region.rooms[9].zone = "���޺�"
      region.rooms[9].id = 2288
      region.rooms[9].desc = "    ���������޺��ߡ�˵�Ǻ�����ʵ��Ƭ���������󣬵���ʮ���ն�����ͨ�����޺������������һ�����̵�ʯͷ·��"
      region.rooms[9].exits = "northwest|southeast|northeast|west"
      region.rooms[9].links = {}
        region.rooms[9].links.ne = {}
          region.rooms[9].links.ne.to = 2297
          region.rooms[9].links.ne.con = ""
        region.rooms[9].links.w = {}
          region.rooms[9].links.w.to = 2966
          region.rooms[9].links.w.con = ""
        region.rooms[9].links.nw = {}
          region.rooms[9].links.nw.to = 2295
          region.rooms[9].links.nw.con = ""
        region.rooms[9].links.se = {}
          region.rooms[9].links.se.to = 2286
          region.rooms[9].links.se.con = ""
    region.rooms[10] = {}
      region.rooms[10].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:nw|;w;|!k1:�ɻ���:enter|"
      region.rooms[10].name = "��ң��"
      region.rooms[10].zone = "���޺�"
      region.rooms[10].id = 2289
      region.rooms[10].desc = "    ����һ���ֲڵ�ʯ�����������˼��ų����Ĳݵ��ӡ������Ա���һЩ�ƾƹ��ӡ�����(wall)����Щ�ּ���"
      region.rooms[10].exits = "out"
      region.rooms[10].links = {}
        region.rooms[10].links.out = {}
          region.rooms[10].links.out.to = 2966
          region.rooms[10].links.out.con = ""
    region.rooms[11] = {}
      region.rooms[11].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:nw|;w;nw"
      region.rooms[11].name = "С·"
      region.rooms[11].zone = "���޺�"
      region.rooms[11].id = 2290
      region.rooms[11].desc = "    ������һ����ɽ�����˹����������᫵�С·�ϣ���������������������������׵����"
      region.rooms[11].exits = "northup|southeast"
      region.rooms[11].links = {}
        region.rooms[11].links.nu = {}
          region.rooms[11].links.nu.to = 2291
          region.rooms[11].links.nu.con = ""
        region.rooms[11].links.se = {}
          region.rooms[11].links.se.to = 2966
          region.rooms[11].links.se.con = ""
    region.rooms[12] = {}
      region.rooms[12].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:nw|;w;nw;nu"
      region.rooms[12].name = "С·"
      region.rooms[12].zone = "���޺�"
      region.rooms[12].id = 2291
      region.rooms[12].danger = 3
      region.rooms[12].desc = "    ɽ�������･�����ƽ�������Ѿ�������������ɽ���׵�ˮ����������һ��ɽ����"
      region.rooms[12].exits = "north|enter|southdown"
      region.rooms[12].links = {}
        region.rooms[12].links.enter = {}
          region.rooms[12].links.enter.to = 2292
          region.rooms[12].links.enter.con = ""
        region.rooms[12].links.sd = {}
          region.rooms[12].links.sd.to = 2290
          region.rooms[12].links.sd.con = ""
        region.rooms[12].links.n = {}
          region.rooms[12].links.n.to = 2293
          region.rooms[12].links.n.con = ""
    region.rooms[13] = {}
      region.rooms[13].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:nw|;w;nw;nu;enter"
      region.rooms[13].name = "�����ɴ�����"
      region.rooms[13].zone = "���޺�"
      region.rooms[13].id = 2292
      region.rooms[13].desc = "    ����ԭ����һ������ɽ���ϵ���Ȼ�ܶ�����Ϊ�ص����ܶ��Ҷ��п���ʮ�ָ�������ɰ�����������һ���ֿ⡣"
      region.rooms[13].exits = "out"
      region.rooms[13].links = {}
        region.rooms[13].links.out = {}
          region.rooms[13].links.out.to = 2291
          region.rooms[13].links.out.con = ""
    region.rooms[14] = {}
      region.rooms[14].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:nw|;nw;nu;nw"
      region.rooms[14].name = "ɽ��ƽ��"
      region.rooms[14].zone = "���޺�"
      region.rooms[14].id = 2293
      region.rooms[14].desc = "    ɽ��ƽ�أ����������̵�С�ݣ���Χ���˼���������ɽ����һ����Ȫ���ݵ������ż�������ʬ���������޵����������á�"
      region.rooms[14].exits = "south|southeast"
      region.rooms[14].links = {}
        region.rooms[14].links.s = {}
          region.rooms[14].links.s.to = 2291
          region.rooms[14].links.s.con = ""
    region.rooms[15] = {}
      region.rooms[15].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:nw|;nw;nu"
      region.rooms[15].name = "С·"
      region.rooms[15].zone = "���޺�"
      region.rooms[15].id = 2294
      region.rooms[15].desc = "    ������һ����᫵�С·�ϣ�����������̣�����������"
      region.rooms[15].exits = "northwest|southdown|northeast"
      region.rooms[15].links = {}
        region.rooms[15].links.ne = {}
          region.rooms[15].links.ne.to = 2286
          region.rooms[15].links.ne.con = ""
        region.rooms[15].links.sd = {}
          region.rooms[15].links.sd.to = 2295
          region.rooms[15].links.sd.con = ""
        region.rooms[15].links.nw = {}
          region.rooms[15].links.nw.to = 2293
          region.rooms[15].links.nw.con = ""
    region.rooms[16] = {}
      region.rooms[16].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:nw|;nw"
      region.rooms[16].name = "С·"
      region.rooms[16].zone = "���޺�"
      region.rooms[16].id = 2295
      region.rooms[16].desc = "    ������һ����᫵�С·�ϣ�����������̣�����������"
      region.rooms[16].exits = "southeast|northup"
      region.rooms[16].links = {}
        region.rooms[16].links.nu = {}
          region.rooms[16].links.nu.to = 2294
          region.rooms[16].links.nu.con = ""
        region.rooms[16].links.se = {}
          region.rooms[16].links.se.to = 2288
          region.rooms[16].links.se.con = ""
    region.rooms[17] = {}
      region.rooms[17].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:ne|"
      region.rooms[17].name = "���޺�"
      region.rooms[17].zone = "���޺�"
      region.rooms[17].id = 2296
      region.rooms[17].desc = "    ���������޺��ߡ�˵�Ǻ�����ʵ��Ƭ���������󣬵���ʮ���ն�����ͨ�����޺������"
      region.rooms[17].exits = "northwest|southwest"
      region.rooms[17].links = {}
        region.rooms[17].links.nw = {}
          region.rooms[17].links.nw.to = 2297
          region.rooms[17].links.nw.con = ""
        region.rooms[17].links.sw = {}
          region.rooms[17].links.sw.to = 2286
          region.rooms[17].links.sw.con = ""
    region.rooms[18] = {}
      region.rooms[18].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:ne|;nw"
      region.rooms[18].name = "���޺�"
      region.rooms[18].zone = "���޺�"
      region.rooms[18].id = 2297
      region.rooms[18].desc = ""
      region.rooms[18].exits = "southeast|southwest"
      region.rooms[18].links = {}
        region.rooms[18].links.se = {}
          region.rooms[18].links.se.to = 2296
          region.rooms[18].links.se.con = ""
        region.rooms[18].links.sw = {}
          region.rooms[18].links.sw.to = 2288
          region.rooms[18].links.sw.con = ""
    region.rooms[19] = {}
      region.rooms[19].path = "fly xx;|!k1:ժ����:wu|"
      region.rooms[19].name = "��ɽɽ·"
      region.rooms[19].zone = "���޺�"
      region.rooms[19].id = 2298
      region.rooms[19].desc = "    ��������ɽ��´��ɽ���ɽ�ϴ����������ɪɪ������·����һƬ��ԭ������һ���(valley)��ס����ɽ��·��"
      region.rooms[19].exits = "eastdown"
      region.rooms[19].links = {}
        region.rooms[19].links.ed = {}
          region.rooms[19].links.ed.to = 2285
          region.rooms[19].links.ed.con = ""
        region.rooms[19].links.hi = {}
          region.rooms[19].links.hi.to = 2299
          region.rooms[19].links.hi.con = "aw:3:jump valley"
    region.rooms[20] = {}
      region.rooms[20].path = "fly xx;|!k1:ժ����:wu|;|!aw:3:jump valley:hi|"
      region.rooms[20].name = "��ɽɽ·"
      region.rooms[20].zone = "���޺�"
      region.rooms[20].id = 2299
      region.rooms[20].desc = "    ��������ɽ��´��ɽ���ɽ�ϴ����������ɪɪ������·����һƬ��Ҷ�֡�ʯ����ʢ����һ���׵���ɽѩ����һ����ҩ�����ڲ�ҩ������һ���(valley)��ס����ɽ��·��"
      region.rooms[20].exits = "westup"
      region.rooms[20].links = {}
        region.rooms[20].links["jump valley"] = {}
          region.rooms[20].links["jump valley"].to = 2298
          region.rooms[20].links["jump valley"].con = ""
        region.rooms[20].links.wu = {}
          region.rooms[20].links.wu.to = 2300
          region.rooms[20].links.wu.con = ""
    region.rooms[21] = {}
      region.rooms[21].path = "fly xx;|!k1:ժ����:wu|;|!aw:3:jump valley:hi|;wu"
      region.rooms[21].name = "��ɽɽ·"
      region.rooms[21].zone = "���޺�"
      region.rooms[21].id = 2300
      region.rooms[21].desc = "    ��������ɽ��´��ɽ���ɽ�ϴ����������ɪɪ������·����һƬ��Ҷ�֡�������ȥ������ңң�ɼ����ϱ��и��������ɽ��(cave)��"
      region.rooms[21].exits = "westup|enter|eastdown"
      region.rooms[21].links = {}
        region.rooms[21].links.ed = {}
          region.rooms[21].links.ed.to = 2299
          region.rooms[21].links.ed.con = ""
        region.rooms[21].links.enter = {}
          region.rooms[21].links.enter.to = 2301
          region.rooms[21].links.enter.con = ""
        region.rooms[21].links.wu = {}
          region.rooms[21].links.wu.to = 2302
          region.rooms[21].links.wu.con = ""
    region.rooms[22] = {}
      region.rooms[22].path = "fly xx;|!k1:ժ����:wu|;|!aw:3:jump valley:hi|;wu;enter"
      region.rooms[22].name = "ɽ��"
      region.rooms[22].zone = "���޺�"
      region.rooms[22].id = 2301
      region.rooms[22].desc = "    ���ɽ�������ֲ�����ָ��ֻ�г��ڴ�͸��һ˿���ߡ�"
      region.rooms[22].exits = "out"
      region.rooms[22].links = {}
        region.rooms[22].links.out = {}
          region.rooms[22].links.out.to = 2300
          region.rooms[22].links.out.con = ""
    region.rooms[23] = {}
      region.rooms[23].path = "fly xx;|!k1:ժ����:wu|;|!aw:3:jump valley:hi|;wu;wu"
      region.rooms[23].name = "��ɽ����"
      region.rooms[23].zone = "���޺�"
      region.rooms[23].id = 2302
      region.rooms[23].danger = 3
      region.rooms[23].desc = "    ��������ɽ���塣����������Χ��ȥ�����׶���ԭ�ķ�⾡���۵ס�����һ��С·������ɽ��ɽ��(wind)��������Ϊǿ���������޷�վ����"
      region.rooms[23].exits = "eastdown"
      region.rooms[23].links = {}
        region.rooms[23].links.ed = {}
          region.rooms[23].links.ed.to = 2300
          region.rooms[23].links.ed.con = ""
    region.rooms[24] = {}
      region.rooms[24].path = "fly xx;su"
      region.rooms[24].name = "��ɽɽ·"
      region.rooms[24].zone = "���޺�"
      region.rooms[24].id = 2303
      region.rooms[24].desc = "    ��������ɽ��´��ɽ���ɽ�ϴ����������ɪɪ������·����һƬ��ԭ��·��ͷ������һλ׳�����ڳ�Х���������Ͼ������˺��µ����չ���."
      region.rooms[24].exits = "south|northup|northdown"
      region.rooms[24].links = {}
        region.rooms[24].links.nu = {}
          region.rooms[24].links.nu.to = 2060
          region.rooms[24].links.nu.con = ""
        region.rooms[24].links.nd = {}
          region.rooms[24].links.nd.to = 2285
          region.rooms[24].links.nd.con = ""
        region.rooms[24].links.s = {}
          region.rooms[24].links.s.to = 2304
          region.rooms[24].links.s.con = ""
    region.rooms[25] = {}
      region.rooms[25].path = "fly xx;su;s"
      region.rooms[25].name = "��ɽɽ·"
      region.rooms[25].zone = "���޺�"
      region.rooms[25].id = 2304
      region.rooms[25].desc = "    ��������ɽ��´��ɽ���ɽ�ϴ����������ɪɪ������·����һƬ��ԭ����ԭ��һλ�����˸���һȺ�������򶫿�����ɽ�����ߴ����������޵�Х����"
      region.rooms[25].exits = "north|eastdown"
      region.rooms[25].links = {}
        region.rooms[25].links.ed = {}
          region.rooms[25].links.ed.to = 2305
          region.rooms[25].links.ed.con = ""
        region.rooms[25].links.n = {}
          region.rooms[25].links.n.to = 2303
          region.rooms[25].links.n.con = ""
    region.rooms[26] = {}
      region.rooms[26].path = "fly xx;su;s;ed"
      region.rooms[26].name = "��ɽ����"
      region.rooms[26].zone = "���޺�"
      region.rooms[26].id = 2305
      region.rooms[26].desc = "    ��������ɽ���£������Ǹ������Ƶ���ɽ�������ʱ����Կ���ɽ���ϵı�����һ����ɽ�������Ϊ���롣�������������ľ۾������Ͻ����ޱߵ����������ɴ�ɳĮ��"
      region.rooms[26].exits = "westup|northwest|southeast|southwest"
      region.rooms[26].links = {}
        region.rooms[26].links.wu = {}
          region.rooms[26].links.wu.to = 2304
          region.rooms[26].links.wu.con = ""
        region.rooms[26].links.sw = {}
          region.rooms[26].links.sw.to = 2967
          region.rooms[26].links.sw.con = ""
        region.rooms[26].links.nw = {}
          region.rooms[26].links.nw.to = 2306
          region.rooms[26].links.nw.con = ""
        region.rooms[26].links.se = {}
          region.rooms[26].links.se.to = 2312
          region.rooms[26].links.se.con = ""
    region.rooms[27] = {}
      region.rooms[27].path = "fly xx;su;s;ed;nw"
      region.rooms[27].name = "����"
      region.rooms[27].zone = "���޺�"
      region.rooms[27].id = 2306
      region.rooms[27].desc = "    ������һ��ά�����۾ӵ�С����������������ʮ�����֡�ֻ������˵�Ļ����������������м�С���̣��������������У������ھ���ʲô�����������м�Ժ�䣬Ժ�ſ��пô�����������һ�����ǡ�"
      region.rooms[27].exits = "northwest|north|east|southeast|west"
      region.rooms[27].links = {}
        region.rooms[27].links.se = {}
          region.rooms[27].links.se.to = 2305
          region.rooms[27].links.se.con = ""
        region.rooms[27].links.e = {}
          region.rooms[27].links.e.to = 2308
          region.rooms[27].links.e.con = ""
        region.rooms[27].links.w = {}
          region.rooms[27].links.w.to = 2307
          region.rooms[27].links.w.con = ""
        region.rooms[27].links.nw = {}
          region.rooms[27].links.nw.to = 2311
          region.rooms[27].links.nw.con = ""
        region.rooms[27].links.n = {}
          region.rooms[27].links.n.to = 2310
          region.rooms[27].links.n.con = ""
    region.rooms[28] = {}
      region.rooms[28].path = "fly xx;su;s;ed;nw;w"
      region.rooms[28].name = "�ӻ���"
      region.rooms[28].zone = "���޺�"
      region.rooms[28].id = 2307
      region.rooms[28].desc = "    ����һ���ӻ��̡����������ŵ�̺�����ϰ����ڵ�̺�ϣ��Ա߶������Ļ���ǽ���и����ӣ��Ǹ���Ŀ��(sign)��"
      region.rooms[28].exits = "east"
      region.rooms[28].links = {}
        region.rooms[28].links.e = {}
          region.rooms[28].links.e.to = 2306
          region.rooms[28].links.e.con = ""
    region.rooms[29] = {}
      region.rooms[29].path = "fly xx;su;s;ed;nw;e"
      region.rooms[29].name = "������Ժ"
      region.rooms[29].zone = "���޺�"
      region.rooms[29].id = 2308
      region.rooms[29].desc = "    ����һ�������ҵ�ͥԺ���ſڴ���������Ͷ��Ժ������˾��ú����졣Ժ�Ӷ����ǰ����Ŀ��������߾���С���֡�"
      region.rooms[29].exits = "east|west"
      region.rooms[29].links = {}
        region.rooms[29].links.w = {}
          region.rooms[29].links.w.to = 2306
          region.rooms[29].links.w.con = ""
        region.rooms[29].links.e = {}
          region.rooms[29].links.e.to = 2309
          region.rooms[29].links.e.con = "k1:"
    region.rooms[30] = {}
      region.rooms[30].path = "fly xx;su;s;ed;nw;e;|!k1::e|"
      region.rooms[30].name = "�����ҿ���"
      region.rooms[30].zone = "���޺�"
      region.rooms[30].id = 2309
      region.rooms[30].desc = "    ���ǰ����ҵĿ������������Ų�˹��̺��ľ���ϰ�����ԭ�Ĵ��������ó���ҵ�����һ������Ǯ��"
      region.rooms[30].exits = "west"
      region.rooms[30].links = {}
        region.rooms[30].links.w = {}
          region.rooms[30].links.w.to = 2308
          region.rooms[30].links.w.con = ""
    region.rooms[31] = {}
      region.rooms[31].path = "fly xx;su;s;ed;nw;n"
      region.rooms[31].name = "����"
      region.rooms[31].zone = "���޺�"
      region.rooms[31].id = 2310
      region.rooms[31].desc = "    ���Ǳ���С������ǣ����깩Ӧ���ʲ��ϡ�����ش��Ὦ��������Ӷ��ÿͣ�������Զ�����������ֵܿ����������ǻ����ǣ�����Ǻ����տ���������ι�����㣬������������ˬˬ��һֱ�ź򵽿�����·�����Ǿ�ľ���϶���һ����ľ��(paizi)��        �����жѷ������Ѳ��ϣ�������һ����ۡ�"
      region.rooms[31].exits = "south"
      region.rooms[31].links = {}
        region.rooms[31].links.s = {}
          region.rooms[31].links.s.to = 2306
          region.rooms[31].links.s.con = ""
    region.rooms[32] = {}
      region.rooms[32].path = "fly xx;su;s;ed;nw;nw"
      region.rooms[32].name = "������"
      region.rooms[32].zone = "���޺�"
      region.rooms[32].id = 2311
      region.rooms[32].desc = "    ������С������������������ھ���ά�����ġ�����׷�����ݡ�һ��С���ӿ�����һ�����ﲢ�����۵�һ���۷��㡣ȥ��·��С���ӿ��ԶԹ����������������ʱ����������ñ��ӳ��С���ӡ���Ȼ���������ϲ�����С���ӣ���޾ͻ���Щ������Ļ�����С���Ӻ��ܵġ�"
      region.rooms[32].exits = "southeast"
      region.rooms[32].links = {}
        region.rooms[32].links.se = {}
          region.rooms[32].links.se.to = 2306
          region.rooms[32].links.se.con = ""
    region.rooms[33] = {}
      region.rooms[33].path = "fly xx;su;s;ed;se"
      region.rooms[33].name = "˿��֮·"
      region.rooms[33].zone = "���޺�"
      region.rooms[33].id = 2312
      region.rooms[33].desc = "    ����һ����ԭ������֮����̵���������һ���޼ʵĴ�ɳĮ����˵���ﳣ�е��˳�û��������ͨ��һƬ�����ɽ�����������ͨ����ԭ��·��·����һ��ʯ��(shibei)��"
      region.rooms[33].exits = "northwest|east|west|southwest"
      region.rooms[33].links = {}
        region.rooms[33].links.e = {}
          region.rooms[33].links.e.to = 2313
          region.rooms[33].links.e.con = ""
        region.rooms[33].links.sw = {}
          region.rooms[33].links.sw.to = 2151
          region.rooms[33].links.sw.con = ""
        region.rooms[33].links.nw = {}
          region.rooms[33].links.nw.to = 2305
          region.rooms[33].links.nw.con = ""
        region.rooms[33].links.w = {}
          region.rooms[33].links.w.to = 2975
          region.rooms[33].links.w.con = ""
    region.rooms[34] = {}
      region.rooms[34].path = "fly xx;su;s;ed;se;e"
      region.rooms[34].name = "˿��֮·"
      region.rooms[34].zone = "���޺�"
      region.rooms[34].id = 2313
      region.rooms[34].desc = "    ����һ����ԭ������֮����̵����������������ɽ��������������º�����һ���������������ԭ��������ͨ������������һ����ɳ�ѻ��γɵ�ɽ(mount)�������é��(grass)�ƺ����ܺܺ�"
      region.rooms[34].exits = "southeast|west"
      region.rooms[34].links = {}
        region.rooms[34].links["climb mount"] = {}
          region.rooms[34].links["climb mount"].to = 2318
          region.rooms[34].links["climb mount"].con = ""
        region.rooms[34].links.w = {}
          region.rooms[34].links.w.to = 2312
          region.rooms[34].links.w.con = ""
        region.rooms[34].links.se = {}
          region.rooms[34].links.se.to = 2314
          region.rooms[34].links.se.con = ""
    region.rooms[35] = {}
      region.rooms[35].path = "fly xx;su;s;ed;se;e;se"
      region.rooms[35].name = "˿��֮·"
      region.rooms[35].zone = "���޺�"
      region.rooms[35].id = 2314
      region.rooms[35].desc = "    ����һ����ԭ������֮����̵����������������ɽ��������������º�����һ���������������ԭ��������ͨ������"
      region.rooms[35].exits = "northwest|east|west"
      region.rooms[35].links = {}
        region.rooms[35].links.nw = {}
          region.rooms[35].links.nw.to = 2313
          region.rooms[35].links.nw.con = ""
        region.rooms[35].links.e = {}
          region.rooms[35].links.e.to = 2315
          region.rooms[35].links.e.con = ""
    region.rooms[36] = {}
      region.rooms[36].path = "fly xx;su;s;ed;se;e;se;e"
      region.rooms[36].name = "˿��֮·"
      region.rooms[36].zone = "���޺�"
      region.rooms[36].id = 2315
      region.rooms[36].desc = "    ����һ����ԭ������֮����̵���������һ����ΰ�Ĺذ���������ͨ������"
      region.rooms[36].exits = "east|west"
      region.rooms[36].links = {}
        region.rooms[36].links.w = {}
          region.rooms[36].links.w.to = 2314
          region.rooms[36].links.w.con = ""
        region.rooms[36].links.e = {}
          region.rooms[36].links.e.to = 2316
          region.rooms[36].links.e.con = ""
    region.rooms[37] = {}
      region.rooms[37].path = "fly xx;su;s;ed;se;e;se;e;e"
      region.rooms[37].name = "������"
      region.rooms[37].zone = "���޺�"
      region.rooms[37].id = 2316
      region.rooms[37].desc = "    ���ǳ��������Ĺذ������²�ɣ�����ڲ�ס���ķ�ɡ�Ⱥɽ����֮�£����������ۻ롣�������򰲶�������ս�£��߹��ؾ��Ѵ�Ϊ���١�һ�����������ͨ����ԭ���������������������ġ�˿��֮·����"
      region.rooms[37].exits = "eastup|west"
      region.rooms[37].links = {}
        region.rooms[37].links.w = {}
          region.rooms[37].links.w.to = 2315
          region.rooms[37].links.w.con = ""
        region.rooms[37].links.eu = {}
          region.rooms[37].links.eu.to = 2317
          region.rooms[37].links.eu.con = ""
    region.rooms[38] = {}
      region.rooms[38].path = "fly xx;su;s;ed;se;e;se;e;e;eu"
      region.rooms[38].name = "����ɽ"
      region.rooms[38].zone = "���޺�"
      region.rooms[38].id = 2317
      region.rooms[38].desc = "    ����һ����̫�ߵ�Сɽ��ɽ����ȥ�����������(sky)Ʈ�ż��䵭���İ��ơ�һȺ���㷢�����¸¡��Ľ�������ͷ�Ϸɹ�������ɽ�³��ǵĲ�ԫ�ϱ���ϡ�ɱ档���ǵľ�ͷ��һ����ΰ�Ĺذ���·����һ������֮�Ͽ����״�(poem)��"
      region.rooms[38].exits = "southdown|westdown"
      region.rooms[38].links = {}
        region.rooms[38].links.wd = {}
          region.rooms[38].links.wd.to = 2316
          region.rooms[38].links.wd.con = ""
        region.rooms[38].links.sd = {}
          region.rooms[38].links.sd.to = 843
          region.rooms[38].links.sd.con = ""
    region.rooms[39] = {}
      region.rooms[39].path = "fly xx;su;s;ed;se;e;climb mount"
      region.rooms[39].name = "��ɳɽ"
      region.rooms[39].zone = "���޺�"
      region.rooms[39].id = 2318
      region.rooms[39].desc = "    ����һ����ɳ�ѻ��γɵ�ɽ��΢�紵����ɳɽ�������˵��������ʶ������˳�֮Ϊ��ɳɽ��ɳ�����ƺ���һ�ֳ������䶯��"
      region.rooms[39].exits = "northeast|west"
      region.rooms[39].links = {}
        region.rooms[39].links.ne = {}
          region.rooms[39].links.ne.to = 2313
          region.rooms[39].links.ne.con = ""
        region.rooms[39].links.w = {}
          region.rooms[39].links.w.to = 2319
          region.rooms[39].links.w.con = ""
    region.rooms[40] = {}
      region.rooms[40].path = "fly xx;su;s;ed;se;e;climb mount;w"
      region.rooms[40].name = "�¶�Ȫ"
      region.rooms[40].zone = "���޺�"
      region.rooms[40].id = 2319
      region.rooms[40].desc = "    �����������֮�⣬��ɳĮ�о�Ȼ��Ȫˮ��һ���峺��Ȫˮ�γ�һ����������״����������¶�Ȫ��������һƬ�ͱ�(cliff)�����ߴ������˵����졣"
      region.rooms[40].exits = "east"
      region.rooms[40].links = {}
        region.rooms[40].links.e = {}
          region.rooms[40].links.e.to = 2318
          region.rooms[40].links.e.con = ""
        region.rooms[40].links["enter hole"] = {}
          region.rooms[40].links["enter hole"].to = 2320
          region.rooms[40].links["enter hole"].con = ""
    region.rooms[41] = {}
      region.rooms[41].path = "fly xx;su;s;ed;se;e;climb mount;w;enter hole"
      region.rooms[41].name = "Ī�߿�"
      region.rooms[41].zone = "���޺�"
      region.rooms[41].id = 2320
      region.rooms[41].desc = "    ����ǽ���ϻ�����������صĻ��棬����Ů���죬���з������á����л��кܶ����;��顣�㱻��Щ�������Ļ�֮�������ˡ�"
      region.rooms[41].exits = "north"
      region.rooms[41].links = {}
        region.rooms[41].links.n = {}
          region.rooms[41].links.n.to = 2319
          region.rooms[41].links.n.con = ""
    region.rooms[42] = {}
      region.rooms[42].path = "fly xx;|!k1:ժ����:n|;|!aw:3:flatter ��������:nw|;w"
      region.rooms[42].name = "ʯ��"
      region.rooms[42].zone = "���޺�"
      region.rooms[42].id = 2966
      region.rooms[42].links = {}
        region.rooms[42].links.e = {}
          region.rooms[42].links.e.to = 2288
          region.rooms[42].links.e.con = ""
        region.rooms[42].links.nw = {}
          region.rooms[42].links.nw.to = 2290
          region.rooms[42].links.nw.con = ""
        region.rooms[42].links.enter = {}
          region.rooms[42].links.enter.to = 2289
          region.rooms[42].links.enter.con = "k1:�ɻ���"
      region.rooms[42].exits = "northwest|east|enter"
      region.rooms[42].desc = "    �������޺���������ʯͷ�̳ɵ�һ��С������Χ�����������������һ��˵����������ζ��·���и�ʯ����"
    region.rooms[43] = {}
      region.rooms[43].path = "fly xx;su;s;ed;sw"
      region.rooms[43].name = "�Ͻ�ɳĮ"
      region.rooms[43].zone = "���޺�"
      region.rooms[43].id = 2967
      region.rooms[43].desc = "    ����Ǻ�嫵����������ɴ�ɳĮ��һ�߽�������·���ʧ�˷�����е�����ʮ�ֽ��ʣ����ǿ�Щ�뿪�ɡ�"
      region.rooms[43].exits = "north|southwest|southeast|south|northwest|east|northeast|west"
      region.rooms[43].links = {}
        region.rooms[43].links.ne = {}
          region.rooms[43].links.ne.to = 2305
          region.rooms[43].links.ne.con = ""
        region.rooms[43].links.nw = {}
          region.rooms[43].links.nw.to = 2968
          region.rooms[43].links.nw.con = ""
    region.rooms[44] = {}
      region.rooms[44].path = "fly xx;su;s;ed;sw;nw"
      region.rooms[44].name = "�Ͻ�ɳĮ"
      region.rooms[44].zone = "���޺�"
      region.rooms[44].id = 2968
      region.rooms[44].desc = "    ����Ǻ�嫵����������ɴ�ɳĮ��һ�߽�������·���ʧ�˷�����е�����ʮ�ֽ��ʣ����ǿ�Щ�뿪�ɡ�"
      region.rooms[44].exits = "north|southwest|southeast|south|northwest|east|northeast|west"
      region.rooms[44].links = {}
        region.rooms[44].links.sw = {}
          region.rooms[44].links.sw.to = 2969
          region.rooms[44].links.sw.con = ""
    region.rooms[45] = {}
      region.rooms[45].path = "fly xx;su;s;ed;sw;nw;sw"
      region.rooms[45].name = "�Ͻ�ɳĮ"
      region.rooms[45].zone = "���޺�"
      region.rooms[45].id = 2969
      region.rooms[45].desc = "    ����Ǻ�嫵����������ɴ�ɳĮ��һ�߽�������·���ʧ�˷�����е�����ʮ�ֽ��ʣ����ǿ�Щ�뿪�ɡ�"
      region.rooms[45].exits = "north|southwest|southeast|south|northwest|east|northeast|west"
      region.rooms[45].links = {}
        region.rooms[45].links.w = {}
          region.rooms[45].links.w.to = 2972
          region.rooms[45].links.w.con = ""
        region.rooms[45].links.se = {}
          region.rooms[45].links.se.to = 2970
          region.rooms[45].links.se.con = ""
    region.rooms[46] = {}
      region.rooms[46].path = "fly xx;su;s;ed;sw;nw;sw;se"
      region.rooms[46].name = "�Ͻ�ɳĮ"
      region.rooms[46].zone = "���޺�"
      region.rooms[46].id = 2970
      region.rooms[46].desc = "    ����Ǻ�嫵����������ɴ�ɳĮ��һ�߽�������·���ʧ�˷�����е�����ʮ�ֽ��ʣ����ǿ�Щ�뿪�ɡ�"
      region.rooms[46].exits = "north|southwest|southeast|south|northwest|east|northeast|west"
      region.rooms[46].links = {}
        region.rooms[46].links.ne = {}
          region.rooms[46].links.ne.to = 2971
          region.rooms[46].links.ne.con = ""
    region.rooms[47] = {}
      region.rooms[47].path = "fly xx;su;s;ed;sw;nw;sw;se;ne"
      region.rooms[47].name = "ɳĮ����"
      region.rooms[47].zone = "���޺�"
      region.rooms[47].id = 2971
      region.rooms[47].desc = "    ��ɳĮ�ľ�ͷ������һ�����ޡ���ľ������һ�ۿ���������̨����һ��ľ��ר���ڿʵ����˺�ˮ��������һ��ϵء�"
      region.rooms[47].exits = "northeast|southwest"
      region.rooms[47].links = {}
        region.rooms[47].links.ne = {}
          region.rooms[47].links.ne.to = 2305
          region.rooms[47].links.ne.con = ""
        region.rooms[47].links.sw = {}
          region.rooms[47].links.sw.to = 2970
          region.rooms[47].links.sw.con = ""
    region.rooms[48] = {}
      region.rooms[48].path = "fly xx;su;s;ed;sw;nw;sw;w"
      region.rooms[48].name = "ɳĮ����"
      region.rooms[48].zone = "���޺�"
      region.rooms[48].id = 2972
      region.rooms[48].desc = "    ������ɳĮ�в����һ�����ޣ����ϲ�Զ��Լ���Կ���һ���ںڵ�ɽ������紫��һЩ���������Ĵ�����������Ҳ��֪��˭�ڴ���ʲô��"
      region.rooms[48].exits = "south|east"
      region.rooms[48].links = {}
        region.rooms[48].links.e = {}
          region.rooms[48].links.e.to = 2969
          region.rooms[48].links.e.con = ""
        region.rooms[48].links.s = {}
          region.rooms[48].links.s.to = 2973
          region.rooms[48].links.s.con = ""
    region.rooms[49] = {}
      region.rooms[49].path = "fly xx;su;s;ed;sw;nw;sw;w;s"
      region.rooms[49].name = "�����Ŷ�"
      region.rooms[49].zone = "���޺�"
      region.rooms[49].id = 2973
      region.rooms[49].desc = "    �����������Ŷ����ڣ����洫������Ĵ��������ƺ��ڶ�����ʲô��������͸��һ����ɱ����Ϣ��"
      region.rooms[49].exits = "enter|east"
      region.rooms[49].links = {}
        region.rooms[49].links.enter = {}
          region.rooms[49].links.enter.to = 2974
          region.rooms[49].links.enter.con = ""
        region.rooms[49].links.n = {}
          region.rooms[49].links.n.to = 2972
          region.rooms[49].links.n.con = ""
    region.rooms[50] = {}
      region.rooms[50].path = "fly xx;su;s;ed;sw;nw;sw;w;s;enter"
      region.rooms[50].name = "�����Ŷ�"
      region.rooms[50].zone = "���޺�"
      region.rooms[50].id = 2974
      region.rooms[50].desc = "    �����������Ŷ������涴��֮�Ͻ�����ʯӢ����״�ᾧ�壬�Ե�ʮ��Ư����ǰ��һ���޴��¯��ǰվ��һλ��������������¯������ʲô���£��Ա߼������δ��������Ŵ�ͷ�ô���һ���ƺ���Ҳ�ղ����ʲô�������Ա���ϸ�ķ��ż��Ѹոճ�¯�ı��������ֺ��˵�ɱ�����Ǵ���Щ������ɢ�������ġ�"
      region.rooms[50].exits = "out"
      region.rooms[50].links = {}
        region.rooms[50].links.out = {}
          region.rooms[50].links.out.to = 2973
          region.rooms[50].links.out.con = ""
    region.rooms[51] = {}
      region.rooms[51].path = "fly xx;su;s;ed;se;w"
      region.rooms[51].name = "��ɳĮ"
      region.rooms[51].zone = "���޺�"
      region.rooms[51].id = 2975
      region.rooms[51].desc = "    ����һƬһ���޼ʵĴ�ɳĮ����һ��������ʧ�˷��򡣿���Ҫ�߳����ɳĮ�������¡�"
      region.rooms[51].exits = "south|north|east|west"
      region.rooms[51].links = {}
        region.rooms[51].links.e = {}
          region.rooms[51].links.e.to = 2312
          region.rooms[51].links.e.con = ""
        region.rooms[51].links.w = {}
          region.rooms[51].links.w.to = 2975
          region.rooms[51].links.w.con = ""
        region.rooms[51].links.s = {}
          region.rooms[51].links.s.to = 2975
          region.rooms[51].links.s.con = ""
        region.rooms[51].links.n = {}
          region.rooms[51].links.n.to = 2976
          region.rooms[51].links.n.con = ""
    region.rooms[52] = {}
      region.rooms[52].path = "fly xx;su;s;ed;se;w;n"
      region.rooms[52].name = "��ɳĮ"
      region.rooms[52].zone = "���޺�"
      region.rooms[52].id = 2976
      region.rooms[52].desc = "    ����һƬһ���޼ʵĴ�ɳĮ����һ��������ʧ�˷��򡣿���Ҫ�߳����ɳĮ�������¡�"
      region.rooms[52].exits = "south|north|east|west"
      region.rooms[52].links = {}
        region.rooms[52].links.e = {}
          region.rooms[52].links.e.to = 2976
          region.rooms[52].links.e.con = ""
        region.rooms[52].links.s = {}
          region.rooms[52].links.s.to = 2977
          region.rooms[52].links.s.con = ""
        region.rooms[52].links.w = {}
          region.rooms[52].links.w.to = 2976
          region.rooms[52].links.w.con = ""
        region.rooms[52].links.n = {}
          region.rooms[52].links.n.to = 2976
          region.rooms[52].links.n.con = ""
    region.rooms[53] = {}
      region.rooms[53].path = "fly xx;su;s;ed;se;w;n;s"
      region.rooms[53].name = "��ɳĮ"
      region.rooms[53].zone = "���޺�"
      region.rooms[53].id = 2977
      region.rooms[53].desc = "    ����һƬһ���޼ʵĴ�ɳĮ����һ��������ʧ�˷��򡣿���Ҫ�߳����ɳĮ�������¡�"
      region.rooms[53].exits = "south|north|east|west"
      region.rooms[53].links = {}
        region.rooms[53].links.e = {}
          region.rooms[53].links.e.to = 2978
          region.rooms[53].links.e.con = ""
        region.rooms[53].links.w = {}
          region.rooms[53].links.w.to = 2049
          region.rooms[53].links.w.con = ""
        region.rooms[53].links.s = {}
          region.rooms[53].links.s.to = 2976
          region.rooms[53].links.s.con = ""
        region.rooms[53].links.n = {}
          region.rooms[53].links.n.to = 2976
          region.rooms[53].links.n.con = ""
    region.rooms[54] = {}
      region.rooms[54].path = "fly xx;su;s;ed;se;w;n;s;e"
      region.rooms[54].name = "��ɳĮ"
      region.rooms[54].zone = "���޺�"
      region.rooms[54].id = 2978
      region.rooms[54].desc = "    ����һƬһ���޼ʵĴ�ɳĮ����һ��������ʧ�˷��򡣿���Ҫ�߳����ɳĮ�������¡�"
      region.rooms[54].exits = "south|north|east|west"
      region.rooms[54].links = {}
        region.rooms[54].links.e = {}
          region.rooms[54].links.e.to = 2975
          region.rooms[54].links.e.con = ""
        region.rooms[54].links.s = {}
          region.rooms[54].links.s.to = 2978
          region.rooms[54].links.s.con = ""
        region.rooms[54].links.w = {}
          region.rooms[54].links.w.to = 2977
          region.rooms[54].links.w.con = ""
        region.rooms[54].links.n = {}
          region.rooms[54].links.n.to = 2978
          region.rooms[54].links.n.con = ""
  region.center = 2285
return region