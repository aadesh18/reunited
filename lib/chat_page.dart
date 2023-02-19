import 'package:flutter/material.dart';
import 'package:reunited/chat_api.dart';
import 'package:reunited/components/message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var messageList = [
    Message(message: "Hi! I am Suzie", isMe: false),
    Message(message: "How can I help you today?", isMe: false)
  ];
  ChatAPI chatAPI = ChatAPI();
  String message = "";
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  _buildMessage(String message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? const Color(0xFFFFEFEE) : const Color(0xFFFDF8E7),
        borderRadius: isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8.0),
          Text(
            message,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: fieldText,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                message = value;
              },
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            color: Colors.blueGrey,
            onPressed: () async {
              String? response = await chatAPI.getData(message);
              setState(() {
                messageList.add(Message(message: message, isMe: true));
                messageList.add(Message(message: response!, isMe: false));
                clearText();
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: ListView.builder(
                  reverse: false,
                  padding: const EdgeInsets.only(top: 15.0),
                  itemCount: messageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = messageList[index].message;
                    final bool isMe = messageList[index].isMe;

                    return _buildMessage(message, isMe);
                  },
                ),
              ),
            ),
          ),
          _buildMessageComposer(),
        ],
      ),
    );
  }
}
