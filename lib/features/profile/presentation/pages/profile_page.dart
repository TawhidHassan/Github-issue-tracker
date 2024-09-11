import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ihb/core/common/widgets/loading/loader.dart';
import 'package:ihb/core/config/color/app_colors.dart';
import 'package:ihb/features/profile/presentation/controller/profile_controller.dart';

import '../../../../core/common/widgets/text field/search_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<ProfileController>().searchUser(search: "TawhidHassan");
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff333333),
        body: GetBuilder<ProfileController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return controller.loading.value?Loader(): Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Search(
                        onSubmit: (text) {
                          controller.searchUser(search: text,);
                        },

                      ),
                    ),
                    SizedBox(height: 48.h,),

                    /// --------------user profile image ------------------
                    controller.response.value==null?
                    Text("There has no user exist",style: TextStyle(color: AppColors.blue300),)
                        :
                    Column(
                      children: [
                        CachedNetworkImage(
                            imageUrl: controller.response.value!.avatarUrl??"",
                            // imageUrl: ApiEndpoint.imageBaseUrl+controller.response.value!.myProfile!.image!,
                            imageBuilder: (context, imageProvider) =>
                                Container(
                                  height: 168.h,
                                  width: 168.w,
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

                        SizedBox(height: 16.h,),

                        /// --------------user name ------------------
                        Text(controller.response.value!.name??"", style: GoogleFonts.sourceSans3(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400
                        ),),
                        SizedBox(height: 6.h,),

                        /// --------------user email ------------------
                        Text(controller.response.value!.bio??"", style: GoogleFonts.sourceSans3(
                            color: const Color(0xffC9C9C9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400
                        ),),
                        SizedBox(height: 16.h,),

                        /// --------------user bio------------------
                        Text(
                          controller.response.value!.location??"", style: GoogleFonts.sourceSans3(
                            color: const Color(0xffC9C9C9),
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400
                        ),),

                        SizedBox(height: 8.h,),

                        /// --------------user public repo ------------------
                        Text("Public Repos: ${controller.response.value!.public_repos}", style: GoogleFonts.sourceSans3(
                            color: const Color(0xffC9C9C9),
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400
                        ),),
                        SizedBox(height: 8.h,),

                        /// -------------- public gits ------------------
                        Text("Public Gits: ${controller.response.value!.public_gists}", style: GoogleFonts.sourceSans3(
                            color: const Color(0xffC9C9C9),
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400
                        ),),
                        SizedBox(height: 8.h,),

                        /// -------------- private repos ------------------
                        Text("followers:  ${controller.response.value!.followers}", style: GoogleFonts.sourceSans3(
                            color: const Color(0xffC9C9C9),
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400
                        ),),
                      ],
                    ),
                  ],
                ),
              );
            });
          },
        ),
      ),
    );
  }
}