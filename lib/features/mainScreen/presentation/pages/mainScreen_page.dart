import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';

class MainPage extends StatefulWidget {

  const MainPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  void _goBranch(int index, BuildContext context) {
    if (index == 3) {
      Future.delayed(Duration.zero, () {
        // Get.find<CartController>().onInit();
        // Get.find<CartController>().getCartData();
      });
    }

    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }



  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar:


        BottomNavigationBar(
          backgroundColor: AppColors.blackColor,
          showSelectedLabels: true,
          enableFeedback: true,
          iconSize: 32,
          showUnselectedLabels: true,
          currentIndex: widget.navigationShell.currentIndex,
          unselectedLabelStyle: robotoMedium.copyWith(
            fontSize: 12,
            color: AppColors.selectColor,
          ),
          selectedLabelStyle:  robotoMedium.copyWith(
            fontSize: 12,
          ),
          unselectedItemColor:  AppColors.selectColor,
          selectedItemColor: AppColors.primarySlate400,
          // selectedIndex:
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_outlined,color: AppColors.selectColor.withAlpha(100),),
              activeIcon: Icon(Icons.home_outlined,color: AppColors.selectColor)
            ),


            BottomNavigationBarItem(
                label: "Issues",
                icon:Icon(Icons.report_problem_outlined,color: AppColors.selectColor.withAlpha(100),),
                activeIcon: Icon(Icons.report_problem_outlined,color: AppColors.selectColor),

            ),

            BottomNavigationBarItem(
                label: "Profile",
                icon:Icon(Icons.person_outline,color: AppColors.selectColor.withAlpha(100),),
                activeIcon: Icon(Icons.person_outline,color:  AppColors.selectColor),

            ),

            // NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
            // NavigationDestination(label: 'Image Generate', icon: Icon(Icons.image)),
          ],
          // destinations: const [
          //
          // ],
          onTap: (index) => _goBranch(index, context),
          // onDestinationSelected: ,

        )
    );
  }
}





