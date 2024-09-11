import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ihb/core/common/widgets/loading/loader.dart';
import 'package:logger/logger.dart';
import '../../../../core/common/widgets/text field/search_bar.dart';
import '../controller/Home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/repo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      Get.find<HomeController>().searchRepository(search: "Flutter", pagex: "1");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

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
                  Text("Repository List", style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400
                  ),),
                ],
              ),
            ),

            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Search(
                      onSubmit: (text){
                        if(text==""){
                          controller.searchRepository(search: "Flutter", pagex: "1");
                        }else{
                          controller.searchRepository(search: text, pagex: "1");
                        }
                      },

                    ),
                  ),
                ),
                Expanded(
                  flex: 12,
                  child:controller.loading.value?
                  Loader():
                  ListView.builder(
                    controller: controller.controller,
                      itemCount: controller.list.length+
                          (controller.pagingCirculer.value ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < controller.list.length) {
                          return RepoCard(
                            repositoryModel: controller.list[index],
                          );
                        }else{
                          Timer(const Duration(milliseconds: 30), () {
                            controller.controller!
                                .jumpTo(controller.controller!.position
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