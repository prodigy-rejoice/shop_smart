import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({Key? key, this.icon, this.onPress})
      : super(key: key);

  final IconData? icon;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      onPressed: onPress,
      shape: const CircleBorder(),
      fillColor: const Color(0xffFAE6E7),
      constraints: const BoxConstraints.tightFor(width: 50, height: 45),
      elevation: 0.0,
      child: Icon(icon, size: 18),
    );
  }
}
