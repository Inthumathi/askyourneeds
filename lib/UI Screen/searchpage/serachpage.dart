
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart'as ssts;


class SearchScreen extends StatefulWidget {

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String text = "Hai welcome here";

  bool isListerning = false;
  final TextEditingController _controller = new TextEditingController();
  bool _wasEmpty = true;
  var _speechToText = ssts.SpeechToText();

  void listen() async{
    if (!isListerning) {
      bool availabe = await _speechToText.initialize(
          onStatus: (status){
            print(status);
          },
          onError:(errorNotification){
              setState(() {
                isListerning = false;
              });
            print(errorNotification);
          },


      );
      if(availabe){
        setState(() {
          isListerning = true;
        });
        _speechToText.listen(
            onResult: (result){
              setState(() {
                text = result.recognizedWords;
                _controller.text = result.recognizedWords;
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
    super.initState();
    // _controller = TextEditingController(text: widget.initialValue);
    _wasEmpty = _controller.text.isEmpty;
    _controller.addListener(() {
      if (_wasEmpty != _controller.text.isEmpty) {
        setState(() => {_wasEmpty = _controller.text.isEmpty});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: searchColor,
      appBar: AppBar(
          backgroundColor: primaryColor,
          automaticallyImplyLeading: true,
          title:  SmallText(text: 'Search',fontWeight: FontWeight.bold,size: 20),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child:Container(
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                child: TextField(
                  cursorColor: primaryColor,
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: true,
                    hoverColor: primaryColor,
                    focusColor: primaryColor,
                    fillColor: whiteColor,
                    isDense: true, // important line
                    contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 1,color: blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(width: 1,color: blueGrey),
                    ),
                    hintText: "Search your product here... ",
                    hintStyle: TextStyle(fontSize: 15,color: blueGrey,fontWeight: FontWeight.bold),
                    suffixIcon:_wasEmpty == true? IconButton(onPressed: (){

                    },icon: AvatarGlow(
                      endRadius: 75,
                      animate: isListerning,
                      duration: Duration(milliseconds: 2000),
                      glowColor: Colors.red,
                      repeat: true,
                      repeatPauseDuration: Duration(milliseconds: 100),
                      showTwoGlows: true,
                      child: InkWell(
                        onTap: (){
                          _showDialog();
                          // listen();
                        },
                        child: isListerning ? Icon(Icons.mic,color: primaryColor,size: 30,) : Icon(Icons.mic_none,color: primaryColor,size: 30,),
                      ),
                    ),)
                   : IconButton(
                        onPressed:_controller.clear,
                        icon: Icon(Icons.close,size: 28,color: Colors.grey),),
                    prefixIcon:Icon(Icons.search_rounded,size: 30,color: Colors.grey),
                  ),
                ),
              ),
            ),
          )),
        body:Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                  child: Image(
                    image: AssetImage('assets/search/search.png'),
                    width: 100,
                    height: 100,
                  )),
              heightSpace,
              heightSpace,
              heightSpace,
              SmallText(
                text:'Item not found',
                fontWeight: FontWeight.w500,
                size: 18,
              ),
              heightSpace,
              SmallText(
                text: 'Try searching the item witha different keyword.',
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                size: 15,
              ),
              const SizedBox(
                height: 50,
              ),

            ],
          ),
        )
    );
  }
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SmallText(text: 'Say Something!',size: 20,color: blueGrey,fontWeight: FontWeight.w500),
                  AvatarGlow(
                    endRadius: 85,
                    animate: isListerning,
                    duration: Duration(milliseconds: 2000),
                    glowColor: Colors.red,
                    repeat: true,
                    repeatPauseDuration: Duration(milliseconds: 100),
                    showTwoGlows: true,
                    child: FloatingActionButton(
                      backgroundColor: primaryColor,
                      onPressed: (){
                        listen();
                      },
                      child: CircleAvatar(
                        backgroundColor: primaryColor.withOpacity(0.5),
                          child: isListerning ? Icon(Icons.mic) : Icon(Icons.mic_none)),
                    ),
                  ),
                  SmallText(text: 'English(United State)',size: 13,color: blueGrey,)
                ],
              )),

        );
      },
    );
  }

}
