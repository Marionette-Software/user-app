import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:user_app/application/controller/get_design_size_provided.dart';
import 'package:user_app/application/global_data/actions/global_actions.dart';
import 'package:user_app/domain/constants/constants.dart';
import 'package:user_app/domain/global_config/global_config_data.dart';
import 'package:user_app/domain/navigation_bar/bottom_navigation_index.dart';
import 'package:user_app/domain/non_custodial_exchange/stepper_progress.dart';
import 'package:user_app/domain/user_config/user_config_data.dart';
import 'package:user_app/go_rout.dart';
import 'package:user_app/presentation/constants/app_info.dart';
import 'package:user_app/presentation/helpers/capitalize.dart';
import 'package:user_app/presentation/helpers/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(
    GlobalConfigDataAdapter(),
    override: true,
  );
  Hive.registerAdapter(StepperProgressAdapter());
  Hive.registerAdapter(UserConfigDataAdapter());
  Hive.registerAdapter(BottomNavigationIndexDataAdapter());
  Paint.enableDithering = true;

// if (!kIsWeb) {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   }
  final IGlobalActionsInterface globalActionsInterface = GlobalActionsGeneral();
  await globalActionsInterface.readGlobalConfig();

  var nonCustodialBox = await Hive.openBox('nonCustodialBox');
  StepperProgress stepperProgress = StepperProgress(
    authenticated: null,
    isWalletConnect: null,
  );
  nonCustodialBox.add(stepperProgress);

  var bottomNavigationIndex = await Hive.openBox<BottomNavigationIndexData>(
    Constants.bottomNavigationIndex,
  );
  bottomNavigationIndex.add(
    BottomNavigationIndexData(selectedIndex: 0),
  );

  var ubox = await Hive.openBox<UserConfigData>(Constants.userConfig);
  if (ubox.length == 0) {
    var data = UserConfigData(
      userId: null,
      token: null,
      selectedMarketId: null,
      userName: null,
    );
    ubox.add(data);
  }

  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/lang',
      child: const UserApp(),
    ),
  );
}

class UserApp extends StatelessWidget {
  const UserApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String? savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          Brightness platformBrightness =
              SchedulerBinding.instance.window.platformBrightness;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('1');
          } else {
            controller.setTheme('2');
          }
          controller.forgetSavedTheme();
        }
      },
      themes: <AppTheme>[appThemeDark(), appThemeLight()],
      child: ProviderScope(
        child: ThemeConsumer(
          child: Consumer(
            builder: (context, ref, _) {
              return ScreenUtilInit(
                designSize: ref.watch(
                    getDesignSizeProvider(MediaQuery.sizeOf(context).width)),
                fontSizeResolver: MediaQuery.sizeOf(context).width > 600
                    ? FontSizeResolvers.height
                    : FontSizeResolvers.width,
                minTextAdapt: false,
                splitScreenMode: true,
                builder: (context, child) {
                  return MaterialApp.router(
                    locale: context.locale,
                    supportedLocales: context.supportedLocales,
                    localizationsDelegates: context.localizationDelegates,
                    title: appName,
                    themeAnimationDuration: const Duration(seconds: 0),
                    debugShowCheckedModeBanner: false,
                    theme: ThemeProvider.themeOf(context).data,
                    routerConfig: goRoutes,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
