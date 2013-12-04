require "tprint"

local task1 = {}

task1["����ɽ"] = {n=3, text=[[
000000000000000100000000001000000000000000000000000
000000000001000000000000000000000000000000100000000
000000000000000000000000000011100000000000100000000
000010000101010000000100011110100000000000100000000
000000000001001000000100010010100010000000100000000
000010011001111000000101011111000000000000100000000
000010101111000000010101010000000000000000100001000
001010111001010000010101010110100000010000100001000
001010101000010000010111011000100000010000100001000
001011101101010000011000101110100000010000100001000
001100011000000000000000101000100000010000111111000
000001101001100000000001001110100000010111000001000
000000001010010100000010001000100000011000000001000
000000011000001100000100001111100000000000000000000
000000001000000100000000000000100000000000000000000
000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000
]]}

task1["ѩɽ��"] = {n=3, text=[[
00000000011000000010000000000000000000000000000000
00000111100000000000000000000000010000000100000000
00000001000000000000000010000000000000000100000000
00000001111101000000000010000000000000000110100000
00001101001001000000000010000000000000011100000000
00100101000010000000000010000000000000000100000000
00100001001000000000000010000000000000000111111100
00000101000000000000000010000000000111111010000000
00000000011100000001000010000100000000000010000000
00001111100100000001000000000100000000001110110000
00000000000100000000000000000100000001110010000000
00000111110100000001000011111000000000010010000000
00000000000100000001001100000100000000001010000000
00001111111100000001100000000100010000000010000000
00000000000000000000000000000000000000000110000000
00000000000000000000000000000000000000000010000000
00000000000000000000000000000000000000000000000000
]]}

task1["�䵱ɽ"] = {n=3, text=[[
0000000000000000000000010000000000000000000000000
0000000010000000000000010000000000000000100000000
0000000010100000100000010000000000000000100000000
0000000010000000000000010001000000000000100000000
0000011010000000000010010010000000000000100000000
0001100011110000000001010000000000000000100000000
0000001110000000000000011111100000000000100001000
0011110010000000000111110000100000010000100000000
0000010000000000000000000000100000010000100001000
0001011101000000000000011110100000010000000001000
0001010001000000000011100000100000010000111111000
0001010000100000000000000001000000010111000001000
0001011100100010000000011011100000011000000001000
0001100000010010000111100000000000000000000000000
0110000000001000000000000000000000000000000000000
0000000000000110000000000000000000000000000000000
0000000000000000000101000000000001000000001000000
]]}

task1["��ң��"] = {n=3, text=[[
000000000000000000000000000000000000000000000000
000000001000000000000000010000000000000000000000
001000001000100000000000110000000000000001000000
000001001001000000100101000100000000000001000000
000000101010000000000010100000000001000001000000
000000011110000000000000010000000001000001010000
001100100001000000000010111100000001110111000000
110100111101000011110011100000000101000001000000
001000100001000000010100111111000001100011100000
001000111101000000100111100100000011010101010000
000000100001000000100000000100000101001001001000
111100000011000000100011111100000101010001000110
000010100000000011110000000000001001000001000000
000000001111111000001110000000000001000001000000
000000000000000000000001011110000000000001000000
000000000000000000000000000000000000000000000000
000000100000000000000000000000000000000000000000
]]}

task1["���չ�"] = {n=3, text=[[
0000000111100000000000000000000000000001000000000
0001111000100000000001000010100000000000100000000
0000000001000000000001110010010000000000000111000
0000111101000000001111000011100000011111110001000
0000000000000000100010100101000000010000000010000
0001111110000000000011100101000100100001111000000
0000001000000000000101011000111100000110001000000
0000001001100000001011001110000000000100011000000
0010001011000000100000110010000000000111100000000
0001001000000000000000101010000000000000000000000
0000010100000000000000100110000000000001111000000
0000100010000000000000101111110000001100000000000
0001000001000000000000110000010000000100001000000
1110000000110000000000001110010000000111011000000
0000000000011100000111110000010000000100000000000
0000000000000000000000000000100000000000000000000
0000000000000001000000000000000000000000000001000
]]}

task1["��ɽ"] = {n=2, text=[[
000000000000000001100000100000101
000000010000000000000000000000000
000010011100000000000000100000000
000000100100011000000000100000000
001000001000100000000000100000000
000010011110000000000000100000000
100010101010011000000000100000000
000100101111110000000000100001000
001000011000010000010000100001000
010100001110010000010000100001000
100101111000010000010000100001000
000100010100010000010000111011000
000100000010010000010111000001000
000101000000000000011000000001000
000000000000010000000000000000000
000000000000000000000000000000000
000000000000000000000000000000000
]]}

