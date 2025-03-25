import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo/Features/home/presentation/model/todo_model.dart';
import 'package:todo/Features/home/presentation/view/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/Features/home/presentation/view_model/cubits/cubit/notes_cubit.dart';
import 'package:todo/simple_bloc_obsever.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObsever();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todo');

  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: GetMaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: HomeToDo(),
      ),
    );
  }
}
