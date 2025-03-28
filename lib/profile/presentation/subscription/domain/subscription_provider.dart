import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/network/api_url.dart';
import '../../../../models/get_plans_subscription_response_model.dart';
import '../../../../models/get_subscriptions_status.dart';
import '../../../../network/api_service.dart';
import '../../../../network/models.dart';
import '../../../../res/loader.dart';
import '../../../../res/toasts.dart';

class SubscriptionProvider extends ChangeNotifier {
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  BuildContext? buildContext;
  final Loader _loader = Loader();

  GetPlansSubscriptionResponseModel getPlansSubscriptionResponseModel = GetPlansSubscriptionResponseModel();
  GetSubscriptionsStatus? _subscriptionStatus;

  GetSubscriptionsStatus? get subscriptionStatus => _subscriptionStatus;

  Future<void> fetchSubscriptionPlans() async {
    // Check if context is valid before showing the loader
    if (buildContext != null) {
      _loader.showLoader(context: buildContext!);
    }

    try {
      getPlansSubscriptionResponseModel = await MyApi.callGetApi(
        url: getPlansSubscriptionUrl,
        modelName: Models.getPlansSubscriptionResponseModel,
      );
      notifyListeners();
    } catch (e) {
      // Only hide loader if buildContext is valid
      if (buildContext != null) {
        _loader.hideLoader(buildContext!);
      }
      Toasts.getErrorToast(text: "Error fetching subscription plans: $e");
    }
  }


  // Future<void> handlePayment(String planCode, int planPrice) async {
  //   try {
  //     final paymentMethod = await Stripe.instance.createPaymentMethod(
  //         params: const PaymentMethodParams.card(
  //             paymentMethodData: PaymentMethodData(
  //                 billingDetails: BillingDetails(
  //                     name: 'user1',
  //                     email: 'user1@example.com'
  //                 )
  //             )
  //         )
  //     );
  //
  //     final response = await MyApi.confirmPayment(
  //       paymentMethodId: paymentMethod.id,
  //       planCode: planCode,
  //       planPrice: planPrice,
  //     );
  //
  //     if (response['success'] == true) {
  //       _loader.showLoader(context: buildContext);
  //     } else {
  //       _loader.hideLoader(buildContext!);
  //     }
  //   } catch (e) {
  //     Toasts.getErrorToast(text: "Error fetching subscription plans: $e");
  //   }
  // }

  // Future<void> fetchSubscriptionStatus() async {
  //   if (buildContext != null) {
  //     _loader.showLoader(context: buildContext!);
  //   }
  //
  //   try {
  //     final response = await MyApi.callGetApi(
  //       url: getSubscriptionStatusUrl,
  //       modelName: Models.getSubscriptionStatus,
  //     );
  //
  //     // Correctly create GetSubscriptionsStatus object
  //     _subscriptionStatus = GetSubscriptionsStatus.fromJson(response);
  //
  //     // Accessing properties correctly
  //     print("Subscription status: ${_subscriptionStatus?.status}");
  //     print("Plan Name: ${_subscriptionStatus?.data?.subscriptionStatusData?.planName}");
  //
  //     // Notify listeners to update the UI
  //     notifyListeners();
  //   } catch (e) {
  //     if (buildContext != null) {
  //       _loader.hideLoader(buildContext!);
  //     }
  //     // Log the error and show a toast message
  //     print("Error fetching subscription status: $e");
  //     Toasts.getErrorToast(text: "Error fetching subscription status: $e");
  //   } finally {
  //     if (buildContext != null) {
  //       _loader.hideLoader(buildContext!);
  //     }
  //   }
  // }
  Future<void> fetchSubscriptionStatus() async {
    if (buildContext != null) {
      _loader.showLoader(context: buildContext!);
    }

    try {
      // Assuming MyApi.callGetApi returns a GetSubscriptionsStatus object
      _subscriptionStatus = await MyApi.callGetApi(
        url: getSubscriptionStatusUrl,
        modelName: Models.getSubscriptionStatus,
      );

      // Accessing properties correctly
      print("Subscription status: ${_subscriptionStatus?.status}");
      print("Plan Name: ${_subscriptionStatus?.data?.subscriptionStatusData?.planName}");

      // Notify listeners to update the UI
      notifyListeners();
    } catch (e) {
      if (buildContext != null) {
        _loader.hideLoader(buildContext!);
      }
      // Log the error and show a toast message
      print("Error fetching subscription status: $e");
      Toasts.getErrorToast(text: "Error fetching subscription status: $e");
    } finally {
      if (buildContext != null) {
        _loader.hideLoader(buildContext!);
      }
    }
  }}