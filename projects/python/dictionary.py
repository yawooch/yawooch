#dictionary : 키와 값이 쌍을 이루는 함수
# people = {
    # "name" : "김개똥",
    # "phone" : "010-0000-0000"
# }

# print(people["name"], people["phone"])


# book = {
    # "Daniel pink" : "파는것이 인간이다",
    # "Eric Schmidt" : "새로운디지털시대"
# }
# 키의 타입은 달라도 되지만 중복되지 않아야한다
# books = {0: "One", False : "True" }
# 위 두 dictionary의 키의 값은 같다

# coffee = {
    # "Java" : 2500, "Americano" : 2500, "Latte" : 2500
# }
# coffee["Americano"] = 1000
# print(coffee)
# coffee["Mocha"] = 3000
# print(coffee)

#값을 가져올때 사용
# print(coffee.get("Latte"))

# 사용 함수
# print(coffee.keys())
# print(coffee.values())
# print(coffee.items())
# in 절 사용
# print("Americano" in coffee)