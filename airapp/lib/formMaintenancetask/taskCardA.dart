import 'package:airapp/constants.dart';
import 'package:flutter/material.dart';

class TaskCardA extends StatefulWidget {
  String? question;
  final ValueChanged<String> initials;

  TaskCardA({
    required this.question,
    required this.initials,
  });

  @override
  State<TaskCardA> createState() => _TaskCardAState();
}

class _TaskCardAState extends State<TaskCardA> {
  int? _selectedValueIndex;
  @override
  Widget build(BuildContext context) {
    String? fQuestion = widget.question ?? '';
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.question!, style: AppTextStyles.title1),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.greyAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                contentPadding: const EdgeInsets.only(left: 25, right: 13),
                hintText: "Enter Data",
                labelStyle: AppTextStyles.subHeadings,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
              ),
              onChanged: (value) {
                widget.initials(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
