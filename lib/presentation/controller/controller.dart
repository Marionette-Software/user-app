// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hive/hive.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:user_app/application/controller/controller_futer_provider.dart';
// import 'package:user_app/application/controller/controller_state_provider.dart';
// import 'package:user_app/application/controller/get_design_size_provided.dart';
// import 'package:user_app/domain/constants/constants.dart';
// import 'package:user_app/domain/controller/controller_state.dart';
// import 'package:user_app/domain/user_config/user_config_data.dart';

// class Controller extends HookConsumerWidget {
//   const Controller({
//     super.key,
//   });

//   static const routeName = '/controller';

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print('wef wefjwenfklweflnkknlwefnknlkwef');
//     final String selectedPage = ModalRoute.of(context)!.settings.name ?? '';

//     // final controller = ref.read(controllerStateProvider.notifier);
//     final controllerProvider =
//         ref.watch(controllerFutureProvider(selectedPage));

//     // checkUser() async {
//     //   var userConfigBox = Hive.box<UserConfigData>(Constants.userConfig);
//     //   UserConfigData userData = userConfigBox.getAt(0)!;

//     //   if (userData.token != null) {
//     //     controller.state = ControllerState.authorized;
//     //   } else {
//     //     controller.state = ControllerState.unauthorized;
//     //     var uData = UserConfigData(
//     //       userId: null,
//     //       token: null,
//     //       selectedMarketId: null,
//     //       userName: '',
//     //     );
//     //     userConfigBox.add(uData);
//     //   }
//     // }

//     // useEffect(() {
//     //   checkUser();
//     //   return null;
//     // }, []);

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: PreferredSize(
//         preferredSize: Size(double.infinity, 0.h),
//         child: AppBar(
//           automaticallyImplyLeading: false,
//           surfaceTintColor: Colors.transparent,
//           leading: null,
//         ),
//       ),
//       body: ScreenUtilInit(
//         minTextAdapt: false,
//         splitScreenMode: true,
//         fontSizeResolver: MediaQuery.sizeOf(context).width > 600
//             ? FontSizeResolvers.height
//             : FontSizeResolvers.width,
//         designSize: ref.watch(
//           getDesignSizeProvider(MediaQuery.sizeOf(context).width),
//         ),
//         builder: (BuildContext context, Widget? child) {
//           return controllerProvider.when(
//             data: (data) {
//               return data;
//             },
//             error: (error, _) => Container(),
//             loading: () => Container(
//               color: Theme.of(context).colorScheme.background,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
