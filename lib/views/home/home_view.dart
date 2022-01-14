import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/widgets/phone_details/phone_details.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/footer/footer.dart';
import '../../widgets/centered_view/centered_view.dart';
import '../../widgets/navigation/custom_navigation_bar.dart';
import '../../widgets/navigation/mobile/custom_navigation_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<PhoneDetails> phones = List.generate(
      30,
      (index) => const PhoneDetails(),
    );
    return SafeArea(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          drawer: [DeviceScreenType.mobile, DeviceScreenType.tablet]
                  .contains(sizingInformation.deviceScreenType)
              ? const CustomNavigationDrawer()
              : null,
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: CenteredView(
              child: Column(
                children: [
                  const CustomNavigationBar(),
                  const SizedBox(height: 15),
                  const Text(
                    'Phones',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: phones.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: [
                        DeviceScreenType.mobile,
                        DeviceScreenType.tablet
                      ].contains(sizingInformation.deviceScreenType)
                          ? 1
                          : 2,
                      childAspectRatio: [
                        DeviceScreenType.mobile,
                        DeviceScreenType.tablet
                      ].contains(sizingInformation.deviceScreenType)
                          ? 1.5
                          : 1.2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => phones[index],
                  ),
                  const SizedBox(height: 15),
                  const Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
