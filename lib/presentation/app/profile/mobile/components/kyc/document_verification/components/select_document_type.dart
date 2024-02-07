import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/documents_state_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SelectDocumentTypeMobile extends HookConsumerWidget {
  const SelectDocumentTypeMobile({
    required this.documentTypeController,
    super.key,
  });

  final TextEditingController documentTypeController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentsState = ref.read(kycDocumentsStateNotifierProvider.notifier);
    final documents = ref.watch(kycDocumentsStateNotifierProvider);

    List categoryDropDownList = [
      tr('profile.passport'),
      tr('profile.driver_license'),
      tr('profile.utility_bill'),
    ];
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isLightTheme(context)
                ? Theme.of(context).primaryColor.withOpacity(0.05)
                : AppColors.whiteColor.withOpacity(0.25),
            width: 5..h,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 14..h),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            dropdownColor: isLightTheme(context)
                ? AppColors.mainBackgroundLightColor
                : AppColors.mainBackgroundDarkColor,
            borderRadius: BorderRadius.circular(25.r),
            isDense: true,
            isExpanded: true,
            icon: Icon(
              Icons.expand_more,
              color: Theme.of(context).primaryColor,
            ),
            hint: Text(
              tr('profile.select_document_type'),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    letterSpacing: -0.75.sp,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
            ),
            value:
                documents.documentType.isEmpty ? null : documents.documentType,
            onChanged: (value) {
              documentTypeController.text = value!;
              documentsState.updateDocumentType(value);
            },
            items: categoryDropDownList.map<DropdownMenuItem<String>>(
              (value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    height: 58..h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value.toString(),
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Inter',
                                    letterSpacing: -0.75.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
