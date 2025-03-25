import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo/Features/home/presentation/model/todo_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  final Box<TodoModel> noteSticky = Hive.box<TodoModel>('todo');
  List<TodoModel> notes = [];
  fetchNotes() {
    notes = noteSticky.values.toList();
    emit(NotesSuccess(notes));
  }
}
