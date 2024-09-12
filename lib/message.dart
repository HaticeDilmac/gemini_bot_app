import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget(
      {super.key, required this.isFromUser, required this.text});
  final String text;
  final bool isFromUser;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Container(
          constraints: BoxConstraints(maxWidth: 520),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.isFromUser
                  ? Color.fromARGB(255, 128, 194, 248)
                  : Theme.of(context).colorScheme.secondary),
          child: Column(
            children: [MarkdownBody(data: widget.text)],
          ),
        ))
      ],
    );
  }
}
