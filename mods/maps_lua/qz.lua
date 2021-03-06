local region = {}
  region.cmd = "fly qz"
  region.name = "泉州"
  region.id = "qz"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly qz;w;n;n"
      region.rooms[1].name = "大路"
      region.rooms[1].zone = "福州|泉州"
      region.rooms[1].id = 387
      region.rooms[1].links = {}
        region.rooms[1].links.e = {}
          region.rooms[1].links.e.to = 389
          region.rooms[1].links.e.con = ""
        region.rooms[1].links.s = {}
          region.rooms[1].links.s.to = 388
          region.rooms[1].links.s.con = ""
        region.rooms[1].links.n = {}
          region.rooms[1].links.n.to = 386
          region.rooms[1].links.n.con = ""
      region.rooms[1].exits = "south|east|north"
      region.rooms[1].desc = "    你走在一条大路上。时值春日，路旁的山坡上开满了金黄色的油菜花。向北是福州城，向南则是泉州。东面有一个供路人休息的小茶亭。"
    region.rooms[2] = {}
      region.rooms[2].path = "fly qz;w;n"
      region.rooms[2].name = "泉州北门"
      region.rooms[2].zone = "福州|泉州"
      region.rooms[2].id = 388
      region.rooms[2].links = {}
        region.rooms[2].links.s = {}
          region.rooms[2].links.s.to = 391
          region.rooms[2].links.s.con = ""
        region.rooms[2].links.n = {}
          region.rooms[2].links.n.to = 387
          region.rooms[2].links.n.con = ""
      region.rooms[2].exits = "south|north"
      region.rooms[2].desc = "    这里是南方第一港泉州的北门。出此门向北可抵中原。"
    region.rooms[3] = {}
      region.rooms[3].path = "fly qz;w;n;n;e"
      region.rooms[3].name = "茶亭"
      region.rooms[3].zone = "泉州"
      region.rooms[3].id = 389
      region.rooms[3].links = {}
        region.rooms[3].links.w = {}
          region.rooms[3].links.w.to = 387
          region.rooms[3].links.w.con = ""
        region.rooms[3].links.s = {}
          region.rooms[3].links.s.to = 390
          region.rooms[3].links.s.con = ""
      region.rooms[3].exits = "south|west"
      region.rooms[3].desc = "    这是一家路边的小茶亭，赶山路的人常在此处歇歇脚。亭子里有几张桌子和几支条凳。周围是一片树林。"
    region.rooms[4] = {}
      region.rooms[4].path = "fly qz;w;n;n;e;s"
      region.rooms[4].name = "树林"
      region.rooms[4].zone = "泉州"
      region.rooms[4].id = 390
      region.rooms[4].links = {}
        region.rooms[4].links.n = {}
          region.rooms[4].links.n.to = 389
          region.rooms[4].links.n.con = ""
      region.rooms[4].exits = "north"
      region.rooms[4].desc = "    树林里光线暗淡，只能听见头顶上传来一些鸟儿的啼鸣。偶而从茂密的叶间透过的一线光伴着落叶在飞舞。"
    region.rooms[5] = {}
      region.rooms[5].path = "fly qz;w"
      region.rooms[5].name = "城中心"
      region.rooms[5].zone = "泉州"
      region.rooms[5].id = 391
      region.rooms[5].links = {}
        region.rooms[5].links.e = {}
          region.rooms[5].links.e.to = 392
          region.rooms[5].links.e.con = ""
        region.rooms[5].links.w = {}
          region.rooms[5].links.w.to = 399
          region.rooms[5].links.w.con = ""
        region.rooms[5].links.s = {}
          region.rooms[5].links.s.to = 393
          region.rooms[5].links.s.con = ""
        region.rooms[5].links.n = {}
          region.rooms[5].links.n.to = 388
          region.rooms[5].links.n.con = ""
      region.rooms[5].exits = "south|east|north|west"
      region.rooms[5].desc = "    泉州是一个安静的港城。虽然这里是城中心，人们也只是脚步轻轻地过往，并不喧哗。东面是一个港口，从那里可以出海。西面有一条小巷。"
    region.rooms[6] = {}
      region.rooms[6].path = "fly qz"
      region.rooms[6].name = "海港"
      region.rooms[6].zone = "泉州"
      region.rooms[6].id = 392
      region.rooms[6].links = {}
        region.rooms[6].links.w = {}
          region.rooms[6].links.w.to = 391
          region.rooms[6].links.w.con = ""
      region.rooms[6].exits = "west"
      region.rooms[6].desc = "    这里是出海的必经之地，泉州号称东方第一大港，是海上丝绸之路的起点，舟船(chuan)十分方便。"
    region.rooms[7] = {}
      region.rooms[7].path = "fly qz;w;s"
      region.rooms[7].name = "泉州南门"
      region.rooms[7].zone = "泉州"
      region.rooms[7].id = 393
      region.rooms[7].links = {}
        region.rooms[7].links.s = {}
          region.rooms[7].links.s.to = 394
          region.rooms[7].links.s.con = ""
        region.rooms[7].links.n = {}
          region.rooms[7].links.n.to = 391
          region.rooms[7].links.n.con = ""
      region.rooms[7].exits = "south|north"
      region.rooms[7].desc = "    这里是南方第一港泉州的南门。南门外是一片荒野。"
    region.rooms[8] = {}
      region.rooms[8].path = "fly qz;w;s;s"
      region.rooms[8].name = "竹林小道"
      region.rooms[8].zone = "泉州"
      region.rooms[8].id = 394
      region.rooms[8].links = {}
        region.rooms[8].links["open door;w"] = {}
          region.rooms[8].links["open door;w"].to = 395
          region.rooms[8].links["open door;w"].con = ""
        region.rooms[8].links.n = {}
          region.rooms[8].links.n.to = 393
          region.rooms[8].links.n.con = ""
      region.rooms[8].exits = "north"
      region.rooms[8].desc = "    这是一条卵石铺成的小道，曲曲折折地通向前方。两边是密密的竹林。这里人迹罕至，惟闻足底叩击路面，微风吹拂竹叶，令人尘心为之一涤。但除了幽静之外，却隐隐有股杀气弥漫在这竹林之中，不禁让人心里一紧。"
    region.rooms[9] = {}
      region.rooms[9].path = "fly qz;w;s;s;open door;w"
      region.rooms[9].name = "青龙会前庭"
      region.rooms[9].zone = "泉州"
      region.rooms[9].id = 395
      region.rooms[9].links = {}
        region.rooms[9].links["open door;e"] = {}
          region.rooms[9].links["open door;e"].to = 394
          region.rooms[9].links["open door;e"].con = ""
        region.rooms[9].links.s = {}
          region.rooms[9].links.s.to = 397
          region.rooms[9].links.s.con = ""
        region.rooms[9].links.w = {}
          region.rooms[9].links.w.to = 396
          region.rooms[9].links.w.con = ""
        region.rooms[9].links.n = {}
          region.rooms[9].links.n.to = 398
          region.rooms[9].links.n.con = ""
      region.rooms[9].exits = "south|east|north|west"
      region.rooms[9].desc = "    这是一片密密的竹林。这里人迹罕至，惟闻足底叩击路面，有僧敲木鱼声；微风吹拂竹叶，又如簌簌禅唱。令人尘心为之一涤，真是绝佳的禅修所在。"
    region.rooms[10] = {}
      region.rooms[10].path = "fly qz;w;s;s;open door;w;w"
      region.rooms[10].name = "青龙会大庭"
      region.rooms[10].zone = "泉州"
      region.rooms[10].id = 396
      region.rooms[10].links = {}
        region.rooms[10].links.e = {}
          region.rooms[10].links.e.to = 395
          region.rooms[10].links.e.con = ""
      region.rooms[10].exits = "east"
      region.rooms[10].desc = "    这是一片密密的竹林。这里人迹罕至，惟闻足底叩击路面，有僧敲木鱼声；微风吹拂竹叶，又如簌簌禅唱。令人尘心为之一涤，真是绝佳的禅修所在。"
    region.rooms[11] = {}
      region.rooms[11].path = "fly qz;w;s;s;open door;w;s"
      region.rooms[11].name = "青龙会侧庭"
      region.rooms[11].zone = "泉州"
      region.rooms[11].id = 397
      region.rooms[11].links = {}
        region.rooms[11].links.n = {}
          region.rooms[11].links.n.to = 395
          region.rooms[11].links.n.con = ""
      region.rooms[11].exits = "north"
      region.rooms[11].desc = "    这是一片密密的竹林。这里人迹罕至，惟闻足底叩击路面，有僧敲木鱼声；微风吹拂竹叶，又如簌簌禅唱。令人尘心为之一涤，真是绝佳的禅修所在。"
    region.rooms[12] = {}
      region.rooms[12].path = "fly qz;w;s;s;open door;w;n"
      region.rooms[12].name = "青龙会侧庭"
      region.rooms[12].zone = "泉州"
      region.rooms[12].id = 398
      region.rooms[12].links = {}
        region.rooms[12].links.s = {}
          region.rooms[12].links.s.to = 395
          region.rooms[12].links.s.con = ""
      region.rooms[12].exits = "south"
      region.rooms[12].desc = "    这是一片密密的竹林。这里人迹罕至，惟闻足底叩击路面，有僧敲木鱼声；微风吹拂竹叶，又如簌簌禅唱。令人尘心为之一涤，真是绝佳的禅修所在。"
    region.rooms[13] = {}
      region.rooms[13].path = "fly qz;w;w"
      region.rooms[13].name = "泉州西门"
      region.rooms[13].zone = "泉州"
      region.rooms[13].id = 399
      region.rooms[13].links = {}
        region.rooms[13].links.e = {}
          region.rooms[13].links.e.to = 391
          region.rooms[13].links.e.con = ""
        region.rooms[13].links.w = {}
          region.rooms[13].links.w.to = 400
          region.rooms[13].links.w.con = ""
      region.rooms[13].exits = "east|west"
      region.rooms[13].desc = "    这里是南方第一港泉州的西门。西门外是一座吊桥。"
    region.rooms[14] = {}
      region.rooms[14].path = "fly qz;w;w;w"
      region.rooms[14].name = "西门吊桥"
      region.rooms[14].zone = "泉州"
      region.rooms[14].id = 400
      region.rooms[14].links = {}
        region.rooms[14].links.e = {}
          region.rooms[14].links.e.to = 399
          region.rooms[14].links.e.con = ""
        region.rooms[14].links.w = {}
          region.rooms[14].links.w.to = 401
          region.rooms[14].links.w.con = ""
      region.rooms[14].exits = "east|west"
      region.rooms[14].desc = "    这是泉州西面的一座吊桥，从傍着晋江而建的城楼大门上以两个滑轮维系。日出放下吊，日落绞起。过了桥向西南走可达岭南广东。"
    region.rooms[15] = {}
      region.rooms[15].path = "fly qz;w;w;w;w"
      region.rooms[15].name = "林间道"
      region.rooms[15].zone = "泉州|佛山"
      region.rooms[15].id = 401
      region.rooms[15].links = {}
        region.rooms[15].links.e = {}
          region.rooms[15].links.e.to = 400
          region.rooms[15].links.e.con = ""
        region.rooms[15].links.sw = {}
          region.rooms[15].links.sw.to = 402
          region.rooms[15].links.sw.con = ""
      region.rooms[15].exits = "east|southwest"
      region.rooms[15].desc = "    这里是一条林间小道，在树丛中蜿蜒。东面就是泉州城的西门吊桥，向西南可达岭南广东。"
  region.center = 392
return region