import 'package:airapp/constants.dart';
import 'package:flutter/material.dart';

class FormCard extends StatefulWidget {
  String? question;
  String? number;
  final ValueChanged<String> initials;
  final ValueChanged<int> findings;

  FormCard({
    required this.question,
    required this.number,
    required this.findings,
    required this.initials,
  });

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  int? _selectedValueIndex;
  @override
  Widget build(BuildContext context) {
    String? fQuestion = widget.question ?? '';
    String? fNumber = widget.number ?? '';
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.number!}.', style: AppTextStyles.title),
              // Container(
              //   width: 30,
              //   padding: const EdgeInsets.all(2),
              //   margin: const EdgeInsets.only(top: 3),
              //   decoration: BoxDecoration(
              //     color: AppColors.blueAccent,
              //     shape: BoxShape.circle,
              //   ),
              //   child: Center(
              //     child: Text(widget.number!,
              //         style: AppTextStyles.subtitle2
              //             .copyWith(color: AppColors.white)),
              //   ),
              // ),
              SizedBox(width: 5),
              Container(
                  width: MediaQuery.of(context).size.width - 125,
                  child: Text(
                    widget.question!,
                    style: AppTextStyles.title,
                    textAlign: TextAlign.justify,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.greyAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  buttonText.length - 1,
                  (index) => button(
                    index: index + 1,
                    text: buttonText[index + 1],
                  ),
                )
              ],
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Initials (Optional)',
              hintStyle: AppTextStyles.subtitle,
            ),
            onChanged: (value) {
              widget.initials(value);
            },
          ),
        ],
      ),
    );
  }

  List<String> buttonText = ["", "Satisfactory", "Not Satisfactory", "Warning"];

  Widget button({required String text, required int index}) {
    String? fQuestion = widget.question ?? '';
    String? fNumber = widget.number ?? '';
    return InkWell(
      splashColor: Colors.white,
      onTap: () {
        widget.findings(index);
        setState(() {
          _selectedValueIndex = index;
          print("$fNumber, $fQuestion, $_selectedValueIndex");
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: _selectedValueIndex == 1 && index == 1
              ? Colors.green
              : _selectedValueIndex == 2 && index == 2
                  ? Colors.orangeAccent
                  : _selectedValueIndex == 3 && index == 3
                      ? Colors.redAccent
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
