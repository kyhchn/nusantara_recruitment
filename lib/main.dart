import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusantara_recruitment/app/core/theme/colors.dart';
import 'package:nusantara_recruitment/app/core/theme/typography.dart';
import 'package:nusantara_recruitment/app/core/utils/injection.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection();
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) => GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorSchemeSeed: CustomColor.primary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            titleLarge: TypographyStyles.h1.bold(),
            titleMedium: TypographyStyles.h2.bold(),
            titleSmall: TypographyStyles.h3.bold(),
            bodyLarge: TypographyStyles.b1,
            bodyMedium: TypographyStyles.b2,
            bodySmall: TypographyStyles.b3,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: CustomColor.primary,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                textStyle:
                    TypographyStyles.b3.semibold(color: CustomColor.primary)),
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: CustomColor.primary.shade300),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: CustomColor.primary.shade300),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red.shade300),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.red.shade300),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            contentPadding: const EdgeInsets.all(12),
            prefixIconColor: CustomColor.primary,
            hintStyle: TypographyStyles.b3.semibold(
              color: Colors.grey.shade600,
            ),
          ),
          appBarTheme: AppBarTheme(
            actionsIconTheme: const IconThemeData(
              size: 24,
              color: Colors.white,
            ),
            backgroundColor: CustomColor.primary.shade500,
            foregroundColor: Colors.white,
            titleTextStyle: TypographyStyles.h3.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: false,
            elevation: 0,
            titleSpacing: 0,
          ),
        ),
      ),
    ),
  );
}
