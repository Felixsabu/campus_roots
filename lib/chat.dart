import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String alumniName;

  const ChatPage({super.key, required this.alumniName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $alumniName'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ChatScreen(alumniName: alumniName),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String alumniName;

  const ChatScreen({super.key, required this.alumniName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(Message(
        text: text,
        isSentByMe: true,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _messages[index];
            },
          ),
        ),
        const Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ],
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  final String text;
  final bool isSentByMe;

  const Message({super.key, required this.text, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    final BorderRadius messageRadius = BorderRadius.circular(12.0);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSentByMe)
            const CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
          const SizedBox(width: 10.0),
          Container(
            padding: const EdgeInsets.all(10.0),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
            decoration: BoxDecoration(
              color: isSentByMe ? Colors.blueAccent : Colors.grey[300],
              borderRadius: isSentByMe
                  ? messageRadius.subtract(const BorderRadius.only(bottomRight: Radius.circular(0)))
                  : messageRadius.subtract(const BorderRadius.only(bottomLeft: Radius.circular(0))),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isSentByMe ? Colors.white : Colors.black87,
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          if (isSentByMe)
            const CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
        ],
      ),
    );
  }
}
