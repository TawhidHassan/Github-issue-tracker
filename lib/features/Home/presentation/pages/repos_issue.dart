import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ihb/core/config/color/app_colors.dart';
import 'package:ihb/features/Home/data/models/repository_model.dart';
import 'package:logger/logger.dart';

import '../../../../core/common/widgets/loading/loader.dart';
import '../../../../core/common/widgets/text field/search_bar.dart';
import '../../../issue/presentation/widget/issue_widget.dart';
import '../controller/Home_controller.dart';
import '../widget/repo_card.dart';

class ReposIssue extends StatelessWidget {
  final RepositoryModel? repositoryModel;
  ReposIssue({super.key, this.repositoryModel});

  TextEditingController textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<HomeController>().searchRepositoryIssue(search: repositoryModel!.fullName??"", pagex: "1");
    });
    return GetBuilder<HomeController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            backgroundColor: const Color(0xff333333),
            appBar: AppBar(
              backgroundColor: const Color(0xff333333),
              title: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(repositoryModel!.fullName??"", style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold
                      ),),
                      Text("Issue List", style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                  SizedBox(width: 12,),



                ],
              ),
            ),

            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Search(
                            controller: textEditingController,
                            onSubmit: (text){
                              // Get.find<HomeController>().searchRepository(search: text, pagex: "1");
                              if(text==""){
                                Get.find<HomeController>().searchRepositoryIssue(search: repositoryModel!.fullName??"", pagex: "1");
                              }else{
                               controller.filterIssueList.value= controller.issueList.value.where((test)=>test.title!.contains(text)).toList();
                                Logger().i(controller.filterIssueList.value.length);
                                controller.update();
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 12,),
                        ChoiceChip(
                          label: Text('Flutter'),
                          selected:controller.issueFilterSelected.value,
                          onSelected: (bool selected) {
                            controller.issueFilterSelected.value=selected;
                            if(selected){
                              controller.filterIssueList.value.removeWhere((test)=>test.title!.contains("flutter"));
                              controller.filterIssueList.value.removeWhere((test)=>test.title!.contains("Flutter"));
                            }else{
                              textEditingController.text="";
                              controller.filterIssueList.value.clear();
                              for(var i=0;i<controller.issueList.value.length;i++){
                                controller.filterIssueList.value.add(controller.issueList.value[i]);
                              }
                            }


                          },
                        )

                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 12,
                  child:controller.issueLoading.value?
                  Loader():
                  controller.filterIssueList.value.isEmpty?
                      Text("There has no data",style: TextStyle(color: AppColors.primarySlate25),):
                  ListView.builder(
                      controller: controller.issueController,
                      itemCount: controller.filterIssueList.value.length+
                          (controller.issuePagingCirculer.value ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < controller.filterIssueList.value.length) {
                          return IssueCard(
                            issueModel: controller.filterIssueList.value[index],
                          );
                        }else{
                          Timer(const Duration(milliseconds: 30), () {
                            controller.issueController!
                                .jumpTo(controller.issueController!.position
                                .maxScrollExtent);
                          });
                          return const Center(
                            child: CircularProgressIndicator(),);
                        }
                      }),
                )

              ],
            ),
          );
        });
      },
    );
  }
}
