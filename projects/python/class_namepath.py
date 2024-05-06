# 네임스페이스

# class BreadMold:
        # category = "빵"

# bread1 = BreadMold()
# bread2 = BreadMold()
# bread3 = BreadMold()

# bread2.category = "붕어빵"
# bread3.category = "잉어빵"

# print(bread1.category, bread2.category, bread3.category)

# 네임스페이스
# BreadMold Class 이름공간

# dir() 이름 공간에 있는 모든 속성을 리스트로 반환

# print(dir(bread1))
# print(dir(bread2))
# print(dir(bread3))

# print(dir(str))

# =========================================================
# __init__ 생성자 메서드
# class BreadMold:
    # category = "빵"

    # def __init__(self, category, price):
        # self.category = category
        # self.price = price
        # print("빵을 만들었습니다.")


# bread1 = BreadMold("잉어빵", 3000)
# bread2 = BreadMold("붕어빵", 2000)
# bread3 = BreadMold("빵", 4500)

# print("{}의 가격은 {}원 입니다.".format(bread1.category, bread1.price))
# print("{}의 가격은 {}원 입니다.".format(bread2.category, bread2.price))
# print("{}의 가격은 {}원 입니다.".format(bread3.category, bread3.price))


# =========================================================
# __del__ 소멸자 메서드
# __str__ # java의 Object.toString 과 같은 역할 
# class BreadMold:
    # category = "빵"

    # def __init__(self, category, price):
        # self.category = category
        # self.price = price
        # print("빵을 만들었습니다.")
    # def __str__ (self):
        # return "{}의 가격은 {}원 입니다.".format(bread1.category, bread1.price)

    # def __del__(self):
        # print("빵이 없어졌습니다.")
       
# bread1 = BreadMold("잉어빵", 3000)#이 객체가 사라질때 소멸자가 실행된다
# bread1 = BreadMold("빵"    , 2500)

#아래에서도 소멸자가 실행된다
##print("{}의 가격은 {}원 입니다.".format(bread1.category, bread1.price))
# print(bread1)# java의 Object.toString 과 같은 역할 


## =========================================================
## 상속
## super, 부모
## sub  , 자식

# class ParentRestourant:
    # price = 15000
    # def __init__(self, name, menu, recipe):
        # self.name   = name
        # self.menu   = menu
        # self.recipe = recipe
    # def __str__(self):
        # return "가게이름 : {}, 가게의 메뉴 : {}, 레시피 : {}".format(self.name, self.menu, self.recipe)
    
    # def __del__(self):
        # pass
    
# class ChildRestourant(ParentRestourant):
    # price = 20000
    ## marketing = "온라인마케팅" #자식의 클래스에서 생성된 변수는 상속되지 않는다.
    # def __init__(self, name, menu, recipe,marketing):
        # ParentRestourant.__init__(self, name, menu, recipe)
        # self.marketing = marketing
    
    # def __str__(self):
        # return super().__str__() + "마케팅 : {}".format(self.marketing)


# retourant_info = ChildRestourant("자식의가게", "붕어빵", "붕어빵을 굽는다", "온라인")
# print(retourant_info)

#issubclass()#하위 클래스인지 확인하는 메소드
# print(issubclass(ChildRestourant, ParentRestourant))#True
# print(issubclass(ParentRestourant, ChildRestourant))#False

