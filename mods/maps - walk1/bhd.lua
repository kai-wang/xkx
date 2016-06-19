local region = {}
  region.cmd = "fly bhd"
  region.name = "冰火岛"
  region.id = "bhd"
  region.rooms = {}
    region.rooms[1] = {}
      region.rooms[1].path = "fly bhd"
      region.rooms[1].name = "冰火岛海滩"
      region.rooms[1].zone = "冰火岛"
      region.rooms[1].id = 2182
      region.rooms[1].links = {}
        region.rooms[1].links.n = {}
          region.rooms[1].links.n.to = 2183
          region.rooms[1].links.n.con = ""
      region.rooms[1].exits = "north"
      region.rooms[1].desc = ""
    region.rooms[2] = {}
      region.rooms[2].path = "fly bhd;n"
      region.rooms[2].name = "小路"
      region.rooms[2].zone = "冰火岛"
      region.rooms[2].id = 2183
      region.rooms[2].links = {}
        region.rooms[2].links.e = {}
          region.rooms[2].links.e.to = 2208
          region.rooms[2].links.e.con = ""
        region.rooms[2].links.w = {}
          region.rooms[2].links.w.to = 2191
          region.rooms[2].links.w.con = ""
        region.rooms[2].links.s = {}
          region.rooms[2].links.s.to = 2182
          region.rooms[2].links.s.con = ""
        region.rooms[2].links.n = {}
          region.rooms[2].links.n.to = 2184
          region.rooms[2].links.n.con = ""
      region.rooms[2].exits = "south|east|north|west"
      region.rooms[2].desc = "    一条草丛中,踏出的小路."
    region.rooms[3] = {}
      region.rooms[3].path = "fly bhd;n;n"
      region.rooms[3].name = "小路"
      region.rooms[3].zone = "冰火岛"
      region.rooms[3].id = 2184
      region.rooms[3].links = {}
        region.rooms[3].links.s = {}
          region.rooms[3].links.s.to = 2183
          region.rooms[3].links.s.con = ""
        region.rooms[3].links.n = {}
          region.rooms[3].links.n.to = 2185
          region.rooms[3].links.n.con = ""
      region.rooms[3].exits = "south|north"
      region.rooms[3].desc = "    一条草丛中,踏出的小路."
    region.rooms[4] = {}
      region.rooms[4].path = "fly bhd;n;n;n"
      region.rooms[4].name = "小路"
      region.rooms[4].zone = "冰火岛"
      region.rooms[4].id = 2185
      region.rooms[4].links = {}
        region.rooms[4].links.s = {}
          region.rooms[4].links.s.to = 2184
          region.rooms[4].links.s.con = ""
        region.rooms[4].links.n = {}
          region.rooms[4].links.n.to = 2186
          region.rooms[4].links.n.con = ""
      region.rooms[4].exits = "south|north"
      region.rooms[4].desc = "    一条草丛中,踏出的小路."
    region.rooms[5] = {}
      region.rooms[5].path = "fly bhd;n;n;n;n"
      region.rooms[5].name = "空地"
      region.rooms[5].zone = "冰火岛"
      region.rooms[5].id = 2186
      region.rooms[5].links = {}
        region.rooms[5].links.ne = {}
          region.rooms[5].links.ne.to = 2190
          region.rooms[5].links.ne.con = ""
        region.rooms[5].links.s = {}
          region.rooms[5].links.s.to = 2185
          region.rooms[5].links.s.con = ""
        region.rooms[5].links.n = {}
          region.rooms[5].links.n.to = 2187
          region.rooms[5].links.n.con = ""
      region.rooms[5].exits = "south|north|northeast"
      region.rooms[5].desc = "    一块开辟出的空地,明显是人工的."
    region.rooms[6] = {}
      region.rooms[6].path = "fly bhd;n;n;n;n;n"
      region.rooms[6].name = "山洞"
      region.rooms[6].zone = "冰火岛"
      region.rooms[6].id = 2187
      region.rooms[6].links = {}
        region.rooms[6].links.w = {}
          region.rooms[6].links.w.to = 2189
          region.rooms[6].links.w.con = ""
        region.rooms[6].links.s = {}
          region.rooms[6].links.s.to = 2186
          region.rooms[6].links.s.con = ""
        region.rooms[6].links.n = {}
          region.rooms[6].links.n.to = 2188
          region.rooms[6].links.n.con = ""
      region.rooms[6].exits = "south|north|west"
      region.rooms[6].desc = "    这儿是张无忌一家住的山洞，旁边住着谢逊。"
    region.rooms[7] = {}
      region.rooms[7].path = "fly bhd;n;n;n;n;n;n"
      region.rooms[7].name = "山洞"
      region.rooms[7].zone = "冰火岛"
      region.rooms[7].id = 2188
      region.rooms[7].links = {}
        region.rooms[7].links.s = {}
          region.rooms[7].links.s.to = 2187
          region.rooms[7].links.s.con = ""
      region.rooms[7].exits = "south"
      region.rooms[7].desc = "    这儿是张无忌一家住的山洞,旁边住着谢逊.张翠山夫妇的卧室,有些简单的铺设."
    region.rooms[8] = {}
      region.rooms[8].path = "fly bhd;n;n;n;n;n;w"
      region.rooms[8].name = "山洞"
      region.rooms[8].zone = "冰火岛"
      region.rooms[8].id = 2189
      region.rooms[8].links = {}
        region.rooms[8].links.e = {}
          region.rooms[8].links.e.to = 2187
          region.rooms[8].links.e.con = ""
      region.rooms[8].exits = "east"
      region.rooms[8].desc = "    这儿是无忌住的地方，地上铺着草垫，草垫上垫着兽皮，很舒适。"
    region.rooms[9] = {}
      region.rooms[9].path = "fly bhd;n;n;n;n;ne"
      region.rooms[9].name = "谢逊居"
      region.rooms[9].zone = "冰火岛"
      region.rooms[9].id = 2190
      region.rooms[9].links = {}
        region.rooms[9].links.sw = {}
          region.rooms[9].links.sw.to = 2186
          region.rooms[9].links.sw.con = ""
      region.rooms[9].exits = "southwest"
      region.rooms[9].desc = "    谢逊住在这里，边上的山洞里住着的是无忌一家！"
    region.rooms[10] = {}
      region.rooms[10].path = "fly bhd;n;w"
      region.rooms[10].name = "小路"
      region.rooms[10].zone = "冰火岛"
      region.rooms[10].id = 2191
      region.rooms[10].links = {}
        region.rooms[10].links.e = {}
          region.rooms[10].links.e.to = 2183
          region.rooms[10].links.e.con = ""
        region.rooms[10].links.w = {}
          region.rooms[10].links.w.to = 2192
          region.rooms[10].links.w.con = ""
      region.rooms[10].exits = "east|west"
      region.rooms[10].desc = "    一条草丛中,踏出的小路."
    region.rooms[11] = {}
      region.rooms[11].path = "fly bhd;n;w;w"
      region.rooms[11].name = "小路"
      region.rooms[11].zone = "冰火岛"
      region.rooms[11].id = 2192
      region.rooms[11].links = {}
        region.rooms[11].links.e = {}
          region.rooms[11].links.e.to = 2191
          region.rooms[11].links.e.con = ""
        region.rooms[11].links.w = {}
          region.rooms[11].links.w.to = 2193
          region.rooms[11].links.w.con = ""
      region.rooms[11].exits = "east|west"
      region.rooms[11].desc = "    一条草丛中,踏出的小路."
    region.rooms[12] = {}
      region.rooms[12].path = "fly bhd;n;w;w;w"
      region.rooms[12].name = "小路"
      region.rooms[12].zone = "冰火岛"
      region.rooms[12].id = 2193
      region.rooms[12].links = {}
        region.rooms[12].links.e = {}
          region.rooms[12].links.e.to = 2192
          region.rooms[12].links.e.con = ""
        region.rooms[12].links.w = {}
          region.rooms[12].links.w.to = 2201
          region.rooms[12].links.w.con = ""
        region.rooms[12].links.n = {}
          region.rooms[12].links.n.to = 2194
          region.rooms[12].links.n.con = ""
      region.rooms[12].exits = "east|north|west"
      region.rooms[12].desc = "    一条草丛中,踏出的小路."
    region.rooms[13] = {}
      region.rooms[13].path = "fly bhd;n;w;w;w;n"
      region.rooms[13].name = "小路"
      region.rooms[13].zone = "冰火岛"
      region.rooms[13].id = 2194
      region.rooms[13].links = {}
        region.rooms[13].links.s = {}
          region.rooms[13].links.s.to = 2193
          region.rooms[13].links.s.con = ""
        region.rooms[13].links.nw = {}
          region.rooms[13].links.nw.to = 2195
          region.rooms[13].links.nw.con = ""
      region.rooms[13].exits = "south|northwest"
      region.rooms[13].desc = "    一条草丛中,踏出的小路."
    region.rooms[14] = {}
      region.rooms[14].path = "fly bhd;n;w;w;w;n;nw"
      region.rooms[14].name = "小路"
      region.rooms[14].zone = "冰火岛"
      region.rooms[14].id = 2195
      region.rooms[14].links = {}
        region.rooms[14].links.nw = {}
          region.rooms[14].links.nw.to = 2196
          region.rooms[14].links.nw.con = ""
        region.rooms[14].links.se = {}
          region.rooms[14].links.se.to = 2194
          region.rooms[14].links.se.con = ""
      region.rooms[14].exits = "northwest|southeast"
      region.rooms[14].desc = "    一条草丛中,踏出的小路.沿着路走,地势渐高.气温也渐渐变热起来."
    region.rooms[15] = {}
      region.rooms[15].path = "fly bhd;n;w;w;w;n;nw;nw"
      region.rooms[15].name = "小路"
      region.rooms[15].zone = "冰火岛"
      region.rooms[15].id = 2196
      region.rooms[15].links = {}
        region.rooms[15].links.e = {}
          region.rooms[15].links.e.to = 2197
          region.rooms[15].links.e.con = ""
        region.rooms[15].links.n = {}
          region.rooms[15].links.n.to = 2199
          region.rooms[15].links.n.con = ""
        region.rooms[15].links.w = {}
          region.rooms[15].links.w.to = 2198
          region.rooms[15].links.w.con = ""
        region.rooms[15].links.se = {}
          region.rooms[15].links.se.to = 2195
          region.rooms[15].links.se.con = ""
      region.rooms[15].exits = "east|north|southeast|west"
      region.rooms[15].desc = "    一条草丛中,踏出的小路.沿着路走,地势渐高.逐渐到了小山坡.坡上灌木丛生,偶有小动物,窜来窜去."
    region.rooms[16] = {}
      region.rooms[16].path = "fly bhd;n;w;w;w;n;nw;nw;e"
      region.rooms[16].name = "山坡"
      region.rooms[16].zone = "冰火岛"
      region.rooms[16].id = 2197
      region.rooms[16].links = {}
        region.rooms[16].links.w = {}
          region.rooms[16].links.w.to = 2196
          region.rooms[16].links.w.con = ""
      region.rooms[16].exits = "west"
      region.rooms[16].desc = "    小山坡上灌木丛生(teng)，偶有小动物，窜来窜去。不知名的小花，缀生其中。"
    region.rooms[17] = {}
      region.rooms[17].path = "fly bhd;n;w;w;w;n;nw;nw;w"
      region.rooms[17].name = "山坡"
      region.rooms[17].zone = "冰火岛"
      region.rooms[17].id = 2198
      region.rooms[17].links = {}
        region.rooms[17].links.e = {}
          region.rooms[17].links.e.to = 2196
          region.rooms[17].links.e.con = ""
      region.rooms[17].exits = "east"
      region.rooms[17].desc = "    小山坡上灌木丛生,偶有小动物,窜来窜去.不知名的小花,缀生其中."
    region.rooms[18] = {}
      region.rooms[18].path = "fly bhd;n;w;w;w;n;nw;nw;n"
      region.rooms[18].name = "山坡"
      region.rooms[18].zone = "冰火岛"
      region.rooms[18].id = 2199
      region.rooms[18].links = {}
        region.rooms[18].links.s = {}
          region.rooms[18].links.s.to = 2196
          region.rooms[18].links.s.con = ""
        region.rooms[18].links.nu = {}
          region.rooms[18].links.nu.to = 2200
          region.rooms[18].links.nu.con = ""
      region.rooms[18].exits = "south|northup"
      region.rooms[18].desc = "    小山坡上灌木丛生,偶有小动物,窜来窜去.在向北山势渐陡,树木丛生."
    region.rooms[19] = {}
      region.rooms[19].path = "fly bhd;n;w;w;w;n;nw;nw;n;nu"
      region.rooms[19].name = "山坡"
      region.rooms[19].zone = "冰火岛"
      region.rooms[19].id = 2200
      region.rooms[19].links = {}
        region.rooms[19].links.sd = {}
          region.rooms[19].links.sd.to = 2199
          region.rooms[19].links.sd.con = ""
      region.rooms[19].exits = "southdown"
      region.rooms[19].desc = "    北去山势益发陡，树木(wood)丛生，去路，被阻。"
    region.rooms[20] = {}
      region.rooms[20].path = "fly bhd;n;w;w;w;w"
      region.rooms[20].name = "小路"
      region.rooms[20].zone = "冰火岛"
      region.rooms[20].id = 2201
      region.rooms[20].links = {}
        region.rooms[20].links.e = {}
          region.rooms[20].links.e.to = 2193
          region.rooms[20].links.e.con = ""
        region.rooms[20].links.w = {}
          region.rooms[20].links.w.to = 2202
          region.rooms[20].links.w.con = ""
      region.rooms[20].exits = "east|west"
      region.rooms[20].desc = "    一条草丛中,踏出的小路."
    region.rooms[21] = {}
      region.rooms[21].path = "fly bhd;n;w;w;w;w;w"
      region.rooms[21].name = "小路"
      region.rooms[21].zone = "冰火岛"
      region.rooms[21].id = 2202
      region.rooms[21].links = {}
        region.rooms[21].links.e = {}
          region.rooms[21].links.e.to = 2201
          region.rooms[21].links.e.con = ""
        region.rooms[21].links.s = {}
          region.rooms[21].links.s.to = 2203
          region.rooms[21].links.s.con = ""
        region.rooms[21].links.nw = {}
          region.rooms[21].links.nw.to = 2204
          region.rooms[21].links.nw.con = ""
      region.rooms[21].exits = "south|east|northwest"
      region.rooms[21].desc = "    一条草丛中,踏出的小路."
    region.rooms[22] = {}
      region.rooms[22].path = "fly bhd;n;w;w;w;w;w;s"
      region.rooms[22].name = "草地"
      region.rooms[22].zone = "冰火岛"
      region.rooms[22].id = 2203
      region.rooms[22].links = {}
        region.rooms[22].links.n = {}
          region.rooms[22].links.n.to = 2202
          region.rooms[22].links.n.con = ""
      region.rooms[22].exits = "north"
      region.rooms[22].desc = "    这里是一片青草地,几只可爱的小白兔,在吃草."
    region.rooms[23] = {}
      region.rooms[23].path = "fly bhd;n;w;w;w;w;w;nw"
      region.rooms[23].name = "小路"
      region.rooms[23].zone = "冰火岛"
      region.rooms[23].id = 2204
      region.rooms[23].links = {}
        region.rooms[23].links.nw = {}
          region.rooms[23].links.nw.to = 2205
          region.rooms[23].links.nw.con = ""
        region.rooms[23].links.se = {}
          region.rooms[23].links.se.to = 2202
          region.rooms[23].links.se.con = ""
      region.rooms[23].exits = "northwest|southeast"
      region.rooms[23].desc = "    一条草丛中,踏出的小路."
    region.rooms[24] = {}
      region.rooms[24].path = "fly bhd;n;w;w;w;w;w;nw;nw"
      region.rooms[24].name = "小路"
      region.rooms[24].zone = "冰火岛"
      region.rooms[24].id = 2205
      region.rooms[24].links = {}
        region.rooms[24].links.n = {}
          region.rooms[24].links.n.to = 2206
          region.rooms[24].links.n.con = ""
        region.rooms[24].links.se = {}
          region.rooms[24].links.se.to = 2204
          region.rooms[24].links.se.con = ""
      region.rooms[24].exits = "north|southeast"
      region.rooms[24].desc = "    一条草丛中,踏出的小路."
    region.rooms[25] = {}
      region.rooms[25].path = "fly bhd;n;w;w;w;w;w;nw;nw;n"
      region.rooms[25].name = "小路"
      region.rooms[25].zone = "冰火岛"
      region.rooms[25].id = 2206
      region.rooms[25].links = {}
        region.rooms[25].links.s = {}
          region.rooms[25].links.s.to = 2205
          region.rooms[25].links.s.con = ""
        region.rooms[25].links.nu = {}
          region.rooms[25].links.nu.to = 2207
          region.rooms[25].links.nu.con = ""
      region.rooms[25].exits = "south|northup"
      region.rooms[25].desc = "    一条草丛中,踏出的小路."
    region.rooms[26] = {}
      region.rooms[26].path = "fly bhd;n;w;w;w;w;w;nw;nw;n;nu"
      region.rooms[26].name = "火山口"
      region.rooms[26].zone = "冰火岛"
      region.rooms[26].id = 2207
      region.rooms[26].links = {}
        region.rooms[26].links.sd = {}
          region.rooms[26].links.sd.to = 2206
          region.rooms[26].links.sd.con = ""
      region.rooms[26].exits = "southdown"
      region.rooms[26].desc = "    往前已经没路了，前面是火山口。"
    region.rooms[27] = {}
      region.rooms[27].path = "fly bhd;n;e"
      region.rooms[27].name = "小路"
      region.rooms[27].zone = "冰火岛"
      region.rooms[27].id = 2208
      region.rooms[27].links = {}
        region.rooms[27].links.w = {}
          region.rooms[27].links.w.to = 2183
          region.rooms[27].links.w.con = ""
        region.rooms[27].links.e = {}
          region.rooms[27].links.e.to = 2209
          region.rooms[27].links.e.con = ""
      region.rooms[27].exits = "east|west"
      region.rooms[27].desc = "    一条草丛中,踏出的小路."
    region.rooms[28] = {}
      region.rooms[28].path = "fly bhd;n;e;e"
      region.rooms[28].name = "小路"
      region.rooms[28].zone = "冰火岛"
      region.rooms[28].id = 2209
      region.rooms[28].links = {}
        region.rooms[28].links.w = {}
          region.rooms[28].links.w.to = 2208
          region.rooms[28].links.w.con = ""
        region.rooms[28].links.e = {}
          region.rooms[28].links.e.to = 2210
          region.rooms[28].links.e.con = ""
      region.rooms[28].exits = "east|west"
      region.rooms[28].desc = "    一条草丛中,踏出的小路."
    region.rooms[29] = {}
      region.rooms[29].path = "fly bhd;n;e;e;e"
      region.rooms[29].name = "小路"
      region.rooms[29].zone = "冰火岛"
      region.rooms[29].id = 2210
      region.rooms[29].links = {}
        region.rooms[29].links.e = {}
          region.rooms[29].links.e.to = 2211
          region.rooms[29].links.e.con = ""
        region.rooms[29].links.w = {}
          region.rooms[29].links.w.to = 2209
          region.rooms[29].links.w.con = ""
        region.rooms[29].links.n = {}
          region.rooms[29].links.n.to = 2213
          region.rooms[29].links.n.con = ""
      region.rooms[29].exits = "east|north|west"
      region.rooms[29].desc = "    一条草丛中,踏出的小路."
    region.rooms[30] = {}
      region.rooms[30].path = "fly bhd;n;e;e;e;e"
      region.rooms[30].name = "小路"
      region.rooms[30].zone = "冰火岛"
      region.rooms[30].id = 2211
      region.rooms[30].links = {}
        region.rooms[30].links.w = {}
          region.rooms[30].links.w.to = 2210
          region.rooms[30].links.w.con = ""
        region.rooms[30].links.s = {}
          region.rooms[30].links.s.to = 2212
          region.rooms[30].links.s.con = ""
      region.rooms[30].exits = "south|west"
      region.rooms[30].desc = "    一条草丛中,踏出的小路."
    region.rooms[31] = {}
      region.rooms[31].path = "fly bhd;n;e;e;e;e;s"
      region.rooms[31].name = "小路"
      region.rooms[31].zone = "冰火岛"
      region.rooms[31].id = 2212
      region.rooms[31].links = {}
        region.rooms[31].links.n = {}
          region.rooms[31].links.n.to = 2211
          region.rooms[31].links.n.con = ""
      region.rooms[31].exits = "north"
      region.rooms[31].desc = "    一条草丛中，踏出的小路。"
    region.rooms[32] = {}
      region.rooms[32].path = "fly bhd;n;e;e;e;n"
      region.rooms[32].name = "迷洞"
      region.rooms[32].zone = "冰火岛"
      region.rooms[32].id = 2213
      region.rooms[32].links = {}
        region.rooms[32].links.e = {}
          region.rooms[32].links.e.to = 2214
          region.rooms[32].links.e.con = ""
        region.rooms[32].links.w = {}
          region.rooms[32].links.w.to = 2213
          region.rooms[32].links.w.con = ""
        region.rooms[32].links.s = {}
          region.rooms[32].links.s.to = 2210
          region.rooms[32].links.s.con = ""
        region.rooms[32].links.n = {}
          region.rooms[32].links.n.to = 2213
          region.rooms[32].links.n.con = ""
      region.rooms[32].exits = "south|east|north|west"
      region.rooms[32].desc = "    又湿又潮的一个石洞,还散发着野兽的腥臭."
    region.rooms[33] = {}
      region.rooms[33].path = "fly bhd;n;e;e;e;n;e"
      region.rooms[33].name = "迷洞"
      region.rooms[33].zone = "冰火岛"
      region.rooms[33].id = 2214
      region.rooms[33].links = {}
        region.rooms[33].links.e = {}
          region.rooms[33].links.e.to = 2214
          region.rooms[33].links.e.con = ""
        region.rooms[33].links.w = {}
          region.rooms[33].links.w.to = 2213
          region.rooms[33].links.w.con = ""
        region.rooms[33].links.s = {}
          region.rooms[33].links.s.to = 2214
          region.rooms[33].links.s.con = ""
        region.rooms[33].links.n = {}
          region.rooms[33].links.n.to = 2215
          region.rooms[33].links.n.con = ""
      region.rooms[33].exits = "south|east|north|west"
      region.rooms[33].desc = "    又湿又潮的一个石洞,还散发着野兽的腥臭."
    region.rooms[34] = {}
      region.rooms[34].path = "fly bhd;n;e;e;e;n;e;n"
      region.rooms[34].name = "迷洞"
      region.rooms[34].zone = "冰火岛"
      region.rooms[34].id = 2215
      region.rooms[34].links = {}
        region.rooms[34].links.e = {}
          region.rooms[34].links.e.to = 2216
          region.rooms[34].links.e.con = ""
        region.rooms[34].links.w = {}
          region.rooms[34].links.w.to = 2215
          region.rooms[34].links.w.con = ""
        region.rooms[34].links.s = {}
          region.rooms[34].links.s.to = 2214
          region.rooms[34].links.s.con = ""
        region.rooms[34].links.n = {}
          region.rooms[34].links.n.to = 2215
          region.rooms[34].links.n.con = ""
      region.rooms[34].exits = "south|east|north|west"
      region.rooms[34].desc = "    又湿又潮的一个石洞,还散发着野兽的腥臭."
    region.rooms[35] = {}
      region.rooms[35].path = "fly bhd;n;e;e;e;n;e;n;e"
      region.rooms[35].name = "迷洞"
      region.rooms[35].zone = "冰火岛"
      region.rooms[35].id = 2216
      region.rooms[35].links = {}
        region.rooms[35].links.e = {}
          region.rooms[35].links.e.to = 2216
          region.rooms[35].links.e.con = ""
        region.rooms[35].links.s = {}
          region.rooms[35].links.s.to = 2216
          region.rooms[35].links.s.con = ""
        region.rooms[35].links.w = {}
          region.rooms[35].links.w.to = 2215
          region.rooms[35].links.w.con = ""
        region.rooms[35].links.n = {}
          region.rooms[35].links.n.to = 2217
          region.rooms[35].links.n.con = ""
      region.rooms[35].exits = "south|east|north|west"
      region.rooms[35].desc = "    又湿又潮的一个石洞,还散发着野兽的腥臭."
    region.rooms[36] = {}
      region.rooms[36].path = "fly bhd;n;e;e;e;n;e;n;e;n"
      region.rooms[36].name = "迷洞口"
      region.rooms[36].zone = "冰火岛"
      region.rooms[36].id = 2217
      region.rooms[36].links = {}
        region.rooms[36].links.s = {}
          region.rooms[36].links.s.to = 2216
          region.rooms[36].links.s.con = ""
        region.rooms[36].links.enter = {}
          region.rooms[36].links.enter.to = 2218
          region.rooms[36].links.enter.con = ""
      region.rooms[36].exits = "south|enter"
      region.rooms[36].desc = "    又湿又潮的一个石洞,还散发着野兽的腥臭."
    region.rooms[37] = {}
      region.rooms[37].path = "fly bhd;n;e;e;e;n;e;n;e;n;enter"
      region.rooms[37].name = "迷洞"
      region.rooms[37].zone = "冰火岛"
      region.rooms[37].id = 2218
      region.rooms[37].links = {}
        region.rooms[37].links.out = {}
          region.rooms[37].links.out.to = 2217
          region.rooms[37].links.out.con = ""
      region.rooms[37].exits = "out"
      region.rooms[37].desc = "    又湿又潮的一个石洞,还散发着野兽的腥臭."
  region.center = 2182
return region