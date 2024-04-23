import 'package:flutter/material.dart';
import 'package:sampleproject/screens/login_screen.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:developer';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final uid = '82091008-a484-4a89-ae75-a22bf8d6f3ac'; //user!.uid;
final eleosID = "1A";
final eleos = types.User(id: eleosID);
InputTextFieldController? _controller = InputTextFieldController();
InputOptions _options = InputOptions(textEditingController: _controller);

class MessagingPage extends StatefulWidget {
  const MessagingPage({Key? key}) : super(key: key);

  @override
  _MessagingPageState createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  final List<types.Message> _messages = [];
  final _user = types.User(id: uid);
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "";

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();

    setState(() {
      _messages.add(createTextMessage(eleos, eleosID,
          "Hi! I'm Eleos! An active listener to hear anything and everything on your mind!"));
    });
    //initTts();
  }

  @override
  Widget build(BuildContext context) => ScaffoldGradientBackground(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4982e1),
              Color(0xFF53ede6),
            ]),
        body: Chat(
          messages: _messages,
          onSendPressed: _onSendPressed,
          user: _user,
          inputOptions: _options,
          theme: const DefaultChatTheme(
            backgroundColor: Colors.transparent,
            primaryColor: Color(0xFFb990f7),
            secondaryColor: Color(0xFFffd773),
            inputBackgroundColor: Color(0xFFb990f7),
            dateDividerTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                height: 1.333),
            emptyChatPlaceholderTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5),
          ),
        ),
        floatingActionButton: Align(
            alignment: Alignment(
                Alignment.bottomRight.x -
                    MediaQuery.of(context).size.width * .07 / 100,
                Alignment.bottomRight.y +
                    MediaQuery.of(context).size.height * .0036 / 100),
            child: FloatingActionButton(
              onPressed: _listen, //_listen,
              child: Icon(_isListening ? Icons.mic : Icons.mic_none),
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              enableFeedback: true,
              mini: true,
              tooltip: "Speak",
              elevation: 0.0,
            )),
      );
  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (_isListening) {
              _options.textEditingController!.text = _text;
            }
            print("Running: " + _text);
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _onSendPressed(types.PartialText message) {
    print(111);
    _speech.cancel();
    _isListening = false;
    _speech.stop();
    final textMessage = createTextMessage(_user, uid, message.text);
    addMessage(textMessage);
    addEleosMessage(message.text);
  }

  void addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void addEleosMessage(String userMessage) async {
    print(userMessage);
    String eleosResponseText = await getResponse(userMessage);
    types.Message eleosResponse = getEleosResponse(eleosResponseText);
    addMessage(eleosResponse);
  }

  types.TextMessage getEleosResponse(String message) {
    return createTextMessage(eleos, eleosID, message);
  }

  types.TextMessage createTextMessage(
      types.User author, String id, String message) {
    final textMessage = types.TextMessage(
        author: author,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: id,
        text: message);

    return textMessage;
  }

  Future getResponse(message) async {
    final json = {
      "type": "service_account",
      "project_id": "projecteleos",
      "private_key_id": "b4e015d851a359ef4991e673dd04c649035315fd",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCXaxAK3VHG/A6z\nI0mWwRn33CPILO8PoK12Qw4vFKAoJKUDoxN9f41i9fZGTXUARCwLXZ79eF87exAY\nom2hap0GvJdAnqTrCxx/wESchaMKaNQYwWUDWJh73/djx8m5Qi2/Z2kIOT21myxT\nBeWmWBHthAcAk11nOZGyAIlSFdrUMob+OAmv/iqnPXhRjKuWXdgg9nIN8xK0K9pq\nnQv9cLTXKhmufOGqBIYXgtZlWhI2ux5cA9R1CDeel5vaPxiGhwgQvN0F8g2G6e9H\nUQdOn8wZy/76e0QUCpgmEb5qf52lPbJgDNg60UTzQmzRn9PYlm50e3lUVHrsh4zM\n87iIErP1AgMBAAECggEAPxVz0ZLzhxtsZGXHOu+oigNFRRizYKdonWTCfArzzsW1\nmhZPAHIrzZb7y75piHrefr26h4+m3Xkf86N4WU+5rBzWRy3RN7uhW/gWnb9vdd7G\nvqmUFBjNLo7Y2tFZ0b0ooh3LPInck9TaWpySWQNINNRUtoCu4VqywJ5Il9JTISRn\nzQNQRfjc2TqxuCo0UhzasZ0q/gaSeytjI5rHDhZiclBhFqCo4DDrtoDQgRwkRFsk\n5kFtk/EFpm0QxF1osR/iAifj38/ly4/JMyQ5fGXjp7U+TxmFAwRexGGrzD6gWLqS\nHERVTpVAyP73FwnojKQrwNKEwTP2op3hNrfNA/364QKBgQDKK7ipGcAC7tOskS/R\nHUoL/sC3h/Ni2L/mkF0rh6qcj6BzCHgY8dTsa0xQBojTpEq50/73yMhkmS/wBCPv\n2BPzDsCbHcjy+c5eZTr7F+sIlI4gxjb6SWaN1Lh2CsGtT5I2Eu8VGmcZ2/+XJAgG\noCdJOG71NHCriNOuhl19WWspiwKBgQC/u/dW5h1s7rkNDlViuIXDcngRIH/LcYgF\naeh35EiaQrXyyk5Lv9HhKPuUFCQ6JFV0C3KP0KQYG6gcLxT1/YB6n6IKx388DArx\n1xWN5UEG5krwFxcrmJkSj8Aw6o7KiXj6n90qiM0Irc2Y8N18wE2dDKkUQPYdCQ0q\ng9u6W+5IfwKBgQCksjtr3qNSgFcGdPxcQZ0J6o36tZDrzKGAZcjQ5mNxyXuvWo3j\n3FZWBw8S/k/HAkcx3WcPWo0NjtHDmMvh3shZsIHtm7URY7nfol4LIbABvGuQfYla\nGiOmlU10NE0VMAZvcLs+GNU29sbfzKWRKDT47DVQIllLFFtGCQXuUMMBAwKBgQCe\nmJq1dM8uRiEn3Y1fhYaP7uXGNP3AiP6ci8hRM7GieEAMvq8ZFWhEOSQwjqCQv3E3\n9igjMdAqaOYbug46lCBsThM5m19xifybovAfWVz6mg+unUr7MtSbd/DgBYVrn19E\n4GuPPW1sGmgQdFyhTmhk2g4ZxMpPpicP3dYpRtXJfQKBgDCilgw4IINhdgaBK6PZ\nWkje8aev/AQVcGG17CYn5I1t/SAjTcsa5gFzm0ylUa0/jERP27wnwJYTmFGVdx1I\nsPRqSV3z47KS6bMHET6V7W1boNy5kVPlNmS5gIv0o68XPPsiM24c0thxh3RoiEOl\n2BttBJ6RHsjVvM9TdWPpBejQ\n-----END PRIVATE KEY-----\n",
      "client_email": "poggers2@projecteleos.iam.gserviceaccount.com",
      "client_id": "103654971600683789187",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/poggers2%40projecteleos.iam.gserviceaccount.com"
    };

    DialogAuthCredentials credentials = DialogAuthCredentials.fromJson(json);
    final DialogFlowtter dialogFlowtter = DialogFlowtter(
      credentials: credentials,
      sessionId: "test",
    );

    final QueryInput queryInput = QueryInput(
      text: TextInput(
        text: message,
        languageCode: "en",
      ),
    );
    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: queryInput,
    );

    // print(response.toString());
    String? textResponse = response.text;

    if (textResponse != null) {
      return textResponse;
    }
    return "";
  }
}
