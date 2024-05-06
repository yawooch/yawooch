#list []안에
#list_a = [1,2,3,4]
#list_b = ["a", "b","c" ]
#list_c = [True, False]
#list_d = [1, "a", True]
#print(list_a)
#print(list_b)
#print(list_c)
#print(list_d)

#numbers = [0,1,2,3,4,5,6,7]
#print(numbers[0])
#print(numbers[3:5])


list_lan = ["JAVA", "C", "Python", "Go"]
# print(list_lan[2][2:4])

# list_lan[1] = "C++"
# print(list_lan)
# list_lan[1:3] = ["C#", "Python2","Python3"]
# print(list_lan)

list_lang = ["JAVA", "C", "Python", "Go"]
# print((len(list_lang)) 


#append()리스트매뒹 제일 마지막 인덱스 
# list_lang.append("Ruby")
# print(list_lang) 

# list_a =  [1,2,3]

#extend() 요소를 추가하는 방법
# list_lang.append(list_a)
# list_lang.extend("Java Script")
# print(list_lang)

# insert(index, data)
# list_lang.insert(0, "R")
# print(list_lang)

# pop()
# print(list_lang.pop(0))
# print(list_lang)

# remove()
# list_lang.remove("Python")
# print(list_lang)

# del
# del list_lang[1]
# print(list_lang)

# sort()
# numbers = [1000, 50, 160, 100, 20, 3450]
# numbers.sort()
# numbers.sort(reverse = True)
# print(numbers)

#reverse() - 리스트안의 요소를 역순으로 변경해주는 함수
# numbers.reverse()
# print(numbers)

# names = ["홍길동", "김개똥", "이승철"]
# names = ["banana", "apple", "carrot"]
# print(names)
# names.sort()
# print(names)
# names.sort(reverse = True)
# print(names)

compare_text1 = "apple"
compare_text2 = "banana"
print(compare_text1 > compare_text2)

# ord("A") -  문자를 아스키 10진수로
# chr(65) - 10진수를 문자로

#in 연산자와 not in 연산자와
numbers = [1,200,3,50,5,66,7,55,9]
 
print(50 in numbers) # => True
print("C" in list_lang) # => True
print("Java script" not in list_lang) # => True


# 인덱스

# 2차원리스트

td_number = [[10,20,30,],[1,2,3]]
print(td_number[1])