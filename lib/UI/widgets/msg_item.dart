import 'package:flutter/material.dart';
import 'package:lan_worker/API/VO/msg_item_data.dart';

class MsgItem extends StatelessWidget {
  MsgItemData data;
  MsgItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: data.sender == MsgSender.self
            ? Alignment.centerRight
            : Alignment.centerLeft,
        padding: data.sender == MsgSender.self
            ? const EdgeInsets.fromLTRB(55, 15, 15, 15)
            : const EdgeInsets.fromLTRB(15, 15, 55, 15),
        child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF795548),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: SelectableText(
              data.content,
              style: const TextStyle(
                  color: Colors.white, fontSize: 16, height: 1.2),
            )));
  }
}
