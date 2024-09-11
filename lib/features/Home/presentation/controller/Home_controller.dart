
import 'package:get/get.dart';
import 'package:ihb/features/Home/data/models/repository_model.dart';
import 'package:ihb/features/Home/data/models/repository_response_model.dart';
import 'package:ihb/features/issue/data/models/issue_model.dart';
import 'package:ihb/features/issue/data/models/issues_response_model.dart';
import 'package:logger/logger.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repositories/Home_repository.dart';
import '../../domain/usecase/Home_use_case.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomeController extends GetxController implements GetxService{
  final HomeUseCase? homeUseCase;
  HomeController({this.homeUseCase });


  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    issueController.dispose();
    super.dispose();
  }

  Rx<RepositoryResponseModel?> response=Rx<RepositoryResponseModel?>(null);
  final loading=false.obs;
  final pagingCirculer=false.obs;
  List<RepositoryModel> list = [];
  ScrollController? controller;
  int listLength = 10;
  int page = 1;
  String? searchText="";

  addItems() async {
    Logger().e(searchText);
    controller!.addListener(() {
      if (controller!.position.maxScrollExtent == controller!.position.pixels) {
        listLength++;
        page++;
        getPagingData(page: page.toString());
        update();
      }
    });
  }

  Future searchRepository({String? search, String? pagex})async {
    loading.value=true;
    response.value=null;
    controller= ScrollController();
    list.clear();
    page=1;
    searchText=search;
    addItems();
    Logger().i(searchText);
    var res=await homeUseCase!.searchRepository(pagex??'1',searchText??'');
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
      for(var i=0;i<r.items!.length;i++){
        list.add(r.items![i]);
      }
    });
    update();
  }

  getPagingData({String? page}) async{
    Logger().d(searchText??"");
    pagingCirculer.value=true;
    var res=await homeUseCase?.searchRepository(
        page??'1',
        searchText??""
    );
    res!.fold((l){
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
      for(var i=0;i<r.items!.length;i++){
        list.add(r.items![i]);
      }
      pagingCirculer.value=false;
      update();
      Logger().w(list.length);

    });

  }



  ///===================repository issue search======================////


  Rx<IssueResponseModel?> responseIssue=Rx<IssueResponseModel?>(null);
  final issueLoading=false.obs;
  final issuePagingCirculer=false.obs;
  List<IssueModel> issueList = [];
  ScrollController issueController = ScrollController();
  int issueListLength = 10;
  int issuePage = 1;
  String? issueSearchText="";

  addIssueItems() async {
    issueController.addListener(() {
      if (issueController.position.maxScrollExtent == issueController.position.pixels) {
        issueListLength++;
        issuePage++;
        getIssuePagingData(page: issuePage.toString());
        update();
      }
    });
  }

  Future searchRepositoryIssue({String? search, String? pagex})async {
    issueLoading.value=true;
    responseIssue.value=null;

    issueList.clear();
    issuePage=1;
    issueSearchText=search;
    addIssueItems();
    var res=await homeUseCase!.searchRepositoryIssue(pagex??'1',issueSearchText??'');
    issueLoading.value=false;
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
      responseIssue.value=r;
      for(var i=0;i<r.items!.length;i++){
        issueList.add(r.items![i]);
      }
    });
    update();
  }

  getIssuePagingData({String? page}) async{
    issuePagingCirculer.value=true;
    var res=await homeUseCase?.searchRepositoryIssue(
        page??'1',
        issueSearchText??""
    );
    res!.fold((l){
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
      for(var i=0;i<r.items!.length;i++){
        issueList.add(r.items![i]);
      }
      issuePagingCirculer.value=false;
      update();
      Logger().w(issueList.length);

    });

  }






}

