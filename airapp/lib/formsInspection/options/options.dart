import 'package:airapp/formsInspection/options/optionCard.dart';
import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          OptionCard(
            value: 1,
            groupValue: _value,
            leading: 'A',
            option: Text('Satisfactory'),
            onChanged: (value) => setState(() => _value = value!),
          ),
          OptionCard(
            value: 2,
            groupValue: _value,
            leading: 'B',
            option: Text('Not Satisfactory'),
            onChanged: (value) => setState(() => _value = value!),
          ),
          OptionCard(
            value: 3,
            groupValue: _value,
            leading: 'B',
            option: Text('Warning'),
            onChanged: (value) => setState(() => _value = value!),
          ),
        ],
      ),
    );
  }
}
