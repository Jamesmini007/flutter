import 'package:flutter/material.dart';

class TitleCheckbox extends StatefulWidget {
  const TitleCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    required this.title,
    this.isRequired = false,
    this.onDetailPressed,
    this.isTitleBold = false,
  });

  final bool value;
  final Function()? onChanged;
  final String title;
  final bool? isRequired;
  final Function()? onDetailPressed;
  final bool? isTitleBold;

  @override
  State<TitleCheckbox> createState() => _TitleCheckboxState();
}

class _TitleCheckboxState extends State<TitleCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: widget.onChanged,
              highlightColor: Colors.transparent,
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: Icon(
                Icons.check_circle,
                color: widget.value! ? Color(0xff0FBFA0) : Color(0xffE8E8E8),
              ),
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: (widget.isTitleBold == true)
                    ? FontWeight.bold
                    : FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            if (widget.isRequired ?? false)
              Text(
                "(필수)",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffF95814),
                ),
              ),
          ],
        ),
        if (widget.onDetailPressed != null)
          TextButton(
            onPressed: widget.onDetailPressed,
            child: Text(
              "상세보기",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff5F5F5F),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
