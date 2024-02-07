import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/kyc/documents_state_provider.dart';
import 'package:user_app/domain/platform/platform_type_state.dart';
import 'package:user_app/presentation/constants/colors.dart';
import 'package:user_app/presentation/helpers/get_size_from_platform_type.dart';
import 'package:user_app/presentation/helpers/theme.dart';

class SelectDocumentType extends HookConsumerWidget {
  const SelectDocumentType({
    required this.platformType,
    required this.documentTypeController,
    super.key,
  });

  final PlatformTypeState platformType;
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
    return SizedBox(
      height: getSizeFromPlatformType(
        platformType: platformType,
        webValue: 70,
        tabletValue: 60,
        mobileValue: 50,
      ).h,
      child: Container(
        padding: EdgeInsets.only(
          right: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 23,
            tabletValue: 15,
            mobileValue: 11,
          ).w,
          left: getSizeFromPlatformType(
            platformType: platformType,
            webValue: 23,
            tabletValue: 15,
            mobileValue: 11,
          ).w,
        ),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(
            color: isLightTheme(context)
                ? Theme.of(context).primaryColor.withOpacity(0.05)
                : AppColors.whiteColor.withOpacity(0.25),
            width: 1.0,
          ),
          color: Theme.of(context).inputDecorationTheme.fillColor,
          borderRadius: BorderRadius.circular(
            getSizeFromPlatformType(
              platformType: platformType,
              webValue: 10,
              tabletValue: 10,
              mobileValue: 5,
            ).r,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isDense: true,
            isExpanded: true,
            icon: Icon(
              Icons.expand_more,
              color: Theme.of(context).primaryColor,
            ),
            hint: Text(
              tr('profile.select_document_type'),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: getSizeFromPlatformType(
                      platformType: platformType,
                      webValue: 20,
                      tabletValue: 15,
                      mobileValue: 10,
                    ).sp,
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
                  child: Text(
                    value.toString(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: getSizeFromPlatformType(
                            platformType: platformType,
                            webValue: 20,
                            tabletValue: 15,
                            mobileValue: 10,
                          ).sp,
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
