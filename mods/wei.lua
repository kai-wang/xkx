require "wait"
require "tprint"
require "utils"
module ("wei", package.seeall)

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------

--[1] name, [2] path, [3] id
wei_buy_items = {
	["冰糖葫芦"] = {"bj;s;buy hulu", "hulu"},
	["百果油包"] = {"hz;w;#3 n;e;buy youbao", "youbao"},
	["冬不拉"] = {"xy;w;#2 nw;w;buy dongbula", "dongbula"},
	["齐眉棍"] = {"xi;s;s;s;e;buy gun", "gun"},
	["牛皮袋"] = {"xy;w;sw;w;w;w;buy niu pidai", "niu pidai"},
	["青稞面"] = {"xy;w;sw;w;w;w;buy qingke mian", "mian"},
	["叫化童鸡"] = {"hz;w;#3 n;e;buy tongji", "tongji"},
	["西湖醋鱼"] = {"hz;w;#3 n;e;buy cuyu", "cuyu"},
	["龙井虾仁"] = {"hz;w;#3 n;e;buy xiaren", "xiaren"},
	["酒瓶"] = {"hz;w;#3 n;e;buy jiu ping", "jiu ping"},
	["荷叶冬笋汤"] = {"sz;buy tang", "tang"},
	["火折"] = 	{"ne;d;buy fire",	"fire"},
	["菱白虾仁"] = 	{"sz;buy xiaren",	"xiaren"},
	["樱桃火腿"] = 	{"sz;buy huotui",	"huotui"},
	["牛皮酒袋"] = {"wm;#2 e;buy jiudai",	"jiudai"},
	["长剑"] = {"ne;d;n;e;s;buy jian",	"chang jian"},
	["钢刀"] = {"bj;e;e;s;buy gang dao",	"dao"},
	["屠刀"] = {"bj;e;e;s;buy tu dao",	"tu dao"},
	["铁棍"] = {"bj;e;e;s;buy tie gun",	"gun"},
	["哈密瓜"] = {"xy;w;#2 (nw);w;buy hami gua",	"hami gua"},
	["马奶酒壶"] = {"xy;w;#2 (nw);w;buy jiu hu",	"jiu hu"},
	["金项链"] = {"fz;#2 s;#3 w;buy xianglian",	"xianglian"},
	["草鞋"] = {"ne;d;buy cao xie",	"xie"},
	["麻布袋"] = {"ne;d;buy budai",	"budai"},
	["窄裉袄"] = {"dl;s;w;s;e;n;buy ken ao",	"ao"},
	["对衿褂子"] = {"dl;s;w;s;e;n;buy guazi",	"guazi"},
	["过桥米线"] = {"dl;s;w;s;s;e;buy mixian",	"mixian"},
	["汽锅鸡"] = {"dl;s;w;s;s;e;buy qiguo ji",	"qiguo ji"},
	["铁甲"] = {"xi;s;s;s;e;buy jia",	"jia"},
	["钢杖"] = {"xi;s;s;s;e;buy zhang",	"gang zhang"},
	["佛跳墙"] = {"fz;s;e;buy fotiaoqiang",	"fotiaoqiang"},
	["花雕酒袋"] = {"wm;#2 e;u;buy jiudai",	"jiudai"},
	["蓝宝石腰带"] = {"ne;buy yao dai",	"dai"},
	["肉包子"] = {"wm;#2 e;buy baozi",	"baozi"},
	["皮靴"] = {"ne;d;buy xue",	"xue"},
	["汤面"] = {"bj;e;n;n;w;buy mian",	"mian"},
	["木刀"] = {"xi;e;e;e;s;buy mu dao",	"mu dao"},
	["木剑"] = {"xi;e;e;e;s;buy mu jian",	"mu jian"},
	["护腕"] = {"ne;d;buy hu wan",	"wan"},
	["绣花小方巾"] = {"ne;buy fang jin",	"jin"},
	["一字逍遥巾"] = {"ne;buy xiaoyao jin",	"jin"},
	["醋坛子"] = {"d;w;s;w;buy tanzi",	"tanzi"},
	["丝绸马褂"] = {"ne;buy ma gua",	"gua"},
	["鹤顶红"] = {"cd;w;w;w;w;w;n;nw;buy hedinghong",	"hedinghong"},
	["木棍"] = {"xi;e;e;e;s;buy mu gun",	"mu gun"},
	["烤鸡腿"] = {"wm;#2 e;buy tui",	"tui"},
	["淡烟秀才装"] = {"ne;buy xiucai zhuang",	"zhuang"},
	["金丝甲"] = {"ne;d;buy jinsi jia",	"jinsi jia"},
	["牛皮盾"] = {"ne;d;buy dun",	"niupi dun"},
	["富贵团金褂"] = {"ne;buy tuanjin gua",	"gua"},
	["头盔"] = {"ne;d;buy kui",	"kui"},
	["貂皮"] = {"bj;w;w;n;w;buy pi",	"pi"},
	["千字文"] = {"ne;d;n;n;buy literateb3",	"literateb3"},
	["孔雀胆"] = {"cd;w;w;w;w;w;n;nw;buy kongque dan",	"kongque dan"},
	["玫瑰花瓣"] = {"cd;w;n;nw;w;w;w;nw;buy huaban",	"huaban"},
	["蛇胆粉"] = {"bj;s;s;buy fen",	"fen"},
	["金创药"] = {"ne;d;n;e;n;buy yao",	"jinchuang yao"},
	["彩缎紧身袄"] = {"ne;buy jinshen ao",	"ao"},
	["指套"] = {"ne;d;buy tao",	"tao"},
	["武者项圈"] = {"ne;d;buy quan",	"quan"},
	["招架入门"] = {"xi;w;w;n;n;w;buy book",	"book"},
	["烤鸭"] = {"wm;#2 e;u;buy ya",	"ya"},
	["狗皮"] = {"yd;n;e;buy gou pi",	"gou pi"},
	["狗皮膏药"] = {"yd;n;e;buy goupi gaoyao",	"goupi gaoyao"},
	["论语"] = {"ne;d;n;n;buy sishu1",	"sishu1"},
	["飞蝗石"] = {"cd;w;n;nw;w;w;w;nw;buy shi",	"shi"},
	["香"] = {"tls;n;e;#2 s;w;#2 s;w;s;buy xiang",	"xiang"},
	["金戒指"] = {"fz;#2 s;#3 w;buy jiezhi",	"jiezhi"},
	["大酒瓶"] = {"fz;s;e;buy ping",	"ping"},
	["绣花小鞋"] = {"bj;w;w;n;w;buy xiuhua xie",	"xiuhua xie"},
	["水壶"] = {"wg;buy hu",	"hu"},
	["手杖"] = {"wg;buy zhang",	"zhang"},
	["五香茶叶蛋"] = {"wg;buy dan",	"dan"},
	["粉红绸衫"] = {"bj;w;w;n;w;buy shan",	"shan"},
	["茶壶"] = {"d;w;s;w;buy hu",	"cha hu"},
	["翡翠豆腐"] = {"d;w;s;w;buy doufu",	"doufu"},
	["竹棒"] = {"sz;w;#3 s;buy bang",	"zhu bang"},
	["百家姓"] = {"ne;d;n;n;buy literateb2",	"literateb2"},
	["羊皮靴"] = {"ne;buy yangpi xue",	"yangpi xue"},
	["五香花生"] = {"d;w;s;w;buy huasheng",	"huasheng"},
	["宣威火腿"] = {"dl;s;w;s;s;e;buy huotui",	"huotui"},
	["霓红连衣裙"] = {"ne;buy lianyi qun",	"qun"},
	["皮背心"] = {"ne;d;buy beixin",	"beixin"},
	["铁锤"] = {"bj;e;e;s;buy tie chui",	"chui"},
	["绣花针"] = {"bj;w;w;n;w;buy zhen",	"zhen"},
	["云南茶壶"] = {"dl;s;w;s;s;e;buy cha hu",	"cha hu"},
	["琼花皎月裳"] = {"ne;buy huayue shang",	"shang"},
	["软金束带"] = {"ne;buy shu dai",	"shu dai"},
	["狗肉"] = {"gw;n;n;w;buy rou",	"rou"},
	["归元丹"] = {"ne;d;n;e;n;buy guiyuan dan",	"guiyuan dan"},
	["桂花鲜栗羹"] = {"hz;w;#3 n;e;buy geng",	"geng"},
	["『长白山旅游图』"] = {"gw;n;n;w;buy tu", "tu"},
	["碧蚕粉"] = {"cd;w;w;w;w;w;n;nw;buy fen",	"fen"},
	["白纱挑线镶边裙"] = {"dl;s;w;s;e;n;buy qun",	"qun"},
	["『少林拜师必读』"] = {"bj;s;#3 s;#2 (se);e;#4 s;#2 w;buy bidu",	"bidu"},
	["绣花鞋"] = {"ne;buy xiuhua xie",	"xiuhua xie"},
	["竹剑"] = {"sz;w;#3 s;buy jian",	"zhu jian"},
	["东坡肉"] = {"hz;w;#3 n;e;buy dongpo rou",	"rou"},
	["叶儿粑"] = {"dl;s;w;s;s;e;buy ba",	"yeer ba"},
	["化尸粉"] = {"ne;d;n;e;n;buy fen",	"fen"},
	["狗肉汤"] = {"gw;n;n;w;buy tang",	"tang"},
	["葫芦"] = {"sz;w;#3 s;buy hulu",	"hulu"},
	["弯刀"] = {"lz;w;s;buy wan dao",	"wan dao"},
	["护腰"] = {"ne;d;buy hu yao",	"yao"},
	["匕首"] = {"ne;d;n;e;s;buy bi shou",	"bi shou"},
	["无常丹"] = {"ne;d;n;e;n;buy wuchang dan",	"dan"},
	["五彩绣花裙"] = {"ne;buy xiuhua qun",	"xiuhua qun"},
	["『峨嵋山旅游图』"] = {"set brief;fly em;ed;d;ne;ed;ne;ed;sd;se;se;ed;ed;ed;ed;ed;ed;ed;e;ne;e;nd;w;unset brief",	"tu"},
	["『少林寺旅游图』"] = {"bj;s;#3 s;#2 (se);e;#4 s;#2 w;buy tu",	"tu"},
	["结婚礼服"] = {"ne;buy lifu",	"lifu"},
	["蛇肉"] = {"bt;sd;s;#2 (sd);se;e;n;buy rou",	"rou"},
	["梨花飘雪裳"] = {"ne;buy piaoxue shang",	"shang"},
	["缨子帽"] = {"ne;buy yingzi mao",	"mao"},
	["新鲜茶叶"] = {"cd;w;n;nw;w;w;w;nw;buy cha ye",	"cha ye"},
	["铁莲子"] = {"cd;w;n;nw;w;w;w;nw;buy lianzi",	"lianzi"},
	["三字经"] = {"ne;d;n;n;buy literateb1",	"literateb1"},
	["面馕"] = {"xy;w;#2 (nw);w;buy nang",	"nang"},
	["养精丹"] = {"ne;d;n;e;n;buy dan",	"dan"},
	["肘後备急方"] = {"ne;d;n;e;n;buy yishu",	"yishu"},
	["七彩霞云衣"] = {"ne;buy qicaixiayun yi",	"yi"},
	["雄黄"] = {"ne;d;n;e;n;buy xionghuang",	"xionghuang"},
	["麻鞋"] = {"bj;s;buy xie",	"xie"},
	["熟鸭蛋"] = {"jx;buy dan",	"dan"},
	["膏药"] = {"bj;w;s;buy gaoyao",	"gaoyao"},
	["嘉兴粽子"] = {"jx;buy zongzi",	"zongzi"},
	["大白鱼"] = {"d;buy da baiyu",	"da baiyu"},
	["皮水囊"] = {"xy;w;#2 (nw);w;buy shuinang",	"shuinang"}
}


