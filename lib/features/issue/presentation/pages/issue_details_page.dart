import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ihb/core/common/widgets/loading/loader.dart';
import 'package:ihb/features/issue/data/models/issue_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import '../controller/issue_controller.dart';

class IssueDetailsPage extends StatelessWidget {
  final IssueModel? issueModel;

  const IssueDetailsPage({super.key, this.issueModel});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<IssueController>().getIssueDetails(
          issueModel!.url!.split("/repos/")[1]);
    });
    return Scaffold(
      backgroundColor: const Color(0xff333333),
      appBar: AppBar(
        backgroundColor: const Color(0xff333333),
        centerTitle: false,
        title: Text("Issue Details", style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.bold
        ),
        ),
      ),
      body: GetBuilder<IssueController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return controller.issueDetailsLoading.value?
            Loader():
            Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///basic info
                    Text(controller!.detailsResponse!.value!.title ?? "", style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6,),
                    Row(
                      children: [
                        Text(controller!.detailsResponse!.value!.repositoryUrl!.split("/repos/")[1] ?? "", style: GoogleFonts.roboto(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 12,),
                        Container(
                          margin: const EdgeInsets.only(left: 0),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              top: 2, left: 8, right: 8, bottom: 2),
                          decoration: BoxDecoration(
                              color: const Color(0xff515050),
                              borderRadius: BorderRadius.circular(26.r)
                          ),

                          child: Text(controller!.detailsResponse!.value!.state??"", style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),),
                        )
                      ],
                    ),
                    SizedBox(height: 6,),
                    Text(controller!.detailsResponse!.value!.repositoryUrl ?? "", style: GoogleFonts.roboto(
                        color: Colors.blueAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 12,),
                    ///user
                    Row(
                      children: [
                        CachedNetworkImage(
                            imageUrl: controller!.detailsResponse!.value!.user!.avatarUrl??"",
                            // imageUrl: ApiEndpoint.imageBaseUrl+controller.response.value!.myProfile!.image!,
                            imageBuilder: (context, imageProvider) =>
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover
                                    ),

                                  ),
                                  alignment: Alignment.topLeft,
                                ),
                            placeholder: (context, url) =>
                            const CircularProgressIndicator(

                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error)

                        ),

                        SizedBox(width: 12,),

                        /// --------------user name ------------------
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller!.detailsResponse!.value!.user!.login??"", style: GoogleFonts.sourceSans3(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),),
                            Text(DateFormat('yyyy-MM-dd hh:mm:a').format(controller!.detailsResponse!.value!.createdAt!), style: GoogleFonts.sourceSans3(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),),
                          ],
                        ),
                        SizedBox(height: 6.h,),
                      ],
                    ),
                    SizedBox(height: 12,),
                    ///Body
                    Text(controller!.detailsResponse!.value!.body ?? "", style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12,),

                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
