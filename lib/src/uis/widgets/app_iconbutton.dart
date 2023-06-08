import 'package:flutter/material.dart';
import 'package:iverify/src/resources/color_manager.dart';
import 'package:iverify/src/resources/value_manager.dart';

class AppIconbutton extends StatelessWidget {
  final Function()? onTap;
  const AppIconbutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: AppHeight.h50,
        width: AppHeight.h50,
        decoration: BoxDecoration(
          color: ColorManager.textColor,
          borderRadius: BorderRadius.circular(AppRadius.r100),
        ),
        child: Center(
          child: Icon(Icons.add,
              color: ColorManager.scaffoldBg, size: AppSize.s30),
        ),
      ),
    );
  }
}

// Padding(
//               padding:
//                   EdgeInsets.only(bottom: AppPadding.p70, right: AppPadding.p8),
//               child: Container(
//                 height: AppHeight.h45,
//                 width: AppWidth.w45,
//                 decoration: const BoxDecoration(
//                   color: ColorManager.textColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   padding: EdgeInsets.zero,
//                   onPressed: () {
//                     AppRoutes.pushNamed(context,
//                         name: AppRoutes.addDocumentScreen);
//                   },
//                   icon: const Icon(Icons.add, color: ColorManager.scaffoldBg),
//                 ),
//               ),
//             ),
