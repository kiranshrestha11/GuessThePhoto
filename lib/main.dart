import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:guess_the_photo/image_control.dart';
import 'package:guess_the_photo/option_control.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

ImageControl imageControl = new ImageControl();
OptionControl optionControl = new OptionControl();
int index = 0;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.tealAccent[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Guess the Wrestlers"),
          elevation: 3,
        ),
        body: Guess(),
      ),
    );
  }
}

class Guess extends StatefulWidget {
  @override
  _GuessState createState() => _GuessState();
}

class _GuessState extends State<Guess> {
  int optionNumber;
  String image = imageControl.getImages(index);
  String text = "";
  String answer = imageControl.getResult(index);
  String optionText;
  void checkAnswer(String answer) {
    setState(() {
      if (answer == imageControl.getResult(index)) {
        text = "CORRECT";
      } else {
        text = "INCORRECT";
      }

      if (imageControl.currentImage() != imageControl.imageNumber()) {
        index++;
      } else {
        Alert(context: context, title: "GAME OVER", buttons: [
          DialogButton(
            child: Text("PLAY AGAIN"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]).show();
        index = 0;
        text = "";
        imageControl.resetNumber();
      }

      image = imageControl.getImages(index);
    });
  }

  Widget Option(String optionText) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: SizedBox(
        width: double.infinity,
        height: 35,
        child: FlatButton(
          color: Colors.black26,
          child: Text("$optionText"),
          onPressed: () {
            checkAnswer(optionText);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: Image.asset(
            "assets/images/$image",
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
        ),
        Column(
          children: <Widget>[
            Option(optionControl.getOption1(index)),
            Option(optionControl.getOption2(index)),
            Option(optionControl.getOption3(index)),
            Option(optionControl.getOption4(index)),
          ],
        ),
        Container(
          child: Text(
            "$text",
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
