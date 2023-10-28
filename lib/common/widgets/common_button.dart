import 'package:authorization/common/constants/global_app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 343,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(5),
        color: GlobalAppColor.buttonColor,
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
