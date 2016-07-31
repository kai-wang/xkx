require "wait"
require "tprint"
require "utils"
require("worlds\\xkx\\mods\\core")
module ("wei", package.seeall)

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

--[1] name, [2] path, [3] id
local wei_buy_items = {
	["���Ǻ�«"] = {"bj;s;buy hulu", "hulu"},
	["�ٹ��Ͱ�"] = {"hz;w;#3 n;e;buy youbao", "youbao"},
	["������"] = {"xy;w;#2 (nw);w;buy dongbula", "dongbula"},
	["��ü��"] = {"xi;s;s;s;e;buy gun", "gun"},
	["ţƤ��"] = {"xy;w;sw;w;w;w;buy niu pidai", "niu pidai"},
	["������"] = {"xy;w;sw;w;w;w;buy qingke mian", "mian"},
	["�л�ͯ��"] = {"hz;w;#3 n;e;buy tongji", "tongji"},
	["��������"] = {"hz;w;#3 n;e;buy cuyu", "cuyu"},
	["����Ϻ��"] = {"hz;w;#3 n;e;buy xiaren", "xiaren"},
	["��ƿ"] = {"hz;w;#3 n;e;buy jiu ping", "jiu ping"},
	["��Ҷ������"] = {"sz;buy tang", "tang"},
	["����"] = 	{"ne;d;buy fire",	"fire"},
	["���Ϻ��"] = 	{"sz;buy xiaren",	"xiaren"},
	["ӣ�һ���"] = 	{"sz;buy huotui",	"huotui"},
	["ţƤ�ƴ�"] = {"wm;#2 e;buy jiudai",	"jiudai"},
	["����"] = {"ne;d;n;e;s;buy jian",	"chang jian"},
	["�ֵ�"] = {"bj;e;e;s;buy gang dao",	"dao"},
	["����"] = {"bj;e;e;s;buy tu dao",	"tu dao"},
	["����"] = {"bj;e;e;s;buy tie gun",	"gun"},
	["���ܹ�"] = {"xy;w;#2 (nw);w;buy hami gua",	"hami gua"},
	["���̾ƺ�"] = {"xy;w;#2 (nw);w;buy jiu hu",	"jiu hu"},
	["������"] = {"fz;#2 s;#3 w;buy xianglian",	"xianglian"},
	["��Ь"] = {"ne;d;buy cao xie",	"xie"},
	["�鲼��"] = {"ne;d;buy budai",	"budai"},
	["խ�̰�"] = {"dl;s;w;s;e;n;buy ken ao",	"ao"},
	["���ƹ���"] = {"dl;s;w;s;e;n;buy guazi",	"guazi"},
	["��������"] = {"dl;s;w;s;s;e;buy mixian",	"mixian"},
	["������"] = {"dl;s;w;s;s;e;buy qiguo ji",	"qiguo ji"},
	["����"] = {"xi;s;s;s;e;buy jia",	"jia"},
	["����"] = {"xi;s;s;s;e;buy zhang",	"gang zhang"},
	["����ǽ"] = {"fz;s;e;buy fotiaoqiang",	"fotiaoqiang"},
	["����ƴ�"] = {"wm;#2 e;u;buy jiudai",	"jiudai"},
	["����ʯ����"] = {"ne;buy yao dai",	"dai"},
	["�����"] = {"wm;#2 e;buy baozi",	"baozi"},
	["Ƥѥ"] = {"ne;d;buy xue",	"xue"},
	["����"] = {"bj;e;n;n;w;buy mian",	"mian"},
	["ľ��"] = {"xi;e;e;e;s;buy mu dao",	"mu dao"},
	["ľ��"] = {"xi;e;e;e;s;buy mu jian",	"mu jian"},
	["����"] = {"ne;d;buy hu wan",	"wan"},
	["�廨С����"] = {"ne;buy fang jin",	"jin"},
	["һ����ң��"] = {"ne;buy xiaoyao jin",	"jin"},
	["��̳��"] = {"d;w;s;w;buy tanzi",	"tanzi"},
	["˿�����"] = {"ne;buy ma gua",	"gua"},
	["�׶���"] = {"cd;w;w;w;w;w;n;nw;buy hedinghong",	"hedinghong"},
	["ľ��"] = {"xi;e;e;e;s;buy mu gun",	"mu gun"},
	["������"] = {"wm;#2 e;buy tui",	"tui"},
	["�������װ"] = {"ne;buy xiucai zhuang",	"zhuang"},
	["��˿��"] = {"ne;d;buy jinsi jia",	"jinsi jia"},
	["ţƤ��"] = {"ne;d;buy dun",	"niupi dun"},
	["�����Ž��"] = {"ne;buy tuanjin gua",	"gua"},
	["ͷ��"] = {"ne;d;buy kui",	"kui"},
	["��Ƥ"] = {"bj;w;w;n;w;buy pi",	"pi"},
	["ǧ����"] = {"ne;d;n;n;buy literateb3",	"literateb3"},
	["��ȸ��"] = {"cd;w;w;w;w;w;n;nw;buy kongque dan",	"kongque dan"},
	["õ�廨��"] = {"cd;w;n;nw;w;w;w;nw;buy huaban",	"huaban"},
	["�ߵ���"] = {"bj;s;s;buy fen",	"fen"},
	["��ҩ"] = {"ne;d;n;e;n;buy yao",	"jinchuang yao"},
	["�ʶн����"] = {"ne;buy jinshen ao",	"ao"},
	["ָ��"] = {"ne;d;buy tao",	"tao"},
	["������Ȧ"] = {"ne;d;buy quan",	"quan"},
	["�м�����"] = {"xi;w;w;n;n;w;buy book",	"book"},
	["��Ѽ"] = {"wm;#2 e;u;buy ya",	"ya"},
	["��Ƥ"] = {"yd;n;e;buy gou pi",	"gou pi"},
	["��Ƥ��ҩ"] = {"yd;n;e;buy goupi gaoyao",	"goupi gaoyao"},
	["����"] = {"ne;d;n;n;buy sishu1",	"sishu1"},
	["�ɻ�ʯ"] = {"cd;w;n;nw;w;w;w;nw;buy shi",	"shi"},
	["��"] = {"tls;n;e;#2 s;w;#2 s;w;s;buy xiang",	"xiang"},
	["���ָ"] = {"fz;#2 s;#3 w;buy jiezhi",	"jiezhi"},
	["���ƿ"] = {"fz;s;e;buy ping",	"ping"},
	["�廨СЬ"] = {"bj;w;w;n;w;buy xiuhua xie",	"xiuhua xie"},
	["ˮ��"] = {"wg;buy hu",	"hu"},
	["����"] = {"wg;buy zhang",	"zhang"},
	["�����Ҷ��"] = {"wg;buy dan",	"dan"},
	["�ۺ����"] = {"bj;w;w;n;w;buy shan",	"shan"},
	["���"] = {"d;w;s;w;buy hu",	"cha hu"},
	["��䶹��"] = {"d;w;s;w;buy doufu",	"doufu"},
	["���"] = {"sz;w;#3 s;buy bang",	"zhu bang"},
	["�ټ���"] = {"ne;d;n;n;buy literateb2",	"literateb2"},
	["��Ƥѥ"] = {"ne;buy yangpi xue",	"yangpi xue"},
	["���㻨��"] = {"d;w;s;w;buy huasheng",	"huasheng"},
	["��������"] = {"dl;s;w;s;s;e;buy huotui",	"huotui"},
	["�޺�����ȹ"] = {"ne;buy lianyi qun",	"qun"},
	["Ƥ����"] = {"ne;d;buy beixin",	"beixin"},
	["����"] = {"bj;e;e;s;buy tie chui",	"chui"},
	["�廨��"] = {"bj;w;w;n;w;buy zhen",	"zhen"},
	["���ϲ��"] = {"dl;s;w;s;s;e;buy cha hu",	"cha hu"},
	["�������"] = {"ne;buy huayue shang",	"shang"},
	["�������"] = {"ne;buy shu dai",	"shu dai"},
	["����"] = {"gw;n;n;w;buy rou",	"rou"},
	["��Ԫ��"] = {"ne;d;n;e;n;buy guiyuan dan",	"guiyuan dan"},
	["��������"] = {"hz;w;#3 n;e;buy geng",	"geng"},
	["������ɽ����ͼ��"] = {"gw;n;n;w;buy tu", "tu"},
	["�̲Ϸ�"] = {"cd;w;w;w;w;w;n;nw;buy fen",	"fen"},
	["��ɴ�������ȹ"] = {"dl;s;w;s;e;n;buy qun",	"qun"},
	["�����ְ�ʦ�ض���"] = {"bj;s;#3 s;#2 (se);e;#4 s;#2 w;buy bidu",	"bidu"},
	["�廨Ь"] = {"ne;buy xiuhua xie",	"xiuhua xie"},
	["��"] = {"sz;w;#3 s;buy jian",	"zhu jian"},
	["������"] = {"hz;w;#3 n;e;buy dongpo rou",	"rou"},
	["Ҷ����"] = {"dl;s;w;s;s;e;buy ba",	"yeer ba"},
	["��ʬ��"] = {"ne;d;n;e;n;buy fen",	"fen"},
	["������"] = {"gw;n;n;w;buy tang",	"tang"},
	["��«"] = {"sz;w;#3 s;buy hulu",	"hulu"},
	["�䵶"] = {"lz;w;s;buy wan dao",	"wan dao"},
	["����"] = {"ne;d;buy hu yao",	"yao"},
	["ذ��"] = {"ne;d;n;e;s;buy bi shou",	"bi shou"},
	["�޳���"] = {"ne;d;n;e;n;buy wuchang dan",	"dan"},
	["����廨ȹ"] = {"ne;buy xiuhua qun",	"xiuhua qun"},
	["������ɽ����ͼ��"] = {"set brief;fly em;ed;d;ne;ed;ne;ed;sd;se;se;ed;ed;ed;ed;ed;ed;ed;e;ne;e;nd;w;unset brief",	"tu"},
	["������������ͼ��"] = {"bj;s;#3 s;#2 (se);e;#4 s;#2 w;buy tu",	"tu"},
	["������"] = {"ne;buy lifu",	"lifu"},
	["����"] = {"bt;sd;s;#2 (sd);se;e;n;buy rou",	"rou"},
	["�滨Ʈѩ��"] = {"ne;buy piaoxue shang",	"shang"},
	["ӧ��ñ"] = {"ne;buy yingzi mao",	"mao"},
	["���ʲ�Ҷ"] = {"cd;w;n;nw;w;w;w;nw;buy cha ye",	"cha ye"},
	["������"] = {"cd;w;n;nw;w;w;w;nw;buy lianzi",	"lianzi"},
	["���־�"] = {"ne;d;n;n;buy literateb1",	"literateb1"},
	["����"] = {"xy;w;#2 (nw);w;buy nang",	"nang"},
	["������"] = {"ne;d;n;e;n;buy dan",	"dan"},
	["���ᱸ����"] = {"ne;d;n;e;n;buy yishu",	"yishu"},
	["�߲�ϼ����"] = {"ne;buy qicaixiayun yi",	"yi"},
	["�ۻ�"] = {"ne;d;n;e;n;buy xionghuang",	"xionghuang"},
	["��Ь"] = {"bj;s;buy xie",	"xie"},
	["��Ѽ��"] = {"jx;buy dan",	"dan"},
	["��ҩ"] = {"bj;w;s;buy gaoyao",	"gaoyao"},
	["��������"] = {"jx;buy zongzi",	"zongzi"},
	["�����"] = {"d;buy da baiyu",	"da baiyu"},
	["Ƥˮ��"] = {"xy;w;#2 (nw);w;buy shuinang",	"shuinang"}
}


