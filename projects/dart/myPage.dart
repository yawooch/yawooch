import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String imageUrl =
      'https://th.bing.com/th/id/OIG.1YaYzgJaMTIv5M83boUi?w=1024&h=1024&rs=1&pid=ImgDetMain';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue,), //기본적인 테마 설정
      debugShowCheckedModeBanner: false, //배너설정 false
      home: Scaffold(
        //기본 위젯
        appBar: AppBar(
          //앱 상단에 표시되는 바
          backgroundColor: Colors.black,
          title: Text(
            '최고가 되기보단 최선을 다하는 개발자가 되겠습니다.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(
                16,
              ),
              child: Column(
                children: [
                  SizedBox(height: 30), //이미지와 appBar 간 빈 여백
                  //child: MyWidget(), //화면 , 텍스트, 입력필드 등을 다 위젯이라고 한다.
                  //프로필 이미지
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  SizedBox(height: 8), //이미지와 텍스트간 빈 여백
                  //닉네임 텍스트
                  Text(
                    'Yawooch',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30), //이미지와 텍스트필드간 빈 여백
                  //텍스트 필드
                  TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: '이메일 주소',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), //텍스트필드간 빈 여백
                  //텍스트 필드
                  TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: '거주지',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), //텍스트필드간 빈 여백
                  //텍스트 필드
                  TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: '나이',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), //빈여백
                  //주요 기술 및 희망 직무
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '주요 기술 및 희망 직무',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8), //빈여백
                        //chip형태의 기술 이름들
                        Wrap(
                          runSpacing: 8,
                          spacing: 8,
                          children: getSkills(),
                        )
                      ],
                    ),
                  ),

                  //죟은 회사 취업하기 버튼

                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: Text(
                        '좋은 회사 취업하기',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        // 버튼 클릭 시 하고싶은 액션 구현
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('취업이 완료 되었습니다'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ), //home 화면 지정
    );
  }

  List<Widget> getSkills() {
    //주요기술 및 희망 직무를 android chip 위젯형태로 리턴
    List<Widget> lstWidgets = [];
    lstWidgets.add(
      Chip(
        label: Text('안드로이드'),
      ),
    );
    lstWidgets.add(
      Chip(
        label: Text('Flutter'),
      ),
    );
    lstWidgets.add(
      Chip(
        label: Text('DartPad'),
      ),
    );
    lstWidgets.add(
      Chip(
        label: Text('JAVA'),
      ),
    );
    lstWidgets.add(
      Chip(
        label: Text('JavaScript'),
      ),
    );
    return lstWidgets;
  }
}
