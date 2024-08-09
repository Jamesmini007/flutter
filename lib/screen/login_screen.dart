import 'package:book_lnr_desc_v2/screen/register_sheet.dart';
import 'package:book_lnr_desc_v2/widget/Button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Transform.translate(
                  offset: Offset(0, 130),
                  child: Image.asset('assets/background.png')),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 106,
                  child: Image.asset("assets/logo.png"),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '반려동물 건강관리부터 정보공유까지,',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '지금 바로 가입해보세요!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Button(text: "로그인"),
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => RegisterSheet(),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(7.0),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    "아직 회원이 아닌가요?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
