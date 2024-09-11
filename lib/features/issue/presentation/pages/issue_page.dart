import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ihb/features/issue/presentation/controller/issue_controller.dart';
import 'package:logger/logger.dart';

import '../../../../core/common/widgets/loading/loader.dart';
import '../../../../core/common/widgets/text field/search_bar.dart';
import '../../../../core/config/color/app_colors.dart';
import '../widget/issue_widget.dart';




class IssuePage extends StatelessWidget {
  const IssuePage({super.key,});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<IssueController>().searchIssue(search: "Flutter", pagex: "1");
    });
    return GetBuilder<IssueController>(
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
                      Text("Issue List", style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold
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
                            onSubmit: (text){
                              controller.searchIssue(search: text, pagex: "1");                      },

                          ),
                        ),

                        SizedBox(width: 12,),
                        ChoiceChip(
                          label: Text('Flutter'),
                          selected:controller.issueFilterSelected.value,
                          onSelected: (bool selected) {
                            controller.issueFilterSelected.value=selected;
                            if(selected){
                              controller.filterIssueList.removeWhere((test)=>test.title!.contains("flutter"));
                              controller.filterIssueList.removeWhere((test)=>test.title!.contains("Flutter"));
                              controller.filterIssueList.removeWhere((test)=>test.title!.contains("FLUTTER"));
                            }else{
                              Get.find<IssueController>().searchIssue(search: "Flutter", pagex: "1");
                            }
                            Logger().w(controller.filterIssueList.length);

                            controller.update();

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
                  controller.issueList.isEmpty?
                  Text("There has no data",style: TextStyle(color: AppColors.primarySlate25),):
                  ListView.builder(
                      controller: controller.issueController,
                      itemCount: controller.issueList.length+
                          (controller.issuePagingCirculer.value ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < controller.issueList.length) {
                          return IssueCard(
                            issueModel: controller.issueList[index],
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
