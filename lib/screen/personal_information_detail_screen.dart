import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonalInformationDetailScreen extends StatefulWidget {
  const PersonalInformationDetailScreen({super.key});

  @override
  State<PersonalInformationDetailScreen> createState() =>
      _PersonalInformationDetailScreenState();
}

class _PersonalInformationDetailScreenState
    extends State<PersonalInformationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "개인정보 처리방침",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "약관 조항 명",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "불어 웅대한 청춘을 있으랴? 그들의 불어 열락의 끝까지 수 인간의 튼튼하며, 끓는다.",
            ),
          ],
        ),
      ),
    );
  }
}