task1["��Ĺ"] = {n=2, text=[[
000000000000000000000100001000000
000000001000000000000010111111000
000000001000000000011111010000000
000000001000000000000000111000000
000000001000000000000111001000000
000000001000000000000100101000000
000000001111111000000111110000000
001111110000000000000010000000000
000000010000000000000011111110000
000000001111000000011110010000000
000001110001000000000101001000000
000001000001000000001001110110000
000001000111000000010111000011110
000001111000000001100001111100000
000000000000000000001111000000000
000000000000000000000000000000000
000000000000000000000000000000000
]]}

task1["���Ʒ�"] = {n=3, text=[[
000000100000000000000000010010000000000000010000000
000000000010000000000010010100000010000000111100000
000010000010000000000001011111100000010001000100000
000010000010000000010011100000100000010010101000000
000100100010000000011100111001000000010000011000000
000110001011110000010001001000000000010100110110000
001000001110000000000001110000000011010111011001110
010001001010000000000000001100000011011101110000000
001110010011100000000011110000000001110000011100000
000011011110000000000000111000000001000001110000000
001110000011000001000000011111100000000000011110000
000010000100100000001111110000000000000111110000000
000010101000010000000000010000000000000000010000000
000011010000011000000000000000000000000000010000000
000010100000001100000000010000000000000000010000000
000000000000000000000000000000000000000000000000000
000000000000000000010000000000000000000000000000000
]]}

task1["����"] = {n=2, text=[[
00000000000000000000000000000000
00001000000000000000000000001000
00001000011100000000100010001000
00001001101000000000100010001000
00001100010000000000100010001000
01111000100000000010101011001000
00001101001111000010001010101000
00001001111001000010101010101000
00111000100000000100100010001000
11001001001001000000100010001000
00001010010010000001000010001000
00001000100010000001000010001000
00010001001010000010000000001000
00001010000100000100000000001000
00000000000000000000000000000000
00000000000000000000000000000000
00000000000000000000000000100000
]]}

task1["��ٹ�"] = {n=3, text=[[
000000000000000010000000000000000000000000000000000
000000000000000000000000000000000000000000011000000
000000000000000000000010000010000000000100000100000
000000000111111000000010000010000000001000000010000
001111111000000000000010000010000000010000100000000
000000001000000000000011100010000000000000100000000
000000000000000000001110000011110000000001010000000
000000011111000000000011101110010000000010001000000
000000010001000000011110000010010000000100000110000
000000100001000000000010000100010000001001111001110
000001000001000000000100100100010000110110001000000
000010000010000000001011101000000001000100001000000
000100010010000000001100010010100000000100111000000
001000001100000000000000100001000000000111000000000
000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000100000000000100
]]}

task1["÷ׯ"] = {n=2, text=[[
00000000010000000000000000000000
00010000010000000000000100000000
00010000100110000000000010000000
00010000111000000000000011110000
00011101000000000001111100000000
01110010101110000001000000000000
00011000100010000001000010000000
00010100101011100001000010000000
00110011111110000001000011110000
01010001000010000001011010000000
00010001010010000001000010000000
00010011111111000010000010000000
00010000000100000000000011111100
00010000010100000101111100000000
00000000001000001000000000000000
00000000000000000000000000000000
10000000010000000000000000000000
]]}

task1["��ɽ��"] = {n=3, text=[[
000001001000000000000000000000000000100000010000
000001001000000000000000000000000000100000000000
000010001011000000000001000000000000100000010000
000110001100000000000001000000000000100000010000
001010011000100000000001000000000000010000011110
010010101000100000000001000000000111100111110000
000010000111100000000001000000000000100000010000
000010010000000000000001000010000001100100010000
000000010111110000100001000010000010110010010000
011111110000000000100001000010000010101010010000
000000010000000000100001000010000100100000010000
000000010000000000100000110010001000100000010000
000000010000000000101110000010000000100000010000
000000010000000000110000000010000000100000110000
000000010000000000000000000000000000100000010000
000000000000000000000000000000000000000000000000
000000000000000100000000000000000000000000000000
]]}

task1["��ɽ"] = {n=2, text=[[
000000000000000000000000000000000
000000100100000000000000000000000
000000100100000000000000100000000
000001000101100000000000100000000
000011000110000000000000100000000
000101001100010000000000100000000
001001010100010000000000100000000
000000000001110000000000100001000
000001001000000000010000100001000
000000001111111000010000100001000
001111111000000000010000100001000
000000001000000000010000110111000
000000001000000000010111000001000
000000001000000000011000000001000
000000001000000000000000000000000
000000001000000000000000000000000
000000000000000000000000000000000
]]}

