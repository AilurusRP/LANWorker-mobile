import 'package:flutter_client_sse/flutter_client_sse.dart';

/// Created to process unexpected leading or trailing whitespace of each line.
/// This may be caused by a issue of flutter_client_sse.
class ExtendedSSEClient extends SSEClient {
  static extendedSubscribeToSSE(
      {required String url,
      required Map<String, String> header,
      void Function(String)? onMessage}) {
    SSEClient.subscribeToSSE(url: url, header: header).listen((event) {
      if (event.event == "message" && event.data != null) {
        onMessage!(trimMsgData(event.data!));
      }
    });
  }

  static trimMsgData(String data) {
    assert(data.startsWith(" ") && data.endsWith("\n"));
    data = data.substring(0, data.length - 1);

    var dataSplit = data.split("\n");
    dataSplit = dataSplit.map((element) {
      assert(data.startsWith(" "));
      return element.substring(1);
    }).toList();

    return dataSplit.join("\n");
  }
}
