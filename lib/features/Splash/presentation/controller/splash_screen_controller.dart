
import 'package:get/get.dart';

import '../../data/repositories/SplashScreen_repository.dart';

class SplashScreenController extends GetxController implements GetxService{
  final SplashScreenRepository? screenRepository;
  SplashScreenController({this.screenRepository});

  //content list
  final List<String> contents = [
    'Building green means building better.',
    'Building white means building better.',
    'Building red means building better.',
  ];

  int index = 0;

  void updateSelectedIndex(int length){
    if(index < length-1){
      index++;
    }else{
      index = 0;
    }
    update();
  }
}