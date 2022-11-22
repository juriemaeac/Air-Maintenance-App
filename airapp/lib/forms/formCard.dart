import 'package:airapp/constants.dart';
import 'package:airapp/forms/options/options.dart';
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
            children: [
              // Container(
              //   width: 30,
              //   padding: const EdgeInsets.all(6),
              //   decoration: BoxDecoration(
              //     color: AppColors.blueAccent,
              //     shape: BoxShape.circle,
              //   ),
              //   child: Text(widget.number!,
              //       style: AppTextStyles.subtitle2
              //           .copyWith(color: AppColors.white)),
              // ),
              // SizedBox(width: 5),
              Container(
                  width: MediaQuery.of(context).size.width - 95,
                  child: Text(widget.question!, style: AppTextStyles.title)),
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
                  buttonText.length,
                  (index) => button(
                    index: index,
                    text: buttonText[index],
                  ),
                )
              ],
            ),
          ),
          //Container(height: 100, child: Options()),
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

  List<String> buttonText = ["Satisfactory", "Not Satisfactory", "Warning"];

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
          color: _selectedValueIndex == index
              ? AppColors.blueAccent
              : null, //AppColors.white,
          // border: Border.all(
          //     color: _selectedValueIndex == index
          //         ? AppColors.blueAccent
          //         : AppColors.greyAccentLine,
          //     width: _selectedValueIndex == index ? 2 : 1),
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
