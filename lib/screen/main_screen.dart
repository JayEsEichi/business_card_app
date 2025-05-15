import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController introduceController = TextEditingController();
  bool isEditMode = false; // 자기 소개 수정 모드 확인용 bool

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIntroduceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱 바 영역
      appBar: AppBar(
        leading: Image.asset("assets/developer.png", width: 20, height: 20),
        backgroundColor: Colors.white,
        elevation: 10,
        // actions: [Image.asset("assets/developer.png", width: 110, height: 80)],
        title: Text(
          "성장하는 개발자 진세훈입니다.",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 프로필 이미지 영역
            Container(
              width: double.infinity,
              height: 400,
              margin: EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/selfie.jpg", fit: BoxFit.cover),
              ),
            ),
            Column(
              children: [
                // 이름 영역
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 5,
                    right: 10,
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "이름",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(flex: 2, child: Text("진세훈")),
                    ],
                  ),
                ),
                // 나이 영역
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 5,
                    right: 10,
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "나이",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(flex: 2, child: Text("29")),
                    ],
                  ),
                ),
                // 취미 영역
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 5,
                    right: 10,
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "취미",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(flex: 2, child: Text("운동")),
                    ],
                  ),
                ),
                // 직업 영역
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 5,
                    right: 10,
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "직업",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(flex: 2, child: Text("개발자")),
                    ],
                  ),
                ),
                // 학력 영역
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 5,
                    right: 10,
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "학력",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(flex: 2, child: Text("인하공업전문대학교 졸업")),
                    ],
                  ),
                ),
                // MBTI 영역
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 5,
                    right: 10,
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "MBTI",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(flex: 2, child: Text("ISFJ")),
                    ],
                  ),
                ),
                // 자기 소개 글 영역
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              top: 0,
                              right: 0,
                              bottom: 0,
                            ),
                            child: Text(
                              "자기 소개",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(
                                left: 0,
                                top: 0,
                                right: 20,
                                bottom: 0,
                              ),
                              child: Icon(
                                Icons.add_circle_outline,
                                size: 24,
                                color:
                                    isEditMode
                                        ? Colors.blueAccent
                                        : Colors.black,
                              ),
                            ),
                            onTap: () async {
                              print("자기 소개 수정 버튼 클릭");
                              if (isEditMode == false) {
                                setState(() {
                                  isEditMode = true;
                                });
                              } else {
                                if (introduceController.text.isEmpty) {
                                  // snackbar 메시지로 사용자에게 경고 알림
                                  var snackBar = SnackBar(
                                    content: Text("자기소개 내용이 존재하지 않습니다."),
                                    duration: Duration(seconds: 2),
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  return;
                                }

                                var sharedPref =
                                    await SharedPreferences.getInstance();
                                sharedPref.setString(
                                  "selfIntroduce",
                                  introduceController.text,
                                );

                                setState(() {
                                  isEditMode = false;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: TextField(
                          maxLines: 4,
                          controller: introduceController,
                          enabled: isEditMode,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffd9d9d9)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getIntroduceData() async{
    var sharedPref = await SharedPreferences.getInstance();
    String introduceData = sharedPref.getString("selfIntroduce").toString();
    introduceController.text = introduceData ?? "";
  }
}
