local region = {}
  region.cmd = "fly qz"
  region.name = "Ȫ��2"
  region.id = "qz2"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly qz;|!a:enter chuan:|;|!a:enter zhou:|"
      region.rooms[1].name = "��Ƕ��"
      region.rooms[1].zone = "Ȫ��"
      region.rooms[1].id = 3045
      region.rooms[1].links = {}
        region.rooms[1].links.eu = {}
          region.rooms[1].links.eu.to = 3046
          region.rooms[1].links.eu.con = ""
        region.rooms[1].links.n = {}
          region.rooms[1].links.n.to = 3047
          region.rooms[1].links.n.con = ""
        region.rooms[1].links.s = {}
          region.rooms[1].links.s.to = 3048
          region.rooms[1].links.s.con = ""
      region.rooms[1].exits = "south|eastup|north"
      region.rooms[1].desc = "    �˵�Ϊ̨�帮פ����̨�忪��δ�ã�����ү�������ո��˳ǣ�Χ����ë��������֮�ã����½����ȱ��"
    region.rooms[2] = {}
      region.rooms[2].path = "fly qz;|!a:enter chuan:|;|!a:enter zhou:|;eu"
      region.rooms[2].name = "����̶"
      region.rooms[2].zone = "Ȫ��"
      region.rooms[2].id = 3046
	  region.rooms[2].attr = "danger"
	  region.rooms[2].npckill = true
      region.rooms[2].links = {}
        region.rooms[2].links.wd = {}
          region.rooms[2].links.wd.to = 3045
          region.rooms[2].links.wd.con = ""
      region.rooms[2].exits = "westdown"
      region.rooms[2].desc = "    ��廷������ˮ�α̵�����̶��̶���������֣�̶���������£�Ϊ̨�����ʤ�ء�"
    region.rooms[3] = {}
      region.rooms[3].path = "fly qz;|!a:enter chuan:|;|!a:enter zhou:|;n"
      region.rooms[3].name = "������"
      region.rooms[3].zone = "Ȫ��"
      region.rooms[3].id = 3047
	  region.rooms[3].attr = "danger"
      region.rooms[3].npckill = true
	  region.rooms[3].links = {}
        region.rooms[3].links.s = {}
          region.rooms[3].links.s.to = 3045
          region.rooms[3].links.s.con = ""
      region.rooms[3].exits = "south"
      region.rooms[3].desc = "    ����Ϊ̨�山�����ۡ�Ⱥɽ�����ĸۿڸ��ع�����̳��ܣ��С�̨���������֮�Ƶĳ����������ڴ˿�����ɣ��������Ϣ���Ű�������"
    region.rooms[4] = {}
      region.rooms[4].path = "fly qz;|!a:enter chuan:|;|!a:enter zhou:|;s"
      region.rooms[4].name = "�򹷸�"
      region.rooms[4].zone = "Ȫ��"
      region.rooms[4].id = 3048
	  region.rooms[4].attr = "danger"
	  region.rooms[4].npckill = true
      region.rooms[4].links = {}
        region.rooms[4].links.n = {}
          region.rooms[4].links.n.to = 3045
          region.rooms[4].links.n.con = ""
      region.rooms[4].exits = "north"
      region.rooms[4].desc = "    �򹷸�λ��̨���ϲ��������С�������е����������ھ�����Ͽ�壬��ǫ̈̄��һ���ۡ�"
  region.center = 3045
return region