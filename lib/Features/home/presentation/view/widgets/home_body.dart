import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/Features/home/presentation/view/widgets/sticky_list_view.dart';
import 'package:todo/Features/home/presentation/view/widgets/sticky_notes.dart';
import 'package:todo/Features/home/presentation/view_model/cubits/cubit/notes_cubit.dart';

class HomeToDoBody extends StatelessWidget {
  const HomeToDoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()..fetchNotes(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              AppBarStickNotes(
                icon: Icon(FontAwesomeIcons.search),
                text: "Sticky Notes",
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
              Expanded(child: StickyListView()),
            ],
          ),
        ),
      ),
    );
  }
}
