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
	["±ùÌÇºùÂ«"] = {"bj;s;buy hulu", "hulu"},
	["°Ù¹ûÓÍ°ü"] = {"hz;w;#3 n;e;buy youbao", "youbao"},
	["¶¬²»À­"] = {"xy;w;#2 (nw);w;buy dongbula", "dongbula"},
	["ÆëÃ¼¹÷"] = {"xi;s;s;s;e;buy gun", "gun"},
	["Å£Æ¤´ü"] = {"xy;w;sw;w;w;w;buy niu pidai", "niu pidai"},
	["ÇàïýÃæ"] = {"xy;w;sw;w;w;w;buy qingke mian", "mian"},
	["½Ð»¯Í¯¼¦"] = {"hz;w;#3 n;e;buy tongji", "tongji"},
	["Î÷ºþ´×Óã"] = {"hz;w;#3 n;e;buy cuyu", "cuyu"},
	["Áú¾®ÏºÈÊ"] = {"hz;w;#3 n;e;buy xiaren", "xiaren"},
	["¾ÆÆ¿"] = {"hz;w;#3 n;e;buy jiu ping", "jiu ping"},
	["ºÉÒ¶¶¬ËñÌÀ"] = {"sz;buy tang", "tang"},
	["»ðÕÛ"] = 	{"ne;d;buy fire",	"fire"},
	["Áâ°×ÏºÈÊ"] = 	{"sz;buy xiaren",	"xiaren"},
	["Ó£ÌÒ»ðÍÈ"] = 	{"sz;buy huotui",	"huotui"},
	["Å£Æ¤¾Æ´ü"] = {"wm;#2 e;buy jiudai",	"jiudai"},
	["³¤½£"] = {"ne;d;n;e;s;buy jian",	"chang jian"},
	["¸Öµ¶"] = {"bj;e;e;s;buy gang dao",	"dao"},
	["ÍÀµ¶"] = {"bj;e;e;s;buy tu dao",	"tu dao"},
	["Ìú¹÷"] = {"bj;e;e;s;buy tie gun",	"gun"},
	["¹þÃÜ¹Ï"] = {"xy;w;#2 (nw);w;buy hami gua",	"hami gua"},
	["ÂíÄÌ¾Æºø"] = {"xy;w;#2 (nw);w;buy jiu hu",	"jiu hu"},
	["½ðÏîÁ´"] = {"fz;#2 s;#3 w;buy xianglian",	"xianglian"},
	["²ÝÐ¬"] = {"ne;d;buy cao xie",	"xie"},
	["Âé²¼´ü"] = {"ne;d;buy budai",	"budai"},
	["Õ­ñÌ°À"] = {"dl;s;w;s;e;n;buy ken ao",	"ao"},
	["¶ÔñÆ¹Ó×Ó"] = {"dl;s;w;s;e;n;buy guazi",	"guazi"},
	["¹ýÇÅÃ×Ïß"] = {"dl;s;w;s;s;e;buy mixian",	"mixian"},
	["Æû¹ø¼¦"] = {"dl;s;w;s;s;e;buy qiguo ji",	"qiguo ji"},
	["Ìú¼×"] = {"xi;s;s;s;e;buy jia",	"jia"},
	["¸ÖÕÈ"] = {"xi;s;s;s;e;buy zhang",	"gang zhang"},
	["·ðÌøÇ½"] = {"fz;s;e;buy fotiaoqiang",	"fotiaoqiang"},
	["»¨µñ¾Æ´ü"] = {"wm;#2 e;u;buy jiudai",	"jiudai"},
	["À¶±¦Ê¯Ñü´ø"] = {"ne;buy yao dai",	"dai"},
	["Èâ°ü×Ó"] = {"wm;#2 e;buy baozi",	"baozi"},
	["Æ¤Ñ¥"] = {"ne;d;buy xue",	"xue"},
	["ÌÀÃæ"] = {"bj;e;n;n;w;buy mian",	"mian"},
	["Ä¾µ¶"] = {"xi;e;e;e;s;buy mu dao",	"mu dao"},
	["Ä¾½£"] = {"xi;e;e;e;s;buy mu jian",	"mu jian"},
	["»¤Íó"] = {"ne;d;buy hu wan",	"wan"},
	["Ðå»¨Ð¡·½½í"] = {"ne;buy fang jin",	"jin"},
	["Ò»×ÖåÐÒ£½í"] = {"ne;buy xiaoyao jin",	"jin"},
	["´×Ì³×Ó"] = {"d;w;s;w;buy tanzi",	"tanzi"},
	["Ë¿³ñÂí¹Ó"] = {"ne;buy ma gua",	"gua"},
	["º×¶¥ºì"] = {"cd;w;w;w;w;w;n;nw;buy hedinghong",	"hedinghong"},
	["Ä¾¹÷"] = {"xi;e;e;e;s;buy mu gun",	"mu gun"},
	["¿¾¼¦ÍÈ"] = {"wm;#2 e;buy tui",	"tui"},
	["µ­ÑÌÐã²Å×°"] = {"ne;buy xiucai zhuang",	"zhuang"},
	["½ðË¿¼×"] = {"ne;d;buy jinsi jia",	"jinsi jia"},
	["Å£Æ¤¶Ü"] = {"ne;d;buy dun",	"niupi dun"},
	["¸»¹óÍÅ½ð¹Ó"] = {"ne;buy tuanjin gua",	"gua"},
	["Í·¿ø"] = {"ne;d;buy kui",	"kui"},
	["õõÆ¤"] = {"bj;w;w;n;w;buy pi",	"pi"},
	["Ç§×ÖÎÄ"] = {"ne;d;n;n;buy literateb3",	"literateb3"},
	["¿×È¸µ¨"] = {"cd;w;w;w;w;w;n;nw;buy kongque dan",	"kongque dan"},
	["Ãµ¹å»¨°ê"] = {"cd;w;n;nw;w;w;w;nw;buy huaban",	"huaban"},
	["Éßµ¨·Û"] = {"bj;s;s;buy fen",	"fen"},
	["½ð´´Ò©"] = {"ne;d;n;e;n;buy yao",	"jinchuang yao"},
	["²Ê¶Ð½ôÉí°À"] = {"ne;buy jinshen ao",	"ao"},
	["Ö¸Ì×"] = {"ne;d;buy tao",	"tao"},
	["ÎäÕßÏîÈ¦"] = {"ne;d;buy quan",	"quan"},
	["ÕÐ¼ÜÈëÃÅ"] = {"xi;w;w;n;n;w;buy book",	"book"},
	["¿¾Ñ¼"] = {"wm;#2 e;u;buy ya",	"ya"},
	["¹·Æ¤"] = {"yd;n;e;buy gou pi",	"gou pi"},
	["¹·Æ¤¸àÒ©"] = {"yd;n;e;buy goupi gaoyao",	"goupi gaoyao"},
	["ÂÛÓï"] = {"ne;d;n;n;buy sishu1",	"sishu1"},
	["·É»ÈÊ¯"] = {"cd;w;n;nw;w;w;w;nw;buy shi",	"shi"},
	["Ïã"] = {"tls;n;e;#2 s;w;#2 s;w;s;buy xiang",	"xiang"},
	["½ð½äÖ¸"] = {"fz;#2 s;#3 w;buy jiezhi",	"jiezhi"},
	["´ó¾ÆÆ¿"] = {"fz;s;e;buy ping",	"ping"},
	["Ðå»¨Ð¡Ð¬"] = {"bj;w;w;n;w;buy xiuhua xie",	"xiuhua xie"},
	["Ë®ºø"] = {"wg;buy hu",	"hu"},
	["ÊÖÕÈ"] = {"wg;buy zhang",	"zhang"},
	["ÎåÏã²èÒ¶µ°"] = {"wg;buy dan",	"dan"},
	["·Ûºì³ñÉÀ"] = {"bj;w;w;n;w;buy shan",	"shan"},
	["²èºø"] = {"d;w;s;w;buy hu",	"cha hu"},
	["ôä´ä¶¹¸¯"] = {"d;w;s;w;buy doufu",	"doufu"},
	["Öñ°ô"] = {"sz;w;#3 s;buy bang",	"zhu bang"},
	["°Ù¼ÒÐÕ"] = {"ne;d;n;n;buy literateb2",	"literateb2"},
	["ÑòÆ¤Ñ¥"] = {"ne;buy yangpi xue",	"yangpi xue"},
	["ÎåÏã»¨Éú"] = {"d;w;s;w;buy huasheng",	"huasheng"},
	["ÐûÍþ»ðÍÈ"] = {"dl;s;w;s;s;e;buy huotui",	"huotui"},
	["ÄÞºìÁ¬ÒÂÈ¹"] = {"ne;buy lianyi qun",	"qun"},
	["Æ¤±³ÐÄ"] = {"ne;d;buy beixin",	"beixin"},
	["Ìú´¸"] = {"bj;e;e;s;buy tie chui",	"chui"},
	["Ðå»¨Õë"] = {"bj;w;w;n;w;buy zhen",	"zhen"},
	["ÔÆÄÏ²èºø"] = {"dl;s;w;s;s;e;buy cha hu",	"cha hu"},
	["Çí»¨ð¨ÔÂÉÑ"] = {"ne;buy huayue shang",	"shang"},
	["Èí½ðÊø´ø"] = {"ne;buy shu dai",	"shu dai"},
	["¹·Èâ"] = {"gw;n;n;w;buy rou",	"rou"},
	["¹éÔªµ¤"] = {"ne;d;n;e;n;buy guiyuan dan",	"guiyuan dan"},
	["¹ð»¨ÏÊÀõ¸þ"] = {"hz;w;#3 n;e;buy geng",	"geng"},
	["¡º³¤°×É½ÂÃÓÎÍ¼¡»"] = {"gw;n;n;w;buy tu", "tu"},
	["±Ì²Ï·Û"] = {"cd;w;w;w;w;w;n;nw;buy fen",	"fen"},
	["°×É´ÌôÏßÏâ±ßÈ¹"] = {"dl;s;w;s;e;n;buy qun",	"qun"},
	["¡ºÉÙÁÖ°ÝÊ¦±Ø¶Á¡»"] = {"bj;s;#3 s;#2 (se);e;#4 s;#2 w;buy bidu",	"bidu"},
	["Ðå»¨Ð¬"] = {"ne;buy xiuhua xie",	"xiuhua xie"},
	["Öñ½£"] = {"sz;w;#3 s;buy jian",	"zhu jian"},
	["¶«ÆÂÈâ"] = {"hz;w;#3 n;e;buy dongpo rou",	"rou"},
	["Ò¶¶ùôÎ"] = {"dl;s;w;s;s;e;buy ba",	"yeer ba"},
	["»¯Ê¬·Û"] = {"ne;d;n;e;n;buy fen",	"fen"},
	["¹·ÈâÌÀ"] = {"gw;n;n;w;buy tang",	"tang"},
	["ºùÂ«"] = {"sz;w;#3 s;buy hulu",	"hulu"},
	["Íäµ¶"] = {"lz;w;s;buy wan dao",	"wan dao"},
	["»¤Ñü"] = {"ne;d;buy hu yao",	"yao"},
	["Ø°Ê×"] = {"ne;d;n;e;s;buy bi shou",	"bi shou"},
	["ÎÞ³£µ¤"] = {"ne;d;n;e;n;buy wuchang dan",	"dan"},
	["Îå²ÊÐå»¨È¹"] = {"ne;buy xiuhua qun",	"xiuhua qun"},
	["¡º¶ëáÒÉ½ÂÃÓÎÍ¼¡»"] = {"set brief;fly em;ed;d;ne;ed;ne;ed;sd;se;se;ed;ed;ed;ed;ed;ed;ed;e;ne;e;nd;w;unset brief",	"tu"},
	["¡ºÉÙÁÖËÂÂÃÓÎÍ¼¡»"] = {"bj;s;#3 s;#2 (se);e;#4 s;#2 w;buy tu",	"tu"},
	["½á»éÀñ·þ"] = {"ne;buy lifu",	"lifu"},
	["ÉßÈâ"] = {"bt;sd;s;#2 (sd);se;e;n;buy rou",	"rou"},
	["Àæ»¨Æ®Ñ©ÉÑ"] = {"ne;buy piaoxue shang",	"shang"},
	["Ó§×ÓÃ±"] = {"ne;buy yingzi mao",	"mao"},
	["ÐÂÏÊ²èÒ¶"] = {"cd;w;n;nw;w;w;w;nw;buy cha ye",	"cha ye"},
	["ÌúÁ«×Ó"] = {"cd;w;n;nw;w;w;w;nw;buy lianzi",	"lianzi"},
	["Èý×Ö¾­"] = {"ne;d;n;n;buy literateb1",	"literateb1"},
	["ÃæâÎ"] = {"xy;w;#2 (nw);w;buy nang",	"nang"},
	["Ñø¾«µ¤"] = {"ne;d;n;e;n;buy dan",	"dan"},
	["Öâáá±¸¼±·½"] = {"ne;d;n;e;n;buy yishu",	"yishu"},
	["Æß²ÊÏ¼ÔÆÒÂ"] = {"ne;buy qicaixiayun yi",	"yi"},
	["ÐÛ»Æ"] = {"ne;d;n;e;n;buy xionghuang",	"xionghuang"},
	["ÂéÐ¬"] = {"bj;s;buy xie",	"xie"},
	["ÊìÑ¼µ°"] = {"jx;buy dan",	"dan"},
	["¸àÒ©"] = {"bj;w;s;buy gaoyao",	"gaoyao"},
	["¼ÎÐËôÕ×Ó"] = {"jx;buy zongzi",	"zongzi"},
	["´ó°×Óã"] = {"d;buy da baiyu",	"da baiyu"},
	["Æ¤Ë®ÄÒ"] = {"xy;w;#2 (nw);w;buy shuinang",	"shuinang"}
}


