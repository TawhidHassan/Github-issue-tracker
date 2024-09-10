import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
    context.goNamed(Routes.mainPage);
      // context.pushNamed(Routes.loginPagePath);
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //--------------------------------------app logo
            SizedBox(),
            Text("Github Issue Tracker",style: boldText(24,color: Colors.blueGrey),),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Powered by', style: robotoMedium.copyWith(
                    color: AppColors.primarySlate500,
                    fontSize: 16.sp
                ),),

                //-------------------------------------bsrm logo
                Container(
                    alignment: Alignment.center,
                    child: Text("Sifat hasan")
                ),
                SizedBox(height: 12,)

              ],
            ),
          ],
        ),
      )
    );
  }
}
