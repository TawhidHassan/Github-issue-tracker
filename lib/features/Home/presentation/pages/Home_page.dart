import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/config/color/app_colors.dart';
import '../controller/Home_controller.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<HomeController>(
            builder: (controller) {
              return Column(
                children: [

                  SizedBox(height: 12,),

                ],
              );
            },
          )
      ),
    );
  }
}
