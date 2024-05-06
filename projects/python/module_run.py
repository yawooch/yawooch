## module 사용 실행 예제
#import module_calculator as c
## 필요한 함수만 필요할 경우
# from module_calculator import add as a


#module_calculator.add(10, 20)
#module_calculator.sub(10, 20)
#module_calculator.times(10, 20)
#module_calculator.dev(10, 20)

## 별칭 주기
## as c 를 붙이고 난 후
#c.add(10, 20)
#c.sub(10, 20)
#c.times(10, 20)
#c.dev(10, 20)

## 필요함수만 가져오기
## 필요한 함수만 필요할 경우
#from module_calculator import add as a
#a(10,20)
#from module_calculator import add, sub
#add(10,20)
#sub(10,20)

## 날짜와 시간을 가져오는 모듈
#from datetime import date
#today = date.today()
#print(today)
#new_date = date(1999, 12, 31)
#print(new_date)
# from datetime import time
# print(time(9))
# print(time(9, 2))
# print(time(9, 2, 2))
# print(time(9, 2, 2, 22222))


# from datetime import datetime
# dt = datetime.now()
# print(dt)
# dt = datetime(2020,10,20,14,5,2)
# print(dt)
# from datetime import datetime, timedelta
# today = datetime.now()
# print(today)
# print(today - timedelta(days = 20))

# import time
# now = time.time()
# print(now)
# from time import localtime
# now = localtime()
# print(now)
# from time import strftime
# now = strftime("%Y년%m월%d일 %H시%M분")
# print(now)


# Python에서 Django를 설치하는 방법(CMD화면)
# PS C:\python> pip install Django==2.0
# Collecting Django==2.0
  # Downloading https://files.pythonhosted.org/packages/44/98/35b935a98a17e9a188efc2d53fc51ae0c8bf498a77bc224f9321ae5d111c/Django-2.0-py3-none-any.whl (7.1MB)        
# Collecting pytz (from Django==2.0)
  # Downloading https://files.pythonhosted.org/packages/32/4d/aaf7eff5deb402fd9a24a1449a8119f00d74ae9c2efa79f8ef9994261fc2/pytz-2023.3.post1-py2.py3-none-any.whl (502kB)
     # |████████████████████████████████| 512kB 6.8MB/s
# Installing collected packages: pytz, Django
# Successfully installed Django-2.0 pytz-2023.3.post1
# WARNING: You are using pip version 19.2.3, however version 23.3.1 is available.   
# You should consider upgrading via the 'python -m pip install --upgrade pip' command.
# PS C:\python> pip uninstall Django==2.0
# Uninstalling Django-2.0:
  # Would remove:
    # c:\python38\lib\site-packages\django-2.0.dist-info\*
    # c:\python38\lib\site-packages\django\*
    # c:\python38\scripts\django-admin.exe
    # c:\python38\scripts\django-admin.py
# Proceed (y/n)? y