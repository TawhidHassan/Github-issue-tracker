import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/config/color/app_colors.dart';

import '../../../config/util/dimensions.dart';
import '../../../config/util/style.dart';

class Search extends StatelessWidget {
  const Search({super.key,



    this.textColor =  Colors.white,
    this.borderColor = Colors.white,
    this.iconColor  =  Colors.white,
    this.menuColor = Colors.white, this.onTap, this.onSubmit, this.controller,
  });
    final Color ? textColor ;
    final Color ? borderColor ;
    final Color ? iconColor ;
    final Color ? menuColor ;
    final VoidCallback ?onTap;
    final TextEditingController ?controller;
    final void Function(String)? onSubmit;



  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmit!,
      style: TextStyle(
          color: AppColors.primarySlate400
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          filled: true,
          prefixIcon: Icon(Icons.search,color: AppColors.primarySlate400,),
          hintText: "Search",
          hintStyle:robotoMedium.copyWith(
              color: AppColors.primarySlate400,
              fontSize: Dimensions.getFontSizeLarge(context)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide:BorderSide(
                color: borderColor ??  Colors.white.withOpacity(0.25),
              )
          )
      ),

    );
  }
}
