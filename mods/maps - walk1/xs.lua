local region = {}
  region.cmd = "fly xs"
  region.name = "ѩɽ��"
  region.id = "xs"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly xs"
      region.rooms[1].name = "ѩɽ��ɽ��"
      region.rooms[1].zone = "ѩɽ��|Ѫ����"
      region.rooms[1].id = 2110
      region.rooms[1].desc = "    �����Ǵ����µ�ɽ�ţ���ǰ�����ﲻ���Ľ��㳯ʥ����ͽ���е�����������˿�����ϵĲ�˿��ɽ��(gate)ǰվ�˸��ֳַ����ĸ��ײ���ά�����򣬶�����һ����ʯ���̳ɵ�ɽ·��"
      region.rooms[1].exits = "north|eastdown"
      region.rooms[1].links = {}
        region.rooms[1].links.ed = {}
          region.rooms[1].links.ed.to = 2134
          region.rooms[1].links.ed.con = ""
        region.rooms[1].links.n = {}
          region.rooms[1].links.n.to = 2111
          region.rooms[1].links.n.con = ""
    region.rooms[2] = {}
      region.rooms[2].path = "fly xs;n"
      region.rooms[2].name = "�㳡"
      region.rooms[2].zone = "ѩɽ��"
      region.rooms[2].id = 2111
      region.rooms[2].desc = "    ������ѩɽ���ڵĹ㳡���㳡ʯ���̾ͣ�����������ƽ������ʵ���㳡�ı��������ɽ������ѩɽ�´������ǿ����䳡��������ɽ�š�������һЩ�ֳ�ɮ����ɮ����Ѳ�ߡ�"
      region.rooms[2].exits = "south|north|east|west"
      region.rooms[2].links = {}
        region.rooms[2].links.e = {}
          region.rooms[2].links.e.to = 2112
          region.rooms[2].links.e.con = ""
        region.rooms[2].links.s = {}
          region.rooms[2].links.s.to = 2110
          region.rooms[2].links.s.con = ""
        region.rooms[2].links.w = {}
          region.rooms[2].links.w.to = 2114
          region.rooms[2].links.w.con = ""
        region.rooms[2].links.n = {}
          region.rooms[2].links.n.to = 2119
          region.rooms[2].links.n.con = ""
    region.rooms[3] = {}
      region.rooms[3].path = "fly xs;n;e"
      region.rooms[3].name = "СԺ"
      region.rooms[3].zone = "ѩɽ��"
      region.rooms[3].id = 2112
      region.rooms[3].desc = "    ���������ڵ�СԺ����ʰ���൱�ɾ�������������������ͺ����һ���ڰ�ʾ��ѩɽ�����֮ʢ��һ��Ҳ�����ڱ�ʾ����Ŀڸ�Ҳ�治������Ϊ���߾��Ǹ�������"
      region.rooms[3].exits = "north|west"
      region.rooms[3].links = {}
        region.rooms[3].links.w = {}
          region.rooms[3].links.w.to = 2111
          region.rooms[3].links.w.con = ""
        region.rooms[3].links.n = {}
          region.rooms[3].links.n.to = 2113
          region.rooms[3].links.n.con = ""
    region.rooms[4] = {}
      region.rooms[4].path = "fly xs;n;e;n"
      region.rooms[4].name = "����"
      region.rooms[4].zone = "ѩɽ��"
      region.rooms[4].id = 2113
      region.rooms[4].desc = "    ������ѩɽ�µĳ�����������ɮ�˿����ڴ˴��ӡ�������Ŀ��λ����һ�����ӣ�paizi����"
      region.rooms[4].exits = "south"
      region.rooms[4].links = {}
        region.rooms[4].links.s = {}
          region.rooms[4].links.s.to = 2112
          region.rooms[4].links.s.con = ""
    region.rooms[5] = {}
      region.rooms[5].path = "fly xs;n;w"
      region.rooms[5].name = "���䳡"
      region.rooms[5].zone = "ѩɽ��"
      region.rooms[5].id = 2114
      region.rooms[5].desc = "    ������ѩɽ�����䳡�����źö�ľ׮��ɳ����ɮ�����ճ����ڴ�ϰ�䡣�����ǹ㳡�������и�С�ⷿ���ϱ�һ��Ƭ�����أ�����ѩɽ�������ڵļ�̳�ˡ�"
      region.rooms[5].exits = "south|north|east|west"
      region.rooms[5].links = {}
        region.rooms[5].links.e = {}
          region.rooms[5].links.e.to = 2111
          region.rooms[5].links.e.con = ""
        region.rooms[5].links.w = {}
          region.rooms[5].links.w.to = 2115
          region.rooms[5].links.w.con = ""
        region.rooms[5].links.n = {}
          region.rooms[5].links.n.to = 2116
          region.rooms[5].links.n.con = ""
    region.rooms[6] = {}
      region.rooms[6].path = "fly xs;n;w;w"
      region.rooms[6].name = "�ⷿ"
      region.rooms[6].zone = "ѩɽ��"
      region.rooms[6].id = 2115
      region.rooms[6].desc = "    ���������䳡�Աߵ�С�ⷿ�������ܲ�ͨ�磬ֻ��һ˿���ߴ�����С����Ͷ�������������Щ���õ�����������ѩɽ�����ճ�������Ҫ�õ��ı�����"
      region.rooms[6].exits = "east"
      region.rooms[6].links = {}
        region.rooms[6].links.e = {}
          region.rooms[6].links.e.to = 2114
          region.rooms[6].links.e.con = ""
    region.rooms[7] = {}
      region.rooms[7].path = "fly xs;n;w;n"
      region.rooms[7].name = "��Ժ"
      region.rooms[7].zone = "ѩɽ��"
      region.rooms[7].id = 2116
      region.rooms[7].desc = "    ������ѩɽ�µĺ�Ժ����Ժ�������˼������ѩ�ɣ��ڰ׻λε�ѩɽ�����£�����ƮȻ�������Ķ����ϱ������䳡�������Ǻ��š�"
      region.rooms[7].exits = "south|north|eastdown"
      region.rooms[7].links = {}
        region.rooms[7].links.ed = {}
          region.rooms[7].links.ed.to = 2118
          region.rooms[7].links.ed.con = ""
        region.rooms[7].links.s = {}
          region.rooms[7].links.s.to = 2114
          region.rooms[7].links.s.con = ""
        region.rooms[7].links.n = {}
          region.rooms[7].links.n.to = 2117
          region.rooms[7].links.n.con = ""
    region.rooms[8] = {}
      region.rooms[8].path = "fly xs;n;w;n;n"
      region.rooms[8].name = "����"
      region.rooms[8].zone = "ѩɽ��"
      region.rooms[8].id = 2117
      region.rooms[8].desc = "    ����ѩɽ�µĺ��š�һƬ���������ģ�������������Ҳ�㣬����Ҳ�����Ǻ��ţ���Ȼδ�⺮�ᣬ��Ҳ�ܿ���Ҵ�š�"
      region.rooms[8].exits = "south"
      region.rooms[8].links = {}
        region.rooms[8].links.s = {}
          region.rooms[8].links.s.to = 2116
          region.rooms[8].links.s.con = ""
    region.rooms[9] = {}
      region.rooms[9].path = "fly xs;n;w;n;ed"
      region.rooms[9].name = "����"
      region.rooms[9].zone = "ѩɽ��"
      region.rooms[9].id = 2118
      region.rooms[9].desc = "    ����һ����������ʪ���η�����е���ֵ�������᲻ʱ����һ�����ȴ��ôҲ�Ҳ�������? "
      region.rooms[9].exits = "westup"
      region.rooms[9].links = {}
        region.rooms[9].links.wu = {}
          region.rooms[9].links.wu.to = 2116
          region.rooms[9].links.wu.con = ""
    region.rooms[10] = {}
      region.rooms[10].path = "fly xs;n;n"
      region.rooms[10].name = "���"
      region.rooms[10].zone = "ѩɽ��"
      region.rooms[10].id = 2119
      region.rooms[10].desc = "    ������ѩɽ�µĴ����빩���ŷ�������ɮ���������ž��ġ�Զ����������������ϵ�Ĥ�ݡ�������඼�ǲ�"
      region.rooms[10].exits = "south|east|west"
      region.rooms[10].links = {}
        region.rooms[10].links.e = {}
          region.rooms[10].links.e.to = 2120
          region.rooms[10].links.e.con = ""
        region.rooms[10].links.s = {}
          region.rooms[10].links.s.to = 2111
          region.rooms[10].links.s.con = ""
        region.rooms[10].links.w = {}
          region.rooms[10].links.w.to = 2121
          region.rooms[10].links.w.con = ""
    region.rooms[11] = {}
      region.rooms[11].path = "fly xs;n;n;e"
      region.rooms[11].name = "���"
      region.rooms[11].zone = "ѩɽ��"
      region.rooms[11].id = 2120
      region.rooms[11].desc = "    ������ѩɽ�µĶ�����������̬�����ʮ���޺����񣬽�����⣬����ׯ�ϡ�"
      region.rooms[11].exits = "up|west"
      region.rooms[11].links = {}
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 2119
          region.rooms[11].links.w.con = ""
        region.rooms[11].links.u = {}
          region.rooms[11].links.u.to = 2126
          region.rooms[11].links.u.con = ""
    region.rooms[12] = {}
      region.rooms[12].path = "fly xs;n;n;w"
      region.rooms[12].name = "���"
      region.rooms[12].zone = "ѩɽ��"
      region.rooms[12].id = 2121
      region.rooms[12].desc = "    ������ѩɽ�µ�����ǽ��������ŷ��洫���Ĺ��£���������𻨱���ׯ�ϡ�"
      region.rooms[12].exits = "up|east"
      region.rooms[12].links = {}
        region.rooms[12].links.e = {}
          region.rooms[12].links.e.to = 2119
          region.rooms[12].links.e.con = ""
        region.rooms[12].links.u = {}
          region.rooms[12].links.u.to = 2122
          region.rooms[12].links.u.con = ""
    region.rooms[13] = {}
      region.rooms[13].path = "fly xs;n;n;w;u"
      region.rooms[13].name = "����"
      region.rooms[13].zone = "ѩɽ��"
      region.rooms[13].id = 2122
      region.rooms[13].desc = "    ������ѩɽ���ڵ����ȡ������е��İ����컨������һЩ��֪��ȷ�к���ĵ�̣�ǽ�������Ǻ�ͨ�׵ķ𾭹��±ڻ��ˡ����ϵ��ż���󺣵�������"
      region.rooms[13].exits = "east|eastup|down"
      region.rooms[13].links = {}
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 2123
          region.rooms[13].links.e.con = ""
        region.rooms[13].links.d = {}
          region.rooms[13].links.d.to = 2121
          region.rooms[13].links.d.con = ""
        region.rooms[13].links.eu = {}
          region.rooms[13].links.eu.to = 2128
          region.rooms[13].links.eu.con = ""
    region.rooms[14] = {}
      region.rooms[14].path = "fly xs;n;n;e;u;w"
      region.rooms[14].name = "����"
      region.rooms[14].zone = "ѩɽ��"
      region.rooms[14].id = 2123
      region.rooms[14].desc = "    ���������ڵĴ�������λ�е��ĸ�ɮ�ڸ������ۡ��������������ݵ䣬�������档"
      region.rooms[14].exits = "northwest|east|southeast|northeast|west"
      region.rooms[14].links = {}
        region.rooms[14].links.ne = {}
          region.rooms[14].links.ne.to = 2127
          region.rooms[14].links.ne.con = ""
        region.rooms[14].links.se = {}
          region.rooms[14].links.se.to = 2125
          region.rooms[14].links.se.con = ""
        region.rooms[14].links.e = {}
          region.rooms[14].links.e.to = 2126
          region.rooms[14].links.e.con = ""
        region.rooms[14].links.nw = {}
          region.rooms[14].links.nw.to = 2124
          region.rooms[14].links.nw.con = ""
        region.rooms[14].links.w = {}
          region.rooms[14].links.w.to = 2122
          region.rooms[14].links.w.con = ""
    region.rooms[15] = {}
      region.rooms[15].path = "fly xs;n;n;e;u;w;nw"
      region.rooms[15].name = "ѩɽ�ؾ���"
      region.rooms[15].zone = "ѩɽ��"
      region.rooms[15].id = 2124
      region.rooms[15].desc = "    ������ѩɽ�µĲؾ��ң���ǽ��һ����ܣ������˸���ȭ�ס��鼮������ǵ����������Ħ�Ƿ���ķ𾭺ʹ�������ȡ������ѧ�伮��"
      region.rooms[15].exits = "southeast"
      region.rooms[15].links = {}
        region.rooms[15].links.se = {}
          region.rooms[15].links.se.to = 2123
          region.rooms[15].links.se.con = ""
    region.rooms[16] = {}
      region.rooms[16].path = "fly xs;n;n;e;u;w;se"
      region.rooms[16].name = "�ؾ���"
      region.rooms[16].zone = "ѩɽ��"
      region.rooms[16].id = 2125
      region.rooms[16].desc = "    ������ѩɽ�µĲؾ�֮����������������ܶ������ĵ伮����һ����Ҳ��������"
      region.rooms[16].exits = "northwest"
      region.rooms[16].links = {}
        region.rooms[16].links.nw = {}
          region.rooms[16].links.nw.to = 2123
          region.rooms[16].links.nw.con = ""
    region.rooms[17] = {}
      region.rooms[17].path = "fly xs;n;n;e;u"
      region.rooms[17].name = "����"
      region.rooms[17].zone = "ѩɽ��"
      region.rooms[17].id = 2126
      region.rooms[17].desc = "    ������ѩɽ���ڵ����ȡ������е��İ����컨������һЩ��֪��ȷ�к���ĵ�̣�ǽ�������Ǻ�ͨ�׵ķ𾭹��±ڻ��ˡ����ϵ��ż���󺣵�������"
      region.rooms[17].exits = "westup|west|down"
      region.rooms[17].links = {}
        region.rooms[17].links.d = {}
          region.rooms[17].links.d.to = 2120
          region.rooms[17].links.d.con = ""
        region.rooms[17].links.w = {}
          region.rooms[17].links.w.to = 2123
          region.rooms[17].links.w.con = ""
        region.rooms[17].links.wu = {}
          region.rooms[17].links.wu.to = 2128
          region.rooms[17].links.wu.con = ""
    region.rooms[18] = {}
      region.rooms[18].path = "fly xs;n;n;e;u;w;ne"
      region.rooms[18].name = "����"
      region.rooms[18].zone = "ѩɽ��"
      region.rooms[18].id = 2127
      region.rooms[18].desc = "    ������ɮ���Ų��������ĵط������һ���������˿��˾��뵽������¡�"
      region.rooms[18].exits = "southwest"
      region.rooms[18].links = {}
        region.rooms[18].links.sw = {}
          region.rooms[18].links.sw.to = 2123
          region.rooms[18].links.sw.con = ""
    region.rooms[19] = {}
      region.rooms[19].path = "fly xs;n;n;e;u;wu"
      region.rooms[19].name = "����"
      region.rooms[19].zone = "ѩɽ��"
      region.rooms[19].id = 2128
      region.rooms[19].desc = "    ������ѩɽ���ڵ����ȡ������е��İ����컨������һЩ��֪��ȷ�к���ĵ�̣�ǽ�������Ǻ�ͨ�׵ķ𾭹��±ڻ��ˡ����ϵ��ż���󺣵�������"
      region.rooms[19].exits = "north|eastdown|westdown"
      region.rooms[19].links = {}
        region.rooms[19].links.ed = {}
          region.rooms[19].links.ed.to = 2126
          region.rooms[19].links.ed.con = ""
        region.rooms[19].links.wd = {}
          region.rooms[19].links.wd.to = 2122
          region.rooms[19].links.wd.con = ""
        region.rooms[19].links.n = {}
          region.rooms[19].links.n.to = 2129
          region.rooms[19].links.n.con = ""
    region.rooms[20] = {}
      region.rooms[20].path = "fly xs;n;n;e;u;wu;n"
      region.rooms[20].name = "�ڵ�"
      region.rooms[20].zone = "ѩɽ��"
      region.rooms[20].id = 2129
      region.rooms[20].desc = "    ������ѩɽ�µ��ڵҲ�������˼��͵ĵط���ѩɽ�µ������ˡ�������������ެ��ʦ�Ħ��������һ����ɮ��Ҳ������������������ʦ����פ�����º�ѩɽ�·�����Զ����"
      region.rooms[20].exits = "south|north|east|west"
      region.rooms[20].links = {}
        region.rooms[20].links.e = {}
          region.rooms[20].links.e.to = 2130
          region.rooms[20].links.e.con = ""
        region.rooms[20].links.s = {}
          region.rooms[20].links.s.to = 2128
          region.rooms[20].links.s.con = ""
        region.rooms[20].links.w = {}
          region.rooms[20].links.w.to = 2131
          region.rooms[20].links.w.con = ""
        region.rooms[20].links.n = {}
          region.rooms[20].links.n.to = 2133
          region.rooms[20].links.n.con = ""
    region.rooms[21] = {}
      region.rooms[21].path = "fly xs;n;n;e;u;wu;n;e"
      region.rooms[21].name = "��̨"
      region.rooms[21].zone = "ѩɽ��"
      region.rooms[21].id = 2130
      region.rooms[21].desc = "    ������ѩɽ�µĸߴ������߿ɼ���ΰ�Ĵ�ѩɽ���ϱ߿��Ը�������羵��ʥ����"
      region.rooms[21].exits = "west"
      region.rooms[21].links = {}
        region.rooms[21].links.w = {}
          region.rooms[21].links.w.to = 2129
          region.rooms[21].links.w.con = ""
    region.rooms[22] = {}
      region.rooms[22].path = "fly xs;n;n;e;u;wu;n;w"
      region.rooms[22].name = "�ܵ�"
      region.rooms[22].zone = "ѩɽ��"
      region.rooms[22].id = 2131
      region.rooms[22].desc = "    ����һ����խ�İ�������ɭ���£����������˻ҳ���������������Ҳ��֪��ͨ���δ���"
      region.rooms[22].exits = "east|north"
      region.rooms[22].links = {}
        region.rooms[22].links.e = {}
          region.rooms[22].links.e.to = 2129
          region.rooms[22].links.e.con = ""
        region.rooms[22].links.n = {}
          region.rooms[22].links.n.to = 2132
          region.rooms[22].links.n.con = ""
    region.rooms[23] = {}
      region.rooms[23].path = "fly xs;n;n;e;u;wu;n;w;n"
      region.rooms[23].name = "����"
      region.rooms[23].zone = "ѩɽ��"
      region.rooms[23].id = 2132
      region.rooms[23].desc = "    ����һ��С���䡣ʲô������û�С�"
      region.rooms[23].exits = "south|down"
      region.rooms[23].links = {}
        region.rooms[23].links.s = {}
          region.rooms[23].links.s.to = 2131
          region.rooms[23].links.s.con = ""
        region.rooms[23].links.d = {}
          region.rooms[23].links.d.to = 40
          region.rooms[23].links.d.con = ""
    region.rooms[24] = {}
      region.rooms[24].path = "fly xs;n;n;e;u;wu;n;n"
      region.rooms[24].name = "���"
      region.rooms[24].zone = "ѩɽ��"
      region.rooms[24].id = 2133
      region.rooms[24].desc = "    ������ѩɽ�µĺ�Ҳ��ѩɽ���ӱ��������ĵط���������һЩ���������ź�ľ�ˣ�����һЩ�����ŵ�ɳ����ֱ����ľ׮��"
      region.rooms[24].exits = "south"
      region.rooms[24].links = {}
        region.rooms[24].links.s = {}
          region.rooms[24].links.s.to = 2129
          region.rooms[24].links.s.con = ""
    region.rooms[25] = {}
      region.rooms[25].path = "fly xs;ed"
      region.rooms[25].name = "��ѩɽɽ·"
      region.rooms[25].zone = "Ѫ����|ѩɽ��"
      region.rooms[25].id = 2134
      region.rooms[25].desc = "    ��ѩɽ��´�ĵ��Ʋ������ߣ���Χ����һЩСɽ��������һ����Ժ��ɽ�������Ե��쳣�ߴ���Ժ��ƽ�����ͣ����ɴ�ʯ���ɣ�ǽ���ʵ������խС��"
      region.rooms[25].exits = "westup|north"
      region.rooms[25].links = {}
        region.rooms[25].links.wu = {}
          region.rooms[25].links.wu.to = 2110
          region.rooms[25].links.wu.con = ""
        region.rooms[25].links.n = {}
          region.rooms[25].links.n.to = 2135
          region.rooms[25].links.n.con = ""
    region.rooms[26] = {}
      region.rooms[26].path = "fly xs;ed;n"
      region.rooms[26].name = "��ѩɽ��´"
      region.rooms[26].zone = "Ѫ����|ѩɽ��"
      region.rooms[26].id = 2135
      region.rooms[26].desc = "    ����ɽ�Ʊȴ�ѩɽ�����Ի���Ҳ����ʮ�ֵ��Ϻ���ɽ�����Գ�����ϡϡ������һЩҰ�ݡ����º����˼���ֻ�м�ֻͺӥ�ڸߴ�������������ããѩɽ��"
      region.rooms[26].exits = "south|eastdown"
      region.rooms[26].links = {}
        region.rooms[26].links.s = {}
          region.rooms[26].links.s.to = 2134
          region.rooms[26].links.s.con = ""
        region.rooms[26].links.ed = {}
          region.rooms[26].links.ed.to = 2136
          region.rooms[26].links.ed.con = ""
    region.rooms[27] = {}
      region.rooms[27].path = "fly xs;ed;n;ed"
      region.rooms[27].name = "ɽ·"
      region.rooms[27].zone = "Ѫ����|ѩɽ��"
      region.rooms[27].id = 2136
      region.rooms[27].desc = "    ������һɽ·�ϣ�������һ����Сɽ����ң�������Ϸ���ѩɽ�ı�´��ɽǰ����ԼԼ������һ����Ժ��"
      region.rooms[27].exits = "westup|eastdown"
      region.rooms[27].links = {}
        region.rooms[27].links.ed = {}
          region.rooms[27].links.ed.to = 2137
          region.rooms[27].links.ed.con = ""
        region.rooms[27].links.wu = {}
          region.rooms[27].links.wu.to = 2135
          region.rooms[27].links.wu.con = ""
    region.rooms[28] = {}
      region.rooms[28].path = "fly xs;ed;n;ed;ed"
      region.rooms[28].name = "ɽ·"
      region.rooms[28].zone = "Ѫ����|ѩɽ��"
      region.rooms[28].id = 2137
      region.rooms[28].desc = "    ɽ·Խ��Խխ������������ǰ���ֳַ��˼�����·��"
      region.rooms[28].exits = "westup|northdown|southup"
      region.rooms[28].links = {}
        region.rooms[28].links.nd = {}
          region.rooms[28].links.nd.to = 2138
          region.rooms[28].links.nd.con = ""
        region.rooms[28].links.wu = {}
          region.rooms[28].links.wu.to = 2136
          region.rooms[28].links.wu.con = ""
        region.rooms[28].links.su = {}
          region.rooms[28].links.su.to = 2152
          region.rooms[28].links.su.con = ""
    region.rooms[29] = {}
      region.rooms[29].path = "fly xs;ed;n;ed;ed;nd"
      region.rooms[29].name = "ɽ·"
      region.rooms[29].zone = "Ѫ����|ѩɽ��"
      region.rooms[29].id = 2138
      region.rooms[29].desc = "    ����һ����᫵�ɽ·�����ӵ�������Ͳ�������ȥ�ˡ�ɽ·�����Ӳݴ�����·��ʼԽ��Խ���ߡ�"
      region.rooms[29].exits = "southup|northdown"
      region.rooms[29].links = {}
        region.rooms[29].links.su = {}
          region.rooms[29].links.su.to = 2137
          region.rooms[29].links.su.con = ""
        region.rooms[29].links.nd = {}
          region.rooms[29].links.nd.to = 2139
          region.rooms[29].links.nd.con = ""
    region.rooms[30] = {}
      region.rooms[30].path = "fly xs;ed;n;ed;ed;nd;nd"
      region.rooms[30].name = "ɽ·"
      region.rooms[30].zone = "Ѫ����|ѩɽ��"
      region.rooms[30].id = 2139
      region.rooms[30].desc = "    ������һɽ·�ϣ�������һ����Сɽ��Զ�����Կ��������ѩ��ɽ�⡣��Χ�������Ѿ����ѿ��õ��ˡ�"
      region.rooms[30].exits = "north|southup"
      region.rooms[30].links = {}
        region.rooms[30].links.su = {}
          region.rooms[30].links.su.to = 2138
          region.rooms[30].links.su.con = ""
        region.rooms[30].links.n = {}
          region.rooms[30].links.n.to = 2140
          region.rooms[30].links.n.con = ""
    region.rooms[31] = {}
      region.rooms[31].path = "fly xs;ed;n;ed;ed;nd;nd;n"
      region.rooms[31].name = "ɽ·"
      region.rooms[31].zone = "Ѫ����|ѩɽ��"
      region.rooms[31].id = 2140
      region.rooms[31].desc = "    ������һɽ·�ϣ�������һ����Сɽ��"
      region.rooms[31].exits = "south|eastdown"
      region.rooms[31].links = {}
        region.rooms[31].links.s = {}
          region.rooms[31].links.s.to = 2139
          region.rooms[31].links.s.con = ""
        region.rooms[31].links.ed = {}
          region.rooms[31].links.ed.to = 2141
          region.rooms[31].links.ed.con = ""
    region.rooms[32] = {}
      region.rooms[32].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed"
      region.rooms[32].name = "ɽ��"
      region.rooms[32].zone = "Ѫ����|ѩɽ��"
      region.rooms[32].id = 2141
      region.rooms[32].desc = "    ������ɽ���µ�һƬƽ�أ�ɽ�ϲ�Զ����������ѩӳ���µ�һ��Ƭ��ǽ���ߴ�������Զ��������ѩɽ�¡�"
      region.rooms[32].exits = "south|westup"
      region.rooms[32].links = {}
        region.rooms[32].links.s = {}
          region.rooms[32].links.s.to = 2142
          region.rooms[32].links.s.con = ""
        region.rooms[32].links.wu = {}
          region.rooms[32].links.wu.to = 2140
          region.rooms[32].links.wu.con = ""
    region.rooms[33] = {}
      region.rooms[33].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s"
      region.rooms[33].name = "����С·"
      region.rooms[33].zone = "Ѫ����|ѩɽ��"
      region.rooms[33].id = 2142
      region.rooms[33].desc = "    ����ʥ���ߵ�С·��·�೤��û��, ���̿�ϲ��"
      region.rooms[33].exits = "south|north"
      region.rooms[33].links = {}
        region.rooms[33].links.s = {}
          region.rooms[33].links.s.to = 2143
          region.rooms[33].links.s.con = ""
        region.rooms[33].links.n = {}
          region.rooms[33].links.n.to = 2141
          region.rooms[33].links.n.con = ""
    region.rooms[34] = {}
      region.rooms[34].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s"
      region.rooms[34].name = "����С·"
      region.rooms[34].zone = "Ѫ����|ѩɽ��"
      region.rooms[34].id = 2143
      region.rooms[34].desc = "    ����ʥ���ߵ�С·���������ģ��װ׵��ƶ��ں���Ư�ƣ��������١�����������һЩ��������Ĳ�֪���İ�����"
      region.rooms[34].exits = "north|southwest"
      region.rooms[34].links = {}
        region.rooms[34].links.n = {}
          region.rooms[34].links.n.to = 2142
          region.rooms[34].links.n.con = ""
        region.rooms[34].links.sw = {}
          region.rooms[34].links.sw.to = 2144
          region.rooms[34].links.sw.con = ""
    region.rooms[35] = {}
      region.rooms[35].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw"
      region.rooms[35].name = "����С·"
      region.rooms[35].zone = "Ѫ����|ѩɽ��"
      region.rooms[35].id = 2144
      region.rooms[35].desc = "    ����ʥ���ߵ�С·������Խ������������ż���а�ɫˮ���Ӻ���ˮ������ȦȦ������"
      region.rooms[35].exits = "northeast|west"
      region.rooms[35].links = {}
        region.rooms[35].links.ne = {}
          region.rooms[35].links.ne.to = 2143
          region.rooms[35].links.ne.con = ""
        region.rooms[35].links.w = {}
          region.rooms[35].links.w.to = 2145
          region.rooms[35].links.w.con = ""
    region.rooms[36] = {}
      region.rooms[36].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w"
      region.rooms[36].name = "����С·"
      region.rooms[36].zone = "Ѫ����|ѩɽ��"
      region.rooms[36].id = 2145
      region.rooms[36].desc = "    ����ʥ���ߵ�С·��·��ĺ�ˮ��Ϊ�峺��������ӳ�Ű׶�ѩɽ�Գ�һƬ�����ĵ�������"
      region.rooms[36].exits = "east|west"
      region.rooms[36].links = {}
        region.rooms[36].links.e = {}
          region.rooms[36].links.e.to = 2144
          region.rooms[36].links.e.con = ""
        region.rooms[36].links.w = {}
          region.rooms[36].links.w.to = 2146
          region.rooms[36].links.w.con = ""
    region.rooms[37] = {}
      region.rooms[37].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w"
      region.rooms[37].name = "ʥ��"
      region.rooms[37].zone = "Ѫ����|ѩɽ��"
      region.rooms[37].id = 2146
      region.rooms[37].desc = "    ��ǰ����������ʥ���������ĺ��浹Ӱ������Ͱ��ƣ�������ˮ�������Ŀ�������Զ����̻Ի͵�ѩɽ�������ɼ�����Զ���Ǽ�������Ĵ�ѩɽ��������ߴ������ɽ���ഫɽ�������ɾ�ס��ѩɽ���ڻ���ѩˮ��������С�"
      region.rooms[37].exits = "south|east"
      region.rooms[37].links = {}
        region.rooms[37].links.e = {}
          region.rooms[37].links.e.to = 2145
          region.rooms[37].links.e.con = ""
        region.rooms[37].links.s = {}
          region.rooms[37].links.s.to = 2147
          region.rooms[37].links.s.con = ""
    region.rooms[38] = {}
      region.rooms[38].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s"
      region.rooms[38].name = "��·"
      region.rooms[38].zone = "Ѫ����|ѩɽ��"
      region.rooms[38].id = 2147
      region.rooms[38].desc = "    ����һ�������۵���·�����������Զ�������߲������ٵ�һ��Ƭ����ˮ�⴦������������ʥ����"
      region.rooms[38].exits = "south|north"
      region.rooms[38].links = {}
        region.rooms[38].links.s = {}
          region.rooms[38].links.s.to = 2148
          region.rooms[38].links.s.con = ""
        region.rooms[38].links.n = {}
          region.rooms[38].links.n.to = 2146
          region.rooms[38].links.n.con = ""
    region.rooms[39] = {}
      region.rooms[39].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s;s"
      region.rooms[39].name = "��·"
      region.rooms[39].zone = "Ѫ����|ѩɽ��"
      region.rooms[39].id = 2148
      region.rooms[39].desc = "    ����һ�������۵���·��ȴ������ѩɽ������ԭ�ıؾ�֮·�����ߵ��Ĵ�����ϡ�ɼ�����������ͨ�����������ѩɽ�¡�"
      region.rooms[39].exits = "north|east|west"
      region.rooms[39].links = {}
        region.rooms[39].links.e = {}
          region.rooms[39].links.e.to = 2150
          region.rooms[39].links.e.con = ""
        region.rooms[39].links.w = {}
          region.rooms[39].links.w.to = 2149
          region.rooms[39].links.w.con = ""
        region.rooms[39].links.n = {}
          region.rooms[39].links.n.to = 2147
          region.rooms[39].links.n.con = ""
    region.rooms[40] = {}
      region.rooms[40].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s;s;w"
      region.rooms[40].name = "�͵�"
      region.rooms[40].zone = "Ѫ����|ѩɽ��"
      region.rooms[40].id = 2149
      region.rooms[40].desc = "    ������һ��·�ߵ�С�͵ꡣ���������˶�������������Ϣ��������·���Ե�����ԭ��"
      region.rooms[40].exits = "east"
      region.rooms[40].links = {}
        region.rooms[40].links.e = {}
          region.rooms[40].links.e.to = 2148
          region.rooms[40].links.e.con = ""
    region.rooms[41] = {}
      region.rooms[41].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s;s;e"
      region.rooms[41].name = "��·"
      region.rooms[41].zone = "Ѫ����|ѩɽ��"
      region.rooms[41].id = 2150
      region.rooms[41].desc = "    ����һ�������۵���·������ȴҲ��խ����ɢ�ĸ�����¶���������̵�Ƶ������������ѩɽ������ԭ�ıؾ�֮·��"
      region.rooms[41].exits = "east|west"
      region.rooms[41].links = {}
        region.rooms[41].links.w = {}
          region.rooms[41].links.w.to = 2148
          region.rooms[41].links.w.con = ""
        region.rooms[41].links.e = {}
          region.rooms[41].links.e.to = 2151
          region.rooms[41].links.e.con = ""
    region.rooms[42] = {}
      region.rooms[42].path = "fly xs;ed;n;ed;ed;nd;nd;n;ed;s;s;sw;w;w;s;s;e;e"
      region.rooms[42].name = "��ԭ"
      region.rooms[42].zone = "Ѫ����|ѩɽ��"
      region.rooms[42].id = 2151
      region.rooms[42].desc = "    ������ѩɽ���µ�һƬ��ԭ�������������Ⱥɽ��ɽ���ϻ������겻����ѩ��������һ����·��"
      region.rooms[42].exits = "northeast|west"
      region.rooms[42].links = {}
        region.rooms[42].links.w = {}
          region.rooms[42].links.w.to = 2150
          region.rooms[42].links.w.con = ""
  region.center = 2110
return region