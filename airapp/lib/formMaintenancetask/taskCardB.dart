import 'package:airapp/constants.dart';
import 'package:flutter/material.dart';

class TaskCardB extends StatefulWidget {
  String? headings;
  String? title;
  String? instructions;
  String? question;
  final ValueChanged<int>? findings;
  final ValueChanged<String> logBook;
  final ValueChanged<String> solution;
  final ValueChanged<String> result;
  TaskCardB({
    required this.headings,
    required this.title,
    required this.instructions,
    required this.question,
    required this.findings,
    required this.logBook,
    required this.solution,
    required this.result,
  });

  @override
  State<TaskCardB> createState() => _TaskCardBState();
}

class _TaskCardBState extends State<TaskCardB> {
  int? _selectedValueIndex;
  @override
  Widget build(BuildContext context) {
    String? fQuestion = widget.question ?? '';
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.headings!,
            style: AppTextStyles.title.copyWith(
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.justify,
          ),
          Text(
            widget.title!,
            style: AppTextStyles.title1,
            textAlign: TextAlign.justify,
          ),
          Text(
            widget.instructions!,
            style: AppTextStyles.subtitle,
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 15,
          ),
          Text(widget.question!, style: AppTextStyles.title0),
          //options
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.greyAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(
                  buttonText.length,
                  (index) => button(
                    index: index,
                    text: buttonText[index],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Indicate Logbook:', style: AppTextStyles.title0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter Logbook',
              hintStyle: AppTextStyles.subtitle,
            ),
            onChanged: (value) {
              widget.logBook(value);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text('Description of the problem and Solution:',
              style: AppTextStyles.title0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter Description ',
              hintStyle: AppTextStyles.subtitle,
            ),
            onChanged: (value) {
              widget.solution(value);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text('Initials/Recommendations/Inspection Result',
              style: AppTextStyles.title0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter Result',
              hintStyle: AppTextStyles.subtitle,
            ),
            onChanged: (value) {
              widget.result(value);
            },
          ),
        ],
      ),
    );
  }

  List<String> buttonText = ["Satisfactory", "Not Satisfactory"];

  Widget button({required String text, required int index}) {
    String? fQuestion = widget.question ?? '';
    return InkWell(
      splashColor: Colors.white,
      onTap: () {
        widget.findings!(index);
        setState(() {
          _selectedValueIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
        decoration: BoxDecoration(
          color: _selectedValueIndex == 0 && index == 0
              ? Colors.green
              : _selectedValueIndex == 1 && index == 1
                  ? Colors.red
                  : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                index == _selectedValueIndex ? AppColors.white : AppColors.grey,
          ),
        ),
      ),
    );
  }
}
