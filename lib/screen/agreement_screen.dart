import 'package:book_lnr_desc_v2/screen/personal_information_detail_screen.dart';
import 'package:book_lnr_desc_v2/widget/Button.dart';
import 'package:book_lnr_desc_v2/widget/TitleCheckBox.dart';
import 'package:flutter/material.dart';

import 'condition_detail_screen.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  var conditionsCheck = false;
  var personalInformationCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '약관동의',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TitleCheckbox(
                    value: conditionsCheck,
                    title: "이용약관",
                    isRequired: true,
                    onChanged: () {
                      setState(() {
                        conditionsCheck = !conditionsCheck;
                      });
                    },
                    onDetailPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => ConditionDetailScreen())); // 화면 전환
                    },
                  ),
                  TitleCheckbox(
                    value: personalInformationCheck,
                    title: "개인정보 처리방침",
                    isRequired: true,
                    onChanged: () {
                      setState(() {
                        personalInformationCheck = !personalInformationCheck;
                      });
                    },
                    onDetailPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => PersonalInformationDetailScreen())); // 화면 전환
                    },
                  ),
                  Divider(),
                  TitleCheckbox(
                    value: conditionsCheck && personalInformationCheck,
                    title: "모두 동의합니다.",
                    isTitleBold: true,
                    onChanged: () {
                      setState(() {
                        conditionsCheck = true;
                        personalInformationCheck = true;

                      });
                    },
                  ),
                ],
              ),
            ),
            if (!conditionsCheck || !personalInformationCheck)
              SafeArea(
                minimum: EdgeInsets.symmetric(vertical: 16),
                child: Button(
                  text: "모두 동의하기",
                  onPressed: () {
                    setState(() {
                      conditionsCheck = true;
                      personalInformationCheck = true;
                    });
                  },
                ),
              )
            else
              SafeArea(
                minimum: EdgeInsets.symmetric(vertical: 16),
                child: Button(
                  text: "다음",
                  onPressed: () {
                    Navigator.pop(context, true); // 다음 버튼을 누르면 POP이 되고, true값을 반환한다.
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

