import 'package:flutter/material.dart';
import 'package:lanworker_mobile/API/send_msg.dart';
import 'package:lanworker_mobile/UI/pages/scan_page.dart';
import 'package:lanworker_mobile/UI/widgets/msg_editor.dart';
import 'package:lanworker_mobile/UI/widgets/msg_list.dart';
import 'package:lanworker_mobile/utils/extended_sse_client.dart';

import '../API/VO/msg_item_data.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String? url;
  final List<MsgItemData> _msgListData = [];
  final _msgListController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _initSSEClient(context));
  }

  _initSSEClient(context) async {
    var _url = await ScanPage.navigatorPush(context);
    setState(() {
      url = _url;
    });
    if (url == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No valid IP address found!"),
      ));
    }

    ExtendedSSEClient.extendedSubscribeToSSE(
        url: "${url!}/events",
        header: {"Accept": "text/event-stream"},
        onMessage: (data) {
          setState(() {
            _msgListData.add(MsgItemData(data, MsgSender.desktop));
            Future.delayed(Duration.zero).then((value) {
              _msgListController
                  .jumpTo(_msgListController.position.maxScrollExtent + 1800);
            });
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LANWorker")),
      body: Column(
        children: [
          MsgList(_msgListData, controller: _msgListController),
          MsgEditor(
            onSendMsg: (text) {
              sendMsg(url!, text);
              setState(() {
                _msgListData.add(MsgItemData(text, MsgSender.self));
                Future.delayed(Duration.zero).then((value) {
                  _msgListController.jumpTo(
                      _msgListController.position.maxScrollExtent + 1800);
                });
              });
            },
          )
        ],
      ),
    );
  }
}
