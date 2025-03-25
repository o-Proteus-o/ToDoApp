import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:todo/Features/home/presentation/model/todo_model.dart';

part 'sticky_state.dart';

class StickyCubit extends Cubit<StickyState> {
  StickyCubit() : super(StickyInitial());
  final Box<TodoModel> noteSticky = Hive.box<TodoModel>('todo');
  addnote(TodoModel todo) async {
    emit(StickyLoading());
    try {
      noteSticky.add(todo);
      emit(StickySuccess());
    } catch (e) {
      emit(StickyFailed("errMessage $e"));
    }
  }
}
