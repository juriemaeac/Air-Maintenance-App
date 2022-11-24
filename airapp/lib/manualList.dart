import 'package:airapp/Home/manual/manualWidget.dart';
import 'package:flutter/material.dart';

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
        title: Text('Manual'),
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
