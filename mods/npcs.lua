local npc_list = {
	["王五"] = {room = 11, name = "wang wu"},
	["冼老板"] = {room = 11, name = "xian laoban"},
	["官兵"] = {room = 17, name = "guan bing"},
	["马超兴"] = {room = 17, name = "ma chaoxing"},
	["武将"] = {room = 17, name = "jiang"},
	["门卫"] = {room = 18, name = "wei"},
	["执法帮众"] = {room = 26, name = "zhifa dizi"},
	["流氓头"] = {room = 40, name = "tou"},
	["胖头陀"] = {room = 42, name = "pang toutuo"},
	["小混混"] = {room = 42, name = "xiao hunhun"},
	["阿庆嫂"] = {room = 50, name = "aqing sao"},
	["江上游"] = {room = 54, name = "jiang shangyou"},
	["快活三"] = {room = 61, name = "kuai huosan"},
	["铁匠"] = {room = 73, name = "tiejiang"},
	["书生"] = {room = 84, name = "sheng"},
	["天乙道人"] = {room = 84, name = "tianyi daoren"},
	["彭有敬"] = {room = 92, name = "peng youjing"},
	["王坏水"] = {room = 99, name = "wang huaishui"},
	["衙役"] = {room = 102, name = "ya yi"},
	["程药发"] = {room = 103, name = "cheng yaofa"},
	["谭友纪"] = {room = 103, name = "tan youji"},
	["程玉环"] = {room = 104, name = "cheng yuhuan"},
	["陈有德"] = {room = 108, name = "chen youde"},
	["管家"] = {room = 110, name = "guan jia"},
	["崔员外"] = {room = 111, name = "cui yuanwai"},
	["崔莺莺"] = {room = 112, name = "cui yingying"},
	["封弓影"] = {room = 113, name = "feng gongying"},
	["男孩"] = {room = 114, name = "boy"},
	["苏州少女"] = {room = 172, name = "girl"},
	["苏州女孩"] = {room = 182, name = "girl"},
	["李莫愁"] = {room = 198, name = "li mochou"},
	["红娘"] = {room = 215, name = "hong niang"},
	["李可秀"] = {room = 218, name = "li kexiu"},
	["张召重"] = {room = 221, name = "zhang zhaozhong", exp=3000000},
	["红花会众"] = {room = 236, name = "hong hua"},
	["褚圆"] = {room = 241, name = "chu yuan"},
	["龙骏"] = {room = 259, name = "long jun"},
	["李沅芷"] = {room = 265, name = "li yuanzhi"},
	["程嘲风"] = {room = 283, name = "cheng chaofeng"},
	["绿营会众"] = {room = 283, name = "hong hua"},
	["方人智"] = {room = 340, name = "fang renzhi"},
	["于人豪"] = {room = 341, name = "yu"},
	["贾人达"] = {room = 344, name = "jia"},
	["余人彦"] = {room = 345, name = "yu"},
	["崔镖头"] = {room = 348, name = "cui biaotou"},
	["白二"] = {room = 352, name = "bai er"},
	["陈七"] = {room = 352, name = "chen qi"},
	["史镖头"] = {room = 353, name = "shi biaotou"},
	["林震南"] = {room = 354, name = "lin zhennan"},
	["王夫人"] = {room = 355, name = "wang furen"},
	["郑镖头"] = {room = 356, name = "zheng biaotou"},
	["老和尚"] = {room = 371, name = "lao heshang"},
	["戈什哈"] = {room = 373, name = "geshiha"},
	["沙天江"] = {room = 377, name = "sha tianjiang"},
	["陈阿婆"] = {room = 379, name = "chen apo"},
	["卜沉"] = {room = 380, name = "bo"},
	["常金鹏"] = {room = 392, name = "chang jinpeng"},
	["老朝奉"] = {room = 411, name = "lao chaofeng"},
	["钟四嫂"] = {room = 412, name = "zhong sisao"},
	["钟小二"] = {room = 412, name = "zhong xiaoer"},
	["凤七"] = {room = 414, name = "feng qi"},
	["马夫"] = {room = 415, name = "ma fu"},
	["胖商人"] = {room = 416, name = "pang shangren"},
	["凤一鸣"] = {room = 426, name = "feng yiming"},
	["米为义"] = {room = 450, name = "mi weiyi"},
	["向大年"] = {room = 450, name = "xiang danian"},
	["刘夫人"] = {room = 453, name = "liu furen"},
	["刘菁"] = {room = 454, name = "liu jing"},
	["刘芹"] = {room = 454, name = "liu qin"},
	["盛皮罗客商"] = {room = 465, name = "shang"},
	["族长"] = {room = 472, name = "zu zhang"},
	["祭司"] = {room = 473, name = "ji si"},
	["台夷商贩"] = {room = 477, name = "shang"},
	["台夷猎人"] = {room = 478, name = "lie"},
	["台夷妇女"] = {room = 480, name = "fu nu"},
	["台夷姑娘"] = {room = 482, name = "gu niang"},
	["台夷农妇"] = {room = 484, name = "nong fu"},
	["摆夷小孩"] = {room = 486, name = "kid"},
	["士兵"] = {room = 492, name = "bing"},
	["侍从"] = {room = 494, name = "cong"},
	["大土司"] = {room = 497, name = "da tusi"},
	["族头人"] = {room = 497, name = "touren"},
	["摆夷老叟"] = {room = 500, name = "oldman"},
	["南国姑娘"] = {room = 500, name = "girl"},
	["江湖艺人"] = {room = 501, name = "jianghu yiren"},
	["富来到"] = {room = 502, name = "fu laidao"},
	["歌女"] = {room = 504, name = "ge nu"},
	["何红药"] = {room = 509, name = "he hongyao"},
	["薛老板"] = {room = 510, name = "xue laoban"},
	["石匠"] = {room = 511, name = "shi jiang"},
	["傅思归"] = {room = 514, name = "fu sigui"},
	["褚万里"] = {room = 516, name = "zhu wanli"},
	["黄衣卫士"] = {room = 516, name = "wei shi"},
    ["锦衣卫士"] = {room = 519, name = "wei shi"},
	["古笃诚"] = {room = 517, name = "gu ducheng"},
	["巴天石"] = {room = 519, name = "ba tianshi"},
    ["华赫艮"] = {room = 520, name = "hua hegen"},
	["范骅"] = {room = 521, name = "fan ye"},
	["段无畏"] = {room = 526, name = "duan wuwei"},
	["小道姑"] = {room = 555, name = "xiao daogu"},
	["刀白凤"] = {room = 556, name = "dao baifeng"},
	["僧人"] = {room = 560, name = "seng ren"},
	["恶奴"] = {room = 573, name = "e nu"},
	["贵公子"] = {room = 573, name = "gongzi"},
	["村妇"] = {room = 575, name = "cun fu"},
	["游客"] = {room = 577, name = "youke"},
	["老祭司"] = {room = 587, name = "lao jisi"},
	["采笋人"] = {room = 589, name = "caisun ren"},
	["砍竹人"] = {room = 590, name = "kanzhu ren"},
	["纺纱女"] = {room = 594, name = "fangsha nu"},
	["采桑女"] = {room = 598, name = "caisang nu"},
	["神农帮弟子"] = {room = 601, name = "shennong dizi"},
	["无量剑弟子"] = {room = 602, name = "wuliang dizi"},
	["侍者"] = {room = 605, name = "zhe"},
	["高升泰"] = {room = 606, name = "gao shengtai"},
    ["素衣卫士"] = {room = 606, name = "shi"},
	["傣族首领"] = {room = 610, name = "daizu shouling"},
	["陪从"] = {room = 613, name = "pei cong"},
	["少女"] = {room = 623, name = "shao nu"},
	["农夫"] = {room = 625, name = "nong fu"},
	["乌夷老祭司"] = {room = 628, name = "lao jisi"},
	["牧羊人"] = {room = 630, name = "muyang ren"},
	["猎人"] = {room = 632, name = "lie"},
	["乌夷商贩"] = {room = 633, name = "fan"},
	["摆夷女子"] = {room = 640, name = "girl"},
	["皮货商"] = {room = 648, name = "shang"},
	["牧羊女"] = {room = 656, name = "muyang nu"},
	["土匪"] = {room = 661, name = "tufei"},
	["年轻少妇"] = {room = 664, name = "nianqing shaofu"},
	["吴天德"] = {room = 693, name = "wu tiande"},
	["铁算盘"] = {room = 840, name = "tie suanpan"},
	["茶博士"] = {room = 846, name = "cha boshi"},
	["酸秀才"] = {room = 846, name = "suan xiucai"},
	["公孙大娘"] = {room = 848, name = "gongsun daniang"},
	["侯员外"] = {room = 869, name = "hou yuanwai"},
	["地保"] = {room = 887, name = "dibao"},
	["村民"] = {room = 888, name = "cun min"},
	["一品堂武士"] = {room = 894, name = "shi"},
	["努儿海"] = {room = 896, name = "nu erhai"},
	["西夏兵"] = {room = 899, name = "bing"},
	["校尉"] = {room = 908, name = "wei"},
	["石人武士"] = {room = 931, name = "shi"},
	["皇宫卫士"] = {room = 936, name = "weishi"},
	["太监"] = {room = 967, name = "tai jian"},
	["宫女"] = {room = 977, name = "gong nv"},
	["白龟寿"] = {room = 982, name = "bai guishou"},
	["卖花姑娘"] = {room = 983, name = "flower girl"},
	["钱老本"] = {room = 985, name = "qian laoben"},
	["吴之荣"] = {room = 988, name = "wu"},
	["厨师"] = {room = 989, name = "chu shi"},
	["女管家"] = {room = 990, name = "guan jia"},
	["鳌拜"] = {room = 991, name = "ao"},
	["程老板"] = {room = 996, name = "cheng laoban"},
	["侍卫"] = {room = 998, name = "shi wei"},
	["齐元凯"] = {room = 999, name = "qi yuankai"},
	["神照上人"] = {room = 999, name = "shen zhao"},
	["仆役"] = {room = 1006, name = "pu yi"},
	["康亲王"] = {room = 1007, name = "kang qinwang"},
	["顾炎武"] = {room = 1024, name = "gu yanwu"},
	["瘦头陀"] = {room = 1028, name = "shou"},
	["吴六奇"] = {room = 1028, name = "wu liuqi"},
	["胡掌柜"] = {room = 1035, name = "hu zhanggui"},
	["高彦超"] = {room = 1040, name = "gao yanchao"},
	["地痞"] = {room = 1042, name = "dipi"},
	["小流氓"] = {room = 1042, name = "punk"},
	["客店伙计"] = {room = 1045, name = "kedian huoji"},
	["掌柜"] = {room = 1045, name = "zhang gui"},
	["徐天川"] = {room = 1049, name = "xu tianchuan"},
	["观众"] = {room = 1051, name = "guan zhong"},
	["戏子"] = {room = 1052, name = "xi zi"},
	["游方和尚"] = {room = 1060, name = "seng ren"},
	["章老三"] = {room = 1063, name = "zhang laosan"},
	["弟子"] = {room = 1064, name = "dizi"},
	["双儿"] = {room = 1068, name = "shuang er"},
	["庄夫人"] = {room = 1068, name = "san furen"},
	["冯锡范"] = {room = 1071, name = "feng xifan"},
	["江湖豪客"] = {room = 1073, name = "jianghu haoke"},
	["船老大"] = {room = 1078, name = "chuan laoda"},
	["老船夫"] = {room = 1078, name = "lao chuanfu"},
	["乐厚"] = {room = 1080, name = "yao hou"},
	["贡唐仓国师"] = {room = 1090, name = "guoshi"},
	["喇嘛"] = {room = 1090, name = "lama"},
	["剑客"] = {room = 1092, name = "jian ke"},
	["舞蛇人"] = {room = 1092, name = "snaker"},
	["关安基"] = {room = 1093, name = "guan anji"},
	["李力世"] = {room = 1094, name = "li lishi"},
	["屠宰场伙计"] = {room = 1094, name = "huo ji"},
	["挑夫"] = {room = 1095, name = "tiao fu"},
	["小贩"] = {room = 1095, name = "xiao fan"},
	["贾老六"] = {room = 1098, name = "jia laoliu"},
	["陈志益"] = {room = 1123, name = "chen zhiyi"},
	["姬清虚"] = {room = 1129, name = "ji qingxu"},
	["知客道长"] = {room = 1147, name = "zhike daozhang"},
	["孙婆婆"] = {room = 1185, name = "sun popo"},
	["崔志方"] = {room = 1195, name = "cui zhifang"},
	["房志起"] = {room = 1205, name = "fang zhiqi"},
	["程瑶迦"] = {room = 1211, name = "cheng yaojia"},
	["吉人通"] = {room = 1249, name = "ji rentong"},
	["申人俊"] = {room = 1249, name = "shen renjun"},
	["罗人杰"] = {room = 1258, name = "luo renjie"},
	["洪人雄"] = {room = 1261, name = "hong renxiong"},
	["余沧海"] = {room = 1264, name = "yu canghai"},
	["侯人英"] = {room = 1267, name = "hou renying"},
	["天柏道人"] = {room = 1277, name = "tianbai daoren"},
	["天松道人"] = {room = 1277, name = "tiansong daorens"},
	["迟百城"] = {room = 1279, name = "chi baicheng"},
	["建除道人"] = {room = 1280, name = "jianchu daoren"},
	["江百胜"] = {room = 1281, name = "jiang baisheng"},
	["青衣武士"] = {room = 1281, name = "wei shi"},
	["玉玑子"] = {room = 1289, name = "yuji zi"},
	["玉磬子"] = {room = 1289, name = "yuqing zi"},
	["玉音子"] = {room = 1289, name = "yuyin zi"},
	["白衣武士"] = {room = 1296, name = "wei shi"},
	["红衣武士"] = {room = 1297, name = "wei shi"},
	["玄贞道长"] = {room = 1343, name = "xuan zhen"},
	["仪文"] = {room = 1356, name = "yi wen"},
	["丁勉"] = {room = 1395, name = "ding mian"},
	["邓八年"] = {room = 1397, name = "deng banian"},
	["高克新"] = {room = 1397, name = "gao kexin"},
	["钟镇"] = {room = 1397, name = "zhong zhen"},
	["费彬"] = {room = 1398, name = "fei bin"},
	["汤英鹄"] = {room = 1403, name = "tang yinghu"},
	["万大平"] = {room = 1403, name = "wan daping"},
	["狄修"] = {room = 1404, name = "di xiu"},
	["史登达"] = {room = 1404, name = "shi dengda"},
	["陆柏"] = {room = 1406, name = "lu bai"},
	["守寺僧兵"] = {room = 1448, name = "seng bing"},
	["澄尚"] = {room = 1474, name = "chengshang"},
	["澄欲"] = {room = 1475, name = "chengyu"},
	["澄灵"] = {room = 1476, name = "chengling"},
	["澄信"] = {room = 1477, name = "chengxin"},
	["澄志"] = {room = 1478, name = "cheng zhi"},
	["澄识"] = {room = 1479, name = "chengshi"},
	["澄思"] = {room = 1480, name = "chengsi"},
	["澄意"] = {room = 1481, name = "chengyi"},
	["澄心"] = {room = 1482, name = "chengxins"},
	["澄和"] = {room = 1485, name = "chenghe"},
	["澄灭"] = {room = 1486, name = "chengmie"},
	["澄寂"] = {room = 1487, name = "chengji"},
	["澄行"] = {room = 1488, name = "chengxing"},
	["澄坚"] = {room = 1489, name = "chengjian"},
	["澄净"] = {room = 1490, name = "chengjing"},
	["澄明"] = {room = 1491, name = "chengming"},
	["澄知"] = {room = 1492, name = "chengzhi"},
	["澄观"] = {room = 1493, name = "chengguan"},
	["打铁僧"] = {room = 1502, name = "datie seng"},
	["觉禅石人"] = {room = 1522, name = "juechan shiren"},
	["碧禅石人"] = {room = 1523, name = "bichan shiren"},
	["枯禅石人"] = {room = 1524, name = "kuchan shiren"},
	["空禅石人"] = {room = 1525, name = "kongchan shiren"},
	["寂禅石人"] = {room = 1526, name = "jichan shiren"},
	["了禅石人"] = {room = 1527, name = "liaochan shiren"},
	["明禅石人"] = {room = 1528, name = "mingchan shiren"},
	["忽伦大虎"] = {room = 1560, name = "da hu"},
	["忽伦二虎"] = {room = 1561, name = "er hu"},
	["忽伦四虎"] = {room = 1561, name = "si hu"},
	["忽伦三虎"] = {room = 1562, name = "san hu"},
	["滕一雷"] = {room = 1566, name = "teng yilei"},
	["焦文期"] = {room = 1574, name = "jiao wenqi"},
	["阎基"] = {room = 1577, name = "yan ji"},
	["护塔僧"] = {room = 1611, name = "huta seng"},
	["老年僧人"] = {room = 1628, name = "laonian sengren"},
	["甘宝宝"] = {room = 1647, name = "gan baobao"},
	["叶二娘"] = {room = 1647, name = "ye erniang"},
	["钟万仇"] = {room = 1648, name = "zhong wanchou"},
	["来福儿"] = {room = 1649, name = "lai fuer"},
	["南海鳄神"] = {room = 1649, name = "eshen"},
	["进喜儿"] = {room = 1651, name = "jin xier"},
	["云中鹤"] = {room = 1651, name = "yun zhonghe"},
	["钟灵"] = {room = 1652, name = "zhong ling"},
	["段延庆"] = {room = 1653, name = "duan yanqing", exp=3000000},
	["方碧琳"] = {room = 1667, name = "fang bilin"},
	["进香客"] = {room = 1674, name = "jinxiang ke"},
	["女弟子"] = {room = 1675, name = "dizi"},
	["丁敏君"] = {room = 1712, name = "ding minjun"},
	["贝锦仪"] = {room = 1718, name = "bei jinyi"},
	["宋青书"] = {room = 1736, name = "song qingshu"},
	["老大娘"] = {room = 1744, name = "old woman"},
	["土匪头"] = {room = 1749, name = "tou"},
	["伐木道士"] = {room = 1752, name = "famu"},
	["小喽罗"] = {room = 1753, name = "xiao louluo"},
	["制香道长"] = {room = 1760, name = "zhixiang daozhang"},
	["店小二"] = {room = 1768, name = "xiao er"},
	["谷虚道长"] = {room = 1792, name = "guxu daozhang"},
	["道童"] = {room = 1798, name = "dao tong"},
	["彭莹玉"] = {room = 1835, name = "peng yingyu", exp=3000000},
	["说不得"] = {room = 1835, name = "shuo bude", exp=3000000},
	["张中"] = {room = 1835, name = "zhang zhong", exp=3000000},
	["周颠"] = {room = 1835, name = "zhou dian", exp=3000000},
	["殷无福"] = {room = 1838, name = "yin wufu"},
	["殷野王"] = {room = 1838, name = "yin yewang", exp=3000000},
	["李天垣"] = {room = 1839, name = "li tianyuan"},
	["殷无禄"] = {room = 1839, name = "yin wulu"},
	["殷无寿"] = {room = 1840, name = "yin wushou"},
	["拓跋"] = {room = 1843, name = "tuoba"},
	["辛然"] = {room = 1845, name = "xin ran"},
	["胡青牛"] = {room = 1847, name = "hu qingniu"},
	["庄铮"] = {room = 1859, name = "zhuang zheng"},
	["唐洋"] = {room = 1869, name = "tang yang"},
	["颜垣"] = {room = 1881, name = "yan yuan"},
	["刀客"] = {room = 1895, name = "dao ke"},
	["大汉"] = {room = 1896, name = "da han"},
	["接引使"] = {room = 1896, name = "jieyin shi"},
	["高山王"] = {room = 1898, name = "gao shanwang"},
	["高则成"] = {room = 1927, name = "gao zecheng"},
	["昆仑派弟子"] = {room = 1927, name = "dizi"},
	["玉灵子"] = {room = 1928, name = "yuling zi"},
	["昆仑派女弟子"] = {room = 1929, name = "dizi"},
	["詹春"] = {room = 1929, name = "zhan chun"},
	["蒋涛"] = {room = 1934, name = "jiang tao"},
	["姚清泉"] = {room = 1942, name = "yao qingquan"},
	["朱长龄"] = {room = 1943, name = "zhu changling"},
	["乔福"] = {room = 1944, name = "qiao fu"},
	["狗仆"] = {room = 1945, name = "gou pu"},
	["小凤"] = {room = 1946, name = "xiao feng"},
	["朱九真"] = {room = 1946, name = "zhu jiuzhen"},
	["卫璧"] = {room = 1947, name = "wei bi"},
	["武青婴"] = {room = 1947, name = "wu qingying"},
	["西华子"] = {room = 1956, name = "xi huazi"},
	["班淑娴"] = {room = 1975, name = "ban shuxian"},
	["五姑"] = {room = 1987, name = "wu gu"},
	["丫环"] = {room = 2002, name = "ya huan"},
	["李教头"] = {room = 2003, name = "li jiaotou"},
	["教练"] = {room = 2004, name = "trainer"},
	["白衣少女"] = {room = 2006, name = "white lady"},
	["肥肥"] = {room = 2009, name = "fei fei"},
	["老材"] = {room = 2010, name = "lao cai"},
	["张妈"] = {room = 2012, name = "zhang ma"},
	["小青"] = {room = 2017, name = "xiao qing"},
	["小孩"] = {room = 2028, name = "kid"},
	["樵夫"] = {room = 2030, name = "qiao fu"},
	["农家妇女"] = {room = 2034, name = "woman"},
	["村姑"] = {room = 2035, name = "cun gu"},
	["花花公子"] = {room = 2038, name = "playboy"},
	["农民"] = {room = 2041, name = "man"},
	["小山贼"] = {room = 2042, name = "xiao shanzei"},
	["山贼"] = {room = 2044, name = "shan"},
	["山贼头"] = {room = 2045, name = "tou"},
	["金花"] = {room = 2046, name = "jin hua"},
	["寡妇"] = {room = 2047, name = "guafu"},
	["仕卫"] = {room = 2048, name = "wei"},
	["兰剑"] = {room = 2052, name = "lan jian"},
	["梅剑"] = {room = 2052, name = "mei jian"},
	["程青霜"] = {room = 2053, name = "cheng qingshuang"},
	["九翼道人"] = {room = 2060, name = "jiuyi"},
	["李嫂"] = {room = 2067, name = "li sao"},
	["菊剑"] = {room = 2077, name = "ju jian"},
	["乌老大"] = {room = 2078, name = "wu laoda", exp=3000000},
	["竹剑"] = {room = 2080, name = "zhu jian"},
    ["余婆婆"] = {room = 2086, name = "yu popo"},
	["符敏仪"] = {room = 2087, name = "fu minyi"},
	["石嫂"] = {room = 2090, name = "shi sao"},
	["蒙面女郎"] = {room = 2092, name = "nv lang"},
	["葛伦布"] = {room = 2110, name = "gelunbu"},
	["小喇嘛"] = {room = 2114, name = "xiao lama"},
	["拉章活佛"] = {room = 2119, name = "lazhang huofo"},
	["嘉木活佛"] = {room = 2120, name = "jiamu huofo"},
	["萨木活佛"] = {room = 2121, name = "samu huofo"},
	["陆天抒"] = {room = 2135, name = "lu tianshu"},
	["花铁干"] = {room = 2139, name = "hua tiegan"},
	["善勇"] = {room = 2140, name = "shan yong"},
	["刘承风"] = {room = 2152, name = "liu chengfeng"},
	["采药人"] = {room = 2157, name = "caiyao ren"},
	["卓玛"] = {room = 2160, name = "zhuoma"},
	["胜谛"] = {room = 2161, name = "sheng di"},
	["宝象"] = {room = 2162, name = "bao xiang"},
	["无根道长"] = {room = 2165, name = "wugen daozhang"},
	["殷锦"] = {room = 2166, name = "yin jin"},
	["方怡"] = {room = 2172, name = "fang yi"},
	["年轻女弟子"] = {room = 2173, name = "young girl"},
	["许雪亭"] = {room = 2176, name = "xu xueting"},
	["陆高轩"] = {room = 2179, name = "lu gaoxuan"},
	["小童"] = {room = 2219, name = "xiao tong"},
	["黑衣帮众"] = {room = 2220, name = "heiyi bangzhong"},
	["灰衣帮众"] = {room = 2220, name = "huiyi bangzhong"},
	["麻衣长老"] = {room = 2268, name = "mayi zhanglao"},
	["星宿派钹手"] = {room = 2285, name = "boshou"},
	["星宿派鼓手"] = {room = 2285, name = "gushou"},
	["星宿派号手"] = {room = 2285, name = "haoshou"},
	["摘星子"] = {room = 2285, name = "zhaixing"},
	["天狼子"] = {room = 2286, name = "tian langzi"},
	["出尘子"] = {room = 2291, name = "chuchen zi"},
	["阿紫"] = {room = 2293, name = "azi"},
	["狮吼子"] = {room = 2303, name = "shihou"},
	["李文秀"] = {room = 2305, name = "li wenxiu"},
	["维吾尔族妇女"] = {room = 2306, name = "woman"},
	["买买提"] = {room = 2307, name = "maimaiti"},
	["巴依"] = {room = 2308, name = "bayi"},
	["阿凡提"] = {room = 2309, name = "afanti"},
	["阿拉木罕"] = {room = 2311, name = "alamuhan"},
	["霍青桐"] = {room = 2313, name = "huo qingtong"},
	["李铁嘴"] = {room = 2349, name = "teller"},
	["李四"] = {room = 2356, name = "li si"},
	["冯铁匠"] = {room = 2357, name = "feng tiejiang"},
	["翠花"] = {room = 2361, name = "cui hua"},
	["趟子手"] = {room = 2378, name = "tangzi shou"},
	["女孩"] = {room = 2380, name = "girl"},
	["仆人"] = {room = 2388, name = "pu ren"},
	["哑仆"] = {room = 2390, name = "ya pu"},
	["程英"] = {room = 2393, name = "cheng ying"},
	["侍童"] = {room = 2394, name = "tong"},
	["冯默风"] = {room = 2406, name = "feng mofeng"},
	["侯通海"] = {room = 2407, name = "hou tonghai"},
	["祖千秋"] = {room = 2421, name = "zu qianqiu"},
	["马青雄"] = {room = 2424, name = "ma qingxiong"},
	["沈青刚"] = {room = 2424, name = "shen qinggang"},
	["钱青健"] = {room = 2425, name = "qian qingjian"},
	["吴青烈"] = {room = 2425, name = "wu qinglie"},
	["梁子翁"] = {room = 2426, name = "liang ziweng"},
	["彭连虎"] = {room = 2426, name = "peng lianhu"},
	["沙通天"] = {room = 2426, name = "sha tongtian"},
	["伙计"] = {room = 2441, name = "huoji"},
	["老秀才"] = {room = 2442, name = "lao xiucai"},
	["蒙面人"] = {room = 2450, name = "mengmian ren"},
	["采石人"] = {room = 2451, name = "caishi ren"},
	["马贼"] = {room = 2452, name = "ma zei"},
	["家丁"] = {room = 2464, name = "jia ding"},
	["公冶乾"] = {room = 2466, name = "gongye gan"},
	["风波恶"] = {room = 2471, name = "feng boe"},
	["邓百川"] = {room = 2495, name = "deng baichuan"},
	["包不同"] = {room = 2552, name = "bao butong"},
	["阿朱"] = {room = 2555, name = "a zhu"},
	["阿碧"] = {room = 2558, name = "a bi"},
	["何不净"] = {room = 2571, name = "he bujing"},
	["韩宝驹"] = {room = 2609, name = "han baoju"},
	["韩小莹"] = {room = 2609, name = "han xiaoyin"},
	["柯镇恶"] = {room = 2609, name = "ke zhene"},
	["南希仁"] = {room = 2609, name = "nan xiren"},
	["朱聪"] = {room = 2609, name = "zhu cong"},
	["书童"] = {room = 2610, name = "tong"},
	["小兰"] = {room = 2611, name = "xiao lan"},
	["小菊"] = {room = 2612, name = "xiao ju"},
	["大金兵"] = {room = 2617, name = "jin bing"},
	["段天德"] = {room = 2617, name = "duan tiande"},
	["灵智上人"] = {room = 2617, name = "lingzhi shangren"},
	["完颜洪烈"] = {room = 2617, name = "wanyan honglie"},
	["完颜康"] = {room = 2617, name = "wanyan kang"},
	["风良"] = {room = 2619, name = "feng liang"},
	["高三娘子"] = {room = 2619, name = "gao san"},
	["范一飞"] = {room = 2620, name = "fan yifei"},
	["吕正平"] = {room = 2620, name = "lu zhengping"},
	["大悲老人"] = {room = 2621, name = "dabei laoren"},
	["施戴子"] = {room = 2652, name = "shi daizi"},
	["矮老者"] = {room = 2653, name = "ai laozhe"},
	["高老者"] = {room = 2653, name = "gao laozhe"},
	["高根明"] = {room = 2666, name = "gao genming"},
	["梁发"] = {room = 2677, name = "liang fa"},
	["公平子"] = {room = 2679, name = "gongping zi"},
	["小猴"] = {room = 2681, name = "little monkey"},
	["劳德诺"] = {room = 2682, name = "lao denuo"},
	["成不忧"] = {room = 2698, name = "cheng buyou", exp=3000000},
	["丛不弃"] = {room = 2700, name = "cong buqi", exp=3000000},
	["封不平"] = {room = 2702, name = "feng buping", exp=3000000},
	["施令威"] = {room = 2705, name = "shi lingwei"},
	["护院"] = {room = 2707, name = "hu yuan"},
	["丹青生"] = {room = 2709, name = "danqing sheng", exp=5000000},
	["秃笔翁"] = {room = 2710, name = "tubi weng", exp=5000000},
	["黑白子"] = {room = 2713, name = "heibai zi", exp=5000000},
	["丁坚"] = {room = 2728, name = "ding jian"},
	["苟读"] = {room = 2743, name = "gou du"},
	["康广陵"] = {room = 2751, name = "kang guangling"},
	["冯阿三"] = {room = 2755, name = "feng asan"},
	["丁当"] = {room = 2898, name = "ding dang"},
	["谢烟客"] = {room = 2900, name = "xie yanke", exp=3000000},
	["石中玉"] = {room = 2901, name = "shi zhongyu"},
	["老者"] = {room = 2908, name = "lao zhe"},
	["桑三娘"] = {room = 2910, name = "sang sanniang"},
	["日月神教教徒"] = {room = 2916, name = "jiao tu"},
	["贾布"] = {room = 2918, name = "jia bu"},
	["童百熊"] = {room = 2930, name = "tong baixiong"},
	["上官云"] = {room = 2938, name = "shangguan"},
	["采花子"] = {room = 2966, name = "caihua zi"},
	["老鸨婆"] = {room = 2997, name = "laobao po"},
	["「平通镖局」镖头"] = {room = 552, name = "biao tou"},
	["静虚"] = {room = 3, name = "jingxu's waxwork", exp=20000000, hubo=true},
	["笑天"] = {room = 3, name = "cutes's waxwork", exp=20000000, hubo=true},
	["一阵风"] = {room = 3, name = "lhh's waxwork", exp=20000000, hubo=true},
	["螃蟹"] = {room = 3, name = "carb's waxwork", exp=20000000, hubo=true},
	["小鱼"] = {room = 3, name = "bullet's waxwork", exp=20000000, hubo=true},
	["张卫健"] = {room = 3, name = "zhangweijian's waxwork", exp=20000000, hubo=true},
	["玩玩"] = {room = 3, name = "wbz's waxwork", exp=20000000, hubo=true},
	["天外天"] = {room = 3, name = "masaki's waxwork", exp=20000000, hubo=true},
	["静菁"] = {room = 3, name = "duke's waxwork", exp=20000000, hubo=true},
	["明平"] = {room = 3, name = "ginko's waxwork", exp=20000000, hubo=true},
	["三叉戟"] = {room = 3, name = "xxx's waxwork", exp=20000000, hubo=true},
	["蓉蓉"] = {room = 3, name = "rong's waxwork", exp=20000000, hubo=true},
	["易水寒"] = {room = 3, name = "lot's waxwork", exp=20000000, hubo=true},
	["小虎"] = {room = 3, name = "sch's waxwork", exp=20000000, hubo=true},
	["萧然山"] = {room = 3, name = "hong's waxwork", exp=20000000, hubo=true},
	["凝蕾"] = {room = 3, name = "waitye's waxwork", exp=20000000, hubo=true},
	["丁香"] = {room = 3, name = "violet's waxwork", exp=20000000, hubo=true},
	["楚山孤"] = {room = 3, name = "lonely's waxwork", exp=20000000, hubo=true},
	["笑痴"] = {room = 5, name = "seven's waxwork", exp=20000000, hubo=true},
	["火舞"] = {room = 5, name = "salas's waxwork", exp=20000000, hubo=true},
	["胡铁花"] = {room = 5, name = "eight's waxwork", exp=20000000, hubo=true},
	["渡你下地狱"] = {room = 5, name = "frank's waxwork", exp=20000000, hubo=true},
	["世外高人"] = {room = 67, name = "robin's waxwork", exp=20000000},
	["大熊掌"] = {room = 67, name = "frank's waxwork", exp=20000000},
	["老肥肥"] = {room = 67, name = "fat's waxwork", exp=20000000},
	["老鱼头"] = {room = 67, name = "foxer's waxwork", exp=20000000},
	["佐少"] = {room = 67, name = "zuosao's waxwork", exp=20000000},
	["流云"] = {room = 67, name = "sieg's waxwork", exp=20000000},
    ["本因"] = {room = 1614, name = "ben yin", exp=10000000},
    ["本观"] = {room = 1631, name = "ben guan", exp=10000000},
    ["本参"] = {room = 1631, name = "ben can", exp=10000000},
    ["本相"] = {room = 1631, name = "ben xiang", exp=10000000},
    ["本尘"] = {room = 1631, name = "ben chen", exp=10000000},
    ["枯荣大师"] = {room = 1631, name = "kurong dashi", exp=20000000},
    ["段正淳"] = {room = 532, name = "duan zhengchun", exp=20000000},
    ["小沙弥"] = {room = 1619, name = "xiao shami"},
    ["木婉清"] = {room = 542, name = "mu wanqing"},
    ["盛皮罗客商"] = {room = 465, name = "ke shang"},
    ["虚竹"] = {room = 2052, name = "xu zhu", exp=10000000},
    ["段誉"] = {room = 907, name = "duan yu", exp=20000000},
    ["天山童姥"] = {room = 2091, name = "tong lao", exp=30000000},
    ["清法比丘"] = {room = 1427, name = "qingfa biqiu"},
    ["道果禅师"] = {room = 1436, name = "daoguo chanshi"},
    ["清善比丘"] = {room = 1439, name = "qiangshan biqiu"}, 
    ["慧空尊者"] = {room = 1462, name = "huikong zunzhe"}, 
    ["慧如尊者"] = {room = 1463, name = "huiru zunzhe"},
    ["慧合尊者"] = {room = 1496, name = "huihe zunzhe"},  
    ["慧修尊者"] = {room = 1497, name = "huixiu zunzhe"},  
    ["慧色尊者"] = {room = 1498, name = "huise zunzhe"},  
    ["慧虚尊者"] = {room = 1512, name = "huixu zunzhe"},  
    ["慧名尊者"] = {room = 1511, name = "huiming zunzhe"},  
    ["慧洁尊者"] = {room = 1510, name = "huijie zunzhe"},  
    ["道品禅师"] = {room = 1466, name = "daopin chanshi"}, 
    ["道成禅师"] = {room = 1513, name = "daocheng chanshi"}, 
    ["道觉禅师"] = {room = 1468, name = "daojue chanshi"}, 
    ["道正禅师"] = {room = 1456, name = "daozheng chanshi"}, 
    ["玄苦大师"] = {room = 1489, name = "xuanku dashi", exp=10000000},
    ["玄难大师"] = {room = 1478, name = "xuannan dashi", exp=10000000},
    ["玄悲大师"] = {room = 1515, name = "xuanbei dashi", exp=10000000},
    ["清乐比丘"] = {room = 1494, name = "qingle biqiu"},
    ["玄慈大师"] = {room = 1495, name = "xuanci dashi", exp=10000000},
    ["苏星河"] = {room = 2742, name = "su xinghe", exp=5000000},
    ["薛慕华"] = {room = 2749, name = "xue muhua", exp=3000000},
    ["康广陵"] = {room = 2751, name = "kang guangling", exp=3000000},
    ["冯阿三"] = {room = 2755, name = "feng asan", exp=3000000},
    ["苟读"] = {room = 2743, name = "gou du", exp=3000000},
    ["逍遥子"] = {room = 2981, name = "xiaoyao zi", exp=50000000},
    ["朱丹臣"] = {room = 3049, name = "zhu danchen"}
}

return npc_list