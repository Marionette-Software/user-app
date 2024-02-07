import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:user_app/presentation/constants/colors.dart';

isLightTheme(BuildContext context) {
  return ThemeProvider.controllerOf(context).currentThemeId == '1';
}

AppTheme appThemeLight() {
  return AppTheme(
    id: '1',
    description: 'lightTheme',
    data: ThemeData(
      tooltipTheme: TooltipThemeData(
        textStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.75,
        ),
        verticalOffset: -35,
        decoration: BoxDecoration(
          color: AppColors.toolTipsColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.mainBackgroundDarkColor,
        elevation: 0.0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => const Color(0xFFEC5B42)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(
          AppColors.borderSideColor.withOpacity(0.5),
        ),
        trackColor: MaterialStateProperty.all(
          AppColors.borderSideColor.withOpacity(0.5),
        ),
        thumbVisibility: MaterialStateProperty.all(false),
        radius: const Radius.circular(13),
        thickness: MaterialStateProperty.all(4),
      ),
      scaffoldBackgroundColor: Colors.white,
      dividerColor: const Color(0xFF222B45).withOpacity(0.2),
      tabBarTheme: const TabBarTheme(
        labelColor: Color(0xFF222B45),
      ),
      dividerTheme: DividerThemeData(
        color: const Color(0xFF222B45).withOpacity(0.25),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFF020C15),
        unselectedItemColor: Color(0xFF020C15),
        backgroundColor: Colors.white,
      ),
      dialogBackgroundColor: Colors.white,
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          color: Color(0xFF222B45),
          fontStyle: FontStyle.normal,
        ),
        displayMedium: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.0,
          color: Color(0xFF222B45),
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        headlineMedium: TextStyle(
          color: const Color(0xFF222B45).withOpacity(0.5),
          fontSize: 30,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        titleMedium: const TextStyle(
          fontSize: 20,
          color: Color(0xFF222B45),
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        titleSmall: const TextStyle(
          fontSize: 20,
          color: Color(0xFF222B45),
          letterSpacing: 0.15,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        labelLarge: const TextStyle(
          fontSize: 15,
          color: Color(0xFF222B45),
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        labelMedium: const TextStyle(
          color: Color(0xFF222B45),
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        labelSmall: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Color(0xFF222B45),
          fontFamily: 'Inter',
          fontSize: 10,
          letterSpacing: 0.1,
          fontStyle: FontStyle.normal,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFF222B45),
        selectionColor: Color(0xFFEC5B43),
        selectionHandleColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFFEFEFF4),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF222B45).withOpacity(0.05),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF222B45).withOpacity(0.05),
          ),
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        hoverColor: const Color(0xFFF1EFF4),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFEC5B43),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
          borderSide: const BorderSide(
            color: Color(0xFFF6455D),
            width: 2.0,
          ),
        ),
        hintStyle: TextStyle(
          color: AppColors.darkColorText.withOpacity(0.5),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xFFEC5B43),
      ),
      primaryColor: const Color(0xFF222B45),
      primaryColorLight: const Color(0xFFEC5B43),
      primaryColorDark: const Color(0xFF222B45),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.white.withOpacity(0.25),
            width: 1,
          ),
        ),
        titleTextStyle: const TextStyle(color: Color(0xFF222B45)),
        contentTextStyle: const TextStyle(color: Color(0xFF222B45)),
      ),
      colorScheme: const ColorScheme(
        background: Colors.transparent,
        error: Color(0xFFF6455D),
        brightness: Brightness.light,
        onBackground: Colors.transparent,
        onError: Color(0xFFF6455D),
        onPrimary: AppColors.whiteColor,
        primary: AppColors.whiteColor,
        onSecondary: Color(0xFF646977),
        onSurface: Colors.white,
        surface: Colors.white,
        secondary: Colors.white,
      ),
    ),
  );
}

AppTheme appThemeDark() {
  return AppTheme(
    id: '2',
    description: 'darkTheme',
    data: ThemeData(
      tooltipTheme: TooltipThemeData(
        textStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.75,
        ),
        verticalOffset: -35,
        decoration: BoxDecoration(
          color: AppColors.toolTipsColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.mainBackgroundDarkColor,
        elevation: 0.0,
      ),
      dividerColor: const Color(0xFF222B45).withOpacity(0.2),
      tabBarTheme: const TabBarTheme(
        labelColor: Color(0xFF222B45),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(
          AppColors.scrollColorDark,
        ),
        trackColor: MaterialStateProperty.all(
          AppColors.scrollColorDark,
        ),
        thumbVisibility: MaterialStateProperty.all(false),
        radius: const Radius.circular(13),
        thickness: MaterialStateProperty.all(4),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFF020C15),
        unselectedItemColor: Color(0xFF020C15),
        backgroundColor: Color(0xFF020C15),
      ),
      dividerTheme: DividerThemeData(color: Colors.white.withOpacity(0.25)),
      scaffoldBackgroundColor: const Color(0xFF020C15),
      dialogTheme: DialogTheme(
        backgroundColor: const Color(0xFF020C15).withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: AppColors.whiteColor.withOpacity(0.25),
            width: 1,
          ),
        ),
        titleTextStyle: const TextStyle(color: Colors.white),
        contentTextStyle: const TextStyle(color: Colors.white),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white.withOpacity(0.25),
        selectionColor: const Color(0xFFEC5B43),
        selectionHandleColor: Colors.white,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.whiteColor.withOpacity(0),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          color: AppColors.whiteColor,
          fontStyle: FontStyle.normal,
        ),
        displayMedium: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
          letterSpacing: 0.0,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        headlineMedium: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 30,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          color: AppColors.whiteColor,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        labelLarge: TextStyle(
          fontSize: 15,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        labelMedium: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
        ),
        labelSmall: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor,
          fontFamily: 'Inter',
          fontSize: 10,
          letterSpacing: 0.1,
          fontStyle: FontStyle.normal,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => const Color(0xFFEC5B42)),
        overlayColor: null,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
      )),
      cardTheme: CardTheme(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
        ),
        fillColor: const Color(0xFF273038),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.whiteColor.withOpacity(0.25),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.whiteColor.withOpacity(0.25),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        hoverColor: const Color(0xFF222A33).withOpacity(0.25),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFEC5B43),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: const BorderSide(
            color: Color(0xFFF6455D),
            width: 2.0,
          ),
        ),
        hintStyle: TextStyle(
          color: AppColors.whiteColor.withOpacity(0.25),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xFFEC5B42),
      ),
      primaryColor: AppColors.whiteColor,
      primaryColorLight: const Color(0xFFEC5B43),
      colorScheme: const ColorScheme(
        background: Color(0xFF020C15),
        error: Color(0xFFF6455D),
        brightness: Brightness.dark,
        onBackground: Color(0xFF040A2D),
        onError: Color(0xFFF6455D),
        onPrimary: AppColors.whiteColor,
        primary: AppColors.whiteColor,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        surface: Colors.white,
        secondary: Color(0xFF1E2026),
      ),
    ),
  );
}