task1["����"] = {n=2, text=[[
000000000000000000000000001000000
000000000100000000000001000000000
000000100100000000000000100000000
000000100100000000000000011111100
000000100100000001111101100000000
000000100100100000000000000000000
000111000101100000000000111100000
000000100110000000000111000100000
000000100000000000000100001000000
000001100100001000000011110000000
000010100100001000000000100000000
001100100100001000001000100100000
000000100011110000001000100011000
000000000000000000010000100001000
000000000000000000000001100000000
000000000000000000000000100000000
000000000000000000000000000000000
]]}

task1["����"] = {n=2, text=[[
0000000001000000000000000000000000
0000000100000000000001110000000000
0000100111000000000010010000000000
0001001001000100010010100001111000
0010000010001000000010100010001000
0000100111100000000010010010001000
0000101010100111000011010010001000
0001001011111100000010110011101000
0011001110000100000010000010001000
0101000011100100000010000010001000
0001011110000000000010000011011000
0001000101000100000010000000001000
0001001000100100000010000000000000
0001010000001100000010000000000000
0000000000000100000000000000000000
0000000000000000000000000000000000
]]}

task1["����ׯ"] = {n=3, text=[[
00000000000000000000000000000000000000000000000100
00000100000000000000000000000000000000000000000000
00000100000000000000000011100000000000000100000000
00000100001110000000011100000000000000000010000000
00100101110010000000000000000000000000000011110000
00100100000010000000000011111100000001010100000000
00000100000010000011111100000000000001000010000000
00100101111010000000000100000000000001000010000000
00000100000100000000000100100000000001000010000000
00100100000100000000001000010000000001000011110000
00000000001110000000010001111000000001011110000000
00001001110000000000100110001000000001000010000000
00010000000000000000111000000000000010000010000000
00100000000000000000000000000000000010000011111100
01000000000000000000000000000000000101101100000000
00000000000000000000000000000000001000000000000000
00000000000010000000000000000000000000000000000000
]]}

task1["������"] = {n=3, text=[[
00000001000000000000000000000000000000000000000000
00000001000000000000000000011100000000000000000000
00000001000000000000010101100100000000000111111000
00000001000000000011100100100100000001111000001000
00000001000000000000100100110100000010000111001000
10000001111110000000100011100100010010111000001000
00011111000000000000110010011100000010001000001000
00000001000000000011100011100000000000001110001000
00000010100000000000100000111000000010111010001000
00000010010000000000111011100000000010001001001000
00000100001000000001100000100000010010001110101000
00001000000100000110000000111110000010110000001000
00010000000011000000011111000000000010000111101000
00100000000001110000000000000000000001111000101000
00000000000000000000000000000000000000000000010000
00000000000000000000000000000000000000000000000000
00000000100000000000000000000001010000000000000000
]]}

task1["������"] = {n=3, text=[[
000000000010000000100001100000000000000000000000000
000000100010000000000000000000000000000000001000000
000000100010000000000000011110000000000000001000000
000000101111110000000011100100000000001000010110000
000111100100000000000000001000000000001000111010000
000000011101000001000000010000000000001000100010000
000001000001010000000000010111110000001110100010000
100111001101100000011111011000000000101000100100000
000001010101001000000000001000000000001000100000000
000001011100111000000000001000000010001000101111000
001100000000000000000000001000000000001100110000100
000001000100100000000000001000000000011000001110100
000100100010010000000000001000000001100011110000100
001000000000001000000001001000000000000000000000100
000000000000000000000000010000000000000000000011000
000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000
]]}

task1["���ɽ"] = {n=3, text=[[
00000001000000000000000001000000000000000000000000
00000001110000000000000001000000000000000100000000
00001011000000000001000001001000000000000100000000
00000001110000000001000001000100000000000100000000
00000111000000000001000001000000000000000100000000
00000001011111000001000001111000000000000100000000
11110110000000000001110110100000000000000100001000
00000001111000000011000100100100000000000100001000
00000110001000001001000111010100000010000100001000
00000110101000000001010101010100000010000100001000
00000100001000000001101001001000000010000111111000
00000111101000000110001011010001000010111000001000
00000100001000001000010010100101000011000000001000
00000100001000000000100000000001000000000000000000
00000100011000000000000000000001000000000000000000
00000000000000000000000000000000000000000000000000
00000001010000000000000000000010010000000000000010
]]}

