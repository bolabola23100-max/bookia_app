import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/inputs/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

ShowBottomSheet(BuildContext context) {
  return showBottomSheet(
    context: context,
    backgroundColor: AppColors.bgColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Checkout",
                    style: TextStyles.fs20.copyWith(fontSize: 20),
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                ],
              ),

              Divider(),
              SizedBox(height: 18),
              Row(
                children: [
                  Text(
                    "Delivery",
                    style: TextStyles.fs18.copyWith(fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    "Select Method",
                    style: TextStyles.fs18.copyWith(
                      color: AppColors.darkGray,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 5),
                  SvgPicture.asset(AppIcons.back),
                ],
              ),
              Divider(),
              SizedBox(height: 18),
              Row(
                children: [
                  Text(
                    "Payment",
                    style: TextStyles.fs18.copyWith(fontSize: 16),
                  ),
                  Spacer(),
                  // SvgPicture.asset(AppIcons.paymentIcon),
                  SizedBox(width: 5),
                  SvgPicture.asset(AppIcons.back),
                ],
              ),
              Divider(),
              SizedBox(height: 18),

              Row(
                children: [
                  Text(
                    "Promo Code",
                    style: TextStyles.fs18.copyWith(fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    "Pick discount",
                    style: TextStyles.fs18.copyWith(
                      color: AppColors.darkGray,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 5),
                  SvgPicture.asset(AppIcons.back),
                ],
              ),
              Divider(),
              SizedBox(height: 18),

              Row(
                children: [
                  Text(
                    "Total Cost",
                    style: TextStyles.fs18.copyWith(fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    "10.00\$",
                    style: TextStyles.fs18.copyWith(
                      color: AppColors.darkGray,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 5),
                  SvgPicture.asset(AppIcons.back),
                ],
              ),
              Divider(),
              SizedBox(height: 18),
              MainButton(
                onPressed: () {
                  // pushReplacement(context, OrderAccepted());
                },
                text: "Place Order",
              ),
            ],
          ),
        ),
      );
    },
  );
}
