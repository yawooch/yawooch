#클래스 객체

# class BreadMold:
    # category = "크림빵"

# bread = BreadMold()

# bread.price = 3000
# bread_choco = BreadMold()
# bread_choco.category = "초코크림빵"

# 참조연산자 ex) .format()
# print(bread.category)
# print("{} 의 가격은 {} 입니다.".format(bread.category, bread.price))
# print(bread_choco.category)

# =======================================================================


class BreadMold:
    category = "크림빵"
    def make_bread(self):#매개변수가 아무것도 없으면 오류가 발생한다(인자값이 객체로 들어가므로)
        print("빵을 만들어냅니다.")

bread = BreadMold()

bread.make_bread()
