import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getx;
import 'package:todo/Features/home/presentation/model/todo_model.dart';
import 'package:todo/Features/home/presentation/view/widgets/edit_sticky_notes.dart';
import 'package:todo/constant.dart';
import 'package:todo/Features/home/presentation/view_model/cubits/cubit/notes_cubit.dart';

class StickCard extends StatelessWidget {
  const StickCard({super.key, required this.note});
  final TodoModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: GestureDetector(
        onTap: () {
          getx.Get.to(
            EditStickNotes(note: note),
            transition: getx.Transition.cupertino,
          );
        },
        child: Container(
          padding: EdgeInsets.only(top: 24, bottom: 24, left: 18),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey.shade900, blurRadius: 4)],
            color: Colors.black,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    note.title,
                    style: TextStyle(
                      color: AppTextStyle.textColor,
                      fontSize: 28,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    note.description,
                    style: TextStyle(
                      color: AppTextStyle.textColor.withOpacity(.5),
                      fontSize: 20,
                    ),
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchNotes();
                    },
                    icon: Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.red.shade300,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 26.0),
                child: Text(
                  "${note.date.day},${note.date.month},${note.date.year}",
                  style: TextStyle(
                    color: AppTextStyle.textColor.withOpacity(.7),
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