task1["Ѫ����"] = {n=3, text=[[
000000000000000001000000000000000000000000001000000
000000001000000001000000000000000000000000000000000
000000011000000000000000001111000000000000000000000
000000010000000000000111110001000000000100001111000
000000100000000000000000100001000000010010010001000
000001000011100000000000100001000000010000000001000
000011011100100000000001000001000000000000000001000
000010100100100000000000000001000010010000000001000
000010100100100000000010000001000000010000000001000
000010100100100000000100000010000000010000000001000
000010100101000000001000001010000000010000000001000
000010111111110100010000000100000000010000000001000
011111000000000000000000000000000000010000000001000
000000000000000000000000000000000000010000000101000
000000000000000000000000000000000000000000000000000
000000000000000000000000000000000010000000000000000
000001000000000000000000000000000000000000000000000
]]}

task1["��ɽ"] = {n=2, text=[[
0000000000000000000000000000000000
0000000010001000000000000000000000
0000010011110000000000000100000000
0000011100000000000000000100000000
0000000010000000010000000100000000
0000000111111100000000000100000000
0000111000000000000000000100000000
0000000111100000000000000100001000
0000001000000000000010000100000000
0000001111000000000010000100001000
0000000000111100010010000100001000
0000111111000100000010000011111000
0000101001000000000010111000001000
1000100111000100000011000000001000
0000100000010100000000000000000000
0000100000001000000000000000000000
0000000000000000010000000000000000
]]}

task1["�ɶ�"] = {n=2, text=[[
0000000000000000000000000000000010
0000000100000000000000010000000000
0000000100010000000000010000000000
0000000100001000000000011101001110
0000000010000000000001110000110010
0000000010110000000000010100000100
0000111100000000000000011111101000
0000100010001000000111100000101000
1000100000001000000000011000100100
0000111101010000000000100100100010
0000100100100000000001111100101000
0001000000100000000010100100100110
1001010101010001001100111100100000
0010001010001001000000000100100000
0100000000000101000000000000100000
0000000000000011000000000000100000
0000000000000000000000000000000000
]]}

task1["���޺�"] = {n=3, text=[[
000000010001000000000001000000000000100000000000
000000000111000000000000100000000000000100000000
000011111001000000000000111110000000000100000000
000010000001000000011111000010000010000101110000
000010111001000000010000000000000001001110000000
000001000110000000100100001111000000010000110000
000001111000000000000101010000000100001111010000
000000010000000000000000010000000010001010010000
000010010100000000011000111100000000000011111110
000111110000000000101001000100000001111110010000
001000011100000001001001111100000010001010010000
010001110000000000001001000100000010010000010000
000000010000000000000001111100000100011111111100
000000011111110000001000000100000100000000100000
011111110000000000000000000000000000000010100000
000000000000000000000000000000000000000001000000
000000000000000001000000000000000000000000000000
]]}

task1["��ľ��"] = {n=3, text=[[
00000100000000000000000000010000000000000000000001
00000000000000000000000000000000000000000000000000
00000001111010000000000100000000000000000010001000
00000110000010000000000100000000000000000000001000
10001001010010000000000100000000000000100011110000
00001011000100000000000111010000000000111100000000
00001001111100000001111100000000000000000011110000
00000111000000000000000110000000010000011110000000
00000001111000000000001101000000000000100011100000
00000110000000000000010100100000000000101110000000
00000001011100000000100100010000000000100011111000
00001100000000000001000100001100000001011110000000
00010000100010000000000100000111000001000011100000
00010100010001100100000100000000000010001110000000
00100010000000100000000100000000000100000011111100
00000000000000000000000100000000001000111100000000
00000000000000000000000000000000000000000000000000
]]}

task1["����"] = {n=2, text=[[
0000000000000000000000000000000000
0000000000100000000000000000000000
0000001000100000000000000000001000
0000001000111100000000100010001000
0001111111100000000000100010001000
0000001000100000000000000000001000
0000000010000000000010101011001000
0000000011110000000000101010101000
0000111110010000000000101010101000
0000000100010000010100100010001000
0001000100011100000000100010001000
0001001000010010000001000010001000
0010010000100000000001000010001000
0000100100100000000010000000001000
0001000011000000000100000000000000
0010000000000000000000000000000000
]]}

task1["������"] = {n=3, text=[[
000011000000001000000000000000000000000100000000
000000000000000000000010001000000000000100000000
000000011100000000000010000100000000000111100000
000111100000000000000010000000000000011100000000
000000100000000000000011111000000000000100000000
000000100000000000111100000000000000000101111100
000000111110000000000101000100000111111010000000
001111100000000000000101000100000000000010000000
000000100000000000001000001000000000001111110000
000001010000000000001001010000000000110010000000
000001001000000000010001100000100000010010000000
000010000100000000000011000000100000001010000000
000100000010000001000101000000100000000010000000
001000000001100010000000111111100000000100000000
110000000000111000000000000000000000000010000000
000000000000000000000000000000000000000000000000
000000000000000000000000000010000000000000100000
]]}

