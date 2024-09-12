// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/widgets.dart';
// // // import 'package:gemini_bot_app/message.dart';
// // // import 'package:google_generative_ai/google_generative_ai.dart';

// // // class HomeScreen extends StatefulWidget {
// // //   const HomeScreen({super.key});

// // //   @override
// // //   State<HomeScreen> createState() => _HomeScreenState();
// // // }

// // // class _HomeScreenState extends State<HomeScreen> {
// // //   TextEditingController _textEditingController = TextEditingController();
// // //   final FocusNode _textFieldFocus = FocusNode();
// // //   ScrollController _scrollController = ScrollController();
// // //   bool _loading = false;
// // //   late final GenerativeModel _model;
// // //   late final ChatSession _chatSession;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _model = GenerativeModel(
// // //         model: 'gemini-pro', apiKey: const String.fromEnvironment('api_key'));
// // //     _chatSession = _model.startChat();
// // //   }

// // //   Future<void> _sendChatmessage(String message) async {
// // //     setState(() {
// // //       _loading = true;
// // //     });
// // //     try {
// // //       final response = await _chatSession.sendMessage(Content.text(message));
// // //       final text = response.text;
// // //       if (text == null) {
// // //         _showErorr('No response fromAPI');
// // //         return;
// // //       } else {
// // //         setState(() {
// // //           _loading = false;
// // //           _scrollDown();
// // //         });
// // //       }
// // //     } catch (e) {
// // //       _showErorr(e.toString());
// // //       setState(() {
// // //         _loading = true;
// // //       });
// // //     } finally {
// // //       _textEditingController.clear();
// // //       setState(() {
// // //         _loading = false;
// // //       });
// // //       _textFieldFocus.requestFocus();
// // //     }
// // //   }

// // //   void _scrollDown() {
// // //     WidgetsBinding.instance.addPostFrameCallback((_) =>
// // //         _scrollController.animateTo(_scrollController.position.maxScrollExtent,
// // //             duration: const Duration(milliseconds: 750), curve: Curves.ease));
// // //   }

