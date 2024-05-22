import 'package:flutter/material.dart';

class NewList extends StatefulWidget {
  NewList({super.key, this.addIntoList, this.newdata});

  List? newdata;
  Function(String)? addIntoList;

  @override
  State<NewList> createState() => _NewListState();
}

class _NewListState extends State<NewList> {
  @override
  void initState() {
    super.initState();
    updatedList = widget.newdata;
  }

  List? updatedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New List'),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView.builder(
        itemCount: updatedList!.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(8),
          color: Colors.white,
          height: 50,
          width: 100,
          child: ListTile(
            title: Text(updatedList![index].toString()),
          ),
        ),
      ),
    );
  }
}
