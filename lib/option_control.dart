import 'package:guess_the_photo/option_model.dart';

class OptionControl {
  List<Options> _option = [
    Options("Batista", "Big Show", "Khali", "Daniel Brayan"),
    Options("Jhon Cena", "Miz", "Kane", "MVP"),
    Options("Undertaker", " Ric Flair", "Edge", "The Rock"),
    Options("Brock Lesner", "Roman Reigns", "Dolph Ziggler", "Rikishi"),
    Options(" Apolo crew", " Hurricane", "Big Show", "ReyMesterio"),
  ];

  String getOption1(int index) {
    return _option[index].option4;
  }

  String getOption2(int index) {
    return _option[index].option3;
  }

  String getOption3(int index) {
    return _option[index].option1;
  }

  String getOption4(int index) {
    return _option[index].option2;
  }

  String getOption5(int index) {
    return _option[index].option3;
  }

  int optionNumber() {
    return _option.length;
  }
}
