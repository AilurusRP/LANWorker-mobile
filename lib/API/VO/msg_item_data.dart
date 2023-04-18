enum MsgSender { self, desktop }

class MsgItemData {
  final String content;
  final MsgSender sender;
  MsgItemData(this.content, this.sender);
}
