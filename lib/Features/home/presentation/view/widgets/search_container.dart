import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key, this.onTap, required this.icon});
  final void Function()? onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: icon,
      ),
    );
  }
}
