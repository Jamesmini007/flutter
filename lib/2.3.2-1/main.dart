import 'package:book_lnr_desc_v2/widget/TitleCheckBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 체크 박스 변수
  var checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TitleCheckbox(
          title: "이용약관",
          value: checkBoxValue,
          onChanged: () {
            setState(() {
              checkBoxValue = !checkBoxValue;
            });
          },
          isRequired: true,
          onDetailPressed: () {},
        ),
      ),
    );
  }
}