--[1] name, [2] id, [3] npc, [4] path
local wei_kill_items = {
	["�಼����"] = {"chang shan",	"���˴�",	"fz;#5 w;k1 jia renda"},
	["��ɫ����"] = {"chang shan",	"������",	"sz;w;s;s;s;s;e;e;se;s;k1 liu haoyi"},
	["ʮ��ľż"] = {"18 niou",	"������",	"d;w;n;n;n;w;gyz;n;n;k1 dabei laoren"},
	["ʮ����ż"] = {"18 niou",	"������",	"d;w;n;n;n;w;gyz;n;n;k1 dabei laoren"},
	["��÷����"] = {"qing yi",	"�Ҷ�",	"mz;#3 n;e;s;k1 jia ding"},
	["����"] = {"chou pao",	"������",	"ca;s;k1 tie suanpan"},
	["��ˮ��"] = {"fenshui ci",	"������",	"yd;n;ne;n;nw;n;ne;ne;ne;ne;k2 menmian ren"},
	["ɳ��"] = {"sha chong",	"ɳ��",	"xy;climb mount;jn;fight sha chong"},
	--["ɳ���"] = {"shachong ke",	"ɳ��",	"xy;climb mount;k1 sha chong"},
	--["�ܵ�"] = {"xiong dan",	"С��ͯ",	"d;w;n;w;w;give daoren 1 gold;halt;qzj;knock1 gate;e;e;k1 dao tong"},
	["���Ķ�ȹ"] = {"duan qun",	"��ɴŮ",	"bd;k1 fangsha nu"},
	["���ĳ�ȹ"] = {"chang qun",	"����Ů",	"dl;s;w;n;w;w;wu;wd;wd;n;k1 muyang nu"},
	["����"] = {"jin duan",	"��Ա��",	"wg;#5 s;k1 hou yuanwai"},
	["�̲�"] = {"yancao",	"����",	"hmy1;k1 lao zhe"},
	["����������"] = {"card1",	"ͯ����",	"hmy1;w;n;su;s;s;s;k1 tong"},
	["����������"] = {"card3",	"���ŵ���Ů",	"hmy1;#2 w;su;s;s;k1 shi nu"},
	["�Ͻ�"] = {"zijin chui",	"ͯ����",	"hmy1;w;n;su;s;s;s;k2 tong baixiong"},
	["�������"] = {"jindai",	"��ܽ",	"xi;w;w;s;s;s;k1 guo fu"},
	["���Ƥ��"] = {"ruanwei jia",	"��ܽ",	"xi;w;w;s;s;s;k1 guo fu"},
	["��"] = {"chai dao",	"�Է�",	"bt;sd;s;#2 (sd);#2 (nw);k2 qiao"},
	["����"] = {"man dao",	"��������",	"dl;s;w;s;s;s;s;s;w;w;enter;n;u;e;e;enter;k2 daizu shouling"},
	["��Ƥ"] = {"hu pi",	"��������",	"dl;s;w;s;s;s;s;s;w;w;enter;n;u;e;e;enter;k1 daizu shouling"},
	["�ײ��ڱ�����"] = {"jia sha",	"���ޱ���",	"sl;e;k1 qingwu biqiu"},
	["�಼ɮЬ"] = {"seng xie",	"���ޱ���",	"sl;e;k1 qingwu biqiu"},
	["�䵶"] = {"jie dao",	"���ޱ���",	"sl;e;k2 qingwu biqiu"},
	["ɥ�Ÿ�"] = {"sangmen fu",	"Ǯ�ཡ",	"d;w;n;n;n;n;w;w;w;n;n;e;ne;n;w;w;k2 qian qingjian"},
	["�η�Կ��"] = {"cuifulaofang yaoshi",	"��Ա��",	"d;w;n;w;w;n;n;n;k1 cui yuanwai"},
	["�׳���"] = {"chou shan",	"�Ϲ�����",	"dl;s;w;#3 s;e;s;k1 girl"},
	["���ɲ�"] = {"sangu cha",	"��ͨ��",	"wm;e;n;w;w;w;n;n;e;ne;n;k2 hou tonghai"},
	["��ɫ����"] = {"dao pao",	"С����",	"dl;s;w;s;s;s;s;e;ne;n;w;n;k1 xiao daogu"},
	["�಼�������"] = {"jia sha",	"��������",	"bj;e;n;n;n;n;unwield all;n;wi;k1 shen zhao"},
	["�Žڱ�"] = {"jiujie bian",	"������",	"gyz;n;k2 han baoju"},
	["����ʶ��"] = {"sangang shilue",	"����ţ",	"mj;s;sd;s;#4 (sd);enter;k1 hu"},
	["��ߺڲ�����"] = {"jia sha",	"ɮ��",	"dl;s;w;n;e;eu;e;ed;se;ed;e;k1 seng ren"},
	["����"] = {"kan dao",	"������",	"dl;s;w;#8 s;sw;sw;w;k2 caisun ren"},
	["�ֲ���"] = {"bu yi",	"�����",	"ca;n;u;u;k1 suan xiucai"},
	["����"] = {"hong yi",	"����",	"wm;e;n;e;k1 wei"},
	["����"] = {"yin jian",	"����",	"wm;e;n;e;k2 wei"},
	["�Ҳ�����"] = {"dao pao",	"��־��",	"qzj;wd;k1 zhao zhijing"},
	["�����"] = {"yang bian",	"����Ů",	"dl;s;w;n;w;w;w;wu;wd;wd;n;k1 muyang nu"},
	["�յ�ͨ�������"] = {"tie chui",	"������",	"hsc;#4 w;s;k2 feng"},
	["Բ��С��"] = {"xiao ao",	"̨������",	"dl;s;w;#9 s;e;e;k1 lie"},
	["ҩ��"] = {"yao fen",	"С����",	"ne;d;n;e;e;e;e;k1 xiao guizi"},
	["��ͷ"] = {"da futou",	"�Է�",	"yd;n;ne;k2 fu"},
	["̨��Ͳȹ"] = {"tong qun",	"������",	"dl;s;w;#8 s;sw;sw;w;k1 ren"},
	["���̽�"] = {"ningbi jian",	"������",	"hz;w;k1 zhang zhaozhong"},
	["���̳���"] = {"chou shan",	"����",	"hy;n;#5 w;k1 ding dang"},
	["��а����"] = {"pixie_sword_book",	"��ƽ֮",	"ws;#3 n;w;#2 n;w;k1 lin pingzhi"},
	["ͭԿ��"] = {"baituo yaoshi",	"�ܼ�",	"bt;#2 n;k1 guan"},
	["��ͭ��"] = {"tong jia",	"����",	"zns;#2 e;#2 s;e;k1 tuo lei"},
	["�ƽ����Ӽ�"] = {"jin jia",	"������",	"zns;#2 e;s;k1 hu bilie"},
	["�಼���"] = {"zi yi",	"����",	"ns;k1 yi qing"},
	["�಼��Ь"] = {"ni xie",	"����",	"ns;k1 yi qing"},
	["��潣"] = {"qingfeng jian",	"����",	"ns;k2 yi qing"},
	["�����˰�ȹ"] = {"ao qun",	"������",	"xy;w;nw;k1 li wenxiu"},
	["���Ǵ�"] = {"liuxing chui",	"������",	"xy;w;nw;k2 li wenxiu"},
	["ɮñ"] = {"seng mao",	"���Ʋֹ�ʦ",	"bj;#4 s;w;k1 gongtangcang guoshi"},
	["��ɫ����"] = {"jia sha",	"���Ʋֹ�ʦ",	"bj;#4 s;w;k1 gongtangcang guoshi"},
	["��������"] = {"chan zhang",	"���Ʋֹ�ʦ",	"bj;#4 s;w;k2 gongtangcang guoshi"},
	["��ɫ����"] = {"jia sha",	"����ɮ��",	"bj;#4 s;w;k1 seng bing"},
	["����"] = {"tie jiang",	"ɳͨ��",	"hh;s;#3 w;k2 sha tongtian"},
	["����޼"] = {"du jili",	"����",	"hz;w;sw;sw;w;w;w;k1 long jun"},
	["����"] = {"zi pao",	"������",	"fs;u;k1 pang shangren"},
	["����"] = {"diao gan",	"������",	"dl;k1 zhu wanli"},
	["�ټ�"] = {"teng jia",	"����˾",	"dl;s;w;#3 s;w;n;k1 da tusi"},
	["��������"] = {"beike xianglian",	"����˾",	"dl;s;w;#3 s;w;n;k1 da tusi"},
	["ľ��"] = {"mu tang",	"��ʿ",	"xy;se;#2 w;s;k1 wushi"},
	["��ɫʥ��"] = {"sheng yi",	"���°���",	"tzf;sd;w;k1 heiyi bangzhong"},
	["��˹����"] = {"chang pao",	"��˹����",	"xy;w;nw;k1 bosi shangrennw"},
	["��ǹ"] = {"chang qiang",	"�ɹű�",	"set brief;fly xi;e;e;n;n;n;w;w;n;n;n;e;unset brief;k2 menggu bing"},
	--["���ߵ�"] = {"qing dan",	"��Ҷ����",	"bt;n;#3 w;n;k1 qing she"},
	["���¾���"] = {"jun fu",	"������ʿ",	"dl;s;w;#3 s;w;s;k1 wei shi"},
	["���¾���"] = {"jun fu",	"������ʿ",	"dl;s;#2 w;k1 wei shi"},
	["���¾���"] = {"jun fu",	"������ʿ",	"dl;s;w;#5 s;#2 w;enter;n;k1 wei shi"},
	["������"] = {"tie pipa",	"������",	"gw;#3 n;e;s;k2 jiao wenqi"},
	["�ײ�����"] = {"chang pao",	"������",	"qz;k1 chang jinpeng"},
	["����"] = {"bu yi",	"����",	"ne;d;n;#3 e;k1 porter"},
	["ͭ��"] = {"tong bo",	"����������",	"xx;k2 boshou"},
	["ͭ��"] = {"tong hao",	"�����ɺ���",	"xx;k2 haoshou"},
	["ͭ��"] = {"tong gu",	"�����ɹ���",	"xx;k2 gushou"},
	["�Ʋ�����"] = {"jia sha",	"��",	"sl;s;#3 (sd);wd;k1 xu"},
	["��ɫ����"] = {"dao pao",	"�η�����",	"hz;w;#4 n;w;sw;k1 daoren"},
	["̨�Ķ�ȹ"] = {"duan qun",	"̨���̷�",	"dl;s;w;#9 s;e;k1 shang"},
	["��"] = {"da dao",	"����",	"bt;sd;s;k2 wei"},
	["��籰�"] = {"hongling ao",	"С��",	"gyz;#3 n;k1 xiao ju"},
	--["���ߵ�"] = {"fushe dan",	"����",	"sld;#3 s;w;#2 s;k1 fu she"},
	--["����"] = {"sizhu",	"Ұ��",	"hy;n;#4 w;s;n;s;w;k1 yezhu"},
	--["���ߵ�"] = {"jin dan",	"����",	"bt;n;#3 w;k1 jin she"},
	["ë̺"] = {"mao tan",	"ũ��", "fly dl;s;w;n;e;eu;e;ed;se;sd;eu;ed;e;ne;e;e;se;eu;ed;sw;su;sd;e;n;k2 fu"},
	["��ͷ"] = {"li tou",	"ũ��", "fly dl;s;w;n;e;eu;e;ed;se;sd;eu;ed;e;ne;e;e;se;eu;ed;sw;su;sd;e;n;k2 fu"},
	--["����"] = {"tu rou",	"����",	"bt;#4 n;ne;k1 bai tu"},
	["�����ⵣ"] = {"bian dan",	"��ϣ��",	"gyz;n;k2 nan xiren"},
	["���۷�"] = {"yayi fu",	"����",	"lz;e;n;k1 ya yi"},
	["ɱ����"] = {"shawei bang",	"����",	"lz;e;n;k2 ya yi"},
	["�˳�"] = {"gan cheng",	"ȫ��",	"gyz;n;k2 quan jinfa"},
	["��ֽ����"] = {"zhe shan",	"���",	"gyz;n;k2 zhu cong"},
	["����"] = {"chang pao",	"����ˮ",	"d;w;n;w;#2 s;k1 wang huaishui"},
	["��ɫ����"] = {"jia sha",	"Сɳ��",	"tls;n;e;k1 xiao shami"},
	["�л���"] = {"jiaohua ji",	"³�н�",	"ne;d;n;#2 e;n;e;n;w;n;e;w;n;k1 lu youjiao"},
	["�Ҳ��������"] = {"jia sha",	"����Сʦ��",	"em1;enter;n;k1 daoming xiaoshifu"},
	["��ˮ��"] = {"bishui jian",	"����ɺ",	"ws;k1 yue"},
	["����"] = {"yao qin",	"��Ů",	"dl;s;w;s;s;e;u;k2 ge nu"},
	["�ֲ���"] = {"bu pao",	"��ͯ",	"thd;#2 n;k1 shi tong"},
	["����Կ��"] = {"hongyu yaoshi",	"����",	"mz;#3 n;su;eu;unwield all;n;wi;k1 ding jian"},
	["ҩ��"] = {"yao chu",	"��ũ�����",	"dl;s;w;#5 s;#3 w;nw;ne;k2 dizi"},
	["�̵�"] = {"duan dao",	"��������",	"d;w;#2 s;#4 e;se;se;k2 gao san"},
	["����"] = {"qing yi",	"����˪",	"lj;s;k1 cheng"},
	["����"] = {"dou peng",	"����˪",	"lj;s;k1 cheng"},
	["ľ��"] = {"mu chai",	"�Է�",	"bt;sd;s;#2 (sd);#2 (nw);k1 qiao"},
	["�⵶"] = {"jian dao",	"�Ű���",	"gyz;n;k2 zhang asheng"},
	["�಼��"] = {"qing buyi",	"��ϣ��",	"gyz;n;k1 nan xiren"},
	["����"] = {"kanchai fu",	"��ϣ��",	"gyz;n;k2 nan xiren"},
	["��ɫ˿��"] = {"si pao",	"С��",	"bt;n;w;s;k1 xiao qing"},
	["�಼ɮ��"] = {"seng yi",	"�η�����",	"bj;w;w;n;n;k1 seng"},
	["��Ҷ"] = {"leaf",	"��֮��",	"bj;e;n;#2 w;unwield all;w;wi;k1 wu"},
	["�Ŷ̽�"] = {"short sword",	"����ͩ",	"xy;k1 huo qingtong"},
	["����"] = {"huang shan",	"����ͩ",	"xy;k1 huo qingtong"},
	["����"] = {"cui yu",	"����ͩ",	"xy;k1 huo qingtong"},
	--["��Ƥ"] = {"she pi",	"����",	"sld;#4 s;w;#2 s;k1 fu she"},
	["�����"] = {"mabang",	"����",	"yd;n;ne;n;nw;n;#4 (ne);se;s;k1 zei"},
	["��ͷ"] = {"chu tou",	"ũ��",	"dl;s;w;n;w;w;wu;wd;wd;s;s;se;e;k1 fu"},
	["ҹ��ˮ��"] = {"shui kao",	"������",	"yd;n;ne;n;nw;n;ne;ne;ne;ne;k1 menmian ren"},
	["��ɫ����"] = {"chang pao",	"������Ů",	"bt;#3 n;k1 lady"},
	["�����йٱ�"] = {"panguan bi",	"������",	"hh;s;#3 (w);k2 peng lianhu"},
	["����"] = {"bai yi",	"����Ů��",	"dl;s;w;n;n;n;n;n;k1 girl"},
	["ά����峤��"] = {"chang pao",	"ά����帾Ů",	"xy;w;nw;nw;k1 woman"},
	--["�ڹ��"] = {"guijia",	"�ڹ�",	"wg;s;s;s;s;se;e;k1 wu gui"},
	["���Ĵ���"] = {"da hui",	"�����̷�",	"dl;s;w;n;w;w;w;wu;wd;wd;n;k1 shang"},
	["�𲼳���"] = {"chang pao",	"������",	"hh;s;#3 (w);k1 liang ziwen"},
	["̨��ͷ��"] = {"tou jin",	"̨������",	"dl;s;w;#9 s;e;e;k1 lie"},
	["����ͭ��"] = {"dujiao tongren",	"��һ��",	"gw;n;n;k2 teng"},
	["����"] = {"tie qiao",	"��ʯ��",	"yd;n;ne;n;nw;n;#4 (ne);se;k2 ren"}
}