--[1] name, [2] id, [3] npc, [4] path
wei_kill_items = {
	["青布长衫"] = {"chang shan",	"贾人达",	"fz;#5 w;k1 jia renda"},	
	["黑色长衫"] = {"chang shan",	"刘好弈",	"sz;w;s;s;s;s;e;e;se;s;k1 liu haoyi"},	
	["十八木偶"] = {"18 niou",	"大悲老人",	"d;w;n;n;n;w;gyz;n;n;k1 dabei laoren"},	
	["十八泥偶"] = {"18 niou",	"大悲老人",	"d;w;n;n;n;w;gyz;n;n;k1 dabei laoren"},	
	["绣梅青衣"] = {"qing yi",	"家丁",	"mz;#3 n;e;s;k1 jia ding"},	
	["绸袍"] = {"chou pao",	"铁算盘",	"ca;s;k1 tie suanpan"},	
	["分水刺"] = {"fenshui ci",	"蒙面人",	"yd;n;ne;n;nw;n;ne;ne;ne;ne;k2 menmian ren"},	
	["沙虫"] = {"sha chong",	"沙虫",	"xy;climb mount;jn;fight sha chong"},	
	["沙虫壳"] = {"shachong ke",	"沙虫",	"xy;climb mount;k1 sha chong"},	
	["熊胆"] = {"xiong dan",	"小道童",	"d;w;n;w;w;give daoren 1 gold;halt;qzj;knock1 gate;e;e;k1 dao tong"},	
	["摆夷短裙"] = {"duan qun",	"纺纱女",	"bd;k1 fangsha nu"},	
	["乌夷长裙"] = {"chang qun",	"牧羊女",	"dl;s;w;n;w;w;wu;wd;wd;n;k1 muyang nu"},	
	["锦缎"] = {"jin duan",	"侯员外",	"wg;#5 s;k1 hou yuanwai"},	
	["烟草"] = {"yancao",	"老者",	"hmy1;k1 lao zhe"},	
	["风雷堂令牌"] = {"card1",	"童百熊",	"hmy1;w;n;su;s;s;s;k1 tong"},	
	["青龙堂令牌"] = {"card3",	"慌张的侍女",	"hmy1;#2 w;su;s;s;k1 shi nu"},	
	["紫金锤"] = {"zijin chui",	"童百熊",	"hmy1;w;n;su;s;s;s;k2 tong baixiong"},	
	["束发金带"] = {"jindai",	"郭芙",	"xi;w;w;s;s;s;k1 guo fu"},	
	["软猬皮甲"] = {"ruanwei jia",	"郭芙",	"xi;w;w;s;s;s;k1 guo fu"},	
	["柴刀"] = {"chai dao",	"樵夫",	"bt;sd;s;#2 (sd);#2 (nw);k2 qiao fu"},	
	["蛮刀"] = {"man dao",	"傣族首领",	"dl;s;w;s;s;s;s;s;w;w;enter;n;u;e;e;enter;k2 daizu shouling"},	
	["虎皮"] = {"hu pi",	"傣族首领",	"dl;s;w;s;s;s;s;s;w;w;enter;n;u;e;e;enter;k1 daizu shouling"},	
	["白布黑边袈裟"] = {"jia sha",	"清无比丘",	"sl;e;k1 qingwu biqiu"},	
	["青布僧鞋"] = {"seng xie",	"清无比丘",	"sl;e;k1 qingwu biqiu"},	
	["戒刀"] = {"jie dao",	"清无比丘",	"sl;e;k2 qingwu biqiu"},	
	["丧门斧"] = {"sangmen fu",	"钱青健",	"d;w;n;n;n;n;w;w;w;n;n;e;ne;n;w;w;k2 qian qingjian"},	
	["牢房钥匙"] = {"cuifulaofang yaoshi",	"崔员外",	"d;w;n;w;w;n;n;n;k1 cui yuanwai"},	
	["白绸衫"] = {"chou shan",	"南国姑娘",	"dl;s;w;#3 s;e;s;k1 girl"},	
	["三股叉"] = {"sangu cha",	"侯通海",	"wm;e;n;w;w;w;n;n;e;ne;n;k2 hou tonghai"},	
	["青色道袍"] = {"dao pao",	"小道姑",	"dl;s;w;s;s;s;s;e;ne;n;w;n;k1 xiao daogu"},	
	["青布镶边袈裟"] = {"jia sha",	"神照上人",	"bj;e;n;n;n;n;unwield all;n;wi;k1 shen zhao"},	
	["九节鞭"] = {"jiujie bian",	"韩宝驹",	"gyz;n;k2 han baoju"},	
	["三冈识略"] = {"sangang shilue",	"胡青牛",	"mj;s;sd;s;#4 (sd);enter;k1 hu"},	
	["金边黑布袈裟"] = {"jia sha",	"僧人",	"dl;s;w;n;e;eu;e;ed;se;ed;e;k1 seng ren"},	
	["砍刀"] = {"kan dao",	"采笋人",	"dl;s;w;#8 s;sw;sw;w;k2 caisun ren"},	
	["粗布衣"] = {"bu yi",	"酸秀才",	"ca;n;u;u;k1 suan xiucai"},	
	["红衣"] = {"hong yi",	"门卫",	"wm;e;n;e;k1 men wei"},	
	["银剑"] = {"yin jian",	"门卫",	"wm;e;n;e;k2 wei"},	
	["灰布道袍"] = {"dao pao",	"赵志敬",	"qzj;wd;k1 zhao zhijing"},	
	["牧羊鞭"] = {"yang bian",	"牧羊女",	"dl;s;w;n;w;w;w;wu;wd;wd;n;k1 muyang nu"},	
	["烧得通红的铁锤"] = {"tie chui",	"冯铁匠",	"hsc;#4 w;s;k2 feng"},	
	["圆领小袄"] = {"xiao ao",	"台夷猎人",	"dl;s;w;#9 s;e;e;k1 lie ren"},	
	["药粉"] = {"yao fen",	"小桂子;ne",	"d;n;e;e;e;e;k1 xiao guizi"},	
	["大斧头"] = {"da futou",	"樵夫",	"yd;n;ne;k2 qiao fu"},	
	["台夷筒裙"] = {"tong qun",	"采笋人",	"dl;s;w;#8 s;sw;sw;w;k1 caisun ren"},	
	["凝碧剑"] = {"ningbi jian",	"张召重",	"hz;w;k1 zhang zhaozhong"},	
	["翠绿绸衫"] = {"chou shan",	"丁当",	"hy;n;#5 w;k1 ding dang"},	
	["辟邪剑谱"] = {"pixie_sword_book",	"林平之",	"ws;#3 n;w;#2 n;w;k1 lin pingzhi"},	
	["铜钥匙"] = {"baituo yaoshi",	"管家",	"bt;#2 n;k1 guan jia"},	
	["熟铜甲"] = {"tong jia",	"拖雷",	"zns;#2 e;#2 s;e;k1 tuo lei"},	
	["黄金锁子甲"] = {"jin jia",	"忽必烈",	"zns;#2 e;s;k1 hu bilie"},	
	["青布缁衣"] = {"zi yi",	"仪清",	"ns;k1 yi qing"},	
	["青布尼鞋"] = {"ni xie",	"仪清",	"ns;k1 yi qing"},	
	["青锋剑"] = {"qingfeng jian",	"仪清",	"ns;k2 yi qing"},	
	["哈萨克袄裙"] = {"ao qun",	"李文秀",	"xy;w;nw;k1 li wenxiu"},	
	["流星锤"] = {"liuxing chui",	"李文秀",	"xy;w;nw;k2 li wenxiu"},	
	["僧帽"] = {"seng mao",	"贡唐仓国师",	"bj;#4 s;w;k1 gongtangcang guoshi"},	
	["青色袈裟"] = {"jia sha",	"贡唐仓国师",	"bj;#4 s;w;k1 gongtangcang guoshi"},	
	["镔铁禅杖"] = {"chan zhang",	"贡唐仓国师",	"bj;#4 s;w;k2 gongtangcang guoshi"},	
	["黑色袈裟"] = {"jia sha",	"守寺僧兵",	"bj;#4 s;w;k1 seng bing"},	
	["铁桨"] = {"tie jiang",	"沙通天",	"hh;s;#3 w;k2 sha tongtian"},	
	["毒蒺藜"] = {"du jili",	"龙骏",	"hz;w;sw;sw;w;w;w;k1 long jun"},	
	["紫袍"] = {"zi pao",	"胖商人",	"fs;u;k1 pang shangren"},	
	["钓杆"] = {"diao gan",	"褚万里",	"dl;k1 zhu wanli"},	
	["藤甲"] = {"teng jia",	"大土司",	"dl;s;w;#3 s;w;n;k1 da tusi"},	
	["贝壳项链"] = {"beike xianglian",	"大土司",	"dl;s;w;#3 s;w;n;k1 da tusi"},	
	["木镗"] = {"mu tang",	"巫士",	"xy;se;#2 w;s;k1 wushi"},	
	["黑色圣衣"] = {"sheng yi",	"黑衣帮众",	"tzf;sd;w;k1 heiyi bangzhong"},	
	["波斯长袍"] = {"chang pao",	"波斯商人",	"xy;w;nw;k1 bosi shangrennw"},	
	["长枪"] = {"chang qiang",	"蒙古兵",	"set brief;fly xi;e;e;n;n;n;w;w;n;n;n;e;unset brief;k2 menggu bing"},	
	["青蛇胆"] = {"qing dan",	"竹叶青蛇",	"bt;n;#3 w;n;k1 qing she"},	
	["黄衣军服"] = {"jun fu",	"黄衣卫士",	"dl;s;w;#3 s;w;s;k1 wei shi"},	
	["锦衣军服"] = {"jun fu",	"锦衣卫士",	"dl;s;#2 w;k1 wei shi"},	
	["素衣军服"] = {"jun fu",	"素衣卫士",	"dl;s;w;#5 s;#2 w;enter;n;k1 wei shi"},	
	["铁琵琶"] = {"tie pipa",	"焦文期",	"gw;#3 n;e;s;k2 jiao wenqi"},	
	["白布长袍"] = {"chang pao",	"常金鹏",	"qz;k1 chang jinpeng"},	
	["布衣"] = {"bu yi",	"挑夫",	"ne;d;n;#3 e;k1 tiao fu"},	
	["铜钹"] = {"tong bo",	"星宿派钹手",	"xx;k2 boshou"},	
	["铜号"] = {"tong hao",	"星宿派号手",	"xx;k2 haoshou"},	
	["铜鼓"] = {"tong gu",	"星宿派鼓手",	"xx;k2 gushou"},	
	["黄布袈裟"] = {"jia sha",	"虚*",	"sl;s;#3 (sd);wd;k1 xu"},	
	["白色道袍"] = {"dao pao",	"游方道人",	"hz;w;#4 n;w;sw;k1 daoren"},	
	["台夷短裙"] = {"duan qun",	"台夷商贩",	"dl;s;w;#9 s;e;k1 shang fan"},	
	["大刀"] = {"da dao",	"门卫",	"bt;sd;s;k2 wei"},	
	["红绫袄"] = {"hongling ao",	"小菊",	"gyz;#3 n;k1 xiao ju"},	
	["腹蛇胆"] = {"fushe dan",	"腹蛇",	"sld;#3 s;w;#2 s;k1 fu she"},	
	["死猪"] = {"sizhu",	"野猪",	"hy;n;#4 w;s;n;s;w;k1 yezhu"},	
	["金蛇胆"] = {"jin dan",	"金环蛇",	"bt;n;#3 w;k1 jin she"},	
	["毛毯"] = {"mao tan",	"农夫;maotan;k1 nong fu"},	
	["犁头"] = {"li tou",	"农夫;maotan;k2 nong fu"},	
	["兔肉"] = {"tu rou",	"白兔",	"bt;#4 n;ne;k1 bai tu"},	
	["熟铁扁担"] = {"bian dan",	"南希仁",	"gyz;n;k2 nan xiren"},	
	["衙役服"] = {"yayi fu",	"衙役",	"lz;e;n;k1 ya yi"},	
	["杀威棒"] = {"shawei bang",	"衙役",	"lz;e;n;k2 ya yi"},	
	["杆秤"] = {"gan cheng",	"全金发",	"gyz;n;k2 quan jinfa"},	
	["油纸折扇"] = {"zhe shan",	"朱聪",	"gyz;n;k2 zhu cong"},	
	["长袍"] = {"chang pao",	"王坏水",	"d;w;n;w;#2 s;k1 wang huaishui"},	
	["黄色袈裟"] = {"jia sha",	"小沙弥",	"tls;n;e;k1 xiao shami"},	
	["叫化鸡"] = {"jiaohua ji",	"鲁有脚",	"ne;d;n;#2 e;n;e;n;w;n;e;w;n;k1 lu youjiao"},	
	["灰布镶边袈裟"] = {"jia sha",	"道明小师父",	"em1;enter;n;k1 daoming xiaoshifu"},	
	["碧水剑"] = {"bishui jian",	"岳灵珊",	"ws;k1 yue"},	
	["瑶琴"] = {"yao qin",	"歌女",	"dl;s;w;s;s;e;u;k2 ge nu"},	
	["粗布袍"] = {"bu pao",	"侍童",	"thd;#2 n;k1 shi tong"},	
	["红玉钥匙"] = {"hongyu yaoshi",	"丁坚",	"mz;#3 n;su;eu;unwield all;n;wi;k1 ding jian"},	
	["药锄"] = {"yao chu",	"神农帮弟子",	"dl;s;w;#5 s;#3 w;nw;ne;k2 dizi"},	
	["短刀"] = {"duan dao",	"高三娘子",	"d;w;#2 s;#4 e;se;se;k2 gao san"},	
	["青衣"] = {"qing yi",	"程青霜",	"lj;s;k1 cheng"},	
	["斗篷"] = {"dou peng",	"程青霜",	"lj;s;k1 cheng"},	
	["木柴"] = {"mu chai",	"樵夫",	"bt;sd;s;#2 (sd);#2 (nw);k1 qiao fu"},	
	["尖刀"] = {"jian dao",	"张阿生",	"gyz;n;k2 zhang asheng"},	
	["青布衣"] = {"qing buyi",	"南希仁",	"gyz;n;k1 nan xiren"},	
	["砍柴斧"] = {"kanchai fu",	"南希仁",	"gyz;n;k2 nan xiren"},	
	["青色丝袍"] = {"si pao",	"小青",	"bt;n;w;s;k1 xiao qing"},	
	["青布僧衣"] = {"seng yi",	"游方和尚",	"bj;w;w;n;n;k1 seng"},	
	["金叶"] = {"leaf",	"吴之荣",	"bj;e;n;#2 w;unwield all;w;wi;k1 wu"},	
	["古短剑"] = {"short sword",	"霍青桐",	"xy;k1 huo qingtong"},	
	["黄衫"] = {"huang shan",	"霍青桐",	"xy;k1 huo qingtong"},	
	["翠羽"] = {"cui yu",	"霍青桐",	"xy;k1 huo qingtong"},	
	["蛇皮"] = {"she pi",	"腹蛇",	"sld;#4 s;w;#2 s;k1 fu she"},	
	["大马棒"] = {"mabang",	"马贼",	"yd;n;ne;n;nw;n;#4 (ne);se;s;k1 ma zei"},	
	["锄头"] = {"chu tou",	"农夫",	"dl;s;w;n;w;w;wu;wd;wd;s;s;se;e;k1 nong fu"},	
	["夜行水靠"] = {"shui kao",	"蒙面人",	"yd;n;ne;n;nw;n;ne;ne;ne;ne;k1 menmian ren"},	
	["白色长袍"] = {"chang pao",	"白衣少女",	"bt;#3 n;k1 lady"},	
	["镔铁判官笔"] = {"panguan bi",	"彭连虎",	"hh;s;#3 (w);k2 peng lianhu"},	
	["白衣"] = {"bai yi",	"摆夷女子",	"dl;s;w;n;n;n;n;n;k1 girl"},	
	["维吾尔族长袍"] = {"chang pao",	"维吾尔族妇女",	"xy;w;nw;nw;k1 woman"},	
	["乌龟甲"] = {"guijia",	"乌龟",	"wg;s;s;s;s;se;e;k1 wu gui"},	
	["乌夷大麾"] = {"da hui",	"乌夷商贩",	"dl;s;w;n;w;w;w;wu;wd;wd;n;k1 shang fan"},	
	["葛布长袍"] = {"chang pao",	"梁子翁",	"hh;s;#3 (w);k1 liang ziwen"},	
	["台夷头巾"] = {"tou jin",	"台夷猎人",	"dl;s;w;#9 s;e;e;k1 lie ren"},	
	["独脚铜人"] = {"dujiao tongren",	"滕一雷",	"gw;n;n;k2 teng"},	
	["铁锹"] = {"tie qiao",	"采石人",	"yd;n;ne;n;nw;n;#4 (ne);se;k2 caishi ren"}
}


