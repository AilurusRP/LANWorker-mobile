import 'package:flutter/material.dart';
import 'package:lan_worker/UI/pages/scan_page.dart';
import 'package:lan_worker/UI/widgets/msg_editor.dart';
import 'package:lan_worker/UI/widgets/msg_list.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String? ip;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initIp(context));
  }

  initIp(context) async {
    ip = await ScanPage.navigatorPush(context);
    print("ip: $ip");
    if (ip == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No valid IP address found!"),
      ));
    }

    SSEClient.subscribeToSSE(url: 'http://$ip:7684/events', header: {
      "Accept": "text/event-stream",
    }).listen((event) {
      print('Id: ${event.id!}');
      print('Event: ${event.event!}');
      print('Data: ${event.data!}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LANWorker")),
      body: Column(
        children: [MsgList(), MsgEditor()],
      ),
    );
  }
}
