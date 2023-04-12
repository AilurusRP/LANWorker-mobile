import 'package:flutter/material.dart';

import '../../API/VO/msg_item_data.dart';
import 'msg_item.dart';

class MsgList extends StatefulWidget {
  List<MsgItemData> msgListData;
  ScrollController controller;
  MsgList(this.msgListData, {required this.controller}) : super();

  @override
  State<MsgList> createState() => _MsgListState();
}

class _MsgListState extends State<MsgList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: ListView(
          controller: widget.controller,
          children:
              widget.msgListData.map((data) => MsgItem(data: data)).toList(),
        ));
  }
}