--[1] name, [2] id, [3] npc, [4] path
local wei_kill_items = {
	["Çà²¼³¤ÉÀ"] = {"chang shan",	"¼ÖÈË´ï",	"fz;#5 w;k1 jia renda"},
	["ºÚÉ«³¤ÉÀ"] = {"chang shan",	"ÁõºÃÞÄ",	"sz;w;s;s;s;s;e;e;se;s;k1 liu haoyi"},
	["Ê®°ËÄ¾Å¼"] = {"18 niou",	"´ó±¯ÀÏÈË",	"d;w;n;n;n;w;gyz;n;n;k1 dabei laoren"},
	["Ê®°ËÄàÅ¼"] = {"18 niou",	"´ó±¯ÀÏÈË",	"d;w;n;n;n;w;gyz;n;n;k1 dabei laoren"},
	["ÐåÃ·ÇàÒÂ"] = {"qing yi",	"¼Ò¶¡",	"mz;#3 n;e;s;k1 jia ding"},
	["³ñÅÛ"] = {"chou pao",	"ÌúËãÅÌ",	"ca;s;k1 tie suanpan"},
	["·ÖË®´Ì"] = {"fenshui ci",	"ÃÉÃæÈË",	"yd;n;ne;n;nw;n;ne;ne;ne;ne;k2 menmian ren"},
	["É³³æ"] = {"sha chong",	"É³³æ",	"xy;climb mount;jn;fight sha chong"},
	--["É³³æ¿Ç"] = {"shachong ke",	"É³³æ",	"xy;climb mount;k1 sha chong"},
	--["ÐÜµ¨"] = {"xiong dan",	"Ð¡µÀÍ¯",	"d;w;n;w;w;give daoren 1 gold;halt;qzj;knock1 gate;e;e;k1 dao tong"},
	["°ÚÒÄ¶ÌÈ¹"] = {"duan qun",	"·ÄÉ´Å®",	"bd;k1 fangsha nu"},
	["ÎÚÒÄ³¤È¹"] = {"chang qun",	"ÄÁÑòÅ®",	"dl;s;w;n;w;w;wu;wd;wd;n;k1 muyang nu"},
	["½õ¶Ð"] = {"jin duan",	"ºîÔ±Íâ",	"wg;#5 s;k1 hou yuanwai"},
	["ÑÌ²Ý"] = {"yancao",	"ÀÏÕß",	"hmy1;k1 lao zhe"},
	["·çÀ×ÌÃÁîÅÆ"] = {"card1",	"Í¯°ÙÐÜ",	"hmy1;w;n;su;s;s;s;k1 tong"},
	["ÇàÁúÌÃÁîÅÆ"] = {"card3",	"»ÅÕÅµÄÊÌÅ®",	"hmy1;#2 w;su;s;s;k1 shi nu"},
	["×Ï½ð´¸"] = {"zijin chui",	"Í¯°ÙÐÜ",	"hmy1;w;n;su;s;s;s;k2 tong baixiong"},
	["Êø·¢½ð´ø"] = {"jindai",	"¹ùÜ½",	"xi;w;w;s;s;s;k1 guo fu"},
	["Èíâ¬Æ¤¼×"] = {"ruanwei jia",	"¹ùÜ½",	"xi;w;w;s;s;s;k1 guo fu"},
	["²ñµ¶"] = {"chai dao",	"éÔ·ò",	"bt;sd;s;#2 (sd);#2 (nw);k2 qiao"},
	["Âùµ¶"] = {"man dao",	"´ö×åÊ×Áì",	"dl;s;w;s;s;s;s;s;w;w;enter;n;u;e;e;enter;k2 daizu shouling"},
	["»¢Æ¤"] = {"hu pi",	"´ö×åÊ×Áì",	"dl;s;w;s;s;s;s;s;w;w;enter;n;u;e;e;enter;k1 daizu shouling"},
	["°×²¼ºÚ±ßôÂôÄ"] = {"jia sha",	"ÇåÎÞ±ÈÇð",	"sl;e;k1 qingwu biqiu"},
	["Çà²¼É®Ð¬"] = {"seng xie",	"ÇåÎÞ±ÈÇð",	"sl;e;k1 qingwu biqiu"},
	["½äµ¶"] = {"jie dao",	"ÇåÎÞ±ÈÇð",	"sl;e;k2 qingwu biqiu"},
	["É¥ÃÅ¸«"] = {"sangmen fu",	"Ç®Çà½¡",	"d;w;n;n;n;n;w;w;w;n;n;e;ne;n;w;w;k2 qian qingjian"},
	["ÀÎ·¿Ô¿³×"] = {"cuifulaofang yaoshi",	"´ÞÔ±Íâ",	"d;w;n;w;w;n;n;n;k1 cui yuanwai"},
	["°×³ñÉÀ"] = {"chou shan",	"ÄÏ¹ú¹ÃÄï",	"dl;s;w;#3 s;e;s;k1 girl"},
	["Èý¹É²æ"] = {"sangu cha",	"ºîÍ¨º£",	"wm;e;n;w;w;w;n;n;e;ne;n;k2 hou tonghai"},
	["ÇàÉ«µÀÅÛ"] = {"dao pao",	"Ð¡µÀ¹Ã",	"dl;s;w;s;s;s;s;e;ne;n;w;n;k1 xiao daogu"},
	["Çà²¼Ïâ±ßôÂôÄ"] = {"jia sha",	"ÉñÕÕÉÏÈË",	"bj;e;n;n;n;n;unwield all;n;wi;k1 shen zhao"},
	["¾Å½Ú±Þ"] = {"jiujie bian",	"º«±¦¾Ô",	"gyz;n;k2 han baoju"},
	["Èý¸ÔÊ¶ÂÔ"] = {"sangang shilue",	"ºúÇàÅ£",	"mj;s;sd;s;#4 (sd);enter;k1 hu"},
	["½ð±ßºÚ²¼ôÂôÄ"] = {"jia sha",	"É®ÈË",	"dl;s;w;n;e;eu;e;ed;se;ed;e;k1 seng ren"},
	["¿³µ¶"] = {"kan dao",	"²ÉËñÈË",	"dl;s;w;#8 s;sw;sw;w;k2 caisun ren"},
	["´Ö²¼ÒÂ"] = {"bu yi",	"ËáÐã²Å",	"ca;n;u;u;k1 suan xiucai"},
	["ºìÒÂ"] = {"hong yi",	"ÃÅÎÀ",	"wm;e;n;e;k1 wei"},
	["Òø½£"] = {"yin jian",	"ÃÅÎÀ",	"wm;e;n;e;k2 wei"},
	["»Ò²¼µÀÅÛ"] = {"dao pao",	"ÕÔÖ¾¾´",	"qzj;wd;k1 zhao zhijing"},
	["ÄÁÑò±Þ"] = {"yang bian",	"ÄÁÑòÅ®",	"dl;s;w;n;w;w;w;wu;wd;wd;n;k1 muyang nu"},
	["ÉÕµÃÍ¨ºìµÄÌú´¸"] = {"tie chui",	"·ëÌú½³",	"hsc;#4 w;s;k2 feng"},
	["Ô²ÁìÐ¡°À"] = {"xiao ao",	"Ì¨ÒÄÁÔÈË",	"dl;s;w;#9 s;e;e;k1 lie"},
	["Ò©·Û"] = {"yao fen",	"Ð¡¹ð×Ó",	"ne;d;n;e;e;e;e;k1 xiao guizi"},
	["´ó¸«Í·"] = {"da futou",	"éÔ·ò",	"yd;n;ne;k2 fu"},
	["Ì¨ÒÄÍ²È¹"] = {"tong qun",	"²ÉËñÈË",	"dl;s;w;#8 s;sw;sw;w;k1 ren"},
	["Äý±Ì½£"] = {"ningbi jian",	"ÕÅÕÙÖØ",	"hz;w;k1 zhang zhaozhong"},
	["´äÂÌ³ñÉÀ"] = {"chou shan",	"¶¡µ±",	"hy;n;#5 w;k1 ding dang"},
	["±ÙÐ°½£Æ×"] = {"pixie_sword_book",	"ÁÖÆ½Ö®",	"ws;#3 n;w;#2 n;w;k1 lin pingzhi"},
	["Í­Ô¿³×"] = {"baituo yaoshi",	"¹Ü¼Ò",	"bt;#2 n;k1 guan"},
	["ÊìÍ­¼×"] = {"tong jia",	"ÍÏÀ×",	"zns;#2 e;#2 s;e;k1 tuo lei"},
	["»Æ½ðËø×Ó¼×"] = {"jin jia",	"ºö±ØÁÒ",	"zns;#2 e;s;k1 hu bilie"},
	["Çà²¼ç»ÒÂ"] = {"zi yi",	"ÒÇÇå",	"ns;k1 yi qing"},
	["Çà²¼ÄáÐ¬"] = {"ni xie",	"ÒÇÇå",	"ns;k1 yi qing"},
	["Çà·æ½£"] = {"qingfeng jian",	"ÒÇÇå",	"ns;k2 yi qing"},
	["¹þÈø¿Ë°ÀÈ¹"] = {"ao qun",	"ÀîÎÄÐã",	"xy;w;nw;k1 li wenxiu"},
	["Á÷ÐÇ´¸"] = {"liuxing chui",	"ÀîÎÄÐã",	"xy;w;nw;k2 li wenxiu"},
	["É®Ã±"] = {"seng mao",	"¹±ÌÆ²Ö¹úÊ¦",	"bj;#4 s;w;k1 gongtangcang guoshi"},
	["ÇàÉ«ôÂôÄ"] = {"jia sha",	"¹±ÌÆ²Ö¹úÊ¦",	"bj;#4 s;w;k1 gongtangcang guoshi"},
	["ïÙÌúìøÕÈ"] = {"chan zhang",	"¹±ÌÆ²Ö¹úÊ¦",	"bj;#4 s;w;k2 gongtangcang guoshi"},
	["ºÚÉ«ôÂôÄ"] = {"jia sha",	"ÊØËÂÉ®±ø",	"bj;#4 s;w;k1 seng bing"},
	["Ìú½°"] = {"tie jiang",	"É³Í¨Ìì",	"hh;s;#3 w;k2 sha tongtian"},
	["¶¾ÝðÞ¼"] = {"du jili",	"Áú¿¥",	"hz;w;sw;sw;w;w;w;k1 long jun"},
	["×ÏÅÛ"] = {"zi pao",	"ÅÖÉÌÈË",	"fs;u;k1 pang shangren"},
	["µö¸Ë"] = {"diao gan",	"ñÒÍòÀï",	"dl;k1 zhu wanli"},
	["ÌÙ¼×"] = {"teng jia",	"´óÍÁË¾",	"dl;s;w;#3 s;w;n;k1 da tusi"},
	["±´¿ÇÏîÁ´"] = {"beike xianglian",	"´óÍÁË¾",	"dl;s;w;#3 s;w;n;k1 da tusi"},
	["Ä¾ïÛ"] = {"mu tang",	"Î×Ê¿",	"xy;se;#2 w;s;k1 wushi"},
	["ºÚÉ«Ê¥ÒÂ"] = {"sheng yi",	"ºÚÒÂ°ïÖÚ",	"tzf;sd;w;k1 heiyi bangzhong"},
	["²¨Ë¹³¤ÅÛ"] = {"chang pao",	"²¨Ë¹ÉÌÈË",	"xy;w;nw;k1 bosi shangrennw"},
	["³¤Ç¹"] = {"chang qiang",	"ÃÉ¹Å±ø",	"set brief;fly xi;e;e;n;n;n;w;w;n;n;n;e;unset brief;k2 menggu bing"},
	--["ÇàÉßµ¨"] = {"qing dan",	"ÖñÒ¶ÇàÉß",	"bt;n;#3 w;n;k1 qing she"},
	["»ÆÒÂ¾ü·þ"] = {"jun fu",	"»ÆÒÂÎÀÊ¿",	"dl;s;w;#3 s;w;s;k1 wei shi"},
	["½õÒÂ¾ü·þ"] = {"jun fu",	"½õÒÂÎÀÊ¿",	"dl;s;#2 w;k1 wei shi"},
	["ËØÒÂ¾ü·þ"] = {"jun fu",	"ËØÒÂÎÀÊ¿",	"dl;s;w;#5 s;#2 w;enter;n;k1 wei shi"},
	["ÌúÅýÅÃ"] = {"tie pipa",	"½¹ÎÄÆÚ",	"gw;#3 n;e;s;k2 jiao wenqi"},
	["°×²¼³¤ÅÛ"] = {"chang pao",	"³£½ðÅô",	"qz;k1 chang jinpeng"},
	["²¼ÒÂ"] = {"bu yi",	"Ìô·ò",	"ne;d;n;#3 e;k1 porter"},
	["Í­îà"] = {"tong bo",	"ÐÇËÞÅÉîàÊÖ",	"xx;k2 boshou"},
	["Í­ºÅ"] = {"tong hao",	"ÐÇËÞÅÉºÅÊÖ",	"xx;k2 haoshou"},
	["Í­¹Ä"] = {"tong gu",	"ÐÇËÞÅÉ¹ÄÊÖ",	"xx;k2 gushou"},
	["»Æ²¼ôÂôÄ"] = {"jia sha",	"Ðé",	"sl;s;#3 (sd);wd;k1 xu"},
	["°×É«µÀÅÛ"] = {"dao pao",	"ÓÎ·½µÀÈË",	"hz;w;#4 n;w;sw;k1 daoren"},
	["Ì¨ÒÄ¶ÌÈ¹"] = {"duan qun",	"Ì¨ÒÄÉÌ··",	"dl;s;w;#9 s;e;k1 shang"},
	["´óµ¶"] = {"da dao",	"ÃÅÎÀ",	"bt;sd;s;k2 wei"},
	["ºìç±°À"] = {"hongling ao",	"Ð¡¾Õ",	"gyz;#3 n;k1 xiao ju"},
	--["¸¹Éßµ¨"] = {"fushe dan",	"¸¹Éß",	"sld;#3 s;w;#2 s;k1 fu she"},
	--["ËÀÖí"] = {"sizhu",	"Ò°Öí",	"hy;n;#4 w;s;n;s;w;k1 yezhu"},
	--["½ðÉßµ¨"] = {"jin dan",	"½ð»·Éß",	"bt;n;#3 w;k1 jin she"},
	["Ã«Ìº"] = {"mao tan",	"Å©·ò", "fly dl;s;w;n;e;eu;e;ed;se;sd;eu;ed;e;ne;e;e;se;eu;ed;sw;su;sd;e;n;k2 fu"},
	["ÀçÍ·"] = {"li tou",	"Å©·ò", "fly dl;s;w;n;e;eu;e;ed;se;sd;eu;ed;e;ne;e;e;se;eu;ed;sw;su;sd;e;n;k2 fu"},
	--["ÍÃÈâ"] = {"tu rou",	"°×ÍÃ",	"bt;#4 n;ne;k1 bai tu"},
	["ÊìÌú±âµ£"] = {"bian dan",	"ÄÏÏ£ÈÊ",	"gyz;n;k2 nan xiren"},
	["ÑÃÒÛ·þ"] = {"yayi fu",	"ÑÃÒÛ",	"lz;e;n;k1 ya yi"},
	["É±Íþ°ô"] = {"shawei bang",	"ÑÃÒÛ",	"lz;e;n;k2 ya yi"},
	["¸Ë³Ó"] = {"gan cheng",	"È«½ð·¢",	"gyz;n;k2 quan jinfa"},
	["ÓÍÖ½ÕÛÉÈ"] = {"zhe shan",	"Öì´Ï",	"gyz;n;k2 zhu cong"},
	["³¤ÅÛ"] = {"chang pao",	"Íõ»µË®",	"d;w;n;w;#2 s;k1 wang huaishui"},
	["»ÆÉ«ôÂôÄ"] = {"jia sha",	"Ð¡É³ÃÖ",	"tls;n;e;k1 xiao shami"},
	["½Ð»¯¼¦"] = {"jiaohua ji",	"Â³ÓÐ½Å",	"ne;d;n;#2 e;n;e;n;w;n;e;w;n;k1 lu youjiao"},
	["»Ò²¼Ïâ±ßôÂôÄ"] = {"jia sha",	"µÀÃ÷Ð¡Ê¦¸¸",	"em1;enter;n;k1 daoming xiaoshifu"},
	["±ÌË®½£"] = {"bishui jian",	"ÔÀÁéÉº",	"ws;k1 yue"},
	["ÑþÇÙ"] = {"yao qin",	"¸èÅ®",	"dl;s;w;s;s;e;u;k2 ge nu"},
	["´Ö²¼ÅÛ"] = {"bu pao",	"ÊÌÍ¯",	"thd;#2 n;k1 shi tong"},
	["ºìÓñÔ¿³×"] = {"hongyu yaoshi",	"¶¡¼á",	"mz;#3 n;su;eu;unwield all;n;wi;k1 ding jian"},
	["Ò©³ú"] = {"yao chu",	"ÉñÅ©°ïµÜ×Ó",	"dl;s;w;#5 s;#3 w;nw;ne;k2 dizi"},
	["¶Ìµ¶"] = {"duan dao",	"¸ßÈýÄï×Ó",	"d;w;#2 s;#4 e;se;se;k2 gao san"},
	["ÇàÒÂ"] = {"qing yi",	"³ÌÇàËª",	"lj;s;k1 cheng"},
	["¶·Åñ"] = {"dou peng",	"³ÌÇàËª",	"lj;s;k1 cheng"},
	["Ä¾²ñ"] = {"mu chai",	"éÔ·ò",	"bt;sd;s;#2 (sd);#2 (nw);k1 qiao"},
	["¼âµ¶"] = {"jian dao",	"ÕÅ°¢Éú",	"gyz;n;k2 zhang asheng"},
	["Çà²¼ÒÂ"] = {"qing buyi",	"ÄÏÏ£ÈÊ",	"gyz;n;k1 nan xiren"},
	["¿³²ñ¸«"] = {"kanchai fu",	"ÄÏÏ£ÈÊ",	"gyz;n;k2 nan xiren"},
	["ÇàÉ«Ë¿ÅÛ"] = {"si pao",	"Ð¡Çà",	"bt;n;w;s;k1 xiao qing"},
	["Çà²¼É®ÒÂ"] = {"seng yi",	"ÓÎ·½ºÍÉÐ",	"bj;w;w;n;n;k1 seng"},
	["½ðÒ¶"] = {"leaf",	"ÎâÖ®ÈÙ",	"bj;e;n;#2 w;unwield all;w;wi;k1 wu"},
	["¹Å¶Ì½£"] = {"short sword",	"»ôÇàÍ©",	"xy;k1 huo qingtong"},
	["»ÆÉÀ"] = {"huang shan",	"»ôÇàÍ©",	"xy;k1 huo qingtong"},
	["´äÓð"] = {"cui yu",	"»ôÇàÍ©",	"xy;k1 huo qingtong"},
	--["ÉßÆ¤"] = {"she pi",	"¸¹Éß",	"sld;#4 s;w;#2 s;k1 fu she"},
	["´óÂí°ô"] = {"mabang",	"ÂíÔô",	"yd;n;ne;n;nw;n;#4 (ne);se;s;k1 zei"},
	["³úÍ·"] = {"chu tou",	"Å©·ò",	"dl;s;w;n;w;w;wu;wd;wd;s;s;se;e;k1 fu"},
	["Ò¹ÐÐË®¿¿"] = {"shui kao",	"ÃÉÃæÈË",	"yd;n;ne;n;nw;n;ne;ne;ne;ne;k1 menmian ren"},
	["°×É«³¤ÅÛ"] = {"chang pao",	"°×ÒÂÉÙÅ®",	"bt;#3 n;k1 lady"},
	["ïÙÌúÅÐ¹Ù±Ê"] = {"panguan bi",	"ÅíÁ¬»¢",	"hh;s;#3 (w);k2 peng lianhu"},
	["°×ÒÂ"] = {"bai yi",	"°ÚÒÄÅ®×Ó",	"dl;s;w;n;n;n;n;n;k1 girl"},
	["Î¬Îá¶û×å³¤ÅÛ"] = {"chang pao",	"Î¬Îá¶û×å¸¾Å®",	"xy;w;nw;nw;k1 woman"},
	--["ÎÚ¹ê¼×"] = {"guijia",	"ÎÚ¹ê",	"wg;s;s;s;s;se;e;k1 wu gui"},
	["ÎÚÒÄ´ó÷â"] = {"da hui",	"ÎÚÒÄÉÌ··",	"dl;s;w;n;w;w;w;wu;wd;wd;n;k1 shang"},
	["¸ð²¼³¤ÅÛ"] = {"chang pao",	"Áº×ÓÎÌ",	"hh;s;#3 (w);k1 liang ziwen"},
	["Ì¨ÒÄÍ·½í"] = {"tou jin",	"Ì¨ÒÄÁÔÈË",	"dl;s;w;#9 s;e;e;k1 lie"},
	["¶À½ÅÍ­ÈË"] = {"dujiao tongren",	"ëøÒ»À×",	"gw;n;n;k2 teng"},
	["ÌúÇÂ"] = {"tie qiao",	"²ÉÊ¯ÈË",	"yd;n;ne;n;nw;n;#4 (ne);se;k2 ren"}
}


