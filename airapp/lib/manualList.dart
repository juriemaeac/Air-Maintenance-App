import 'package:airapp/Home/manual/manualWidget.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ManualList extends StatefulWidget {
  const ManualList({super.key});

  @override
  State<ManualList> createState() => _ManualListState();
}

class _ManualListState extends State<ManualList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellowAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Manuals',
            style: AppTextStyles.title.copyWith(color: AppColors.blueAccent)),
        elevation: 2,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(child: Manuals()),
        ),
      ),
    );
  }
}
