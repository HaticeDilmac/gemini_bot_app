import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  late final GenerativeModel _model;
  late final ChatSession _chatSession;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
        model: 'gemini-pro', apiKey: const String.fromEnvironment('api_key'));
    _chatSession = _model.startChat();
  }

  Future<void> _sendChatmessage(String message) async {
    setState(() {
      _loading = true;
    });
    try {
      final response = await _chatSession.sendMessage(Content.text(message));
      final text = response.text;
      if (text == null) {
        _showErorr('No response fromAPI');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showErorr(e.toString());
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

  void _showErorr(String message) {
    showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Something went wrong'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _chatSession.history.length,
                  itemBuilder: (context, index) {
                    final Content content =
                        _chatSession.history.toList()[index];
                    final text = content.parts
                        .whereType<TextPart>()
                        .map<String>((e) => e.text)
                        .join('');
                    return MessageWidget(
                        isFromUser: content.role == 'user', text: text);
                  })),
          // Padding(padding: EdgeInsets.symmetric(vertical: 25,
          //  horizontal: 15,
          //  ))
          Row(
            children: [
              Expanded(
                  child: TextField(
                autofocus: true,
                focusNode: _textFieldFocus,
                controller: _textEditingController,
                onSubmitted: _sendChatmessage,
              ))
            ],
          )
        ],
      ),
    );
  }
}
