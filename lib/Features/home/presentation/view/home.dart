import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/Features/home/presentation/view/widgets/bottom_sheet_body.dart';
import 'package:todo/Features/home/presentation/view/widgets/home_body.dart';

class HomeToDo extends StatefulWidget {
  const HomeToDo({super.key});

  @override
  State<HomeToDo> createState() => _HomeToDoState();
}

class _HomeToDoState extends State<HomeToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => BottomSheetBody(),
          );
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.black.withOpacity(.5),
        child: Icon(FontAwesomeIcons.plus),
      ),

      body: const HomeToDoBody(),
    );
  }
}