// // //   void _showErorr(String message) {
// // //     showCupertinoDialog<void>(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return CupertinoAlertDialog(
// // //           title: Text('Something went wrong'),
// // //           content: Text(message),
// // //           actions: <CupertinoDialogAction>[
// // //             CupertinoDialogAction(
// // //               isDefaultAction: true,
// // //               onPressed: () {
// // //                 Navigator.pop(context); // Alert'ı kapat
// // //               },
// // //               child: Text('OK'),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Column(
// // //         mainAxisAlignment: MainAxisAlignment.center,
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Expanded(
// // //               child: ListView.builder(
// // //                   controller: _scrollController,
// // //                   itemCount: _chatSession.history.length,
// // //                   itemBuilder: (context, index) {
// // //                     final Content content =
// // //                         _chatSession.history.toList()[index];
// // //                     final text = content.parts
// // //                         .whereType<TextPart>()
// // //                         .map<String>((e) => e.text)
// // //                         .join('');
// // //                     return MessageWidget(
// // //                         isFromUser: content.role == 'user', text: text);
// // //                   })),
// // //           // Padding(padding: EdgeInsets.symmetric(vertical: 25,
// // //           //  horizontal: 15,
// // //           //  ))
// // //           Padding(
// // //             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
// // //             child: Row(
// // //               children: [
// // //                 Expanded(
// // //                   child: TextField(
// // //                     decoration: InputDecoration(
// // //                       contentPadding: EdgeInsets.all(15),
// // //                       hintText: 'Enter a message...',
// // //                       focusedBorder: const OutlineInputBorder(
// // //                         borderRadius: BorderRadius.all(Radius.circular(14)),
// // //                       ),
// // //                       border: OutlineInputBorder(
// // //                         borderSide: BorderSide(
// // //                           color: Theme.of(context).colorScheme.secondary,
// // //                         ),
// // //                         borderRadius: BorderRadius.circular(20),
// // //                       ),
// // //                     ),
// // //                     autofocus: true,
// // //                     focusNode: _textFieldFocus,
// // //                     controller: _textEditingController,
// // //                     onSubmitted: _sendChatmessage, // Enter ile gönderme
// // //                   ),
// // //                 ),
// // //                 const SizedBox(width: 10), // Buton ve TextField arasında boşluk
// // //                 IconButton(
// // //                   icon: Icon(Icons.send), // Gönderme ikonu
// // //                   color: Theme.of(context).colorScheme.primary, // Buton rengi
// // //                   onPressed: () {
// // //                     if (_textEditingController.text.isNotEmpty) {
// // //                       _sendChatmessage(_textEditingController
// // //                           .text); // Butona basınca mesaj gönderme
// // //                     }
// // //                   },
// // //                 ),
// // //               ],
// // //             ),
// // //           )
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'dart:convert'; // JSON dosyasını parse etmek için
// // import 'package:flutter/services.dart'; // rootBundle erişimi için
// // import 'package:gemini_bot_app/message.dart';
// // import 'package:google_generative_ai/google_generative_ai.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   TextEditingController _textEditingController = TextEditingController();
// //   final FocusNode _textFieldFocus = FocusNode();
// //   ScrollController _scrollController = ScrollController();
// //   bool _loading = false;
// //   GenerativeModel? _model;
// //   ChatSession? _chatSession;


// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadApiKey();
// //   }

// //   Future<void> _loadApiKey() async {
// //     // JSON dosyasını yükle
// //     final String response = await rootBundle.loadString('assets/env.json');
// //     final data = await json.decode(response);
// //     final apiKey = data['api_key'];

// //     // API modelini başlat
// //     _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
// //     _chatSession = _model!.startChat();
// //   }

// //   Future<void> _sendChatmessage(String message) async {
// //     setState(() {
// //       _loading = true;
// //     });
// //     try {
// //       final response = await _chatSession!.sendMessage(Content.text(message));
// //       final text = response.text;
// //       if (text == null) {
// //         _showErorr('No response from API');
// //         return;
// //       } else {
// //         setState(() {
// //           _loading = false;
// //           _scrollDown();
// //         });
// //       }
// //     } catch (e) {
// //       _showErorr(e.toString());
// //       setState(() {
// //         _loading = true;
// //       });
// //     } finally {
// //       _textEditingController.clear();
// //       setState(() {
// //         _loading = false;
// //       });
// //       _textFieldFocus.requestFocus();
// //     }
// //   }

// //   void _scrollDown() {
// //     WidgetsBinding.instance.addPostFrameCallback((_) =>
// //         _scrollController.animateTo(_scrollController.position.maxScrollExtent,
// //             duration: const Duration(milliseconds: 750), curve: Curves.ease));
// //   }

// //   void _showErorr(String message) {
// //     showCupertinoDialog<void>(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return CupertinoAlertDialog(
// //           title: const Text('Something went wrong'),
// //           content: Text(message),
// //           actions: <CupertinoDialogAction>[
// //             CupertinoDialogAction(
// //               isDefaultAction: true,
// //               onPressed: () {
// //                 Navigator.pop(context);
// //               },
// //               child: const Text('OK'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.black,
// //         title: const Text('Gemini ChatBot',
// //       style: TextStyle(color: Colors.white),),),
// //       backgroundColor: Colors.black,
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Expanded(
// //               child: ListView.builder(
// //                   controller: _scrollController,
// //                   itemCount: _chatSession!.history.length,
// //                   itemBuilder: (context, index) {
// //                     final Content content =
// //                         _chatSession!.history.toList()[index];
// //                     final text = content.parts
// //                         .whereType<TextPart>()
// //                         .map<String>((e) => e.text)
// //                         .join('');
// //                     return MessageWidget(
// //                         isFromUser: content.role == 'user', text: text);
// //                   })),
// //           Padding(
// //             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     decoration: InputDecoration(
// //                       contentPadding: const EdgeInsets.all(15),
// //                       hintText: 'Enter a message...',
// //                       focusedBorder: const OutlineInputBorder(
// //                         borderRadius: BorderRadius.all(Radius.circular(14)),
// //                       ),focusColor:   Colors.white,
// //                       fillColor:    Colors.white,
// //                       border: OutlineInputBorder(
// //                         borderSide: BorderSide(
// //                           color: Colors.white,
// //                         ),
// //                         borderRadius: BorderRadius.circular(20),
// //                       ),
// //                     ),
// //                     autofocus: true,
// //                     focusNode: _textFieldFocus,
// //                     controller: _textEditingController,
// //                     onSubmitted: _sendChatmessage,
// //                   ),
// //                 ),
// //                 const SizedBox(width: 10),
// //                 IconButton(
// //                   icon: const Icon(Icons.send),
// //                   color:  Colors.white,
// //                   onPressed: () {
// //                     if (_textEditingController.text.isNotEmpty) {
// //                       _sendChatmessage(_textEditingController.text);
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert'; // JSON dosyasını parse etmek için
// import 'package:flutter/services.dart'; // rootBundle erişimi için
// import 'package:gemini_bot_app/message.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   TextEditingController _textEditingController = TextEditingController();
//   final FocusNode _textFieldFocus = FocusNode();
//   ScrollController _scrollController = ScrollController();
//   bool _loading = false;
//   GenerativeModel? _model;
//   ChatSession? _chatSession;

//   @override
//   void initState() {
//     super.initState();
//     _loadApiKey();
//   }

//   Future<void> _loadApiKey() async {
//     try {
//       // JSON dosyasını yükle
//       final String response = await rootBundle.loadString('assets/env.json');
//       final data = json.decode(response);
//       final apiKey = data['api_key'];

//       // API modelini başlat
//       _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
//       _chatSession = _model!.startChat();

//       setState(() {}); // UI'yı güncelle
//     } catch (e) {
//       _showError('Failed to load API key: $e');
//     }
//   }

//   Future<void> _sendChatmessage(String message) async {
//     if (_chatSession == null) {
//       _showError('Chat session is not initialized');
//       return;
//     }

//     setState(() {
//       _loading = true;
//     });

//     try {
//       final response = await _chatSession!.sendMessage(Content.text(message));
//       final text = response.text;
//       if (text == null) {
//         _showError('No response from API');
//         return;
//       } else {
//         setState(() {
//           _loading = false;
//           _scrollDown();
//         });
//       }
//     } catch (e) {
//       _showError(e.toString());
//       setState(() {
//         _loading = true;
//       });
//     } finally {
//       _textEditingController.clear();
//       setState(() {
//         _loading = false;
//       });
//       _textFieldFocus.requestFocus();
//     }
//   }

//   void _scrollDown() {
//     WidgetsBinding.instance.addPostFrameCallback((_) =>
//         _scrollController.animateTo(_scrollController.position.maxScrollExtent,
//             duration: const Duration(milliseconds: 750), curve: Curves.ease));
//   }

//   void _showError(String message) {
//     showCupertinoDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return CupertinoAlertDialog(
//           title: const Text('Something went wrong'),
//           content: Text(message),
//           actions: <CupertinoDialogAction>[
//             CupertinoDialogAction(
//               isDefaultAction: true,
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Eğer _chatSession veya _model henüz başlatılmamışsa, boş bir ekran göster.
//     if (_chatSession == null || _model == null) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: const Text('Gemini ChatBot',
//               style: TextStyle(color: Colors.white)),
//         ),
//         backgroundColor: Colors.black,
//         body: const Center(child: CircularProgressIndicator()), // Yükleniyor göstergesi
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('Gemini ChatBot',
//             style: TextStyle(color: Colors.white)),
//       ),
//       backgroundColor: Colors.black,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//               child: ListView.builder(
//                   controller: _scrollController,
//                   itemCount: _chatSession!.history.length,
//                   itemBuilder: (context, index) {
//                     final Content content =
//                         _chatSession!.history.toList()[index];
//                     final text = content.parts
//                         .whereType<TextPart>()
//                         .map<String>((e) => e.text)
//                         .join('');
//                     return MessageWidget(
//                         isFromUser: content.role == 'user', text: text);
//                   })),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.all(15),
//                       hintText: 'Enter a message...',
//                       focusedBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(14)),
//                       ),focusColor: Colors.white,hoverColor: Colors.white,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.white,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     autofocus: true,
//                     focusNode: _textFieldFocus,
//                     controller: _textEditingController,
//                     onSubmitted: _sendChatmessage,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   color: Colors.white,
//                   onPressed: () {
//                     if (_textEditingController.text.isNotEmpty) {
//                       _sendChatmessage(_textEditingController.text);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; // JSON dosyasını parse etmek için
import 'package:flutter/services.dart'; // rootBundle erişimi için
import 'package:gemini_bot_app/message.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _textEditingController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  ScrollController _scrollController = ScrollController();
  bool _loading = false;
  GenerativeModel? _model;
  ChatSession? _chatSession;

  @override
  void initState() {
    super.initState();
    _loadApiKey();
  }

  Future<void> _loadApiKey() async {
    try {
      // JSON dosyasını yükle
      final String response = await rootBundle.loadString('assets/env.json');
      final data = json.decode(response);
      final apiKey = data['api_key'];

      // API modelini başlat
      _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
      _chatSession = _model!.startChat();

      setState(() {}); // UI'yı güncelle
    } catch (e) {
      _showError('Failed to load API key: $e');
    }
  }

  Future<void> _sendChatmessage(String message) async {
    if (_chatSession == null) {
      _showError('Chat session is not initialized');
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      final response = await _chatSession!.sendMessage(Content.text(message));
      final text = response.text;
      if (text == null) {
        _showError('No response from API');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = true;
      });
    } finally {
      _textEditingController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 750), curve: Curves.ease));
  }

  void _showError(String message) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Something went wrong'),
          content: Text(message),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Eğer _chatSession veya _model henüz başlatılmamışsa, boş bir ekran göster.
    if (_chatSession == null || _model == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Gemini ChatBot',
              style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.black,
        body: const Center(child: CircularProgressIndicator()), // Yükleniyor göstergesi
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Gemini ChatBot',
            style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _chatSession!.history.length,
                  itemBuilder: (context, index) {
                    final Content content =
                        _chatSession!.history.toList()[index];
                    final text = content.parts
                        .whereType<TextPart>()
                        .map<String>((e) => e.text)
                        .join('');
                    return MessageWidget(
                        isFromUser: content.role == 'user', text: text);
                  })),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Enter a message...',
                      hintStyle: const TextStyle(color: Colors.white), // Placeholder rengi beyaz
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Focused border rengi beyaz
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Normal border rengi beyaz
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Border rengi beyaz
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white), // Text rengi beyaz
                    autofocus: true,
                    focusNode: _textFieldFocus,
                    controller: _textEditingController,
                    onSubmitted: _sendChatmessage,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.white,
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      _sendChatmessage(_textEditingController.text);
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
