// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

// class MessageWidget extends StatefulWidget {
//   const MessageWidget(
//       {super.key, required this.isFromUser, required this.text});
//   final String text;
//   final bool isFromUser;

//   @override
//   State<MessageWidget> createState() => _MessageWidgetState();
// }

// class _MessageWidgetState extends State<MessageWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Flexible(
//             child: Container(
//           constraints: BoxConstraints(maxWidth: 520),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: widget.isFromUser
//                   ? Color.fromARGB(255, 64, 63, 63)
//                   : Theme.of(context).colorScheme.secondary),
//           child: Column(
//             children: [MarkdownBody(data: widget.text)],
//           ),
//         ))
//       ],
//     );
//   }
// }
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
      mainAxisAlignment: widget.isFromUser
          ? MainAxisAlignment.end // Kullanıcı mesajını sağa yasla
          : MainAxisAlignment.start, // Karşı tarafın mesajını sola yasla
      children: [
        Flexible(
          child: Container(
            constraints:
                const BoxConstraints(maxWidth: 320), // Mesajın genişliği
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: widget.isFromUser
                  ? Colors.green // Kullanıcının mesaj rengi
                  : Colors.grey[800], // Karşı tarafın mesaj rengi
              borderRadius: widget.isFromUser
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ) // Sağdaki mesaj için baloncuk şekli
                  : const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ), // Soldaki mesaj için baloncuk şekli
            ),
            child: MarkdownBody(
              data: widget.text,
              styleSheet:
                  MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                p: const TextStyle(color: Colors.white), // Yazı rengi
              ),
            ),
          ),
        ),
      ],
    );
  }
}
