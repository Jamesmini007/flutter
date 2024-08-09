import 'package:book_lnr_desc_v2/screen/login_screen.dart';
import 'package:book_lnr_desc_v2/widget/Button.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final supabase = Supabase.instance.client;


  // 로그인 정보가 없으면 Login화면으로 이동
  @override
  void initState() {
    super.initState();
    if (supabase.auth!.currentUser == null) {
      // 아래 함수는 위젯트리가 완전하게 빌드가 완료되면 실행된다.
      // 빌드가 완료가 안되고 Navigator사용하면 실행되면 오류가 생긴다.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // PshAndRemoveUntill은 route 스택을 조작하는데 사용하는데, 지금 이 상황에는 모든 스택을 제거함.
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
        );
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // 사용자 정보가 없을 때는 빈화면 출력
    if(supabase.auth!.currentUser == null) return Scaffold();
    // 사용자 정보가 있을 때는 제대로 출력
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${supabase.auth.currentUser!.email}님 반갑습니다.",
                style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Button(
                text: "로그아웃",
                onPressed: () {
                  setState(() {
                    supabase.auth.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                          (route) => false,
                    );
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
