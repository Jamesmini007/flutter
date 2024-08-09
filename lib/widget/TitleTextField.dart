import 'package:flutter/material.dart';

class TitleTextField extends StatefulWidget {
  const TitleTextField({
  super.key,
  required this.hintText,
  required this.title,
  this.isRequire = false,
  this.textEditingController,  // 파라미터에 컨트롤러를 추가한다.
});

final String hintText;
final String title;
final bool? isRequire;
final TextEditingController? textEditingController; // 파라미터에 컨트롤러를 추가한다.

@override
State<TitleTextField> createState() => _TitleTextFieldState();
}

class _TitleTextFieldState extends State<TitleTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            if(widget.isRequire ?? false)
              Text(
                '(필수)',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffF95814),
                ),
              )
          ],
        ),
        SizedBox(
          height: 12,
        ),
        TextField(
          controller: widget.textEditingController, // 컨트롤러를 적용한 모습
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Color(0xffD1D1D1)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 1.0,
                color: Color(0xffD1D1D1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
