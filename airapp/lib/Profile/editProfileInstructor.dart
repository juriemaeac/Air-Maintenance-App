import 'package:flutter/material.dart';

import '../database/instructor_model.dart';

class EditProfileInstructor extends StatefulWidget {
  Instructor? instructorAccount;
  int? instructorIndex;
  EditProfileInstructor(
      {super.key,
      required this.instructorAccount,
      required this.instructorIndex});

  @override
  State<EditProfileInstructor> createState() => _EditProfileInstructorState();
}

class _EditProfileInstructorState extends State<EditProfileInstructor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: Container(child: Text('Edit Profile'))));
  }
}
