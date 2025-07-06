import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/colors_manger.dart';
import 'package:movie/presentation/main_layout/tabs/home/widget/movie_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      ImagesManger.movie,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorsManger.dark.withOpacity(0.8),
                            ColorsManger.dark.withOpacity(0.6),
                            ColorsManger.dark.withOpacity(1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.6, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          ImagesManger.availableNow,
                          height: 80.h,
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: 300.h,
                          child: CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, realIndex) {
                              return MovieItem();
                            },
                            options: CarouselOptions(
                              autoPlay: false,
                              enlargeCenterPage: true,
                              viewportFraction: 0.55,
                              aspectRatio: 1 / 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Image.asset(
              ImagesManger.watchNow,
              height: 80.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    'Action',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See More",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 16.sp),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: ColorsManger.yellow,
                    size: 16,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 250.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: MovieItem(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
