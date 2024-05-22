import 'package:draganddrop/screens/new_list.dart';
import 'package:flutter/material.dart';

class DraggableList extends StatefulWidget {
  const DraggableList({super.key});

  @override
  State<DraggableList> createState() => _DraggableListState();
}

class _DraggableListState extends State<DraggableList> {
  List<String> myList = ['1', '2', '3', '4'];
  List<String> newList = [];

  void addList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewList(
          newdata: newList,
        ),
      ),
    );
  }

  void sortOrder(oldIndex, newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    var item = myList.removeAt(oldIndex);
    setState(() {
      myList.insert(newIndex, item);
    });
  }

  void onAccept(DragTargetDetails<String> data) {
    newList.add(data.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
        actions: [
          DragTarget<String>(
            builder: (context, v, va) => IconButton(
              onPressed: addList,
              icon: const Icon(Icons.add),
            ),
            onAcceptWithDetails: onAccept,
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ReorderableListView.builder(
        onReorder: sortOrder,
        itemCount: myList.length,
        itemBuilder: (context, index) => Draggable(
          key: ValueKey(myList[index]),
          data: myList[index],
          feedback: Container(
            color: Colors.white,
            height: 50,
            width: 100,
            child: Material(
              child: ListTile(
                title: Text(myList[index]),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              height: 50,
              width: 100,
              child: Material(
                child: ListTile(
                  title: Text(
                    myList[index],
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
