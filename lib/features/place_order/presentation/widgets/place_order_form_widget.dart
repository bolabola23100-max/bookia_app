import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/validators.dart';
import 'package:bookia/core/widgets/inputs/custom_text_form_field.dart';
import 'package:bookia/features/place_order/presentation/cubit/place_order_cubit.dart';
import 'package:bookia/features/place_order/presentation/widgets/governorate_bottom_sheet_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PlaceOrderFormWidget extends StatelessWidget {
  const PlaceOrderFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = PlaceOrderCubit.get(context);
    return Form(
      key: cubit.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'place_your_order'.tr(),
                style: TextStyles.fs30.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'dont_worry_it_occurs'.tr(),
                style: TextStyles.fs16.copyWith(color: AppColors.darkGray),
              ),
            ),
          ),
          const Gap(30),
          CustomTextFormField(
            controller: cubit.nameController,
            hintText: 'full_name'.tr(),
            validator: (value) => Validators().validatorName(value),
          ),
          const Gap(15),
          CustomTextFormField(
            controller: cubit.emailController,
            hintText: 'email'.tr(),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => Validators().validatorEmail(value),
          ),
          const Gap(15),
          CustomTextFormField(
            controller: cubit.addressController,
            hintText: 'address'.tr(),
            validator: (value) => Validators().validatorAddress(value),
          ),
          const Gap(15),
          CustomTextFormField(
            controller: cubit.phoneController,
            hintText: 'phone'.tr(),
            keyboardType: TextInputType.phone,
            validator: (value) => Validators().validatorPhone(value),
          ),
          const Gap(15),
          CustomTextFormField(
            controller: cubit.governorateController,
            hintText: 'governorate'.tr(),
            readOnly: true,
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.darkGray,
            ),
            validator: (value) => Validators().validatorGovernorate(value),
            onTap: () {
              cubit.getGovernorates();
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.bgColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (context) {
                  return BlocProvider.value(
                    value: cubit,
                    child: const GovernorateBottomSheetWidget(),
                  );
                },
              );
            },
          ),
          const Gap(40),
        ],
      ),
    );
  }
}
