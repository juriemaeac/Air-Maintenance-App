import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  int? value;
  int? groupValue;
  String? leading;
  Widget? option;
  ValueChanged? onChanged;

  OptionCard({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    final option = this.option;
    return InkWell(
      onTap: () {
        onChanged!(value);

        print('groupValue: $groupValue \n value: $value');
      },
      child: Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _customRadioButton,
            SizedBox(width: 12),
            if (option != null) option,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : null,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isSelected ? Colors.grey[300]! : Colors.grey[300]!,
          width: 2,
        ),
      ),
      // child: Text(
      //   leading!,
      //   style: TextStyle(
      //     color: isSelected ? Colors.white : Colors.grey[600]!,
      //     fontWeight: FontWeight.bold,
      //     fontSize: 18,
      //   ),
      // ),
    );
  }
}
