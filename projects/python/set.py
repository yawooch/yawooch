# 집합
week = {"월요일" , "화요일" , "수요일" , "목요일" , "금요일" , "토요일" , "일요일", "월요일"}
print(week)

week.add("화요일")
print(week)

#add 123, "문자" , True ("튜플")은 추가가능
#[1,2,3], {keys:value}

week.add(("일주일",))
print(week)
week.update(("일주일",))
print(week)
week.update(["일주일"],{"한달:123"})
print(week) #집합 안에 dictionary를 넣었을때는 key값만 들어간다.

set(["월요일" , "화요일" , "수요일" , "목요일" , "금요일" , "토요일" , "일요일", "금요일"])
print(week)

#Set
#set 순서대로 저장되지 않는다.
a = {1,2,3,4,5}
b = {3,4,5,6,7}
print(a | b)#합집합
print(a & b)#교집합
print(a - b)#차집합

a.remove(4)#지우고 싶은요소를 선택


