local region = {}
  region.cmd = "fly mz"
  region.name = "÷ׯ"
  region.id = "mz"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly mz;open gate;s;s;s;ed"
      region.rooms[1].name = "��ɽ"
      region.rooms[1].zone = "����|÷ׯ"
      region.rooms[1].id = 276
      region.rooms[1].desc = "    ͨ���������ǰ��ӭ��ʯ���Ͽ��С���ɽ������������֡�����ʰ����ɽ����ƽ̨�������߱��Ƿ���ͤ�����ϱ�����ƽ�����¡�������ͨ�������š�"
      region.rooms[1].exits = "westup|northwest|east|northeast|southup"
      region.rooms[1].links = {}
        region.rooms[1].links.ne = {}
          region.rooms[1].links.ne.to = 278
          region.rooms[1].links.ne.con = ""
        region.rooms[1].links.wu = {}
          region.rooms[1].links.wu.to = 282
          region.rooms[1].links.wu.con = ""
        region.rooms[1].links.e = {}
          region.rooms[1].links.e.to = 279
          region.rooms[1].links.e.con = ""
        region.rooms[1].links.nw = {}
          region.rooms[1].links.nw.to = 275
          region.rooms[1].links.nw.con = ""
        region.rooms[1].links.su = {}
          region.rooms[1].links.su.to = 277
          region.rooms[1].links.su.con = ""
    region.rooms[2] = {}
      region.rooms[2].path = "fly mz;open gate;s;s;s"
      region.rooms[2].name = "��ɽʯ��"
      region.rooms[2].zone = "����|÷ׯ"
      region.rooms[2].id = 282
      region.rooms[2].desc = "    �����ɽ�ߵ�ʯ������ȥ��һ·�����ź��߳�ҷ����������֪������ת�˼����䣬ȴ����ض���÷�����ϸɺ�б��֦Ҷï�ܣ��������÷��ʢ��֮�գ���ѩ�纣����Ȼ���Ͳ�����"
      region.rooms[2].exits = "north|eastdown"
      region.rooms[2].links = {}
        region.rooms[2].links.ed = {}
          region.rooms[2].links.ed.to = 276
          region.rooms[2].links.ed.con = ""
        region.rooms[2].links.n = {}
          region.rooms[2].links.n.to = 2741
          region.rooms[2].links.n.con = ""
    region.rooms[3] = {}
      region.rooms[3].path = "fly mz"
      region.rooms[3].name = "���쾮"
      region.rooms[3].zone = "÷ׯ"
      region.rooms[3].id = 2703
      region.rooms[3].desc = "    ���߹�һ�����쾮���쾮���Ҹ�ֲһ����÷��֦�����������ǲԾ���������÷ׯ���ţ������Ǵ�����"
      region.rooms[3].exits = "north"
      region.rooms[3].links = {}
        region.rooms[3].links["open gate;s"] = {}
          region.rooms[3].links["open gate;s"].to = 2740
          region.rooms[3].links["open gate;s"].con = ""
        region.rooms[3].links.n = {}
          region.rooms[3].links.n.to = 2704
          region.rooms[3].links.n.con = ""
    region.rooms[4] = {}
      region.rooms[4].path = "fly mz;n"
      region.rooms[4].name = "�������"
      region.rooms[4].zone = "÷ׯ"
      region.rooms[4].id = 2704
      region.rooms[4].desc = "    ���Ѿ�����÷ׯ�Ĵ����ſڣ����ڵ��Ҷ�(bian)���ɷ����д�š�������硱�ĸ����֣��ʷ�������͸��ͦ�Σ���ʧΪһ�ʺ��֡�͸�����ţ��㿴������һ����Ⱦ��һ��ʯ���ͼ���ʯ�ʶ����ŵ��������롣"
      region.rooms[4].exits = "south|north"
      region.rooms[4].links = {}
        region.rooms[4].links.s = {}
          region.rooms[4].links.s.to = 2703
          region.rooms[4].links.s.con = ""
        region.rooms[4].links.n = {}
          region.rooms[4].links.n.to = 2705
          region.rooms[4].links.n.con = ""
    region.rooms[5] = {}
      region.rooms[5].path = "fly mz;n;n"
      region.rooms[5].name = "ӭ��ͤ"
      region.rooms[5].zone = "÷ׯ"
      region.rooms[5].id = 2705
      region.rooms[5].desc = "    ͨ��������磬��������÷ׯ��ӭ��ͤ��������Ȼֻ��һ��ʯ������ʯ�ʣ���ȴ��һ����Ⱦ��ʯ�ʺ�ʯ��֮��Ŀ�϶�ܴ����Ƿ��������������໥���ѡ�һλ������վ��ͤǰ�����㹰��΢Ц��"
      region.rooms[5].exits = "south|north"
      region.rooms[5].links = {}
        region.rooms[5].links["zuan table"] = {}
          region.rooms[5].links["zuan table"].to = 2731
          region.rooms[5].links["zuan table"].con = ""
        region.rooms[5].links.s = {}
          region.rooms[5].links.s.to = 2704
          region.rooms[5].links.s.con = ""
        region.rooms[5].links.n = {}
          region.rooms[5].links.n.to = 2706
          region.rooms[5].links.n.con = ""
    region.rooms[6] = {}
      region.rooms[6].path = "fly mz;n;n;n"
      region.rooms[6].name = "��ľ԰"
      region.rooms[6].zone = "÷ׯ"
      region.rooms[6].id = 2706
      region.rooms[6].desc = "    ������÷ׯ�İ�ľ԰����һ�ߵ���������ߵ���һ�������޾���Сɭ��һ��������������������������������кܶ�в��������ֵ�������ľ��������һ�����(huang song)�ر�Ĵ�׳��������ï�ܵ�֦Ҷ���棬�ƺ�����ʲô���ܡ��Ա�����һ������(pai zi)��"
      region.rooms[6].exits = "south|east|north|southup|west"
      region.rooms[6].links = {}
        region.rooms[6].links.s = {}
          region.rooms[6].links.s.to = 2705
          region.rooms[6].links.s.con = ""
        region.rooms[6].links["climb huang song"] = {}
          region.rooms[6].links["climb huang song"].to = 2719
          region.rooms[6].links["climb huang song"].con = ""
        region.rooms[6].links.e = {}
          region.rooms[6].links.e.to = 2720
          region.rooms[6].links.e.con = ""
        region.rooms[6].links.n = {}
          region.rooms[6].links.n.to = 2707
          region.rooms[6].links.n.con = ""
        region.rooms[6].links.w = {}
          region.rooms[6].links.w.to = 2716
          region.rooms[6].links.w.con = ""
        region.rooms[6].links.su = {}
          region.rooms[6].links.su.to = 2726
          region.rooms[6].links.su.con = ""
    region.rooms[7] = {}
      region.rooms[7].path = "fly mz;n;n;n;n"
      region.rooms[7].name = "��Ժ"
      region.rooms[7].zone = "÷ׯ"
      region.rooms[7].id = 2707
      region.rooms[7].desc = "    ������÷ׯ����Ժ���������߹�ȥ�Ϳ����ҵ���λׯ���������ƺ��ǳ�����������������Ҷ���ص������������ƺ��ǳ����֣����������������ӵ����������������ֿ��Խ�������Ҵ��ң����治֪������ô��������ط�����һλ׳��ĺ��ӣ�������������Ժ�ſڡ�"
      region.rooms[7].exits = "south|north"
      region.rooms[7].links = {}
        region.rooms[7].links.s = {}
          region.rooms[7].links.s.to = 2706
          region.rooms[7].links.s.con = ""
        region.rooms[7].links.n = {}
          region.rooms[7].links.n.to = 2708
          region.rooms[7].links.n.con = ""
    region.rooms[8] = {}
      region.rooms[8].path = "fly mz;n;n;n;n;n"
      region.rooms[8].name = "����"
      region.rooms[8].zone = "÷ׯ"
      region.rooms[8].id = 2708
      region.rooms[8].desc = "    ����һ�����������ȣ�������������λׯ���е�������λƽʱ��Ϣ�������ĵط����������������ң��ұ��ǻ��ң���ׯ��ͺ���̺���ׯ�����������������µ�ʱ�򣬱㵽������ȥ�Ӻ�����ī��"
      region.rooms[8].exits = "south|north|east|west"
      region.rooms[8].links = {}
        region.rooms[8].links.e = {}
          region.rooms[8].links.e.to = 2709
          region.rooms[8].links.e.con = ""
        region.rooms[8].links.s = {}
          region.rooms[8].links.s.to = 2707
          region.rooms[8].links.s.con = ""
        region.rooms[8].links.w = {}
          region.rooms[8].links.w.to = 2710
          region.rooms[8].links.w.con = ""
        region.rooms[8].links.n = {}
          region.rooms[8].links.n.to = 2711
          region.rooms[8].links.n.con = ""
    region.rooms[9] = {}
      region.rooms[9].path = "fly mz;n;n;n;n;n;e"
      region.rooms[9].name = "����"
      region.rooms[9].zone = "÷ׯ"
      region.rooms[9].id = 2709
      region.rooms[9].desc = "    �����ǵ������Ļ��ң��׻�˵���黭���ּң����Ե��������鷨Ҳ���൱�Ĺ�������Ȼ����������ͺ���̺ܶ࣬���������Ľ������������鷨���У�Ҳ��ν�����������ˡ�����ĳ�������Ҳ�࣬Ψһ��ͬ���������ǽ�ϲ�û�йҵ������ĵ�����ʣ����ǹ�������ǰ�����ҵ����������ڵ������Լ�����һ��д�š������С������á�"
      region.rooms[9].exits = "west"
      region.rooms[9].links = {}
        region.rooms[9].links.w = {}
          region.rooms[9].links.w.to = 2708
          region.rooms[9].links.w.con = ""
    region.rooms[10] = {}
      region.rooms[10].path = "fly mz;n;n;n;n;n;w"
      region.rooms[10].name = "����"
      region.rooms[10].zone = "÷ׯ"
      region.rooms[10].id = 2710
      region.rooms[10].desc = "    ������ͺ���̵����ң�������һ���󰸣����Ϸ���һ����Ͳ����Ͳ�в��ż��ܴ�С��ͬ��ë�ʣ�ë�ʵ�����Ҳ������ͬ�����Ǻ���������������ף������룬����һ֧���Ϻ��Ѽ�����̡���ʣ�����ƽ����һ���ĳ����ô�С����ֽ��һ�����⣬һ����ī��һ�԰�����ֽ��һ����ɽ�ʼܣ����Գ����˶��鷨�İ��á�ǽ�Ϲ�����������д��һ�������������ã������� "
      region.rooms[10].exits = "east"
      region.rooms[10].links = {}
        region.rooms[10].links.e = {}
          region.rooms[10].links.e.to = 2708
          region.rooms[10].links.e.con = ""
    region.rooms[11] = {}
      region.rooms[11].path = "fly mz;n;n;n;n;n;n"
      region.rooms[11].name = "����"
      region.rooms[11].zone = "÷ׯ"
      region.rooms[11].id = 2711
      region.rooms[11].desc = "    ����һ�����������ȣ�������������λׯ���е�������λƽʱ��Ϣ�������ĵط����������������ң��ұ�����÷ׯ���Ӹо��Ͷٵ�ʱ����Ϣ�ĵط�����ׯ���ڰ��Ӳ�����ҹ�����������о�����Щ��֪���Ķ������Ĺ����ס� "
      region.rooms[11].exits = "south|north|east|west"
      region.rooms[11].links = {}
        region.rooms[11].links.e = {}
          region.rooms[11].links.e.to = 2712
          region.rooms[11].links.e.con = ""
        region.rooms[11].links.s = {}
          region.rooms[11].links.s.to = 2708
          region.rooms[11].links.s.con = ""
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 2713
          region.rooms[11].links.w.con = ""
        region.rooms[11].links.n = {}
          region.rooms[11].links.n.to = 2714
          region.rooms[11].links.n.con = ""
    region.rooms[12] = {}
      region.rooms[12].path = "fly mz;n;n;n;n;n;n;e"
      region.rooms[12].name = "��Ϣ��"
      region.rooms[12].zone = "÷ׯ"
      region.rooms[12].id = 2712
      region.rooms[12].desc = "    ������÷ׯ�����������۵�ʱ����Ϣ�ĵط������ﾭ�������������׵�����������򵥵ķ��ż��ŵ��ӣ������ޱ���������ͷ������÷ׯ������Ȼ������ɨ�����������Ȼ���Ҳ������ܶ�÷ׯ����һ�������ͷ��˯�����ǹ���ƣ�͵�Ե�ʡ� "
      region.rooms[12].exits = "west"
      region.rooms[12].links = {}
        region.rooms[12].links.w = {}
          region.rooms[12].links.w.to = 2711
          region.rooms[12].links.w.con = ""
    region.rooms[13] = {}
      region.rooms[13].path = "fly mz;n;n;n;n;n;n;w"
      region.rooms[13].name = "����"
      region.rooms[13].zone = "÷ׯ"
      region.rooms[13].id = 2713
      region.rooms[13].desc = "    ������Ƕ�ׯ���ڰ��ӵ������ˣ�����������ʯ�ʣ�һ��ʯ����ʯ�����úڰ��ӵ�ָ�������ݺ�žŰ�ʮһ����������˼򵥵ķ��������������ɵ������⣬ʲô��û�У�������˫������ʱ���ġ�"
      region.rooms[13].exits = "east"
      region.rooms[13].links = {}
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 2711
          region.rooms[13].links.e.con = ""
    region.rooms[14] = {}
      region.rooms[14].path = "fly mz;n;n;n;n;n;n;n"
      region.rooms[14].name = "����"
      region.rooms[14].zone = "÷ׯ"
      region.rooms[14].id = 2714
      region.rooms[14].desc = "    ���ȵ��������ƺ��͵��˾�ͷ�������ȵ���һͷ����������շ�����ζ�������������㣬�ߵ������Ҳ���ܲ�����������������������ջ�ֻ�мӿ�Ų���ȥ���������� "
      region.rooms[14].exits = "south|north"
      region.rooms[14].links = {}
        region.rooms[14].links.s = {}
          region.rooms[14].links.s.to = 2711
          region.rooms[14].links.s.con = ""
        region.rooms[14].links.n = {}
          region.rooms[14].links.n.to = 2715
          region.rooms[14].links.n.con = ""
    region.rooms[15] = {}
      region.rooms[15].path = "fly mz;n;n;n;n;n;n;n;n"
      region.rooms[15].name = "����"
      region.rooms[15].zone = "÷ׯ"
      region.rooms[15].id = 2715
      region.rooms[15].desc = "    ��˳����ζ�ߵ���÷ׯ�ĳ�����һλ��ʦ��վ����̨����Ц���еĿ����㣬����������һ�����ף������İѹ������ŵ�һ���ʳ����ȣ�÷ׯ�ĵ�����������ˣ��͵�����������λ��ʦ�ܲ��ܳԷ���һ����˵�����Ƕ������⵽�ܾ��ġ�"
      region.rooms[15].exits = "south"
      region.rooms[15].links = {}
        region.rooms[15].links.s = {}
          region.rooms[15].links.s.to = 2714
          region.rooms[15].links.s.con = ""
    region.rooms[16] = {}
      region.rooms[16].path = "fly mz;n;n;n;w"
      region.rooms[16].name = "ƫ��"
      region.rooms[16].zone = "÷ׯ"
      region.rooms[16].id = 2716
      region.rooms[16].desc = "    ����һ��û���κζ����ķ��ӣ��ıڿյ����ģ�������һ����޺õģ���û�����ü�����װ�εķ��䣬���е�ǽ�ϻ���һ���ڻ����൱����Ŀ�����ž���ʮ����ħ�ѪΪ�ˣ�ʮ���ħѪ������һֻ�ʺ�����ģ����ĵ��۾���Ȼ���÷ǳ���������ȸʯ���ɵġ�"
      region.rooms[16].exits = "east"
      region.rooms[16].links = {}
        region.rooms[16].links.e = {}
          region.rooms[16].links.e.to = 2706
          region.rooms[16].links.e.con = ""
        region.rooms[16].links["push eye"] = {}
          region.rooms[16].links["push eye"].to = 2717
          region.rooms[16].links["push eye"].con = ""
    region.rooms[17] = {}
      region.rooms[17].path = "fly mz;n;n;n;w;push eye"
      region.rooms[17].name = "����"
      region.rooms[17].zone = "÷ׯ"
      region.rooms[17].id = 2717
      region.rooms[17].desc = "    ����һ�䲻��ķ��䣬���������һ���ŵ����(shu jia)�ͺܶ���(book)������ܵ����Կ��ż������˵ĺ��ǣ���һ�ߵ��ع�֮�л�����һ������"
      region.rooms[17].exits = "out"
      region.rooms[17].links = {}
        region.rooms[17].links["climb ti zi;jump shu jia"] = {}
          region.rooms[17].links["climb ti zi;jump shu jia"].to = 2718
          region.rooms[17].links["climb ti zi;jump shu jia"].con = ""
        region.rooms[17].links.out = {}
          region.rooms[17].links.out.to = 2716
          region.rooms[17].links.out.con = ""
    region.rooms[18] = {}
      region.rooms[18].path = "fly mz;n;n;n;w;push eye;climb ti zi;jump shu jia"
      region.rooms[18].name = "��ܶ���"
      region.rooms[18].zone = "÷ׯ"
      region.rooms[18].id = 2718
      region.rooms[18].desc = "    ����������ܵĶ���������������Կ����������ҵ���������˼��߰׹����⣬ȷʵû��ʲôֵ���㻳�ɵĶ��������㷢����ܵĶ����ǳ������ʵ�����һ����"
      region.rooms[18].exits = "down"
      region.rooms[18].links = {}
        region.rooms[18].links.d = {}
          region.rooms[18].links.d.to = 2717
          region.rooms[18].links.d.con = ""
    region.rooms[19] = {}
      region.rooms[19].path = "fly mz;n;n;n;climb huang song"
      region.rooms[19].name = "������"
      region.rooms[19].zone = "÷ׯ"
      region.rooms[19].id = 2719
      region.rooms[19].desc = "    �����������������Ķ��ˣ�����������Կ���һƬ���ܺ������֣�����������ͬ����һ��ݵ���һ����Զ�����Կ�������ԼԼ��һ��Ρ��ĸ�ɽ��"
      region.rooms[19].exits = "down"
      region.rooms[19].links = {}
        region.rooms[19].links.d = {}
          region.rooms[19].links.d.to = 2706
          region.rooms[19].links.d.con = ""
    region.rooms[20] = {}
      region.rooms[20].path = "fly mz;n;n;n;e"
      region.rooms[20].name = "��ľ԰"
      region.rooms[20].zone = "÷ׯ"
      region.rooms[20].id = 2720
      region.rooms[20].desc = "    ������÷ׯ�İ�ľ԰����һ�ߵ���������ߵ���һ�������޾���Сɭ��һ��������������������������������кܶ�в��������ֵ�������ľ�����������У�ֻ�����Ƭ���־��������һ�飬������ȥ�źá�"
      region.rooms[20].exits = "south|east|north|west"
      region.rooms[20].links = {}
        region.rooms[20].links.s = {}
          region.rooms[20].links.s.to = 2721
          region.rooms[20].links.s.con = ""
        region.rooms[20].links.n = {}
          region.rooms[20].links.n.to = 2721
          region.rooms[20].links.n.con = ""
        region.rooms[20].links.w = {}
          region.rooms[20].links.w.to = 2720
          region.rooms[20].links.w.con = ""
        region.rooms[20].links.e = {}
          region.rooms[20].links.e.to = 2720
          region.rooms[20].links.e.con = ""
    region.rooms[21] = {}
      region.rooms[21].path = "fly mz;n;n;n;e;s"
      region.rooms[21].name = "��ľ԰"
      region.rooms[21].zone = "÷ׯ"
      region.rooms[21].id = 2721
      region.rooms[21].desc = "    ������÷ׯ�İ�ľ԰����һ�ߵ���������ߵ���һ�������޾���Сɭ��һ��������������������������������кܶ�в��������ֵ�������ľ�����������У�ֻ�����Ƭ���־��������һ�飬������ȥ�źá�"
      region.rooms[21].exits = "south|east|north|west"
      region.rooms[21].links = {}
        region.rooms[21].links.s = {}
          region.rooms[21].links.s.to = 2722
          region.rooms[21].links.s.con = ""
        region.rooms[21].links.n = {}
          region.rooms[21].links.n.to = 2720
          region.rooms[21].links.n.con = ""
        region.rooms[21].links.w = {}
          region.rooms[21].links.w.to = 2721
          region.rooms[21].links.w.con = ""	
        region.rooms[21].links.e = {}
          region.rooms[21].links.e.to = 2706
          region.rooms[21].links.e.con = ""		  
    region.rooms[22] = {}
      region.rooms[22].path = "fly mz;n;n;n;e;s;s"
      region.rooms[22].name = "��ľ԰"
      region.rooms[22].zone = "÷ׯ"
      region.rooms[22].id = 2722
      region.rooms[22].desc = "    ������÷ׯ�İ�ľ԰����һ�ߵ���������ߵ���һ�������޾���Сɭ��һ��������������������������������кܶ�в��������ֵ�������ľ�����������У�ֻ�����Ƭ���־��������һ�飬������ȥ�źá� "
      region.rooms[22].exits = "south|east|north|west"
      region.rooms[22].links = {}
        region.rooms[22].links.w = {}
          region.rooms[22].links.w.to = 2723
          region.rooms[22].links.w.con = ""
        region.rooms[22].links.e = {}
          region.rooms[22].links.e.to = 2720
          region.rooms[22].links.e.con = ""
        region.rooms[22].links.s = {}
          region.rooms[22].links.s.to = 2722
          region.rooms[22].links.s.con = ""	
        region.rooms[22].links.n = {}
          region.rooms[22].links.n.to = 2721
          region.rooms[22].links.n.con = ""		  
    region.rooms[23] = {}
      region.rooms[23].path = "fly mz;n;n;n;e;s;s;w"
      region.rooms[23].name = "��ľ԰"
      region.rooms[23].zone = "÷ׯ"
      region.rooms[23].id = 2723
      region.rooms[23].desc = "    ������÷ׯ�İ�ľ԰����һ�ߵ���������ߵ���һ�������޾���Сɭ��һ��������������������������������кܶ�в��������ֵ�������ľ�����������У�ֻ�����Ƭ���־��������һ�飬������ȥ�źá�"
      region.rooms[23].exits = "north|southwest|south|northwest|east|southeast|northeast|west"
      region.rooms[23].links = {}
        region.rooms[23].links.sw = {}
          region.rooms[23].links.sw.to = 2724
          region.rooms[23].links.sw.con = ""
        region.rooms[23].links.e = {}
          region.rooms[23].links.e.to = 2720
          region.rooms[23].links.e.con = ""
        region.rooms[23].links.w = {}
          region.rooms[23].links.w.to = 2720
          region.rooms[23].links.w.con = ""
        region.rooms[23].links.ne = {}
          region.rooms[23].links.ne.to = 2720
          region.rooms[23].links.ne.con = ""
        region.rooms[23].links.n = {}
          region.rooms[23].links.n.to = 2721
          region.rooms[23].links.n.con = ""
        region.rooms[23].links.s = {}
          region.rooms[23].links.s.to = 2723
          region.rooms[23].links.s.con = ""
        region.rooms[23].links.nw = {}
          region.rooms[23].links.nw.to = 2722
          region.rooms[23].links.nw.con = ""
        region.rooms[23].links.se = {}
          region.rooms[23].links.se.to = 2722
          region.rooms[23].links.se.con = ""
    region.rooms[24] = {}
      region.rooms[24].path = "fly mz;n;n;n;e;s;s;w;sw"
      region.rooms[24].name = "��ľ԰"
      region.rooms[24].zone = "÷ׯ"
      region.rooms[24].id = 2724
      region.rooms[24].desc = "    ������÷ׯ�İ�ľ԰����һ�ߵ���������ߵ���һ�������޾���Сɭ��һ��������������������������������кܶ�в��������ֵ�������ľ�����������У�ֻ�����Ƭ���־��������һ�飬������ȥ�źá�"
      region.rooms[24].exits = "south|east|north|west"
      region.rooms[24].links = {}
        region.rooms[24].links.e = {}
          region.rooms[24].links.e.to = 2725
          region.rooms[24].links.e.con = ""
		region.rooms[24].links.n = {}
          region.rooms[24].links.n.to = 2722
          region.rooms[24].links.n.con = ""
		region.rooms[24].links.w = {}
          region.rooms[24].links.w.to = 2721
          region.rooms[24].links.w.con = ""
    region.rooms[25] = {}
      region.rooms[25].path = "fly mz;n;n;n;e;s;s;w;sw;e"
      region.rooms[25].name = "��ľ԰"
      region.rooms[25].zone = "÷ׯ"
      region.rooms[25].id = 2725
      region.rooms[25].desc = "    ������÷ׯ�İ�ľ԰����һ�ߵ���������ߵ���һ�������޾���Сɭ��һ��������������������������������кܶ�в��������ֵ�������ľ�����������У�ֻ�����Ƭ���־��������һ�飬������ȥ�źá� "
      region.rooms[25].exits = "south|east|north|west"
      region.rooms[25].links = {}
        region.rooms[25].links.s = {}
          region.rooms[25].links.s.to = 2726
          region.rooms[25].links.s.con = ""
		region.rooms[25].links.e = {}
          region.rooms[25].links.e.to = 2720
          region.rooms[25].links.e.con = ""
        region.rooms[25].links.w = {}
          region.rooms[25].links.w.to = 2723
          region.rooms[25].links.w.con = ""		  
    region.rooms[26] = {}
      region.rooms[26].path = "fly mz;n;n;n;su"
      region.rooms[26].name = "�滱��"
      region.rooms[26].zone = "÷ׯ"
      region.rooms[26].id = 2726
      region.rooms[26].desc = "    ��������滱���ˣ��������Ŵ��СС��ǧ��ٹֵĻ������еĻ���һֱ���죬�е����������ƣ������������ԼԼ����һ������������������ޣ��������֡�"
      region.rooms[26].exits = "eastup|northdown"
      region.rooms[26].links = {}
        region.rooms[26].links.eu = {}
          region.rooms[26].links.eu.to = 2727
          region.rooms[26].links.eu.con = ""
        region.rooms[26].links.nd = {}
          region.rooms[26].links.nd.to = 2706
          region.rooms[26].links.nd.con = ""
    region.rooms[27] = {}
      region.rooms[27].path = "fly mz;n;n;n;su;eu"
      region.rooms[27].name = "С·"
      region.rooms[27].zone = "÷ׯ"
      region.rooms[27].id = 2727
      region.rooms[27].desc = "    ���ߵ�����С·�ϣ�ǰ���Ѿ���������ԼԼ����һ��СС��Ժ���Ӱ�ӣ�����Էǳ��Ŀ϶����������Ǵ����СԺ�﷢�����ģ��뵽���̾Ϳ��Լ�����ׯ�����ӹ��ˣ��㲻��һ����š� "
      region.rooms[27].exits = "north|westdown"
      region.rooms[27].links = {}
        region.rooms[27].links.wd = {}
          region.rooms[27].links.wd.to = 2726
          region.rooms[27].links.wd.con = ""
        region.rooms[27].links["unwield all;n"] = {}
          region.rooms[27].links["unwield all;n"].to = 2728
          region.rooms[27].links["unwield all;n"].con = ""
    region.rooms[28] = {}
      region.rooms[28].path = "fly mz;n;n;n;su;eu;unwield all;n"
      region.rooms[28].name = "����СԺ"
      region.rooms[28].zone = "÷ׯ"
      region.rooms[28].id = 2728
      region.rooms[28].desc = "    ����һ���������ǳ���ͨ��СС��Ժ�䣬Ժ�ӵ��м佨��һ��С�ݣ�С��Ҳ����ͨ��������é��Ϊ����ש��Ϊǽ��Ժ����û��ʲô���裬ֻ�м��Ѹ�ľ��(wood)���ڽ����������һ���ر�����עĿ��"
      region.rooms[28].exits = "south|enter"
      region.rooms[28].links = {}
        region.rooms[28].links.enter = {}
          region.rooms[28].links.enter.to = 2729
          region.rooms[28].links.enter.con = ""
        region.rooms[28].links.s = {}
          region.rooms[28].links.s.to = 2727
          region.rooms[28].links.s.con = ""
        region.rooms[28].links.e = {}
          region.rooms[28].links.e.to = 2730
          region.rooms[28].links.e.con = "k1:����"
    region.rooms[29] = {}
      region.rooms[29].path = "fly mz;n;n;n;su;eu;unwield all;n;enter"
      region.rooms[29].name = "С��"
      region.rooms[29].zone = "÷ׯ"
      region.rooms[29].id = 2729
      region.rooms[29].desc = "    ��������С���Ժ󣬷������ﾹȻ��������Ĳ��ܴ�������Ȼ����˵�ǽ�̻Իͣ��������������Ƶ����������������Σ������磬��������......����ʤ����ǽ�Ϲ���һ����������һ�߰������١�"
      region.rooms[29].exits = "out"
      region.rooms[29].links = {}
        region.rooms[29].links.out = {}
          region.rooms[29].links.out.to = 2728
          region.rooms[29].links.out.con = ""
    region.rooms[30] = {}
      region.rooms[30].path = "fly mz;n;n;n;su;eu;unwield all;n;|!k1:����:e|"
      region.rooms[30].name = "��԰"
      region.rooms[30].zone = "÷ׯ"
      region.rooms[30].id = 2730
      region.rooms[30].desc = "    ����һ��СС��԰�ӣ����������˴��СС����������֦�еĳ��ɼ��أ��еĻ�����֦��Ҷ�����м���һ���ľ(guanmu)�͵Ͱ����ģ���������ǳ�����עĿ���㲻��������࿴�����ۡ�"
      region.rooms[30].exits = "west"
      region.rooms[30].links = {}
        region.rooms[30].links.w = {}
          region.rooms[30].links.w.to = 2728
          region.rooms[30].links.w.con = ""
    region.rooms[31] = {}
      region.rooms[31].path = "fly mz;n;n;zuan table"
      region.rooms[31].name = "÷ׯ�ܵ�"
      region.rooms[31].zone = "÷ׯ"
      region.rooms[31].id = 2731
      region.rooms[31].desc = "    ����һ���谵��ʪ�ĵص����ص��ܳ������ߵ���������̫�����Ļ�ѣ��ص����Ե�ǽ���ϻ��źܶ಻֪�����Ժ���֮�ֵıڻ������һ����൱�ѿ�����ӿ�Ų�����֪���ص��ľ�ͷ��ʲô�ط��� "
      region.rooms[31].exits = "south|east|north|west"
      region.rooms[31].links = {}
        region.rooms[31].links.e = {}
          region.rooms[31].links.e.to = 2731
          region.rooms[31].links.e.con = ""
        region.rooms[31].links.w = {}
          region.rooms[31].links.w.to = 2732
          region.rooms[31].links.w.con = ""
        region.rooms[31].links.s = {}
          region.rooms[31].links.s.to = 2735
          region.rooms[31].links.s.con = ""
        region.rooms[31].links.n = {}
          region.rooms[31].links.n.to = 2732
          region.rooms[31].links.n.con = ""
    region.rooms[32] = {}
      region.rooms[32].path = "fly mz;n;n;zuan table;w"
      region.rooms[32].name = "÷ׯ�ܵ�"
      region.rooms[32].zone = "÷ׯ"
      region.rooms[32].id = 2732
      region.rooms[32].desc = "    ����һ���谵��ʪ�ĵص����ص��ܳ������ߵ���������̫�����Ļ�ѣ��ص����Ե�ǽ���ϻ��źܶ಻֪�����Ժ���֮�ֵıڻ������һ����൱�ѿ�����ӿ�Ų�����֪���ص��ľ�ͷ��ʲô�ط��� "
      region.rooms[32].exits = "south|east|north|west"
      region.rooms[32].links = {}
        region.rooms[32].links.e = {}
          region.rooms[32].links.e.to = 2731
          region.rooms[32].links.e.con = ""
        region.rooms[32].links.w = {}
          region.rooms[32].links.w.to = 2732
          region.rooms[32].links.w.con = ""
        region.rooms[32].links.s = {}
          region.rooms[32].links.s.to = 2731
          region.rooms[32].links.s.con = ""
        region.rooms[32].links.n = {}
          region.rooms[32].links.n.to = 2733
          region.rooms[32].links.n.con = ""
    region.rooms[33] = {}
      region.rooms[33].path = "fly mz;n;n;zuan table;w;n"
      region.rooms[33].name = "÷ׯ�ܵ�"
      region.rooms[33].zone = "÷ׯ"
      region.rooms[33].id = 2733
      region.rooms[33].desc = "    ����һ���谵��ʪ�ĵص����ص��ܳ������ߵ���������̫�����Ļ�ѣ��ص����Ե�ǽ���ϻ��źܶ಻֪�����Ժ���֮�ֵıڻ������һ����൱�ѿ�����ӿ�Ų�����֪���ص��ľ�ͷ��ʲô�ط��� "
      region.rooms[33].exits = "south|east"
      region.rooms[33].links = {}
        region.rooms[33].links.e = {}
          region.rooms[33].links.e.to = 2733
          region.rooms[33].links.e.con = ""
        region.rooms[33].links.s = {}
          region.rooms[33].links.s.to = 2734
          region.rooms[33].links.s.con = ""
    region.rooms[34] = {}
      region.rooms[34].path = "fly mz;n;n;zuan table;w;n;s"
      region.rooms[34].name = "÷ׯ�ܵ�"
      region.rooms[34].zone = "÷ׯ"
      region.rooms[34].id = 2734
      region.rooms[34].desc = "    ����һ���谵��ʪ�ĵص����ص��ܳ������ߵ���������̫�����Ļ�ѣ��ص����Ե�ǽ���ϻ��źܶ಻֪�����Ժ���֮�ֵıڻ������һ����൱�ѿ�����ӿ�Ų�����֪���ص��ľ�ͷ��ʲô�ط���"
      region.rooms[34].exits = "south|east|north|west"
      region.rooms[34].links = {}
        region.rooms[34].links.e = {}
          region.rooms[34].links.e.to = 2735
          region.rooms[34].links.e.con = ""
        region.rooms[34].links.w = {}
          region.rooms[34].links.w.to = 2733
          region.rooms[34].links.w.con = ""
        region.rooms[34].links.s = {}
          region.rooms[34].links.s.to = 2735
          region.rooms[34].links.s.con = ""
        region.rooms[34].links.n = {}
          region.rooms[34].links.n.to = 2731
          region.rooms[34].links.n.con = ""
    region.rooms[35] = {}
      region.rooms[35].path = "fly mz;n;n;zuan table;s"
      region.rooms[35].name = "÷ׯ�ܵ�"
      region.rooms[35].zone = "÷ׯ"
      region.rooms[35].id = 2735
      region.rooms[35].desc = "    ����һ���谵��ʪ�ĵص����ص��ܳ������ߵ���������̫�����Ļ�ѣ��ص����Ե�ǽ���ϻ��źܶ಻֪�����Ժ���֮�ֵıڻ������һ����൱�ѿ�����ӿ�Ų�����֪���ص��ľ�ͷ��ʲô�ط���ͻȻ֮���㷢������ĵ����Ѿ���ľ��ƴ�ɵ��ˡ�"
      region.rooms[35].exits = "south"
      region.rooms[35].links = {}
        region.rooms[35].links.s = {}
          region.rooms[35].links.s.to = 2732
          region.rooms[35].links.s.con = ""
        region.rooms[35].links["pull floor;d"] = {}
          region.rooms[35].links["pull floor;d"].to = 2736
          region.rooms[35].links["pull floor;d"].con = ""
    region.rooms[36] = {}
      region.rooms[36].path = "fly mz;n;n;zuan table;s;pull floor;d"
      region.rooms[36].name = "��"
      region.rooms[36].zone = "÷ׯ"
      region.rooms[36].id = 2736
      region.rooms[36].desc = "    ��һ�����ӭ����ŵ�һ�ɸ��õ�������ζ����������ǰ��������У����ֿ�����ϣ�����㲻����ʼ�ӿ�Ų����뿴�����ﵽ����Щʲô������ "
      region.rooms[36].exits = "up|north"
      region.rooms[36].links = {}
        region.rooms[36].links.u = {}
          region.rooms[36].links.u.to = 2735
          region.rooms[36].links.u.con = ""
        region.rooms[36].links.n = {}
          region.rooms[36].links.n.to = 2737
          region.rooms[36].links.n.con = ""
    region.rooms[37] = {}
      region.rooms[37].path = "fly mz;n;n;zuan table;s;pull floor;d;n"
      region.rooms[37].name = "��"
      region.rooms[37].zone = "÷ׯ"
      region.rooms[37].id = 2737
      region.rooms[37].desc = "    ��һ�����ӭ����ŵ�һ�ɸ��õ�������ζ����������ǰ��������У����ֿ�����ϣ�����㲻����ʼ�ӿ�Ų����뿴�����ﵽ����Щʲô������ "
      region.rooms[37].exits = "south|north"
      region.rooms[37].links = {}
        region.rooms[37].links.s = {}
          region.rooms[37].links.s.to = 2736
          region.rooms[37].links.s.con = ""
        region.rooms[37].links.n = {}
          region.rooms[37].links.n.to = 2738
          region.rooms[37].links.n.con = ""
    region.rooms[38] = {}
      region.rooms[38].path = "fly mz;n;n;zuan table;s;pull floor;d;n;n"
      region.rooms[38].name = "�Ż���"
      region.rooms[38].zone = "÷ׯ"
      region.rooms[38].id = 2738
      region.rooms[38].desc = "    ��һ�ߵ����ͻȻһƬ������ԭ�����ﾹȻ�ǹŴ��ϴ�������Ĺ���м�ͣ����һ�߹�ľ����ľ���Ϸ�������һ�Ŷ쵰һ���С��ҹ���飬�������յ��쳣��������ľ�����з���һ���飬�鿴�����ܳ¾ɣ��ƺ���һλǰ���������µġ� "
      region.rooms[38].exits = "south|out"
      region.rooms[38].links = {}
        region.rooms[38].links.s = {}
          region.rooms[38].links.s.to = 2737
          region.rooms[38].links.s.con = ""
        region.rooms[38].links.out = {}
          region.rooms[38].links.out.to = 2739
          region.rooms[38].links.out.con = ""
    region.rooms[39] = {}
      region.rooms[39].path = "fly mz;n;n;zuan table;s;pull floor;d;n;n;out"
      region.rooms[39].name = "��������"
      region.rooms[39].zone = "÷ׯ"
      region.rooms[39].id = 2739
      region.rooms[39].desc = "    ˳������һֱ�߹�ȥ���������ź��ߵ���������֪�������Ѿ��ߵ������ľ�ͷ��������һ�����ѵ�С·��ǰ�����ţ�����ԼԼ���Կ���һ��ׯ԰���㲻�����߹�ȥ����������ʲô�ط���"
      region.rooms[39].exits = "northeast"
      region.rooms[39].links = {}
    region.rooms[40] = {}
      region.rooms[40].path = "fly mz;open gate;s"
      region.rooms[40].name = "÷ׯ����"
      region.rooms[40].zone = "÷ׯ"
      region.rooms[40].id = 2740
      region.rooms[40].desc = "    �߹�һ��Ƭ÷�֣�����һ����ʯ���·������һ�����Ű�ǽ�Ĵ�ׯԺ�⣬�е���������������д�š�÷ׯ���������֣��Ա����š��������⡱���֡����������������ƽ�Ĵ󹦳����⼸��������֮��͸�Ų���Ӣ����"
      region.rooms[40].exits = "south|north"
      region.rooms[40].links = {}
        region.rooms[40].links.s = {}
          region.rooms[40].links.s.to = 2741
          region.rooms[40].links.s.con = ""
        region.rooms[40].links["knock 4;knock 2;knock 5;knock 3;n"] = {}
          region.rooms[40].links["knock 4;knock 2;knock 5;knock 3;n"].to = 2703
          region.rooms[40].links["knock 4;knock 2;knock 5;knock 3;n"].con = ""
    region.rooms[41] = {}
      region.rooms[41].path = "fly mz;open gate;s;s"
      region.rooms[41].name = "����С��"
      region.rooms[41].zone = "÷ׯ"
      region.rooms[41].id = 2741
      region.rooms[41].desc = "    ����С·����������������÷������Ȼ��û��÷��ʢ���ļ��ڣ���͸�������ܵ�÷�֣����ƺ��Ѿ��ŵ��������÷�������㣬��ʱ���Ѿ���������ߵ�ׯ԰���ſڣ��㰵����ӿ��˽Ų���"
      region.rooms[41].exits = "south|north"
      region.rooms[41].links = {}
        region.rooms[41].links.s = {}
          region.rooms[41].links.s.to = 282
          region.rooms[41].links.s.con = ""
        region.rooms[41].links.n = {}
          region.rooms[41].links.n.to = 2740
          region.rooms[41].links.n.con = ""
  region.center = 2703
return region