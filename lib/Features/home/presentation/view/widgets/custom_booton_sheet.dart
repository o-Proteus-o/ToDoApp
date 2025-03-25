import 'package:flutter/material.dart';

class CustomBottonSheet extends StatelessWidget {
  const CustomBottonSheet({super.key, this.onTap, required this.child});
  final void Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(24),
          ),
          child: child,
        ),
      ),
    );
  }
}
