import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.onPressed,
    this.isButtonEnabled = true,
  });

  final String text;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final bool? isButtonEnabled; // 버튼의 상태

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.maxFinite,
      height: height ?? 48,
      child: OutlinedButton(
        onPressed: isButtonEnabled! ? onPressed : null, // 버튼을 활성화 할건지 비활성화 할건지
        style: OutlinedButton.styleFrom(
          disabledBackgroundColor: const Color(0xffE8E8E8), // 비활성화 경우 버튼 색상
          backgroundColor: const Color(0xff0FBFA0),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
