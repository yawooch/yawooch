# break & continue
# i = 0
# while True :
    # print("{}번째 반복입니다. ".format(i))
    # i += 1
    # if i > 10 :
        # break

# sum = 0
# while True :
    # num = int(input("정수를 입력해 주세요"))
    # if num == 0 :
        # break
    # sum += num
    # print("현재 정수의 합은 {}입니다".format(sum))
# else :
    # print("반복문이 종료되었습니다.")

# continue
# numbers = [10,200,30,400,50]

# for i in numbers :
    # if i < 200 :
        # continue
    # print("{}은 200 이상의 숫자입니다.".format(i))


# break 는 가장 가까운 반복문 하나만 탈출한다.
# numbers = [[1,2,3],[10,20,30]]

# for i in numbers :
    # for j in i :
        # print(j)
        # break

#========================================== Quiz

# menu = {"아이스 아메리카노": 3000, "아메리카노" : 2500, "아이스라떼" : 4000, "라떼":3500, "아이스크림":8000}

# ice_menu = {}
# hot_menu = {}

# for i, j in menu.items():
    # if i[0:3] == "아이스" :
        # ice_menu[i] = j
    # else :
        # hot_menu[i] = j
# print("따뜻한 메뉴")
# for i, j in hot_menu.items() :
    # print("제품명 : {}, \t가격 : {}".format(i, j))
# print("차가운 메뉴")
# for i, j in ice_menu.items() :
    # print("제품명 : {}, \t가격 : {}".format(i, j))