--[1] name, [2] path, [3] id
local wei_get_items = {
	["������"] = {"ws;n;n;n;w;s;get zhengqi_book", "zhengqi_book"},
	["С��֦"] = {"fs;n;#5 e;ne;ne;get shu zhi", "shu zhi"},
	["����ʯ"] = {"sz;w;#4 n;sw;get 1 eluan shi", "eluan shi"},
	["������"] = {"wg;ask seller about ҩ;give 1 gold to seller", "shouwu"},
	["��ɴ��"] = {"bd;get fangsha ji", "fangsha ji"},
	["����"] = {"em2;s;enter;|!k1::s|;e;#3 s;get fu chen", "fu chen"},
	["����������"] = {"qz;w;n;n;e;ask xiang about ɱ��������", "card4"},
	["�׻�������"] = {"hmy1;w;n;n;s;w;w;s;s;s;w;ask ren about �����;ws;sd;#2 (su);enter;give linghu xin", "card2"},
	["Ƥ����"] = {"xi;w;w;s;s;s;se;ask wu about Ƥ����", "shoutao"},
	["��ָ��"] = {"xi;w;w;s;s;s;se;ask wu about ��ָ��", "zhitao"},
	["������"] = {"xi;w;w;s;s;s;se;ask wu about ������", "huyao"},
	["ƤΧ��"] = {"xi;w;w;s;s;s;se;ask wu about ƤΧ��", "weibo"},
	["������"] = {"xi;w;w;s;s;s;se;ask wu about ������", "beixin"},
	["������"] = {"xi;w;w;s;s;s;se;ask wu about ������", "huwan"},
	["ɽ�軨"] = {"dl;s;w;n;e;eu;get all", "hua"},
	["ɯ须�"] = {"fs;n;e;e;e;e;get flower", "flower"},
	["������"] = {"tdh;e;get hand", "hand"},
	["ʯ��"] = {"tdh;e;get stone", "stone"},
	["����"] = {"tdh;e;get silk", "silk"},
	["����Ƭ"] = {"tdh;e;get bamboo", "bamboo"},
	["�Ʒ�����"] = {"tdh;e;get strike book", "strike book"},
	["ȭ���ܾ�"] = {"tdh;e;get unarmed book", "unarmed book"},
	["������"] = {"tdh;e;get yunlong jing", "yunlong jing"},
	["Ѫ��"] = {"wg;#6 s;pull drawer;d;se;get xuejie", "xuejie"},
	["����"] = {"wg;w;w;w;ne;eu;ne;nu;nu;e;nu;kan frutex", "fuling"},
	["������"] = {"d;w;n;w;w;give daoren 1 gold", "ling"},
	["Ұ������"] = {"xi;w;w;s;s;s;s;serve;drop fan", "wan"},
	["����������"] = {"wm;e;n;e;e;s;s;serve;drop fan", "tang"},
	["�ٺϻ�"] = {"fs;n;#7 w;nw;sw;w;get hua", "hua"},
	["��ʯͷ"] = {"d;w;s;s;e;e;get shi tou", "shi tou"},
	["����֦"] = {"sz;w;#3 n;sw;get shu zhi", "shu zhi"},
	["���ݳ���"] = {"wm;e;n;e;e;s;s;serve;drop tang", "fan"},
	["����Ӣ����"] = {"d;w;s;give seng 1 gold", "ling"},
	["����"] = {"hy;n;#5 w;ask ding about ʯ����", "pa"},
	["����"] = {"tzf;e;n;get bian", "bian"},
	["�����׷�"] = {"xi;w;w;s;s;s;s;serve;drop wan", "fan"},
	["ޥ����"] = {"qz;#4 w;get flower;#3 (sw);get flower", "flower"},
	["���̳"] = {"zjc;e;get tan", "tan"},
	["����"] = {"xs;n;#3 w;get fa lun", "fa lun"},
	["ûҩ"] = {"d;w;n;#2 w;give daoren 1 gold;halt;qzj;knock gate;#3 e;#2 n;wu;eu;wu;dian candle", "moyao"},
	["�������澭���ϲ�"] = {"gm;s;tang coffin", "zhenjing1"},
	["�������澭���²�"] = {"gm;s;tang coffin", "zhenjing2"},
	["ϸ����"] = {"wjg;s;enter;s;#2 (out);e;su;eu;ed;nd;ed;pull tiegan", "xi tiegan"},
	["������"] = {"wm;get 1 baiqi zi from xiang", "baiqi zi"},
	["������"] = {"wm;get 1 heiqi zi from xiang;we", "heiqi zi"},
	["����ͭ��"] = {"sz;#2 w;get shan pai from xiang", "shan pai"},
	["��·����"] = {"bt;#3 n;w;d;get shen she", "shen she"},
	["��ʯ��"] = {"mz;#3 n;climb huang song;pull song zhen;get pu", "huangshi pu"},
	["Ⱥ����ͼ"] = {"mz;#2 n;zuan table;s;pull floor;d;n;n;get qunxing tu", "qunxing tu"},
	["�Ƽ���"] = {"bj;e;join mingjiao", "tuijian xin1"},
	["����"] = {"d;w;n;#3 e;#4 s;#3 (se);e;s;s;ask lu about ����ׯ;decide", "guiyun shuxin"},
	["ˮ����"] = {"yzw;#4 s;get tao", "tao"},
	["��֦"] = {"yzw;#4 s;get li zhi", "li zhi"},
	["�����޶������ϲ᡽��"] = {"tdh;e;get du jing1", "du jing1"},
	["�����޶������²᡽��"] = {"tdh;e;get du jing2", "du jing2"},
	["���㻨"] = {"sld;#3 s;#2 w;get baixiang hua", "hua"},
	["���黨"] = {"sld;#4 s;#2 w;get jueqing hua", "hua"},
	["�ϳ���"] = {"sld;#4 s;#2 w;get duanchang hua", "duanchang hua"},
	["��ˮ��«"] = {"em2;s;enter;|!k1::s|;e;#2 s;get qingshui hulu", "qingshui hulu"},
	["���˷���"] = {"em2;s;enter;|!k1::s|;e;#2 s;get bocai fentiao", "bocai fentiao"},
	["�ؼ�"] = {"em;ed;d;ne;ed;ne;ed;sd;#2 (se);ed;s;enter;w;get suji", "suji"},
	["��Ѽ"] = {"em;ed;d;ne;ed;ne;ed;sd;#2 (se);ed;s;enter;w;get suya", "suya"},
	["ɺ���ײ�"] = {"em2;s;enter;|!k1::s|;e;#2 s;get shanhu baicai", "shanhu baicai"},
	["��������"] = {"em;ed;d;ne;ed;ne;ed;sd;#2 (se);ed;s;enter;w;get mala doufu", "mala doufu"},
	["��������"] = {"em2;s;enter;|!k1::s|;e;#2 s;get liuli qiezi", "liuli qiezi"},
	["Ƥ����"] = {"em2;s;enter;|!k1::s|;e;#3 s;get yao dai", "yao dai"},
	["����"] = {"bt;#3 n;e;get dangao", "dangao"},
	["�佬ƿ"] = {"gm;n;e;e;get ping", "ping"},
	["��ѩ����"] = {"lj;n;#3 w;get gao", "gao"},
	["�̽�"] = {"d;w;n;w;#3 s;get duan jian", "duan jian"},
	["���"] = {"zjc;e;get chi", "chi"},
	["����"] = {"xyl;#2 s;ask kang about ����", "pu"},
	["��師"] = {"tzf;e;n;get ban fu", "ban fu"},
	["��ľ��"] = {"thd;n;e;get taomu jian", "taomu jian"},
	["�׷�"] = {"xyl;#2 w;s;order;drop wan", "mi fan"},
	["ˮ��"] = {"xyl;#2 w;s;order;drop fan", "shui wan"},
	["������"] = {"thd;e;get buzhen xiang", "xiang"},
	["����ţ��"] = {"tzf;#2 w;n;get niu rou", "niu rou"},
	["��佬"] = {"gm;n;e;get jiang;#2 w;get jiang", "jiang"},
	["�����"] = {"gm;n;e;get mi;#2 w;get mi", "mi"},
	["�����Ϻ�ɢ"] = {"wm;get yinyang san from xiang", "san"},
	["�ֽ�"] = {"tzf;e;n;get gang jian", "gang jian"},
	["������"] = {"sb;d;w;n;enter dong;say ������·�㲻��ѽ;d;9;#2 (sw);out;u;#2 (wu);su;wu;su;ub;enter;get da chang", "chang"},
	["��÷��"] = {"lj;n;#3 w;get tang", "tang"},
	["����"] = {"bt;#3 n;e;get jiang", "jiang"},
	["���"] = {"yzw;#2 s;get xiang cha", "xiang cha"},
	["������"] = {"sld;#3 s;#2 w;get wuming hua", "wuming hua"},
	["ʬ��"] = {"xy;#2 (se);#3 w;get shi gu", "shi gu"},
	["���ڴ���"] = {"bt;n;w;s;get haikou dawan", "haikou dawan"},
	["���"] = {"mz;n;n;n;w;push eye;climb ti zi;jump shu jia;get all;tear chou;wm;drop xue yi", "chou"},
	["Ѫ����"] = {"mz;n;n;n;w;push eye;climb ti zi;jump shu jia;get all;tear chou;wm;drop hong chou", "yi"},
	["��ݮ"] = {"bt;sd;s;#2 (sd);#2 (nw);n;w;sw;get cao mei", "cao mei"},
	["�������ա��"] = {"lz;e;n;get rusty blade", "rusty blade"},
	["������"] = {"jx;n;out;#2 d;#2 s;get da zhenzhu", "da zhenzhu"},
	["ʯ��"] = {"qz;#4 w;#2 (sw);get shi", "shi"},
	["����ͨ��"] = {"d;w;n;enter dong;say ������·�㲻��ѽ;#2 d;w;break wall;get stick book", "stick book"},
	["���ɲ�"] = {"thd;n;w;|!aw:3:ask cheng about all:hi|","cha"},
	["�һ���"] = {"thd;n;w;|!aw:3:ask cheng about all:hi|","gao"},
	["С����"] = {"fly xyl;|!mmdd::ok|;u;u;s;w;w;w", "pu tuan"}
}
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

