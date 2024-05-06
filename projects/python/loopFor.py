#for문
#for 변수 in 나열가능한 자료 :
#    실행할 문자
# for i in range(1,10+1):
    # print(i)

# for i in "일이삼사오":
    # print(i)

# fruits = ["사과","딸기", "바나나"]
# for i in fruits:
    # print("과일 바구니에 {}가들어있습니다.".format(i))

# ===========================================================
#1부터 30까지의 수 중에서 3의 배수들의 합을구하시오
# sum = 0
# for i in range(1, 30+1):
    # if i %3 ==0 :
        # print("{} + {} =".format(sum,i),end = "")
        # sum += i
# print(sum)

#step 사용
# sum = 0
# for i in range(3, 30+1, 3):
    # print("{} + {} =".format(sum,i),end = "")
    # sum += i
# print(sum)

# ===========================================================
# dictionary
# coffee = {"아메리카노" :2500, "라떼" : 3000, "자바" : 2500}

# for i in coffee.values() :
    # print(i)
# ===========================================================
# fruits = ["사과", "바나나", "딸기"]

# for i in enumerate(fruits):
    # print(f"{i[0]+1}번째 과일은 {i[1]}입니다.")
# ===========================================================
# 2차원 list 중첩 for문
# list_2nd = [[1,2,3],["a","b","c"]]

#print(list_2nd[0][0])
# for list_1nd in list_2nd :
    # for j in list_1nd :
        # print(j)
# ===========================================================
# 구구단
# print("2단부터 9단까지구구단 출력")

# for i in range(2,9+1) :
    # for j in range(1, 9+1) :
        # print(f"{i} X {j} = {j*i}", end = "\t")
    # print()

# ===========================================================
list_3nd = [[[1,2,3],[4,5,6]],[[11,12,13],[14,15,16]]]

for list_2nd in list_3nd :
    for list_1nd in list_2nd :
        for list in list_1nd :
            print(list)

