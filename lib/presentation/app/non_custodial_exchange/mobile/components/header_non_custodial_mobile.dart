import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/application/non_custodial/non_custodial_progress_state_notifier.dart';
import 'package:user_app/domain/non_custodial_exchange/non_custodial_progress_state.dart';
import 'package:user_app/presentation/app/exchange/exchange.dart';

class HeaderNonCustodialMobile extends HookConsumerWidget {
  const HeaderNonCustodialMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(nonCustodialStateProvider);

    return SizedBox(
      height: 68.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: 26.w,
          right: 26.w,
          bottom: 10.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            progress == NonCustodialState.authentication
                ? InkWell(
                    onTap: () {
                      context.go(Exchange.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 15.h,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        SizedBox(
                          width: 35.w,
                          height: 18.h,
                          child: AutoSizeText(
                            tr('non_custodial_exchange.back'),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 15,
                                ),
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
            SizedBox(
              height: 24.h,
              child: AutoSizeText(
                tr('non_custodial_exchange.swap'),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 20,
                    ),
              ),
            ),
            SizedBox(
              width: progress == NonCustodialState.authentication ? 53.w : 0,
            )
          ],
        ),
      ),
    );
  }
}
