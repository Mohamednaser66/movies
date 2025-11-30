import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors_manger.dart';
import '../../../core/widget/custom_elvated_button.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.title,
     this.discription,
    required this.onClickFristButton,
    required this.titleInFristButton,
    this.titleInSecoundButton,
    this.onClickSecoundButton,
  });

  final String title;
  final String ?discription;
  final String titleInFristButton;
  final String? titleInSecoundButton;
  final VoidCallback onClickFristButton;
  final VoidCallback? onClickSecoundButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      decoration: BoxDecoration(
        color: ColorsManger.dark,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height:32.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 17.h),
            Text(
              discription??'',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16.h),
            CustomElevatedButton(
              title: titleInFristButton,
              onClick: onClickFristButton,
            ),
            SizedBox(height: 16.h),
            if (titleInSecoundButton != null && onClickSecoundButton != null)
              InkWell(
                onTap: onClickSecoundButton,
                child: Container(
                  alignment: Alignment.center,
                  // width: double.infinity,
                  padding: REdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border:
                          Border.all(width: 2.w, color: ColorsManger.yellow)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        titleInSecoundButton!,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: ColorsManger.yellow,
                                fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 16.h),

          ],
        ),
      ),
    );
  }
}
