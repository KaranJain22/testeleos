//import 'dart:html';
// ignore_for_file: avoid_unnecessary_containers

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:sampleproject/screens/login_screen.dart';
import 'package:sampleproject/screens/main_screen.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:developer';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Project Eleos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen() //const TermsPage(title: 'Eleos'),
        );
  }
}

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TermsAndConditions'),
        ),
        body: new Container(
            padding: const EdgeInsets.all(0),
            height: 2000.0,
            width: 2000.0,
            child:
                new Stack(alignment: new Alignment(0, -0.7), children: <Widget>[
              new Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                    Color(0xFF4982e1),
                    Color(0xFF53ede6),
                  ]))),
              new Container(
                  alignment: const Alignment(0, 0.5),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CustomPageRoute(const MyHomePage(
                            title: 'MyHomePage',
                          )));
                    },
                    child: const Text('I agree to the terms and conditions'),
                  ))
            ])));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyHomepage'),
        ),
        body: new Container(
            padding: const EdgeInsets.all(0),
            height: 2000.0,
            width: 2000.0,
            child:
                new Stack(alignment: new Alignment(0, -0.7), children: <Widget>[
              new Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                    Color(0xFF4982e1),
                    Color(0xFF53ede6),
                  ]))),
              new Container(
                  alignment: new Alignment(0, -0.1),
                  height: 200.0,
                  width: 200.0,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: new AssetImage(
                            'assets/images/eleos_home_sun-nobg.png'),
                        fit: BoxFit.fill),
                  )),
              new Container(
                  child: Column(children: [
                const Hero(
                  tag: "HeroOne",
                  child: Icon(
                    Icons.mic,
                    size: 10.0,
                    color: Color(0xFF4982e1),
                  ),
                ),
              ])),
              new Container(
                  alignment: Alignment.topCenter,
                  height: 400.0,
                  width: 400.0,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: new AssetImage(
                            'assets/images/eleos_home_mountain_only-nobg.png'),
                        fit: BoxFit.fill),
                  )),
              new Container(
                  alignment: new Alignment(0, -0.1),
                  height: 200.0,
                  width: 400.0,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: new AssetImage(
                            'assets/images/eleos_home_clouds-nobg.png'),
                        fit: BoxFit.fill),
                  )),
              new Container(
                  alignment: new Alignment(0, 0.5),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CustomPageRoute(const TitlePage(
                            title: 'TitlePage',
                          )));
                    },
                    child: const Text('Welcome'),
                  ))
            ])));
  }
}

class TitlePage extends StatelessWidget {
  const TitlePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: /*Text(title) */ const Text('TitlePage'),
        ),
        body: new Container(
            padding: const EdgeInsets.all(0),
            height: 2000.0,
            width: 2000.0,
            child:
                new Stack(alignment: new Alignment(0, -0.7), children: <Widget>[
              new Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                    Color(0xFF4982e1),
                    Color(0xFF53ede6),
                  ]))),
              new Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    const Hero(
                        tag: "HeroOne",
                        child: Icon(
                          Icons.mic,
                          size: 50.0,
                        ))
                  ])),
              new Container(
                  alignment: new Alignment(0, 0.5),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const EleosPage(title: 'EleosPage');
                      }));
                    },
                    child: const Text('Go to Eleos'),
                  ))
            ])));
  }
}

class CustomPageRoute<t> extends PageRoute<t> {
  final Widget child;
  CustomPageRoute(this.child);
  @override
  Color get barrierColor => Colors.black;
  @override
  String get barrierLabel => '';
  @override
  bool get maintainState => true;
  @override
  Duration get transitionDuration => const Duration(seconds: 2);
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
} //</double></double></t></t></widget>

class EleosPage extends StatefulWidget {
  const EleosPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _EleosPage createState() => _EleosPage();
}

enum TtsState { playing, stopped, paused, continued }

//Speak to Eleos Page
class _EleosPage extends State<EleosPage> {
  //some of these variables might not be necessary as I removed voice sliders
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  int playerID = 0;
  late FlutterTts flutterTts;
  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  String responseMessage = '';
  String? _newVoiceText;
  int? _inputLength;
  TextEditingController textController = TextEditingController();
  static const borderWidth = 2.0;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;

  @override
  void initState() {
    super.initState();
    _initSpeech();
    initTts();
  }

  Future<void> getResponse(message) async {
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
    String? textResponse = response.text;

    if (textResponse != null) {
      responseMessage = textResponse;
      log(responseMessage);
    }
  }

