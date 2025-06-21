import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/app_button.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/extensions/navigation.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_assets.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/core/resources/constants.dart';
import 'package:home_decor/src/core/services/routing/routes.dart';
import 'package:home_decor/src/core/services/shared_pref_helper.dart';
import 'package:home_decor/src/features/onboarding/data/models/onboadring_model.dart';
import 'package:home_decor/src/features/onboarding/presentation/widgets/onboarding_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController();
  int currentPage = 0;

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void goToNextPage() {
    if (currentPage < 4 - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    } else {
      finishOnboarding();
    }
  }

  void finishOnboarding() async {
    await storesOnboardingDone();
    context.pushReplacementNamed(
      Routes.loginPage,
    );
  }

  Future<void> storesOnboardingDone() async {
    await SharedPrefHelper.setData(SharedPrefKeys.isOnboardingDone, true);
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingModel> onboardingData = [
      OnboardingModel(
        image: AppAssets.onboarding1,
        title: context.l10n.onboardingOneTitle,
        description: context.l10n.onboardingOneDescription,
      ),
      OnboardingModel(
        image: AppAssets.onboarding2,
        title: context.l10n.onboardingTwoTitle,
        description: context.l10n.onboardingTwoDescription,
      ),
      OnboardingModel(
        image: AppAssets.onboarding3,
        title: context.l10n.onboardingThreeTitle,
        description: context.l10n.onboardingThreeDescription,
      ),
      OnboardingModel(
        image: AppAssets.onboarding4,
        title: context.l10n.onboardingFourTitle,
        description: context.l10n.onboardingFourDescription,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingData.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return OnboardingWidget(
                  imagePath: data.image,
                  title: data.title,
                  description: data.description,
                  onSkipPressed: finishOnboarding,
                  currentPage: currentPage,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.screenHeight * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPageIndicator(),
                AppElevatedButton(
                  onPressed: goToNextPage,
                  text: onboardingData.length - 1 == currentPage
                      ? context.l10n.getStarted
                      : context.l10n.next,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 4; i++) {
      indicators.add(
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          width: currentPage == i ? 30.0 : 8.0,
          decoration: BoxDecoration(
            color: currentPage == i ? AppColors.melon : AppColors.darkVanilla,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      );
    }
    return Row(children: indicators);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