--[1] name, [2] path, [3] id
wei_get_items = {
	["正气吟"] = {"ws;n;n;n;w;s;get zhengqi_book", "zhengqi_book"},
	["小树枝"] = {"fs;n;#5 e;ne;ne;get shu zhi", "shu zhi"},
	["鹅卵石"] = {"sz;w;#4 n;sw;get 1 eluan shi", "eluan shi"},
	["何首乌"] = {"wg;ask seller about 药;give 1 gold to seller", "shouwu"},
	["纺纱机"] = {"bd;get fangsha ji", "fangsha ji"},
	["拂尘"] = {"em2;s;enter;|!k1::s|;e;#3 s;get fu chen", "fu chen"},
	["天香堂令牌"] = {"qz;w;n;n;e;ask xiang about 杀东方不败", "card4"},
	["白虎堂令牌"] = {"hmy1;w;n;n;s;w;w;s;s;s;w;ask ren about 令狐冲;ws;sd;#2 su;enter;give linghu xin", "card2"},
	["皮手套"] = {"xi;w;w;s;s;s;se;ask wu about 皮手套", "shoutao"},
	["铁指套"] = {"xi;w;w;s;s;s;se;ask wu about 铁指套", "zhitao"},
	["铁护腰"] = {"xi;w;w;s;s;s;se;ask wu about 铁护腰", "huyao"},
	["皮围脖"] = {"xi;w;w;s;s;s;se;ask wu about 皮围脖", "weibo"},
	["铁背心"] = {"xi;w;w;s;s;s;se;ask wu about 铁背心", "beixin"},
	["铁护腕"] = {"xi;w;w;s;s;s;se;ask wu about 铁护腕", "huwan"},
	["山茶花"] = {"dl;s;w;n;e;eu;get all", "hua"},
	["莎椤花"] = {"fs;n;e;e;e;e;get flower", "flower"},
	["铁手掌"] = {"tdh;e;get hand", "hand"},
	["石板"] = {"tdh;e;get stone", "stone"},
	["薄绢"] = {"tdh;e;get silk", "silk"},
	["旧竹片"] = {"tdh;e;get bamboo", "bamboo"},
	["掌法总谱"] = {"tdh;e;get strike book", "strike book"},
	["拳谱总诀"] = {"tdh;e;get unarmed book", "unarmed book"},
	["云龙经"] = {"tdh;e;get yunlong jing", "yunlong jing"},
	["血竭"] = {"wg;#6 s;pull drawer;d;se;get xuejie", "xuejie"},
	["茯苓"] = {"wg;w;w;w;ne;eu;ne;nu;nu;e;nu;kan frutex", "fuling"},
	["重阳令"] = {"d;w;n;w;w;give daoren 1 gold", "ling"},
	["野菜汤碗"] = {"xi;w;w;s;s;s;s;serve;drop fan", "wan"},
	["西红柿蛋汤"] = {"wm;e;n;e;e;s;s;serve;drop fan", "tang"},
	["百合花"] = {"fs;n;#7 w;nw;sw;w;get hua", "hua"},
	["大石头"] = {"d;w;s;s;e;e;get shi tou", "shi tou"},
	["大树枝"] = {"sz;w;#3 n;sw;get shu zhi", "shu zhi"},
	["扬州炒饭"] = {"wm;e;n;e;e;s;s;serve;drop tang", "fan"},
	["少林英雄令"] = {"d;w;s;give seng 1 gold", "ling"},
	["手帕"] = {"hy;n;#5 w;ask ding about 石中玉", "pa"},
	["长鞭"] = {"tzf;e;n;get bian", "bian"},
	["高粱米饭"] = {"xi;w;w;s;s;s;s;serve;drop wan", "fan"},
	["蕙兰花"] = {"qz;#4 w;get flower;#3 sw;drop flower;get flower", "flower"},
	["大酒坛"] = {"zjc;e;get tan", "tan"},
	["法轮"] = {"xs;n;#3 w;get fa lun", "fa lun"},
	["没药"] = {"d;w;n;#2 w;give daoren 1 gold;halt;qzj;knock gate;#3 e;#2 n;wu;eu;wu;dian candle", "moyao"},
	["「九阴真经」上册"] = {"gm;s;tang coffin", "zhenjing1"},
	["「九阴真经」下册"] = {"gm;s;tang coffin", "zhenjing2"},
	["细铁杆"] = {"wjg;s;enter;s;#2 out;e;su;eu;ed;nd;ed;pull tiegan", "xi tiegan"},
	["白棋子"] = {"wm;get 1 baiqi zi from xiang", "baiqi zi"},
	["黑棋子"] = {"wm;get 1 heiqi zi from xiang;we", "heiqi zi"},
	["赏善铜牌"] = {"sz;#2 w;get shan pai from xiang", "shan pai"},
	["引路神蛇"] = {"bt;#3 n;w;d;get shen she", "shen she"},
	["黄石谱"] = {"mz;#3 n;climb huang song;pull song zhen;get pu", "huangshi pu"},
	["群星璀璨图"] = {"mz;#2 n;zuan table;s;pull floor;d;n;n;get qunxing tu", "qunxing tu"},
	["推荐信"] = {"bj;e;join mingjiao", "tuijian xin1"},
	["书信"] = {"d;w;n;#3 e;#4 s;#3 se;e;s;s;ask lu about 归云庄;decide", "guiyun shuxin"},
	["水蜜桃"] = {"yzw;#4 s;get tao", "tao"},
	["荔枝"] = {"yzw;#4 s;get li zhi", "li zhi"},
	["『星宿毒经〖上册〗』"] = {"tdh;e;get du jing1", "du jing1"},
	["『星宿毒经〖下册〗』"] = {"tdh;e;get du jing2", "du jing2"},
	["百香花"] = {"sld;#3 s;#2 w;get baixiang hua", "hua"},
	["绝情花"] = {"sld;#4 s;#2 w;get jueqing hua", "hua"},
	["断肠花"] = {"sld;#4 s;#2 w;get duanchang hua", "duanchang hua"},
	["清水葫芦"] = {"em2;s;enter;|!k1::s|;e;#2 s;get qingshui hulu", "qingshui hulu"},
	["菠菜粉条"] = {"em2;s;enter;|!k1::s|;e;#2 s;get bocai fentiao", "bocai fentiao"},
	["素鸡"] = {"em;ed;d;ne;ed;ne;ed;sd;#2 (se);ed;s;enter;w;get suji", "suji"},
	["素鸭"] = {"em;ed;d;ne;ed;ne;ed;sd;#2 (se);ed;s;enter;w;get suya", "suya"},
	["珊瑚白菜"] = {"em2;s;enter;|!k1::s|;e;#2 s;get shanhu baicai", "shanhu baicai"},
	["麻辣豆腐"] = {"em;ed;d;ne;ed;ne;ed;sd;#2 se;ed;s;enter;w;get mala doufu", "mala doufu"},
	["琉璃茄子"] = {"em2;s;enter;|!k1::s|;e;#2 s;get liuli qiezi", "liuli qiezi"},
	["皮腰带"] = {"em;s;enter;|!k1::s|;e;#3 s;get yao dai", "yao dai"},
	["蛋糕"] = {"bt;#3 n;e;get dangao", "dangao"},
	["蜂浆瓶"] = {"gm;n;e;e;get ping", "ping"},
	["冰雪翡翠糕"] = {"lj;n;#3 w;get gao", "gao"},
	["短剑"] = {"d;w;n;w;#3 s;get duan jian", "duan jian"},
	["鱼翅"] = {"zjc;e;get chi", "chi"},
	["棋谱"] = {"xyl;#2 s;ask kang about 棋谱", "pu"},
	["大板斧"] = {"tzf;e;n;get ban fu", "ban fu"},
	["桃木剑"] = {"thd;n;e;get taomu jian", "taomu jian"},
	["米饭"] = {"xyl;#2 w;s;order;drop wan", "mi fan"},
	["水碗"] = {"xyl;#2 w;s;order;drop fan", "shui wan"},
	["布阵箱"] = {"thd;e;get buzhen xiang", "xiang"},
	["红烧牛肉"] = {"tzf;#2 w;n;get niu rou", "niu rou"},
	["玉蜂浆"] = {"gm;n;e;get jiang;#2 w;drop jiang;get jiang", "jiang"},
	["玉蜂蜜"] = {"gm;n;e;get mi;#2 w;drop mi;get mi", "mi"},
	["阴阳合和散"] = {"wm;get yinyang san from xiang", "san"},
	["钢剑"] = {"tzf;e;n;get gang jian", "gang jian"},
	["鸟羽大氅"] = {"sb;d;w;n;enter dong;say 天堂有路你不走呀;d;9;#2 sw;out;u;#2 wu;su;wu;su;ub;enter;get da chang", "chang"},
	["酸梅汤"] = {"lj;n;#3 w;get tang", "tang"},
	["豆浆"] = {"bt;#3 n;e;get jiang", "jiang"},
	["香茶"] = {"yzw;#2 s;get xiang cha", "xiang cha"},
	["无名花"] = {"sld;#3 s;#2 w;get wuming hua", "wuming hua"},
	["尸骨"] = {"xy;#2 se;#3 w;get shi gu", "shi gu"},
	["海口大碗"] = {"bt;n;w;s;get haikou dawan", "haikou dawan"},
	["红绸"] = {"mz;n;n;n;w;push eye;climb ti zi;jump shu jia;get all;tear chou;wm;drop xue yi", "chou"},
	["血棋衣"] = {"mz;n;n;n;w;push eye;climb ti zi;jump shu jia;get all;tear chou;wm;drop hong chou", "yi"},
	["草莓"] = {"bt;sd;s;#2 sd;#2 nw;n;w;sw;get cao mei", "cao mei"},
	["生了锈的铡刀"] = {"lz;e;n;get rusty blade", "rusty blade"},
	["大珍珠"] = {"jx;n;out;#2 d;#2 s;get da zhenzhu", "da zhenzhu"},
	["石块"] = {"qz;#4 w;#2 (sw);get shi", "shi"},
	["棒法通解"] = {"d;w;n;enter dong;say 天堂有路你不走呀;#2 d;w;break wall;get stick book", "stick book"},
	["醉仙茶"] = {"thd;n;w;|!aw:3:ask cheng about all:hi|","cha"},
	["桃花糕"] = {"thd;n;w;|!aw:3:ask cheng about all:hi|","gao"},
	["小蒲团"] = {"fly xyl;|!mmdd::ok|;u;u;s;w;w;w", "pu tuan"}
}
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

