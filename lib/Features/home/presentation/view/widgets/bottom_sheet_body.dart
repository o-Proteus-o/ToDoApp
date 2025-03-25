import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo/Features/home/presentation/model/todo_model.dart';
import 'package:todo/Features/home/presentation/view/widgets/custom_booton_sheet.dart';
import 'package:todo/Features/home/presentation/view/widgets/custom_text_field.dart';
import 'package:todo/Features/home/presentation/view_model/cubits/cubit/notes_cubit.dart';
import 'package:todo/Features/home/presentation/view_model/cubits/sicky_cubit/sticky_cubit.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({super.key});

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, description;
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StickyCubit(),
      child: Container(
        decoration: BoxDecoration(),
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 20),
                child: CustomTextFormField(
                  onSaved: (val) {
                    title = val;
                  },
                  hintText: "Title",
                ),
              ),
              CustomTextFormField(
                onSaved: (val) {
                  description = val;
                },
                hintText: "Description",
                contentPadding: EdgeInsets.only(bottom: 100, left: 10),
              ),
              SizedBox(height: 150),
              BlocConsumer<StickyCubit, StickyState>(
                listener: (context, state) {
                  if (state is StickySuccess) {
                    BlocProvider.of<NotesCubit>(context).fetchNotes();
                    Get.back();
                  }
                },
                builder: (context, state) {
                  return CustomBottonSheet(
                    onTap: () {
                      isClicked = state is StickyLoading ? true : false;
                      setState(() {});
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        var stickyNote = TodoModel(
                          Colors.blueGrey.value,
                          title: title!,
                          description: description!,
                          date: DateTime.now(),
                        );
                        BlocProvider.of<StickyCubit>(
                          context,
                        ).addnote(stickyNote);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    child:
                        isClicked
                            ? Text(
                              "Save",
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            )
                            : CircularProgressIndicator(color: Colors.white),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
