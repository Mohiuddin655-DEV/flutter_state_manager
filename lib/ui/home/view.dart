import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/ui/home/controller.dart';
import 'package:flutter_cubit/ui/home/state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String key = "students";
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CubitController>();
    return BlocConsumer<CubitController, CubitState>(
      builder: (context, state) {
        print(state.caches);
        final data = state.getData(key);
        print("Hi");
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$data"),
                ElevatedButton(
                  child: const Text("Students"),
                  onPressed: () {
                    key = "students";
                    cubit.fetchStudents();
                    setState(() {});
                  },
                ),
                ElevatedButton(
                  child: const Text("Teachers"),
                  onPressed: () {
                    key = "teachers";
                    cubit.fetchTeachers();
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        );
      },
      listener: (c, s) {
        print(s);
      },
    );
  }
}