main = function()
	EnableTriggerGroup("wei", true)
	Execute("set brief;fly wm;e;s;s;s;e;u;quest")
end

exit = function()
	EnableTriggerGroup("wei", false)
	msg.broadcast("msg_wei_exit")
end

done = function()
	var.wei_fail_times = 0
	Execute("halt;fly wm")
	exit()
end

fail = function()
	busy_test(function()
		Execute("halt;fly wm")
		exit()
	end)
end

start = function(name, line, wildcards)
	var.wei_item_name = wildcards[2]
	local t = var.wei_item_name
	print(wei.wei_buy_items[t])
	print(wei.wei_kill_items[t])
	print(wei.wei_get_items[t])
	if(wei_buy_items[t] ~= nil) then 
		buy(wei_buy_items[t])
	elseif(wei_kill_items[t] ~= nil) then 
		kill(wei_kill_items[t])
	elseif(wei_get_items[t] ~= nil) then 
		get(wei_get_items[t])
	else 
		cancel() 
	end
end


finish = function()
	Execute("halt;fly wm;e;s;s;s;e;u;give " .. var.wei_item_id .. " to wei xiaobao")
end

cancel = function()
	if(var.wei_fail_times == nil or var.wei_fail_times == "") then 
		var.wei_fail_times = 1 
	else 
		var.wei_fail_times = tonumber(var.wei_fail_times) + 1 
	end
	
	local amount = math.floor(tonumber(var.wei_fail_times)/3) * 10 + 50
	var.wei_cancel_amt = amount
	Execute("give " .. amount .. " silver to wei xiaobao")
end

qukuan = function()
	wait.make(function()
		Execute("fly wm;e;s;w;qukuan " .. var.wei_cancel_amt .. " silver")
		wait.time(5)
		Execute("halt;e;s;s;e;u;give " .. var.wei_cancel_amt .. " silver to wei xiaobao")
	end)
end

buy = function(t)
	var.wei_item_id = t[2]
	var.wei_item_path = t[1]
	
	wait.make(function()
		walk.run(var.wei_item_path)
		wait.time(2)
		wei.finish()
	end)
end

kill = function(t)
	var.wei_item_id = t[1]
	var.wei_npc_name = t[2]
	var.wei_item_path = t[3]
	
	walk.run(var.wei_item_path)
end

kill_done = function()
	fight.stop()
	busy_test(function()
		Execute("get ".. var.wei_item_id .. " from corpse")
		wei.finish()
	end)
end

get = function(t)
	var.wei_item_path = t[1]
	var.wei_item_id = t[2]
	
	wait.make(function()
		walk.run(var.wei_item_path)
		wait.time(2)
		wei.finish()
	end)
end
