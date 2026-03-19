import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/utils/navigations.dart';
import 'package:bookia/features/place_order/presentation/cubit/place_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class GovernorateBottomSheetWidget extends StatelessWidget {
  const GovernorateBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = PlaceOrderCubit.get(context);
    return BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
      builder: (context, state) {
        if (state is GetGovernoratesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            const Gap(20),
            Text(
              'Select Governorate',
              style: TextStyles.fs20.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            const Divider(color: AppColors.border),
            Expanded(
              child: ListView.separated(
                itemCount: cubit.governorates.length,
                separatorBuilder: (context, index) => const Divider(
                  color: AppColors.border,
                  indent: 20,
                  endIndent: 20,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        cubit.governorates[index].governorateNameEn ?? "",
                        style: TextStyles.fs18,
                      ),
                    ),
                    onTap: () {
                      cubit.governorateController.text =
                          cubit.governorates[index].governorateNameEn ?? "";
                      cubit.selectedGovernorateId =
                          cubit.governorates[index].id;
                      pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