task1["��ɽ"] = {n=2, text=[[
000000000000100100000000000000000
000001000010000000000000100000000
000001001000000000000000100000000
000010001011110000000000100000000
000010011110010000000000100000000
000110001010010000000000100000000
001010001111100000000000100001000
010010111010000000010000100001000
000010101011110000010000100001000
000010111110001000010000100001000
000010001010000000010000111111000
100010001010101000010111000001000
000010010010010000011000000001000
000010100010000000000000000000000
000010000010000000000000000000000
000000000010000000000000000000000
000000000000000001000100000000000
]]}

task1["Ȫ��"] = {n=2, text=[[
00000001000000000000000000000000
00000010000000000000000000001000
00000111111000000000100010001000
00011000001000000000100010001000
00010111000000000000100010000000
00001000010000000010101011001000
00001111110000000010101010101000
00000010001000000010101010101000
00011011000000000100100010001000
01101010100000000000100010000000
00010010010000000001000010001000
00100010001100000000000010001000
01000010000111100010000000001000
10000110000000000100000000001000
00000010000000000000000000000000
00000000000000000000000000000000
10000000000101000000000000000001
]]}

task1["�Ͻ���"] = {n=3, text=[[
00000000001000000000000000000000010010000000000000
00000010001000000000001000010000000000000010000000
00000011101110000000001000010110000000000010000000
00001010001000100000000110110000000010000010010000
00001001101000100000111000011000000010000010001000
00001110100101100000011100110100000010000010000000
10111001001000000000101001010011100000000011110000
00000011110000000001000000000000000011101101000000
00000000101000000100000001110000000110001001001000
00000001011100000000000110000000000010000110101000
00000111100000000000000001111111000010101010101000
00000000101000000001111111000000000011010010010000
00000100100110000000000001001000001100010110101010
00001001000010000000001001000110000000100101001010
00000000100000000000010011000010000001000000000110
00000000000000000000000001000000000000000000000010
00000001000000000000000000000000000000000000000000
]]}

task1["����"] = {n=2, text=[[
0000000000000100000000000000000000
0000000100000000000001110000000000
0000000011111000000010010000000000
0000111100110000000010100001111000
0000011001010000000010100010001000
0000101000110000000010010010001000
0000111111000000000011000010000000
0000001001100000000010110011100000
0000011111000000000010000010001000
0000001001111000000010000010001000
0001111110000000000010000011111000
0000011010100000000010000000000000
1000101001000000000010000000000000
0001001010110000000010000000000000
0110001100001111000000000000000000
0000001000000000000000000000000000
0000000000000000000000100000000000
]]}

task1["����"] = {n=2, text=[[
000000000000000000000000000000000
000100110000000000001110000000000
001001001000110000010010000000000
010000010001000000010100001101000
000100111100000000010100010001000
000101010100111000010010010001000
001001011111000000011010000001000
011001110000100000000110011101000
101000011100100000010000010001000
001011110000100000010000010001000
001000101000100000010000001111000
001001000000100000010000000001000
001010000001000000010000000000000
000000000000100000010000000000000
000000000000000000000000000000000
000000000000000000000000000000000
000000000000000000000000100000000
]]}

task1["����"] = {n=2, text=[[
0000000000000000010000000000000000
0000100000000000000000000000001000
0000100000100000000000100010001000
0000100000010000000000100010001000
0000100000000000000000100000001000
0000111000111100000010101011001000
0011100111000000000010101010101000
0000100000000000000010101010101000
0000110001100000000100100010001000
0001101010010000000000100010001000
0010100010010000000001000010001000
0100000010010001000000000010000000
0000100010010001000010000000001000
0000100100001111000100000000001000
0000101000000000000000000000000000
0000000000000000000000000000000000
0000000000000000000000000000000000
]]}

task1["����"] = {n=2, text=[[
00000000000000000000000000000000
00010000001100000000000000000000
00001001100000000000000000001000
00000000011000000000100000001000
00011001100100000000100010001000
11101001001100000000100010001000
00001001010000000010100011001000
00010000001111000010101010100000
00110001110001000010101010101000
01010010011101000100100010001000
10000000110001000000100010001000
00010010010001000001000010001000
00000001101110000000000010001000
00010000000010000010000000001000
00000000000000000100000000001000
00000000000000000000000000000000
00000001100000000000000000000000
]]}

