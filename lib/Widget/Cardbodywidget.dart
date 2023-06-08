import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class Cardbody extends StatelessWidget {
  Cardbody(
      {super.key,
      required this.item,
      required this.handleDelete,
      required this.index});
  var item;
  var index;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: (index % 2 == 0)
              ? Color.fromARGB(255, 149, 119, 233)
              : Color.fromARGB(255, 205, 102, 102),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            item.name,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () async {
              if (await confirm(
                context,
                title: const Text('Confirm'),
                content: const Text('Would you like to remove?'),
                textOK: const Text('Yes'),
                textCancel: const Text('No'),
              )) {
                handleDelete(item.id);
              }
              return;
            },
            child: Icon(
              Icons.delete_outline,
              color: Colors.black,
              size: 30,
            ),
          ),
        ]),
      ),
    );
  }
}
