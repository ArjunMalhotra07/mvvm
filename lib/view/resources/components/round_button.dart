import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressFunc;
  final bool loading;
  final double? heightOfButton;
  final double? widthOfButton;
  const RoundButton(
      {required this.loading,
      required this.onPressFunc,
      required this.name,
      this.heightOfButton,
      this.widthOfButton,
      super.key});

  @override
  Widget build(BuildContext context) {
    return !loading
        ? InkWell(
            onTap: !loading ? onPressFunc : null,
            child: Container(
              height: heightOfButton ?? 50,
              width: widthOfButton ?? 100,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: Center(child: Text(name)),
            ))
        : const CircularProgressIndicator();
  }
}
