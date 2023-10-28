import 'package:flutter/cupertino.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.textEditingController,
    this.onChanged,
    this.hintText,
  });

  final TextEditingController textEditingController;
  final String? hintText;
  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onChanged: onChanged,
      controller: textEditingController,
      placeholder: hintText,
      decoration: const BoxDecoration(border: null),
    );
  }
}