  String sendResponse(message) {
    getResponse(message);
    return responseMessage;
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;

      //  getResponse(_lastWords);

      _newVoiceText = _lastWords;
    });
  }

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print("Paused");
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print("Continued");
          ttsState = TtsState.continued;
        });
      });
    }
  }

  Future<dynamic> _getEngines() => flutterTts.getEngines;

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  //giving words for text to speech
  Future _speak() async {
    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(sendResponse(_lastWords));
      }
    }
  }

  Future _disp() async {
    _lastWords = textController.text;
    sendResponse(_lastWords);
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  List<DropdownMenuItem<String>> getEnginesDropDownMenuItems(dynamic engines) {
    var items = <DropdownMenuItem<String>>[];
    for (dynamic type in engines) {
      items.add(DropdownMenuItem(
          value: type as String?, child: Text(type as String)));
    }
    return items;
  }

  void changedEnginesDropDownItem(String? selectedEngine) {
    flutterTts.setEngine(selectedEngine!);
    language = null;
    setState(() {
      engine = selectedEngine;
    });
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

//Eleos Page GUI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Eleos Speech Demo'),
        ),
        body: new Container(
          padding: const EdgeInsets.all(0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: new Stack(
            children: <Widget>[
              //gradient
              new Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                    Color(0xFF4982e1),
                    Color(0xFF53ede6),
                  ]))),
              //lilypad 1
              Positioned(
                  left: 10,
                  top: 50,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage(
                                'assets/images/Lilypad1trbg.png'),
                            fit: BoxFit.fill),
                      ))),
              //lilypad 2
              Positioned(
                  left: 170,
                  top: 180,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.27,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage(
                                'assets/images/Lilypad2trbg.png'),
                            fit: BoxFit.fill),
                      ))),
              //lilypad 3
              Positioned(
                  left: -40,
                  top: 350,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.27,
                      width: MediaQuery.of(context).size.width * 0.53,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage(
                                'assets/images/Lilypad3trbg.png'),
                            fit: BoxFit.fill),
                      ))),
              //recognized words textbox
              new Container(
                alignment: new Alignment(0, 0.18),
                child: const Text(
                  "What's on your mind?",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              _btnSection(), //submit button
              //back to previous page button (replace with Sahil's infinity button)
              new Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                ),
              ),
              _textFieldSection(),
              useButton(context, "Send", _disp),
              //user words displayed
              new Container(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: new Alignment(0, 0.3),
                  child: Text(
                    // If listening is active show the recognized words
                    _speechToText.isListening
                        ? '$_lastWords'
                        // If listening isn't active but could be tell the user
                        // how to start it, otherwise indicate that speech
                        // recognition is not yet ready or not supported on
                        // the target device
                        : _speechEnabled
                            ? ' '
                            : 'Speech not available',
                  ),
                ),
              ),
              //Eleos response displayed
              new Container(
                padding: const EdgeInsets.all(16),
                alignment: const Alignment(0, -0.4),
                child: Text(
                  responseMessage,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
        //microphone button
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          const SizedBox(
            height: 10,
          ),
          //Eleos response only shows up on the screen when mic button is pressed after user text or speech is submitted!!!
          FloatingActionButton(
            onPressed:
                // If not yet listening for speech start, otherwise stop
                _speechToText.isNotListening ? _startListening : _stopListening,
            tooltip: 'Listen',
            child: Icon(_speechToText.isNotListening
                ? Icons.mic_off_rounded
                : Icons.mic_rounded),
          )
        ]));
  }

  Widget _inputSection() => Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: TextField(
        onChanged: (String value) {
          _onChange(value);
        },
      ));

  //submit button widget
  //_speak function is not working!!!
  Widget _btnSection() {
    if (isAndroid) {
      return Container(
          //padding: EdgeInsets.only(top: 600.0),
          margin: const EdgeInsets.fromLTRB(75, 220, 50, 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildButton(Colors.black, Colors.greenAccent, Icons.volume_up,
                'SPEAK', _speak),
          ]));
    } else {
      return Container(
          //padding: EdgeInsets.only(top: 600.0),
          margin: const EdgeInsets.fromLTRB(260, 440, 10, 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildButton(Colors.black, Colors.greenAccent, Icons.volume_up,
                'SPEAK', _speak),
          ]));
    }
  }

  //submit button graphics
  Column _buildButton(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(icon),
              color: color,
              splashColor: splashColor,
              onPressed: () => func()),
          Container(
              margin: const EdgeInsets.only(top: 0.1),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)))
        ]);
  }

  Widget _textFieldSection() {
    return Container(
        margin: const EdgeInsets.fromLTRB(50, 430, 50, 20),
        child: reusableTextField("", Icons.arrow_right, false, textController));
  }

//User speech does not go inside the textfield, instead it is just on top!!!
  TextField reusableTextField(String text, IconData icon, bool isPasswordType,
      TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        hintText: "Type or tap microphone...",
        hintStyle: const TextStyle(color: Colors.grey),
        labelText: text,
        labelStyle: const TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        border: const UnderlineInputBorder(
            borderSide: BorderSide(width: borderWidth, color: Colors.black)),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 2,
    );
  }

  Container useButton(BuildContext context, String title, Function onTap) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(90, 550, 90, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          title,
          style: const TextStyle(
              color: Color(0xFF4982e1),
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 200, 200, 200);
              }
              return Colors.white;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)))),
      ),
    );
  }
}
