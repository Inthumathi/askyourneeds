import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart'as ssts;



class VoiceRegno extends StatefulWidget {
  const VoiceRegno({Key? key}) : super(key: key);

  @override
  State<VoiceRegno> createState() => _VoiceRegnoState();
}

class _VoiceRegnoState extends State<VoiceRegno> {
  String text = "Hai welcome here";
  bool isListerning = false;
  var _speechToText = ssts.SpeechToText();
  // SpeechToText speechToText = SpeechToText();
  void listen() async{
    if (!isListerning) {
      bool availabe = await _speechToText.initialize(
          onStatus: (status){
            print(status);
          },
          onError:(errorNotification){
            print(errorNotification);
          }
      );
      if(availabe){
        setState(() {
          isListerning = true;
        });
        _speechToText.listen(
            onResult: (result){
              setState(() {
                text = result.recognizedWords;
              });
            }
        );
      }
    }
    else{
      setState(() {
        isListerning = false;
      });
      _speechToText.stop();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speechToText =ssts.SpeechToText();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75,
        animate: isListerning,
        duration: Duration(milliseconds: 2000),
        glowColor: Colors.red,
        repeat: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        showTwoGlows: true,
        child: FloatingActionButton(
          onPressed: (){
            listen();
          },
          child: CircleAvatar(
              child: isListerning ? Icon(Icons.mic) : Icon(Icons.mic_none)),
        ),
      ),
      body: SafeArea(child: Text(text)),
    );
  }
}
