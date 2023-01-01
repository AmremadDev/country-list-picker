import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/onboarding_provider.dart';
import '../home_page.dart';
import '../app_data.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<OnboardingProvider>(
        builder: (context, boarding, child) {
          return Column(
            children: [
              Expanded(
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
                            Text(listOnboarding[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(fontSize: 30, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 20),
                            Text(
                              listOnboarding[index].body,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(
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
                        const SizedBox(height: 20),
                        ElevatedButton(
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
                            child: const Text("Continue"))
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
