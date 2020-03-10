import 'package:guess_the_photo/image_model.dart';

class ImageControl {
  int imageNum = 0;
  List<Image> _images = [
    Image("image1.jpg", "Daniel Brayan"),
    Image("image2.jpg", "Kane"),
    Image("image3.jpg", "Undertaker"),
    Image("image4.jpg", "Roman Reigns"),
    Image("image5.jpg", "Big Show"),
  ];
  int imagesLength;
  String getImages(int index) {
    imageNum++;
    return _images[index].images;
  }

  int currentImage() {
    return imageNum;
  }

  String getResult(int index) {
    return _images[index].answer;
  }

  int imageNumber() {
    return _images.length;
  }

  bool isFinished() {
    if (imageNum < _images.length)
      return false;
    else
      return true;
  }

  void resetNumber() {
    imageNum = 0;
  }
}
