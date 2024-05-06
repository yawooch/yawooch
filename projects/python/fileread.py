file    = open('D:/sample02.txt', 'r',encoding='UTF8')
out_file = open('D:/myfile2.txt', 'w',encoding='UTF8')

while True :
    line = file.readline()
    if not line:
        break
    else:
        adult = "미성년"
        info = line.strip().split(',')
        if int(info[1]) >= 19:
            adult = "성인"
            out_file.write(info[0]+'/'+info[1]+'/'+adult+'\n')
        else :
            out_file.write(info[0]+'/'+info[1]+'/'+adult+'\n')


file.close()
out_file.close()

