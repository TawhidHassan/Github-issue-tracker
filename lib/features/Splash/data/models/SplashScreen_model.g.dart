// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SplashScreen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplashScreenModel _$SplashScreenModelFromJson(Map<String, dynamic> json) =>
    SplashScreenModel(
      (json['user'] as num?)?.toInt(),
      json['status'] as String?,
    );

Map<String, dynamic> _$SplashScreenModelToJson(SplashScreenModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'status': instance.status,
    };