task1["�书"] = {n=2, text=[[
00000000100000000000000000000000
00000000001000000000000000100000
00000000100100000000000000100000
00000110100000000000000000100000
00011000111100000000111000100000
00000011100000000011000000011100
00111100100000000000100111000100
00000100100000000000100001000100
00010010010000000000111010000100
00000100010000000111000010001000
00000100001000000000000100001000
00010111001000100000001000001000
00011000000100100000010001000000
01100000000010100000100000100000
00000000000001100000000000000000
00000000000000000000000000000000
00000000000000000000000000000000
]]}

task1["̩ɽ"] = {n=2, text=[[
0000000100000000000000000000000000
0000000111100000010000000000000000
0000111100000000000000000000000000
0000000111100000000000000100000000
0000111000000000000000000100000000
0000001111111000000000000100000000
0001011001000000000000000100000000
0000010000100000000000000100001000
0000100100010000010010000100001000
0000100101001100000010000100001000
0010010110000111000010000100001000
0100001101000000000010000111111000
0000110100100000000010111000001000
0001001100010000000011000000001000
0000000100000000000000000000000000
0000000000000000000000000000000000
0000000000000000000000000000000000
]]}

task1["����ɽ"] = {n=3, text=[[
0000000000000000010000000000000000100000000000000
0000000001000000000000001000000000000000000000000
0000100001111000000000001000000000000000100000000
0000100001001000000000001111000000000000100000000
0001010001010000000001111000000000000000100000000
0010010100100000000000010000000000000000100000000
0111100001010000000000010011010000000000100000000
0001000010001000000011111100010000000000100001000
0010110100000111000100100100010000010000100001000
0011000001000000000100010010010000010000100001000
0000011000100000000101111000010000010000100001000
0001100000000000000100001110010000010000111110000
0110000001000000000101111000010000010111000001000
1000000000110000000100001001010000011000000001000
0000000000010000000000000000110000000000000000000
0000000000000000000000000000000000000000000000000
0000010100000001000000000000000000000000000000000
]]}

task1["����ɽ"] = {n=3, text=[[
000100000000000000000000000000000000000000000000
000000000000000000000000000000000000000100000000
000000110000000000000000010000000000000100000000
000000100000000000010100001000000000000100000000
000001000000000000000100001101000000000100000000
000010001111000000100101110001000000000100000000
001111110001000000101001000010000000000100001000
001000000001000000101000000000000010000100001000
001000000001000000101110100010000010000100001000
000111111001000000110010101100000010000100001000
000100000001000000000010110000000010000111111000
000000000001000000011010000001000000111000001000
000110111101000011000010100001000011000000001000
000100000010000000010100000001000000000000000000
000000000010000000001000001110000000000000000000
000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000001000
]]}

task1["����"] = {n=2, text=[[
000000010000000000000000000000000
000000011110000000000000000000000
000011110000000000000000000100000
000000011100000000010001000100000
000001100000000000001000100100000
000000110100000000000100101000000
000001000100000010000100001000000
000001111000000000000000011011100
000001001111111001011111100000000
011101110000000000000000010000000
000001000001100000000010000000000
001111001110100000000100000100000
000010101000100000001000000010000
000100100111000000110000000010000
011001100000000000000000000000000
000000000000000000000000000000000
000000000000000001000000100000000
]]}

task1["��ɽ"] = {n=2, text=[[
010000001000000000000000000000000
000000000000000000000000100000000
000010000000000000000000100000000
000010000000100000000000100000000
000010000110000000000000000000000
000011000000000000000000100000000
001010100111110000000000100001000
001010001000010000010000100001000
001010001111010000010000100001000
001010001000010000010000100001000
000010001111100000010000111111000
000010000000000000010111000001000
000010000011111000011000000001000
000010111100000000000000000000000
000010000000000000000000000000000
000000000000000000000000000000000
000000000000000000000000000100000
]]}

task1["����"] = {n=2, text=[[
000000000000000000000000000000000
000000001111000000000000000001000
000011110001000000000000010001000
000000000010000000000100010001000
000001111010000000000100010001000
000000000010000000010101001001000
000011111100000000010101010101000
000000010000000000010101010101000
000000010011000000100100010001000
000100010110000000000100010001000
000000010000000000001000010001000
000000101000000000001000010001000
000001000100000000010000000001000
000010000010000000100000000001000
001100000001100000000000000000000
000000000000111000000000000000000
000000000000000000000000001100000
]]}

