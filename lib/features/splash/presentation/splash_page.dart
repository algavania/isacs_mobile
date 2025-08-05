import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/core/styles.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.primary50,
      body: Stack(
        children: [
          Image.asset(
            'assets/onboarding/bg_onboarding.png',
            width: 100.w,
            height: 100.h,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Expanded(
                child: _buildHeading(),
              ),
              _buildBodySection(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: Styles.smallSpacing,
          children: [
            Image.asset(
              'assets/onboarding/img_onboarding_heading.png',
              width: 52,
              height: 52,
            ),
            Text(
              context.l10n.onboardingHeading,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorValues.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodySection() {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.symmetric(
        vertical: Styles.extraLargePadding,
        horizontal: Styles.biggerPadding,
      ),
      decoration: const BoxDecoration(
        color: ColorValues.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Styles.defaultBorder),
          topRight: Radius.circular(Styles.defaultBorder),
        ),
      ),
      child: Column(
        spacing: Styles.extraLargeSpacing,
        children: [
          _buildLogo(),
          _buildFeatureCard(),
          CustomButton(
            onPressed: () {},
            buttonText: context.l10n.enterApp,
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: Styles.mediumSpacing,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        Text(context.l10n.isacs,
            style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }

  Widget _buildFeatureCard() {
    return Container(
      decoration: BoxDecoration(
        color: ColorValues.white,
        borderRadius: BorderRadius.circular(Styles.defaultBorder),
        boxShadow: [
          BoxShadow(
            color: ColorValues.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Styles.defaultBorder),
                topRight: Radius.circular(Styles.defaultBorder),
              ),
              border: Border.all(color: ColorValues.grey05),
              gradient: const LinearGradient(
                colors: [
                  ColorValues.white,
                  ColorValues.primary20,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Styles.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: Styles.largerSpacing,
                children: [
                  Image.asset(
                    'assets/onboarding/img_onboarding_1.png',
                    height: 40,
                  ),
                  Image.asset(
                    'assets/onboarding/img_onboarding_2.png',
                    height: 40,
                  ),
                  Image.asset(
                    'assets/onboarding/img_onboarding_3.png',
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: Styles.defaultPadding,
              horizontal: Styles.contentPadding,
            ),
            child: Column(
              spacing: Styles.biggerSpacing,
              children: [
                _buildFeatureItem(
                  context.l10n.onboardingFeature1,
                  context.l10n.onboardingFeature1Desc,
                  ColorValues.primary50,
                  ColorValues.primary30,
                ),
                _buildFeatureItem(
                  context.l10n.onboardingFeature2,
                  context.l10n.onboardingFeature2Desc,
                  const Color(0xFFF68524),
                  const Color(0xFFFAB67C),
                ),
                _buildFeatureItem(
                  context.l10n.onboardingFeature3,
                  context.l10n.onboardingFeature3Desc,
                  const Color(0xFFFDD037),
                  const Color(0xFFFEE387),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    String title,
    String description,
    Color color1,
    Color color2,
  ) {
    return Row(
      spacing: Styles.defaultSpacing,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color1,
            border: Border.all(color: color2, width: 4),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorValues.grey50,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
