
import 'package:get/get.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repositories/Home_repository.dart';
import '../../domain/usecase/Home_use_case.dart';


class HomeController extends GetxController implements GetxService{
    HomeRepository? homeRepository;

  HomeController( { this.homeRepository });

    final selectedMineIndex = 0.obs;
    final selectedHomeIndex = 1.obs;
      selectedHomeItem(int index){
        selectedHomeIndex.value = index;
         update();
     }

    int selectedIndexx = 0;
    selectedData(int index){
      selectedIndexx = index;
      update();
    }

    int selectedReport = 0;
    selectReport(int index){
      selectedReport = index;
      update();
    }

    final switch1 = true.obs;

    selectOff(value){
      switch1.value = value;
    }

    final switch2 = true.obs;

    selectOffon(val){
      switch2.value = val;
    }
}

