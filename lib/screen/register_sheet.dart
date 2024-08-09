import 'package:book_lnr_desc_v2/widget/Button.dart';
import 'package:book_lnr_desc_v2/widget/TitleTextField.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'agreement_screen.dart';

class RegisterSheet extends StatefulWidget {
  const RegisterSheet({super.key});

  @override
  State<RegisterSheet> createState() => _RegisterSheetState();
}

class _RegisterSheetState extends State<RegisterSheet> {
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
      isButtonEnabled = (emailController.text.length + passwordController.text.length) > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Wrap(
        children: [
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Text(
                    "회원가입",
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
              text: "회원가입",
              isButtonEnabled: isButtonEnabled,
              onPressed: () async {
                final result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AgreementScreen()));

                // 약관동의에서 뒤로가기를 누르면 및 예외상황,
                if (result == null) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('회원가입을 실패하였습니다'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
                try {
                  final res = await supabase.auth.signUp(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  if(res.user != null) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('회원가입을 성공하였습니다'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                } catch(error) {
                  // 회원가입에 실패했을 때,
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('회원가입을 실패하였습니다'),
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
