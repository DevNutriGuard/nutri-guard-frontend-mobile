import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/profile/presentation/profile/widgets/SecurityAndPrivacyPolicyWidget.dart';
import 'package:nutri_guard_mobile/core/routes/app_routes.dart';

class SecurityAndPrivacyPolicy extends StatelessWidget {
  const SecurityAndPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Security & Privacy Policy'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.profileScreen,
            );
          },
        ),
      ),
      body: SecurityAndPrivacyPolicyWidget(),
    );
  }
}
