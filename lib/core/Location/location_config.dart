
import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

import '../config/util/text_style.dart';

class LocationConfig{

  Position? possition;
  LocationPermission? permission;
  List<Position>? locations = <Position>[];

  Future<List<double>> getCureentLocation()async{
    Logger().w("click");
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if(Platform.isIOS){
        permission = await Geolocator.requestPermission();
      }else{
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }else{
      // getCureentLocation();
    }

    var possition =Platform.isAndroid?
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low):
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    Logger().i(possition.latitude);

    return [possition.latitude,possition.longitude];




  }


}