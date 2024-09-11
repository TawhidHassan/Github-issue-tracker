
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ihb/features/Home/data/models/owner_model.dart';
import '../../domain/usecase/profile_use_case.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController implements GetxService{
  final ProfileUseCase? profileUseCase;
  ProfileController({ this.profileUseCase });


  Rx<OwnerModel?> response=Rx<OwnerModel?>(null);
  final loading=false.obs;
  Future searchUser({required String search})async {
    loading.value=true;
    response.value=null;
    var res=await profileUseCase!.searchUser(search);
    loading.value=false;
    res.fold((l){
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }, (r)async{
      response.value=r;
    });

  }


}

