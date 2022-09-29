import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/rating_reviews/widget/rating_container.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class RatingsReviews extends StatefulWidget {
  const RatingsReviews({Key? key}) : super(key: key);

  @override
  State<RatingsReviews> createState() => _RatingsReviewsState();
}

class _RatingsReviewsState extends State<RatingsReviews> {
  var rate = 0.0;
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.RATINGS_REVIEWS_OPTION_TEXT,
      child: CustomMainContainer(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 0.01.sh),
          //----------------Tating Main Text----------------
          ratingMainTextWidget(),
          //----------------Rating Bar----------------
          ratingBarWidget(),
          //----------------Reviews Area----------------
          reviewsAreaWidget(),
          //----------------Rating List----------------
          ratingListWidget(),
        ]),
      ),
    );
  }

  Widget ratingMainTextWidget() {
    return CustomText(
        maintext: rate.toString(),
        is_alignLeft: false,
        fontsize: 35.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.PURPLE_COLOR);
  }

  Widget ratingBarWidget() {
    return RatingBar.builder(
        initialRating: 0,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
        itemBuilder: (context, _) =>
            const Icon(Icons.star_rate_rounded, color: Colors.amber),
        onRatingUpdate: (rating) {
          setState(() {
            rate = rating;
          });
        });
  }

  Widget reviewsAreaWidget() {
    return CustomText(
        maintext: AppStrings.BASED_ON_34_REVIEWS_TEXT,
        is_alignLeft: false,
        fontsize: 18.sp);
  }

  Widget ratingListWidget() {
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: AppStrings.RATING_LIST.length,
          itemBuilder: (BuildContext context, int index) {
            return RatingContainer(
              firstText: AppStrings.RATING_LIST[index],
            );
          }),
    );
  }
}
