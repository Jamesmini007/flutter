import 'package:book_lnr_desc_v2/screen/agreement_screen.dart';
import 'package:book_lnr_desc_v2/screen/login_screen.dart';
import 'package:book_lnr_desc_v2/screen/personal_information_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://xyzcompany.supabase.co', // 필자에 맞는 url을 넣어야합니다.
    anonKey: 'public-anon-key', // 필자에 맞는 anonKey를 넣어야합니다.
  );

  runApp(const MyApp());

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
