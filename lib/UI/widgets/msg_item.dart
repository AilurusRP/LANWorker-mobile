import 'package:flutter/material.dart';
import 'package:lan_worker/API/VO/msg_item_data.dart';

class MsgItem extends StatelessWidget {
  MsgItemData data;
  MsgItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(15, 15, 55, 15),
        child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF795548),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(
              data.content,
              style: const TextStyle(
                  color: Colors.white, fontSize: 16, height: 1.2),
            )));
  }
}
