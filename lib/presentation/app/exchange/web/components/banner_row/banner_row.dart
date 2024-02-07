import 'package:flutter/material.dart';
import 'package:user_app/presentation/app/exchange/web/components/banner_row/components/download_app_banner.dart';
import 'package:user_app/presentation/app/exchange/web/components/banner_row/components/premium_banner.dart';

class BannerRow extends StatelessWidget {
  const BannerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PremiumBanner(),
        DownloadAppBanner(),
      ],
    );
  }
}
