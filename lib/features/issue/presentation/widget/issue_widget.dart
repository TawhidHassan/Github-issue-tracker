import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ihb/features/Home/data/models/repository_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ihb/features/issue/data/models/issue_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/routes/route_path.dart';


class IssueCard extends StatelessWidget {
  final IssueModel? issueModel;
  const IssueCard({super.key, this.issueModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.issuesDetailsPage,extra:issueModel );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 16.w, vertical: 12),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color(0xff404040)
                )
            )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// -----------commit and time--------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    maxLines: 10,
                    issueModel!.title??'',
                    style: GoogleFonts.sourceSans3(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400
                    ),),
                ),

                Text(
                  DateFormat('yyyy-MM-dd hh:mm:a').format(issueModel!.createdAt!),
                  style: GoogleFonts.sourceCodePro(
                      color: const Color(0xffB8B8B8),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400
                  ),),
              ],
            ),
            SizedBox(height: 4.h,),
            Row(
              children: [
                Text(
                  maxLines: 10,
                  issueModel!.repositoryUrl!.split("/repos/")[1],
                  style: GoogleFonts.sourceSans3(
                      color: Colors.white70,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400
                  ),),
                SizedBox(width: 6,),
                Container(
                  margin: const EdgeInsets.only(left: 0),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                      top: 2, left: 8, right: 8, bottom: 2),
                  decoration: BoxDecoration(
                      color: const Color(0xff515050),
                      borderRadius: BorderRadius.circular(26.r)
                  ),

                  child: Text(issueModel!.state??"", style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                  ),),
                )
              ],
            ),
            SizedBox(height: 8.h,),

            /// -----------user image and name--------------
            Row(
              children: [
                CachedNetworkImage(
                    imageUrl:  issueModel!.user!.avatarUrl??'',
                    // imageUrl: ApiEndpoint.imageBaseUrl+controller.response.value!.myProfile!.image!,
                    imageBuilder: (context,
                        imageProvider) =>
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill
                            ),

                          ),
                          alignment: Alignment.topLeft,
                        ),
                    placeholder: (context, url) =>
                        SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            )),
                    errorWidget: (context, url,
                        error) => const Icon(Icons.error)

                ),

                SizedBox(width: 8.w,),

                Text(issueModel!.user!.login??"",
                  style: GoogleFonts.sourceCodePro(
                      color: const Color(0xff9B9B9B),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400
                  ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
