
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../data/models/issue_model.dart';
import '../../data/models/issues_response_model.dart';
import '../../domain/usecase/issue_use_case.dart';
import 'package:flutter/material.dart';


class IssueController extends GetxController implements GetxService{
 final IssueUseCase? issueUseCase;
  IssueController({ this.issueUseCase });


 ///===================repository issue search======================////


 Rx<IssueResponseModel?> responseIssue=Rx<IssueResponseModel?>(null);
 final issueFilterSelected=false.obs;
 List<IssueModel> filterIssueList = [];
 final issueLoading=false.obs;
 final issuePagingCirculer=false.obs;
 List<IssueModel> issueList = [];
 ScrollController? issueController;
 int issueListLength = 10;
 int issuePage = 1;
 String? issueSearchText="";

 addIssueItems() async {
  issueController!.addListener(() {
   if (issueController!.position.maxScrollExtent == issueController!.position.pixels) {
    issueListLength++;
    issuePage++;
    getIssuePagingData(page: issuePage.toString());
    update();
   }
  });
 }

 Future searchIssue({String? search, String? pagex})async {

  issueLoading.value=true;
  responseIssue.value=null;
  issueList.clear();
  filterIssueList.clear();
  issueController = ScrollController();
  issuePage=1;
  issueSearchText=search;
  addIssueItems();
  var res=await issueUseCase!.searchIssue(pagex??'1',issueSearchText??'');
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
  filterIssueList=issueList;
  if(issueFilterSelected.value){
   filterIssueList.removeWhere((test)=>test.title!.contains("flutter"));
   filterIssueList.removeWhere((test)=>test.title!.contains("Flutter"));
   filterIssueList.removeWhere((test)=>test.title!.contains("FLUTTER"));
  }
  update();
 }

 getIssuePagingData({String? page}) async{
  issuePagingCirculer.value=true;
  var res=await issueUseCase?.searchIssue(
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
   filterIssueList=issueList;
   Logger().w(filterIssueList.length);
   if(issueFilterSelected.value){
    filterIssueList.removeWhere((test)=>test.title!.contains("flutter"));
    filterIssueList.removeWhere((test)=>test.title!.contains("Flutter"));
    filterIssueList.removeWhere((test)=>test.title!.contains("FLUTTER"));
   }
   update();
   Logger().e(filterIssueList.length);

  });

 }
///================================================


 Rx<IssueModel?> detailsResponse=Rx<IssueModel?>(null);
final issueDetailsLoading=false.obs;
 Future getIssueDetails(String id)async {
  issueDetailsLoading.value=true;
  detailsResponse.value=null;
  var res=await issueUseCase!.getIssueDetails(id);
  issueDetailsLoading.value=false;
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
   detailsResponse.value=r;

  });
  }


}

