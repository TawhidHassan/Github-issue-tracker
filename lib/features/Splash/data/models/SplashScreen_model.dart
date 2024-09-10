import 'package:json_annotation/json_annotation.dart';


part 'SplashScreen_model.g.dart';

@JsonSerializable()
class SplashScreenModel  {


  int? user;
  String? status;


  SplashScreenModel(this.user,this.status);

  factory SplashScreenModel.fromJson(Map<String, dynamic> json) => _$SplashScreenModelFromJson(json);

  Map<String, dynamic> toJson() => _$SplashScreenModelToJson(this);
}