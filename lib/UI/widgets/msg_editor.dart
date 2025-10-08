import 'package:flutter/material.dart';
import 'package:lanworker_mobile/API/send_msg.dart';

class MsgEditor extends StatefulWidget {
  const MsgEditor({Key? key, required this.onSendMsg}) : super(key: key);

  final Function onSendMsg;

  @override
  State<MsgEditor> createState() => _MsgEditorState();
}

class _MsgEditorState extends State<MsgEditor> {
  final _controller = TextEditingController();
  bool _isInputEmpty = true;

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
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      controller: _controller,
                      onChanged: (value) {
                        _isInputEmpty = value.isEmpty;
                        setState(() {});
                      },
                    ))),
            _isInputEmpty
                ? TextButton(
                    onPressed: () {}, child: const Icon(Icons.attach_file))
                : TextButton(
                    onPressed: () {
                      widget.onSendMsg(_controller.text);
                      _controller.clear();
                    },
                    child: const Text("Send"))
          ],
        ));
  }
}