task1["��ľ��"] = {n=3, text=[[
0000000000000000000000000000000000000000000000000
0000000000000000100000010000000000000000000000000
0000000111110000000000010000000000000000010001000
0001111000010000000000000000000000000100010001000
0001001010010000000000011111000000000100011110000
0001011000100000000111110000000000000111100000000
0001001111100000100000011000000000000000011110000
0000111000000000000000110100000000000111110000000
0000001101000000000001010010000000000100011100000
0000111000000000000010010001000000000100100000000
0000001111100000000100010000110000000000011111000
0001110000000000000000010000011100001011110000000
0010000100010000010000010000000000001000011100000
0010100010001100000000010000000000010001110000000
0100010000000100000000010000000000100000011111000
0000000000000000000000000000000001000111100000000
0000000000000000000000000000000000000000000000000
]]}

task1["������"] = {n=3, text=[[
0000000000000000000000000000000000000000000000000
0000000100000000000000000010000000000000100000000
0000000100000000000010000010000000000000100000000
0000000100011000000010000010000000000000111100000
0000100100000110000010000011100000000011100000000
0000100100000010000001001110000000000000100000000
0000100100010000000110000010000000000000111111100
0001000100010000000011000111000000111111010000000
0001000000100000000100101010100000000000010000000
0000000001000000000000010010010000000001111110000
0000000010000000001010100010001100001110010000000
1000000100000000010010000010000000000010010000000
0000001000000000000010000010000000000001010000000
0000110000000000000000000010000000000000010000000
0011000000000000000000000000000000000000110000000
0000000000000000000000000000000000000000010000000
0000000000000010000000000000000000000000000000000
]]}

task1["����"] = {n=3, text=[[
00000000000000000000000000000000000000000000000000
00000000100000000000000000000000000000000100000000
00000000100000000000000100000000010000001000000000
00000000100000000000000100000000000000011111000000
00100000100010000000000100010000000000100000000000
00000000100010000000000100010000000000101001000000
00010000100100000001000100000000000000100110000000
00001100101000000000100101000000000000100000000000
00000000110000000000100100000000000000100011111000
00010010101000000000001010000000000000111100001000
10010100100100000000001010000000000000010010001000
00100100100011110000010001000000000010010010001000
01001000100000000000100000100000000010011100001000
00010001100000000001000000011000000011100010001000
00000000100000000010000000001110000000000000101000
00000000000000000000000000000000010000000000010000
00000000000000000000000000000000000000000000000000
]]}

task1["������"] = {n=3, text=[[
00000000000010000000000000000000000000000000000000
00000000100000000000000000000110000000000000101000
00000000100000000000011100110010000000000110000000
10000000100100000101100100100010000001100001000000
00000100101100000001000100010010001111000011111000
00000010010000000001110100100010000001000100001000
00000000100000000001000100100010000001000101001000
00000001111110000001000100111010000001000101001000
00011110010000000000111100100010000001000101001000
00000010000000000001000100100010000001000101001000
00000010010000000000000001000010000011000001000000
00000100010000010000000001000010000001000010000000
00001000010000010000000010001010000000000100011000
00010000010000010000000100000110000000011000001000
00100000001111100000001000000000000000000000000000
00000000000000000000000000000000000000000000000000
00000000000000000000100100000000000000000000001000
]]}

task1["�߲��Թ�"] = {n=4, text=[[
00000010000000000000000000000000000000000000000000000000000001000
00000001000000000000000011010000001000000100000000000001000000000
00000001111110000000111100010000000100000000100000000000100000000
00101110000000000000100000010000000000100101000000000000001111000
00000011110000000000111110100000000000010100000000010111110001000
00000100010000000000100000100000001100000011100000010000000010000
00000111100000000000011111000000010100111100000000100001111000000
00000000011110000000000000000000000100001110000000000100001000000
00111111100000000000000111111000001000000101000000000100011000000
00000000000010000001101000001000000001100100100000000111100000000
00100111110010000001000011001000000100000000000000000000000000000
00100100010010000001111100001000111111100000000000000011111000000
00100111100010000001000000001000000000011111111000001100001000000
00100000001000000000111011010000000000000011100000000100001000000
00100000000100000000000000110000000000000000000000000111111000000
]]}

task1["������"] = {n=3, text=[[
0000000000000010000000000000000000000010000010000
0000000000000000000000000000000000000001000000000
0000000001000000000110000000000000000000100000000
0000011100000000001001000000000000000000001111000
0000000111011100001010000111100000011111110001000
0111111100000000001010001000100000010000000010000
0000000111100000001001000000100000100001111000000
0001111000100000001101001000100000000110001000000
0000001110100000001011001110100000000100011000000
0000100101100000001000001000100000000111100000000
0000111100000000001000001000100000000000000000000
0000000100000000001000001101100000000011111000000
0000011001000000001000000000000000001100001000000
0000000000000000001000000000000000000100001000000
0000001110111000001000000000000000000111111000000
0011100000000000000000000000000000000100000000000
0000000000000000000000000000000000000000000000000
]]}

