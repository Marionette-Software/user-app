import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/presentation/constants/assets_path.dart';

class WalletBannerWeb extends StatelessWidget {
  const WalletBannerWeb({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Container(
      width: 347.w,
      height: 412.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: const DecorationImage(
          image: AssetImage(walletBannerPath),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
