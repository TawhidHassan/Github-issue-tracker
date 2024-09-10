
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../data/models/bottom_navmodel.dart';

class MainScreenController extends GetxController implements GetxService{
  MainScreenController();

  //nav item


  //selected index
  final _selectedItem = 0.obs;
  int get selectedItem => _selectedItem.value;

  //---------------------------------update selected item
  void updateSelectedItem(int idx){
    _selectedItem.value = idx;
  }


  void goBranch(int index, BuildContext context, navigationShell) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}