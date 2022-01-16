import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/services/authentication_service.dart';

import '../../locator.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _authenticationService = locator<AuthenticationService>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _authenticationService.currentUser == null
            ? 'Not Logged In'
            : _authenticationService.currentUser!.uid,
      ),
    );
    // List<PhoneDetails> phones = List.generate(
    //   30,
    //   (index) => const PhoneDetails(),
    // );
    // return ResponsiveBuilder(
    //   builder: (context, sizingInformation) => Column(
    //     children: [
    //       const Text(
    //         'Shop Phones',
    //         style: TextStyle(
    //           fontSize: 30,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       const SizedBox(height: 15),
    //       GridView.builder(
    //         shrinkWrap: true,
    //         physics: const NeverScrollableScrollPhysics(),
    //         itemCount: phones.length,
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: [
    //             DeviceScreenType.mobile,
    //             DeviceScreenType.tablet
    //           ].contains(sizingInformation.deviceScreenType)
    //               ? 1
    //               : 4,
    //           childAspectRatio: [
    //             DeviceScreenType.mobile,
    //             DeviceScreenType.tablet
    //           ].contains(sizingInformation.deviceScreenType)
    //               ? 2
    //               : 4 / 7,
    //           crossAxisSpacing: 30,
    //           mainAxisSpacing: 30,
    //         ),
    //         itemBuilder: (context, index) => const Placeholder(),
    //       ),
    //     ],
    //   ),
    // );
  }
}
