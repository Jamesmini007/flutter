import 'package:book_lnr_desc_v2/screen/main_screen.dart';
import 'package:book_lnr_desc_v2/widget/Button.dart';
import 'package:book_lnr_desc_v2/widget/TitleTextField.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginSheet extends StatefulWidget {
  const LoginSheet({super.key});

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isButtonEnabled = false;

  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    emailController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled =
          (emailController.text.length + passwordController.text.length) > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Wrap(
        children: [
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Text(
                    "로그인",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: TitleTextField(
              textEditingController: emailController,
              hintText: "이메일을 입력해주세요",
              title: "이메일",
              isRequire: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: TitleTextField(
              textEditingController: passwordController,
              hintText: "비밀번호를 입력해주세요",
              title: "비밀번호",
              isRequire: true,
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Button(
              isButtonEnabled: isButtonEnabled,
              text: "로그인",
              onPressed: () async {
                try {
                  final res = await supabase.auth.signInWithPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if(res.user != null) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('로그인을 성공하였습니다'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                          (route) => false,
                    );
                  }
                } catch(error) {
                  // 로그인 실패 했을 때,
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('로그인을 실패하였습니다'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }

              },
            ),
          )
        ],
      ),
    );
  }
}
