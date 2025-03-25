import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todo/Features/home/presentation/model/todo_model.dart';
import 'package:todo/Features/home/presentation/view/widgets/custom_text_field.dart';
import 'package:todo/Features/home/presentation/view/widgets/sticky_notes.dart';
import 'package:todo/Features/home/presentation/view_model/cubits/cubit/notes_cubit.dart';

class EditStickNotes extends StatefulWidget {
  const EditStickNotes({super.key, required this.note});

  final TodoModel note;

  @override
  State<EditStickNotes> createState() => _EditStickNotesState();
}

class _EditStickNotesState extends State<EditStickNotes> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            AppBarStickNotes(
              onTap: () {
                setState(() {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.description = subtitle ?? widget.note.description;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                });
                Get.back();
              },
              icon: Icon(FontAwesomeIcons.check),
              text: "Edit Note",
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20),
              child: CustomTextFormField(
                onChanged: (val) {
                  title = val;
                },
                hintText: "Title",
              ),
            ),
            CustomTextFormField(
              onChanged: (value) {
                subtitle = value;
              },
              contentPadding: EdgeInsets.only(bottom: 100, left: 10),
              hintText: "Discription",
            ),
          ],
        ),
      ),
    );
  }
}
