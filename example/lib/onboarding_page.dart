import 'package:country_list_picker_example/controller/settings_provider.dart';
import 'package:country_list_picker_example/translation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/onboarding_provider.dart';
import '../home_page.dart';
import '../app_data.dart';

export '../controller/onboarding_provider.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer2<OnboardingProvider, SettingsProvider>(
        builder: (context, boarding, settings, child) {
          return Column(
            children: [
              Directionality(
                textDirection: settings.textDirection,
                child: Expanded(
                  flex: 3,
                  child: PageView.builder(
                      itemCount: listOnboarding.length,
                      controller: boarding.pageController,
                      onPageChanged: (value) => boarding.currentOnboard = value,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image.asset(
                              //   listOnboarding[index].image,
                              //   width: 200,
                              //   height: 250,
                              // ),
                              const FlutterLogo(size: 250),
                              Text(listOnboarding[index].title.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(fontSize: 25, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              Text(
                                textAlign: TextAlign.center,
                                listOnboarding[index].body.tr,
                                style:
                                    Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Directionality(
                          textDirection: settings.textDirection,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(listOnboarding.length, (index) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 900),
                                  margin: const EdgeInsets.only(right: 10),
                                  width: (boarding.currentOnboard == index) ? 30 : 6,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(10)),
                                );
                              }),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Directionality(
                          textDirection: settings.textDirection,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const HomePage()),
                                  );
                                },
                                child: Text("SKIP".tr,
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (boarding.currentOnboard >= listOnboarding.length - 1) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const HomePage()),
                                    );
                                  } else {
                                    boarding.nextOnboarding();
                                  }
                                },
                                child: boarding.currentOnboard < listOnboarding.length - 1
                                    ? Text("NEXT".tr,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 15))
                                    : Text("FINISH".tr,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () => settings.isDarkMode = !settings.isDarkMode,
                              icon: settings.isDarkMode
                                  ? const Icon(
                                      Icons.sunny,
                                      color: darkprimarySwatch,
                                    )
                                  : const Icon(
                                      Icons.dark_mode,
                                      color: lightprimarySwatch,
                                    ),
                            ),
                            IconButton(
                              onPressed: () {
                                settings.textDirection =
                                    (settings.textDirection == TextDirection.ltr)
                                        ? TextDirection.rtl
                                        : TextDirection.ltr;
                              },
                              icon: settings.textDirection == TextDirection.ltr
                                  ? Icon(
                                      Icons.swipe_right,
                                      color: settings.isDarkMode
                                          ? darkprimarySwatch
                                          : lightprimarySwatch,
                                    )
                                  : Icon(
                                      Icons.swipe_left,
                                      color: settings.isDarkMode
                                          ? darkprimarySwatch
                                          : lightprimarySwatch,
                                    ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          );
        },
      ),
    ));
  }
}