local context = {}

function main(f_done, f_fail)
	context.f_done = f_done
	context.f_fail = f_fail

	EnableTriggerGroup("wei", true)
	EnableTriggerGroup("wei_ask", true)
	EnableTriggerGroup("wei_kill", false)
	Execute("set brief;fly wm;e;s;s;s;e;u;quest")
end

function init()
	EnableTriggerGroup("wei", false)
	EnableTriggerGroup("wei_ask", false)
	EnableTriggerGroup("wei_kill", false)
end

function done()
	var.wei_fail_times = 0
	var.wei_available_time = os.time() + 120
	init()
	core.safeback(function()
		me.cleanup(context.f_done)
	end, 1)
end

function fail()
	var.wei_available_time = os.time() + 180
	init()
	core.safeback(function()
		me.cleanup(context.f_done)
	end, 1)
end

function start(name, line, wildcards)
	var.wei_item_name = wildcards[2]
	var.wei_start_time = os.time()
	local t = var.wei_item_name
	print(wei_buy_items[t])
	print(wei_kill_items[t])
	print(wei_get_items[t])

	timer.tickonce("action", 1, function()
		if(wei_buy_items[t] ~= nil) then
			buy(wei_buy_items[t])
		elseif(wei_kill_items[t] ~= nil) then
			kill(wei_kill_items[t])
		elseif(wei_get_items[t] ~= nil) then
			get(wei_get_items[t])
		else
			cancel()
		end
	end)
