import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/ui/home/state.dart';

class CubitController extends Cubit<CubitState> {
  CubitController() : super(CubitState());

  Future<void> fetchStudents() async {
    final list = ["STUDENT-1", "STUDENT-2", "STUDENT-3"];
    emit(state.setData("students", list));
  }

  Future<void> fetchTeachers() async {
    final list = ["TEACHER-1", "TEACHER-2", "TEACHER-3"];
    emit(state.setData("teachers", list));
  }

  Future<void> clearUsers() async {
    state.status(CubitStatus.loading);
    return Future.delayed(const Duration(seconds: 2)).then((value) {
      state.clearData("users");
      emit(state.clearData("users"));
    });
  }

  void dispose() => state.clear();
}
