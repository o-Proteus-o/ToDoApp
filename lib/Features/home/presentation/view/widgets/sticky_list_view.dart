import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Features/home/presentation/model/todo_model.dart';
import 'package:todo/Features/home/presentation/view/widgets/stick_card.dart';
import 'package:todo/Features/home/presentation/view_model/cubits/cubit/notes_cubit.dart';

class StickyListView extends StatelessWidget {
  const StickyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<TodoModel> notes = BlocProvider.of<NotesCubit>(context).notes;
        notes = List.from(notes.reversed);
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) => StickCard(note: notes[index]),
        );
      },
    );
  }
}