--[1] name, [2] path, [3] id
local wei_get_items = {
	["ÕýÆøÒ÷"] = {"ws;n;n;n;w;s;get zhengqi_book", "zhengqi_book"},
	["Ð¡Ê÷Ö¦"] = {"fs;n;#5 e;ne;ne;get shu zhi", "shu zhi"},
	["¶ìÂÑÊ¯"] = {"sz;w;#4 n;sw;get 1 eluan shi", "eluan shi"},
	["ºÎÊ×ÎÚ"] = {"wg;ask seller about Ò©;give 1 gold to seller", "shouwu"},
	["·ÄÉ´»ú"] = {"bd;get fangsha ji", "fangsha ji"},
	["·÷³¾"] = {"em2;s;enter;|!k1::s|;e;#3 s;get fu chen", "fu chen"},
	["ÌìÏãÌÃÁîÅÆ"] = {"qz;w;n;n;e;ask xiang about É±¶«·½²»°Ü", "card4"},
	["°×»¢ÌÃÁîÅÆ"] = {"hmy1;w;n;n;s;w;w;s;s;s;w;ask ren about Áîºü³å;ws;sd;#2 (su);enter;give linghu xin", "card2"},
	["Æ¤ÊÖÌ×"] = {"xi;w;w;s;s;s;se;ask wu about Æ¤ÊÖÌ×", "shoutao"},
	["ÌúÖ¸Ì×"] = {"xi;w;w;s;s;s;se;ask wu about ÌúÖ¸Ì×", "zhitao"},
	["Ìú»¤Ñü"] = {"xi;w;w;s;s;s;se;ask wu about Ìú»¤Ñü", "huyao"},
	["Æ¤Î§²±"] = {"xi;w;w;s;s;s;se;ask wu about Æ¤Î§²±", "weibo"},
	["Ìú±³ÐÄ"] = {"xi;w;w;s;s;s;se;ask wu about Ìú±³ÐÄ", "beixin"},
	["Ìú»¤Íó"] = {"xi;w;w;s;s;s;se;ask wu about Ìú»¤Íó", "huwan"},
	["É½²è»¨"] = {"dl;s;w;n;e;eu;get all", "hua"},
	["É¯é¡»¨"] = {"fs;n;e;e;e;e;get flower", "flower"},
	["ÌúÊÖÕÆ"] = {"tdh;e;get hand", "hand"},
	["Ê¯°å"] = {"tdh;e;get stone", "stone"},
	["±¡¾î"] = {"tdh;e;get silk", "silk"},
	["¾ÉÖñÆ¬"] = {"tdh;e;get bamboo", "bamboo"},
	["ÕÆ·¨×ÜÆ×"] = {"tdh;e;get strike book", "strike book"},
	["È­Æ××Ü¾÷"] = {"tdh;e;get unarmed book", "unarmed book"},
	["ÔÆÁú¾­"] = {"tdh;e;get yunlong jing", "yunlong jing"},
	["Ñª½ß"] = {"wg;#6 s;pull drawer;d;se;get xuejie", "xuejie"},
	["ÜòÜß"] = {"wg;w;w;w;ne;eu;ne;nu;nu;e;nu;kan frutex", "fuling"},
	["ÖØÑôÁî"] = {"d;w;n;w;w;give daoren 1 gold", "ling"},
	["Ò°²ËÌÀÍë"] = {"xi;w;w;s;s;s;s;serve;drop fan", "wan"},
	["Î÷ºìÊÁµ°ÌÀ"] = {"wm;e;n;e;e;s;s;serve;drop fan", "tang"},
	["°ÙºÏ»¨"] = {"fs;n;#7 w;nw;sw;w;get hua", "hua"},
	["´óÊ¯Í·"] = {"d;w;s;s;e;e;get shi tou", "shi tou"},
	["´óÊ÷Ö¦"] = {"sz;w;#3 n;sw;get shu zhi", "shu zhi"},
	["ÑïÖÝ³´·¹"] = {"wm;e;n;e;e;s;s;serve;drop tang", "fan"},
	["ÉÙÁÖÓ¢ÐÛÁî"] = {"d;w;s;give seng 1 gold", "ling"},
	["ÊÖÅÁ"] = {"hy;n;#5 w;ask ding about Ê¯ÖÐÓñ", "pa"},
	["³¤±Þ"] = {"tzf;e;n;get bian", "bian"},
	["¸ßÁ»Ã×·¹"] = {"xi;w;w;s;s;s;s;serve;drop wan", "fan"},
	["Þ¥À¼»¨"] = {"qz;#4 w;get flower;#3 (sw);get flower", "flower"},
	["´ó¾ÆÌ³"] = {"zjc;e;get tan", "tan"},
	["·¨ÂÖ"] = {"xs;n;#3 w;get fa lun", "fa lun"},
	["Ã»Ò©"] = {"d;w;n;#2 w;give daoren 1 gold;halt;qzj;knock gate;#3 e;#2 n;wu;eu;wu;dian candle", "moyao"},
	["¡¸¾ÅÒõÕæ¾­¡¹ÉÏ²á"] = {"gm;s;tang coffin", "zhenjing1"},
	["¡¸¾ÅÒõÕæ¾­¡¹ÏÂ²á"] = {"gm;s;tang coffin", "zhenjing2"},
	["Ï¸Ìú¸Ë"] = {"wjg;s;enter;s;#2 (out);e;su;eu;ed;nd;ed;pull tiegan", "xi tiegan"},
	["°×Æå×Ó"] = {"wm;get 1 baiqi zi from xiang", "baiqi zi"},
	["ºÚÆå×Ó"] = {"wm;get 1 heiqi zi from xiang;we", "heiqi zi"},
	["ÉÍÉÆÍ­ÅÆ"] = {"sz;#2 w;get shan pai from xiang", "shan pai"},
	["ÒýÂ·ÉñÉß"] = {"bt;#3 n;w;d;get shen she", "shen she"},
	["»ÆÊ¯Æ×"] = {"mz;#3 n;climb huang song;pull song zhen;get pu", "huangshi pu"},
	["ÈºÐÇè­è²Í¼"] = {"mz;#2 n;zuan table;s;pull floor;d;n;n;get qunxing tu", "qunxing tu"},
	["ÍÆ¼öÐÅ"] = {"bj;e;join mingjiao", "tuijian xin1"},
	["ÊéÐÅ"] = {"d;w;n;#3 e;#4 s;#3 (se);e;s;s;ask lu about ¹éÔÆ×¯;decide", "guiyun shuxin"},
	["Ë®ÃÛÌÒ"] = {"yzw;#4 s;get tao", "tao"},
	["ÀóÖ¦"] = {"yzw;#4 s;get li zhi", "li zhi"},
	["¡ºÐÇËÞ¶¾¾­¡¼ÉÏ²á¡½¡»"] = {"tdh;e;get du jing1", "du jing1"},
	["¡ºÐÇËÞ¶¾¾­¡¼ÏÂ²á¡½¡»"] = {"tdh;e;get du jing2", "du jing2"},
	["°ÙÏã»¨"] = {"sld;#3 s;#2 w;get baixiang hua", "hua"},
	["¾øÇé»¨"] = {"sld;#4 s;#2 w;get jueqing hua", "hua"},
	["¶Ï³¦»¨"] = {"sld;#4 s;#2 w;get duanchang hua", "duanchang hua"},
	["ÇåË®ºùÂ«"] = {"em2;s;enter;|!k1::s|;e;#2 s;get qingshui hulu", "qingshui hulu"},
	["²¤²Ë·ÛÌõ"] = {"em2;s;enter;|!k1::s|;e;#2 s;get bocai fentiao", "bocai fentiao"},
	["ËØ¼¦"] = {"em;ed;d;ne;ed;ne;ed;sd;#2 (se);ed;s;enter;w;get suji", "suji"},
	["ËØÑ¼"] = {"em;ed;d;ne;ed;ne;ed;sd;#2 (se);ed;s;enter;w;get suya", "suya"},
	["Éºº÷°×²Ë"] = {"em2;s;enter;|!k1::s|;e;#2 s;get shanhu baicai", "shanhu baicai"},
	["ÂéÀ±¶¹¸¯"] = {"em;ed;d;ne;ed;ne;ed;sd;#2 (se);ed;s;enter;w;get mala doufu", "mala doufu"},
	["ÁðÁ§ÇÑ×Ó"] = {"em2;s;enter;|!k1::s|;e;#2 s;get liuli qiezi", "liuli qiezi"},
	["Æ¤Ñü´ø"] = {"em2;s;enter;|!k1::s|;e;#3 s;get yao dai", "yao dai"},
	["µ°¸â"] = {"bt;#3 n;e;get dangao", "dangao"},
	["·ä½¬Æ¿"] = {"gm;n;e;e;get ping", "ping"},
	["±ùÑ©ôä´ä¸â"] = {"lj;n;#3 w;get gao", "gao"},
	["¶Ì½£"] = {"d;w;n;w;#3 s;get duan jian", "duan jian"},
	["Óã³á"] = {"zjc;e;get chi", "chi"},
	["ÆåÆ×"] = {"xyl;#2 s;ask kang about ÆåÆ×", "pu"},
	["´ó°å¸«"] = {"tzf;e;n;get ban fu", "ban fu"},
	["ÌÒÄ¾½£"] = {"thd;n;e;get taomu jian", "taomu jian"},
	["Ã×·¹"] = {"xyl;#2 w;s;order;drop wan", "mi fan"},
	["Ë®Íë"] = {"xyl;#2 w;s;order;drop fan", "shui wan"},
	["²¼ÕóÏä"] = {"thd;e;get buzhen xiang", "xiang"},
	["ºìÉÕÅ£Èâ"] = {"tzf;#2 w;n;get niu rou", "niu rou"},
	["Óñ·ä½¬"] = {"gm;n;e;get jiang;#2 w;get jiang", "jiang"},
	["Óñ·äÃÛ"] = {"gm;n;e;get mi;#2 w;get mi", "mi"},
	["ÒõÑôºÏºÍÉ¢"] = {"wm;get yinyang san from xiang", "san"},
	["¸Ö½£"] = {"tzf;e;n;get gang jian", "gang jian"},
	["ÄñÓð´óë©"] = {"sb;d;w;n;enter dong;say ÌìÌÃÓÐÂ·Äã²»×ßÑ½;d;9;#2 (sw);out;u;#2 (wu);su;wu;su;ub;enter;get da chang", "chang"},
	["ËáÃ·ÌÀ"] = {"lj;n;#3 w;get tang", "tang"},
	["¶¹½¬"] = {"bt;#3 n;e;get jiang", "jiang"},
	["Ïã²è"] = {"yzw;#2 s;get xiang cha", "xiang cha"},
	["ÎÞÃû»¨"] = {"sld;#3 s;#2 w;get wuming hua", "wuming hua"},
	["Ê¬¹Ç"] = {"xy;#2 (se);#3 w;get shi gu", "shi gu"},
	["º£¿Ú´óÍë"] = {"bt;n;w;s;get haikou dawan", "haikou dawan"},
	["ºì³ñ"] = {"mz;n;n;n;w;push eye;climb ti zi;jump shu jia;get all;tear chou;wm;drop xue yi", "chou"},
	["ÑªÆåÒÂ"] = {"mz;n;n;n;w;push eye;climb ti zi;jump shu jia;get all;tear chou;wm;drop hong chou", "yi"},
	["²ÝÝ®"] = {"bt;sd;s;#2 (sd);#2 (nw);n;w;sw;get cao mei", "cao mei"},
	["ÉúÁËÐâµÄÕ¡µ¶"] = {"lz;e;n;get rusty blade", "rusty blade"},
	["´óÕäÖé"] = {"jx;n;out;#2 d;#2 s;get da zhenzhu", "da zhenzhu"},
	["Ê¯¿é"] = {"qz;#4 w;#2 (sw);get shi", "shi"},
	["°ô·¨Í¨½â"] = {"d;w;n;enter dong;say ÌìÌÃÓÐÂ·Äã²»×ßÑ½;#2 d;w;break wall;get stick book", "stick book"},
	["×íÏÉ²è"] = {"thd;n;w;|!aw:3:ask cheng about all:hi|","cha"},
	["ÌÒ»¨¸â"] = {"thd;n;w;|!aw:3:ask cheng about all:hi|","gao"},
	["Ð¡ÆÑÍÅ"] = {"fly xyl;|!mmdd::ok|;u;u;s;w;w;w", "pu tuan"}
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