end


function finish()
	EnableTriggerGroup("wei_kill", false)
	EnableTriggerGroup("wei_ask", true)
	timer.tickonce("action", 1, function()
		core.safeback(function()
			Execute("e;s;s;s;e;u;give " .. var.wei_item_id .. " to wei xiaobao")
		end, 1)
	end)
end

function cancel()
	if(var.wei_fail_times == nil or var.wei_fail_times == "") then
		var.wei_fail_times = 1
	else
		var.wei_fail_times = tonumber(var.wei_fail_times) + 1
	end

	local amount = math.floor(tonumber(var.wei_fail_times)/3) * 10 + 50
	if(amount > 100) then var.wei_cancel_amt = "1 gold" else var.wei_cancel_amt = amount .. " silver" end

	qukuan(var.wei_cancel_amt,
		function()
			Execute("e;s;s;e;u;give " .. var.wei_cancel_amt .. " to wei xiaobao")
		end,
		fail)
end

buy = function(t)
	var.wei_item_id = t[2]
	var.wei_item_path = t[1]

	walk.run(var.wei_item_path, finish, finish)
end

kill = function(t)
	var.wei_item_id = t[1]
	var.wei_npc_name = t[2]
	var.wei_item_path = t[3]
	EnableTriggerGroup("wei_kill", true)
	EnableTriggerGroup("wei_ask", false)
	walk.run(var.wei_item_path, function() fight.start() end, finish)
end

kill_done = function()
	fight.stop()
	timer.tickonce("action", 1, function()
		core.safehalt(function()
			EnableTriggerGroup("wei_kill", false)
			EnableTriggerGroup("wei_ask", true)
			Execute("get ".. var.wei_item_id .. " from corpse")
			finish()
		end, 1)
	end)
end

get = function(t)
	var.wei_item_path = t[1]
	var.wei_item_id = t[2]

	walk.run(var.wei_item_path, finish, finish)
end


init()