task1["���͵�"] = {n=3, text=[[
000000001000000000000010000000000000000100000000
000010001000000000000001000000000000001000000000
000010001000000000000001111100000000011111000000
000100001111000000111110000100000000100001000000
000100111000000000000100001000000000101001000000
001100001001000001000011100000000000100110000000
010100101010000000001100100000000000100000000000
100100001111100000010011000000000000100011110000
000100111000000000000100100000000000111100001000
000100001000000000001000010000000000010010001000
000100010100000000010001110111100010010010001000
000100100000000011101110010000000010011110001000
000101000001100000000000010000000011100010001000
000110000000111000000111100000000000000000101000
000100000000000000000000000000000000000000010000
000000000000000000000000000000000000000000000000
100000000000000010001000010000000000000011000000
]]}

task1["�һ���"] = {n=3, text=[[
00010000000000001000000000000000000000000100000000
00010000001000000000000000100000000000001000000000
00010000001000000000011000100000000000010111000000
00010000100000000000001011111100000000100001000000
00010000101001000000111101000000000000101001000000
00011100101010000000001001000000000000100110000000
01110000101100000000000000000000000000100000000000
00011000101000000000010010001000000000100011111000
00110101101100000000010010010000010000111100001000
01010010101010000000100010100000000000010010000000
10010100101000000001100011000000000010010010001000
00010001001000100010101110000001000010001110001000
00010010001000000100100010000001000011100010001000
00010100000111000000100010000001000000000000101000
00010000000000000000100001110110000000000000010000
00000000000000000000100000000000000000000000000000
00000000000000000000000000000000001001000000000000
]]}

task1["������"] = {n=3, text=[[
000000000000000000000000000000000000000000010000000
000000000001000000000000100010000000000000100000000
000001000001000000000000100001000000000001000000000
000000000001000000000000100000000000000011111000000
000000000001111000000000111110000000000100001000000
000011101111001000001111000000000000000101001000000
000100101001101000000001010001000000000100110000000
000001001011001000000001010001000000000100000000000
000011001001001000000010010010000000000100011111000
000101101001110000000010010100000000000111100001000
001001000111000000000100011000001000000010010001000
010000000001000000001000110000001000010010010001000
000001000000000000010001010000001000010011110001000
000001000001000000100000001111110000011100010001000
000000000001000000000000000000000000000000000101000
000000000001000000000000000000000000000000000010000
000000000000000001000000000010000000000000000000000
]]}

task1["����ɽ"] = {n=3, text=[[
0000000010100000000000000000000010000000000000100
0001111100100000000000100000000000000000000000000
0000100000100000000000100000000010000000100000000
0000111110100000000000110000000000000000100000000
0000100001000000000001001000000010000000100000000
0000011110000000000010000100000000000000100000000
0000000010000000000100000011000000000000100000000
0001000000010000001000000000110000000000100001000
0001111010110000010010000100000000010000100001000
0001000011000000000010011100000000010000100001000
0000001000000100000011100000000000010000100001000
0000110010000100000010000001000000010000011101000
0011000010000100000010000001000000010111000001000
0000000000111100000001000001000000011000000001000
0000000000000000000000111110000000000000000000000
0000000000000000000000000000000000000000000000000
0000000000000000000100000000000000000000000000000
]]}

task1["�ƺӵ���"] = {n=4, text=[[
00000000010000000000000000000000000000001000000000000001000010000
00000100010000000001000000000000000000001000000000000000000000000
00000100011100000000100000001110001000001000000000000000011111000
00001111100000000000011111110000001000001000000000011011100000000
00000100100000000100000000010000001000001000000000001000000100000
00000111111111100010000110010000001000101011000000001000000100000
11111001000000000000011010010000001110101101000000001001000100000
00000111111000000000010010010000010000111001000000001000101000000
00001001001000000001001110000000001001101001000000001000010000000
00001011101000000001000000010000001000101011001000001000101000000
00001001011000000010000000010000001110101000001000001001000100000
00001111100000000010000000010000001000100000001000000010000010000
00000000010000000010000000110000110000010000001000001000000000000
00001000001000000000000000010000000000001111010000001011111110000
00110000000100000000000000000000000000000000000000001100000000000
]]}

return task1
