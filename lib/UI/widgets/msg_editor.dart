import 'package:flutter/material.dart';
import 'package:lan_worker/API/send_msg.dart';

class MsgEditor extends StatefulWidget {
  MsgEditor({Key? key, required this.onSendMsg}) : super(key: key);

  Function onSendMsg;

  @override
  State<MsgEditor> createState() => _MsgEditorState();
}

class _MsgEditorState extends State<MsgEditor> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(
            color: Colors.black12,
            width: 0.4,
          ),
          bottom: BorderSide.none,
          left: BorderSide.none,
          right: BorderSide.none,
        )),
        child: Row(
          children: [
            Expanded(
                child: Padding(padding: EdgeInsets.fromLTRB(20, 1, 1, 1),
                child:TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              maxLines: null,
              controller: _controller,
            ))),
            TextButton(
                onPressed: () {
                  widget.onSendMsg(_controller.text);
                  _controller.clear();
                },
                child: const Text("Send"))
          ],
        ));
  }
}
