import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihb/features/Home/data/models/repository_response_model.dart';
import 'package:ihb/features/issue/data/models/issue_model.dart';
import 'package:ihb/features/issue/data/models/issues_response_model.dart';
import 'package:logger/logger.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class HomeRemoteSource {

Future<RepositoryResponseModel?> searchRepository(String page,search);
Future<IssueResponseModel?> searchRepositoryIssue(String page,search);

// Future<LoginResponseModel?> login(String email,String deviceToken, String pass, bool isPg);

}


class HomeRemoteSourceImpl implements HomeRemoteSource {
    final ApiMethod apiMethod;
   HomeRemoteSourceImpl({required this.apiMethod});

  @override
  Future<RepositoryResponseModel?> searchRepository(String page,search) async{
    // TODO: implement searchRepository
  try{
    final result =await apiMethod.get(url: ApiEndpoint.SEARCH_REPOSITORY+"${search}&page=${page}&per_page=20",showResult: true,isBasic: true,duration: 30);
    return RepositoryResponseModel.fromJson(result);
  }catch (e) {
    throw ServerException(e.toString());
  }
  }

  @override
  Future<IssueResponseModel?> searchRepositoryIssue(String page, search)async {
    // TODO: implement searchRepositoryIssue
    try{
      final result =await apiMethod.get(url: ApiEndpoint.SEARCH_REPOSITORY_ISSUE+"${search}/issues?page=${page}&per_page=20",showResult: true,isBasic: true,duration: 30);
      List<IssueModel> posts = List<IssueModel>.from(result.map((model)=> IssueModel.fromJson(model)));
      return IssueResponseModel(0, false, posts);
    }catch (e) {
    throw ServerException(e.toString());
  }
  }

// @override
// Future<LoginResponseModel?> login(String email,String deviceToken, String pass, bool isPg)async {
//
//   Map<String, dynamic> data = {
//   "email":email,
//   "password":pass,
//   "isPG":isPg,
//   "mobileToken":deviceToken
//   };
//   try{
//     final result =await apiMethod.post(url: ApiEndpoint.LOGIN,body: data,showResult: true,isBasic: true,duration: 30);
//     return LoginResponseModel.fromJson(result);
//   }catch (e) {
//     throw ServerException(e.toString());
//   }
// }
}
