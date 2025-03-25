import 'package:flutter/material.dart';
import 'package:todo/Features/home/presentation/view/widgets/search_container.dart';

class AppBarStickNotes extends StatelessWidget {
  const AppBarStickNotes({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final Widget icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 28,
            fontFamily: "Jetbrains Mono",
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        SearchContainer(onTap: onTap, icon: icon),
      ],
    );
  }
}
