import 'package:flutter_sqflite/model/StudentModel.dart';
import 'package:flutter_sqflite/repositories/StudentRepository.dart';
import 'package:get/get.dart';

class StudentViewModel extends GetxController{

  var allStudent = <StudentModel>[].obs;
  StudentRepository studentRepository = StudentRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllStudent();
  }

  fetchAllStudent() async{
    var student = await studentRepository.getStudent();
    allStudent.value = student;
  }

  addStudent(StudentModel studentModel){
    studentRepository.add(studentModel);
    fetchAllStudent();
  }

  updateStudent(StudentModel studentModel){
    studentRepository.update(studentModel);
    fetchAllStudent();
  }

  deleteStudent(int id){
    studentRepository.delete(id);
    fetchAllStudent();
  }

}