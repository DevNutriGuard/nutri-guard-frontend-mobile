import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/core/constants/app_colors.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_app_bar.dart';
import 'package:nutri_guard_mobile/core/widgets/custom_button_widget.dart';
import 'package:nutri_guard_mobile/profile/presentation/subscription/widgets/cancel_subscription_modal.dart';
import 'package:nutri_guard_mobile/res/assets.dart';
import 'package:provider/provider.dart';
import '../domain/subscription_provider.dart';

class SubscriptionScreen2 extends StatefulWidget {
  const SubscriptionScreen2({super.key});

  @override
  _SubscriptionScreen2State createState() => _SubscriptionScreen2State();
}

class _SubscriptionScreen2State extends State<SubscriptionScreen2> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SubscriptionProvider>(context, listen: false);
      provider.buildContext = context;
      provider.fetchSubscriptionStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SubscriptionProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
          onBackPressed: (){Navigator.pop(context);},
          title: 'Subscription',
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  if (provider.subscriptionStatus != null)
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Image.asset(
                                Assets.dollar,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          provider.subscriptionStatus!
                                              .data!
                                              .subscriptionStatusData!
                                              .planName!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        if (provider.subscriptionStatus!
                                            .data!
                                            .subscriptionStatusData!
                                            .isFree!)
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue,
                                                  width: 2),
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              color: Colors.transparent,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            child: const Text(
                                              "FREE",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "\$${provider.subscriptionStatus!.data!.subscriptionStatusData!.planPrice ?? 0}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      provider.subscriptionStatus!
                                          .data!
                                          .subscriptionStatusData!
                                          .billingCycle ??
                                          "Not Available",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Subscription Start: ${provider.subscriptionStatus!.data!.subscriptionStatusData!.subscriptionStart}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  const Spacer(),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 50.0,
                    child: CustomWidgetButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CancelSubscriptionModal(
                            onCancel: () {
                              Navigator.pop(context);
                            },
                            onConfirm: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                      label: "Cancel Subscription",
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
