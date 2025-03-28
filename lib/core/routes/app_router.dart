// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/features/assessment/presentation/assessment.dart';
// import 'package:nutri_guard_mobile/features/auth/presentation/screens/create_account_screen.dart';
// import 'package:nutri_guard_mobile/features/auth/presentation/screens/sign_in_screen.dart';
// import 'package:nutri_guard_mobile/features/auth/presentation/screens/sign_in_with_number.dart';
// import 'package:nutri_guard_mobile/features/auth/presentation/screens/sign_up_screen.dart';
// import 'package:nutri_guard_mobile/features/auth/presentation/screens/sign_up_with_number_screen.dart';
// import 'package:nutri_guard_mobile/features/auth/presentation/screens/verification_code_screen.dart';
// import 'package:nutri_guard_mobile/features/medical_background/presentation/medical_background1.dart';
// import 'package:nutri_guard_mobile/features/medical_background/presentation/medical_background_2.dart';
// import 'package:nutri_guard_mobile/features/medical_background/presentation/medical_background_3.dart';
// import 'package:nutri_guard_mobile/features/medical_background/presentation/medical_background_4.dart';
// import 'package:nutri_guard_mobile/features/medical_background/presentation/medical_background_5.dart';
// import 'package:nutri_guard_mobile/features/medical_background/presentation/medical_background_6.dart';
// import 'package:nutri_guard_mobile/features/onboarding/screens/onboarding1.dart';
// import 'package:nutri_guard_mobile/features/onboarding/screens/onboarding3.dart';
// import 'package:nutri_guard_mobile/features/onboarding/screens/onboarding4.dart';
// import '../../features/onboarding/screens/onboarding2.dart';
// import '../../features/splash/presentation/splash-screen.dart';
// import 'app_routes.dart';
//
// class AppRouter {
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     final args = settings.arguments;
//
//     switch (settings.name) {
//       case AppRoutes.createAccountScreen:
//         return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
//       case AppRoutes.signIn:
//         return MaterialPageRoute(builder: (_) => const SignInScreen());
//       case AppRoutes.signInWithPhoneNumber:
//         return MaterialPageRoute(builder: (_) => const SignInWithNumber());
//       case AppRoutes.splashScreen:
//         return MaterialPageRoute(builder: (_) => const SplashScreen());
//       case AppRoutes.onboardingScreen:
//         return MaterialPageRoute(builder: (_) => const Onboarding1());
//       case AppRoutes.onboarding2Screen:
//         return MaterialPageRoute(builder: (_) => const Onboarding2());
//       case AppRoutes.onboarding3Screen:
//         return MaterialPageRoute(builder: (_) => const Onboarding3());
//       case AppRoutes.onboarding4Screen:
//         return MaterialPageRoute(builder: (_) => const Onboarding4());
//       case AppRoutes.signUpWithPhoneNumber:
//         return MaterialPageRoute(builder: (_) => const SignUpWithPhone());
//       case AppRoutes.assessment:
//         return MaterialPageRoute(builder: (_) => const Assessment());
//       case AppRoutes.medicalBackGround1:
//         return MaterialPageRoute(builder: (_) => const MedicalBackground1());
//       case AppRoutes.medicalBackGround2:
//         return MaterialPageRoute(builder: (_) => const MedicalBackground2(completedSections:  ));
//       case AppRoutes.medicalBackGround3:
//         return MaterialPageRoute(builder: (_) => const MedicalBackground3());
//       case AppRoutes.medicalBackGround4:
//         return MaterialPageRoute(builder: (_) => const MedicalBackground4());
//       case AppRoutes.medicalBackGround5:
//         return MaterialPageRoute(builder: (_) => const MedicalBackground5());
//       case AppRoutes.medicalBackGround6:
//         return MaterialPageRoute(builder: (_) => const MedicalBackground6());
//       case AppRoutes.verifyPhoneNumber:
//         if (args is String) {
//           return MaterialPageRoute(
//             builder: (_) => VerifyCodeScreen(phoneNumber: args),
//           );
//         }
//         return _errorRoute();
//       case AppRoutes.signUp:
//         return MaterialPageRoute(builder: (_) => const SignUpScreen());
//
//       default:
//         return MaterialPageRoute(
//           builder: (_) => const Scaffold(
//             body: Center(child: Text("Page not found")),
//           ),
//         );
//     }
//   }
//
//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(
//       builder: (_) => const Scaffold(
//         body: Center(child: Text("Error: Missing phone number")),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/features/auth/presentation/screens/create_account_screen.dart';
import 'package:nutri_guard_mobile/features/auth/presentation/screens/foret_password_verification_code.dart';
import 'package:nutri_guard_mobile/features/auth/presentation/screens/forget_password_email_screen.dart';
import 'package:nutri_guard_mobile/features/auth/presentation/screens/forget_password_phone_screen.dart';
import 'package:nutri_guard_mobile/features/auth/presentation/screens/set_password_screen.dart';
import 'package:nutri_guard_mobile/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:nutri_guard_mobile/features/auth/presentation/screens/sign_in_with_number.dart';
import 'package:nutri_guard_mobile/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:nutri_guard_mobile/features/auth/presentation/screens/sign_up_with_number_screen.dart';
import 'package:nutri_guard_mobile/features/auth/presentation/screens/verification_code_screen.dart';
import 'package:nutri_guard_mobile/features/home/presentation/home_screen.dart';
import 'package:nutri_guard_mobile/features/home/presentation/home_screens/readiness.dart';
import 'package:nutri_guard_mobile/features/home/presentation/home_screens/calories_consumed.dart';
import 'package:nutri_guard_mobile/features/notifications/presentation/notifications.dart';
import 'package:nutri_guard_mobile/features/onboarding/screens/onboarding1.dart';
import 'package:nutri_guard_mobile/features/onboarding/screens/onboarding3.dart';
import 'package:nutri_guard_mobile/features/onboarding/screens/onboarding4.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/comprehensive_health_testing/screens/comprehensive_health_testing_screen1.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/comprehensive_health_testing/screens/comprehensive_health_testing_screen2.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/diet_and_nutrition_references/screens/diet_nutrition_screen1.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/diet_and_nutrition_references/screens/diet_nutrition_screen2.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/diet_and_nutrition_references/screens/diet_nutrition_screen3.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/diet_and_nutrition_references/screens/diet_nutrition_screen4.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/diet_and_nutrition_references/screens/diet_nutrition_screen5.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/diet_and_nutrition_references/screens/diet_nutrition_screen6.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/diet_and_nutrition_references/screens/diet_nutrition_screen7.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/diet_and_nutrition_references/screens/diet_nutrition_screen8.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/fitness_and_physical_activity/screens/fitness_and_physical_actitvity_screen1.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/fitness_and_physical_activity/screens/fitness_and_physical_actitvity_screen2.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/fitness_and_physical_activity/screens/fitness_and_physical_actitvity_screen3.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/fitness_and_physical_activity/screens/fitness_and_physical_actitvity_screen4.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/fitness_and_physical_activity/screens/fitness_and_physical_actitvity_screen5.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/fitness_and_physical_activity/screens/fitness_and_physical_actitvity_screen6.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/fitness_and_physical_activity/screens/fitness_and_physical_actitvity_screen7.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/health_and_biohacking_goals/screens/health_and_biohacking_goals_screen1.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/health_and_biohacking_goals/screens/health_and_biohacking_goals_screen2.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/health_and_biohacking_goals/screens/health_and_biohacking_goals_screen3.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/health_and_biohacking_goals/screens/health_and_biohacking_goals_screen4.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/health_and_biohacking_goals/screens/health_and_biohacking_goals_screen5.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/lifestyle_and_daily_habits/screens/lifestyle_screen1.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/lifestyle_and_daily_habits/screens/lifestyle_screen2.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/lifestyle_and_daily_habits/screens/lifestyle_screen3.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/lifestyle_and_daily_habits/screens/lifestyle_screen4.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/lifestyle_and_daily_habits/screens/lifestyle_screen5.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/lifestyle_and_daily_habits/screens/lifestyle_screen6.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/lifestyle_and_daily_habits/screens/lifestyle_screen7.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/medical_background/screens/assessment_screen.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/medical_background/screens/medical_background1.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/medical_background/screens/medical_background2.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/medical_background/screens/medical_background3.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/medical_background/screens/medical_background4.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/medical_background/screens/medical_background5.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/medical_background/screens/medical_background6.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/preferences_for_plan_customization/screen/preferences_for_plan_customization_screen1.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/preferences_for_plan_customization/screen/preferences_for_plan_customization_screen2.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/preferences_for_plan_customization/screen/preferences_for_plan_customization_screen3.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/preferences_for_plan_customization/screen/preferences_for_plan_customization_screen4.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/preferences_for_plan_customization/screen/preferences_for_plan_customization_screen5.dart';
import 'package:nutri_guard_mobile/features/setup-profile/presentation/screens/onboarding_age.dart';
import 'package:nutri_guard_mobile/features/setup-profile/presentation/screens/onboarding_gender.dart';
import 'package:nutri_guard_mobile/features/setup-profile/presentation/screens/onboarding_height.dart';
import 'package:nutri_guard_mobile/features/setup-profile/presentation/screens/onboarding_weight.dart';
import 'package:nutri_guard_mobile/features/setup-profile/presentation/screens/privacy_policy_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/ai-coach/ai_chat_history_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/ai-coach/ai_coach_chat_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/ai-coach/ai_coach_selection_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/presentation/ashwagandha_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/presentation/biohacking_and_advanced_health_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/presentation/creatine_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/presentation/ice_bath_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/presentation/sauna_session_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/all_female_fitness_exercises_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/all_male_fitness_exercises_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/band_push_ups_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/cable_push_ups_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/corba_push_ups_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/db_overhead_push_press_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/fitness_logs_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/fitness_push_ups_all_exercises_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/fitness_screen1.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/fitness_summary_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/hyde_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/presentation/mass_gainer_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/push-ups-exercises/presentation/band_push_ups_exercise_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/push-ups-exercises/presentation/band_push_ups_exercise_completed.dart';
import 'package:nutri_guard_mobile/profile/presentation/heart-check/screens/browse_screens.dart';
import 'package:nutri_guard_mobile/profile/presentation/heart-check/screens/check_heart_rate_screen1.dart';
import 'package:nutri_guard_mobile/profile/presentation/heart-check/screens/check_heart_rate_screen2.dart';
import 'package:nutri_guard_mobile/profile/presentation/heart-check/screens/check_heart_rate_screen3.dart';
import 'package:nutri_guard_mobile/profile/presentation/heart-check/screens/heart_check_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/long-term-heath/presentation/coco_via_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/long-term-heath/presentation/long_term_health_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/long-term-heath/presentation/metagenics_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/presentation/b12_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/presentation/grapefruit_warning_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/presentation/medication_and_supplement_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/presentation/omega3_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/presentation/supplement_conflict_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/presentation/Salmon_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/presentation/afterave_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/presentation/blueberries_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/presentation/bone_base_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/presentation/breath_exercise_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/presentation/breathing_exercise_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/presentation/meditation_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/presentation/mental_and_cognitve_health_screen1.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/presentation/add_diet_goals_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/presentation/daily_meal_suggestions_card_screens/avocado_toast_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/presentation/nutrition_screen1.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/presentation/nutrition_screen3.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/presentation/nutrition_screen4.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/presentation/nutrition_screen5.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/presentation/nutrition_screen6.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/widgets/personalized_meal_plans.dart';
import 'package:nutri_guard_mobile/profile/presentation/profile/presentation/edit_profile_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/profile/presentation/profileScreen.dart';
import 'package:nutri_guard_mobile/profile/presentation/profile/presentation/scan_history_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/profile/presentation/security_and_privacy_policy.dart';
import 'package:nutri_guard_mobile/profile/presentation/report/presentation/report_screen1.dart';
import 'package:nutri_guard_mobile/profile/presentation/scanner/presentation/scanner_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/scanner/presentation/scanner_screen2.dart';
import 'package:nutri_guard_mobile/profile/presentation/set-goals/presentation/set_goals_screen1.dart';
import 'package:nutri_guard_mobile/profile/presentation/set-goals/presentation/set_goals_screen2.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/presentation/brain_md_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/presentation/herbworks_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/presentation/magnesium_supplement_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/presentation/power_nap_details_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/presentation/sleep_and_recovery_screen.dart';
import 'package:nutri_guard_mobile/profile/presentation/subscription/presentation/subscription_screen1.dart';
import 'package:nutri_guard_mobile/profile/presentation/subscription/presentation/subscription_screen2.dart';
import 'package:nutri_guard_mobile/res/utils.dart';
import '../../features/auth/presentation/screens/email_verification_screen.dart';
import '../../features/home/presentation/home_screens/heart_rate.dart';
import '../../features/home/presentation/home_screens/hydration.dart';
import '../../features/home/presentation/home_screens/respiratory_rate.dart';
import '../../features/home/presentation/home_screens/spo2.dart';
import '../../features/home/presentation/home_screens/step_count.dart';
import '../../features/home/presentation/home_screens/stress.dart';
import '../../features/home/presentation/home_screens/weight.dart';
import '../../features/onboarding/screens/onboarding2.dart';
import '../../features/splash/presentation/splash-screen.dart';
import '../../res/strings.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.createAccountScreen:
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      case AppRoutes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AppRoutes.signInWithPhoneNumber:
        return MaterialPageRoute(builder: (_) => const SignInWithNumber());
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const Onboarding1());
      case AppRoutes.onboarding2Screen:
        return MaterialPageRoute(builder: (_) => const Onboarding2());
      case AppRoutes.onboarding3Screen:
        return MaterialPageRoute(builder: (_) => const Onboarding3());
      case AppRoutes.onboarding4Screen:
        return MaterialPageRoute(builder: (_) => const Onboarding4());
      case AppRoutes.signUpWithPhoneNumber:
        return MaterialPageRoute(builder: (_) => const SignUpWithPhone());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.verifyPhoneNumber:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => VerifyCodeScreen(phoneNumber: args),
          );
        }
        return _errorRoute();
      case AppRoutes.emailVerificationScreen:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => EmailVerificationScreen(email: args),
          );
        }
        return _errorRoute();
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.forgettPasswordEmail:
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordEmailScreen());
      case AppRoutes.forgettPasswordPhone:
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordPhoneScreen());
      case AppRoutes.forgetPasswordVerification:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ForgetPasswordVerifyCodeScreen(phoneNumber: args),
          );
        }
        return _errorRoute();
      case AppRoutes.setPasswordScreen:
        return MaterialPageRoute(builder: (_) => const SetPasswordScreen());
      case AppRoutes.privacyPolicyScreen:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      case AppRoutes.onboardingAgeScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingAge());
      case AppRoutes.onboardingGenderScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingGender());
      case AppRoutes.onboardingHeightScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingHeight());
      case AppRoutes.onboardingWeightScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingWeight());
      case AppRoutes.assessmentScreen:
        return MaterialPageRoute(builder: (_) => const AssessmentScreen());
      case AppRoutes.medicalBackground1Screen:
        return MaterialPageRoute(builder: (_) => const MedicalBackground1());
      case AppRoutes.medicalBackground2Screen:
        return MaterialPageRoute(builder: (_) => const MedicalBackground2());
      case AppRoutes.medicalBackground3Screen:
        return MaterialPageRoute(builder: (_) => const MedicalBackground3());
      case AppRoutes.medicalBackground4Screen:
        return MaterialPageRoute(builder: (_) => const MedicalBackground4());
      case AppRoutes.medicalBackground5Screen:
        return MaterialPageRoute(builder: (_) => const MedicalBackground5());
      case AppRoutes.medicalBackground6Screen:
        return MaterialPageRoute(builder: (_) => const MedicalBackground6());
      case AppRoutes.lifestyleScreen1:
        return MaterialPageRoute(builder: (_) => const LifestyleScreen1());
      case AppRoutes.lifestyleScreen2:
        return MaterialPageRoute(builder: (_) => const LifestyleScreen2());
      case AppRoutes.lifestyleScreen3:
        return MaterialPageRoute(builder: (_) => const LifestyleScreen3());
      case AppRoutes.lifestyleScreen4:
        return MaterialPageRoute(builder: (_) => const LifestyleScreen4());
      case AppRoutes.lifestyleScreen5:
        return MaterialPageRoute(builder: (_) => const LifestyleScreen5());
      case AppRoutes.lifestyleScreen6:
        return MaterialPageRoute(builder: (_) => const LifestyleScreen6());
      case AppRoutes.lifestyleScreen7:
        return MaterialPageRoute(builder: (_) => const LifestyleScreen7());
      case AppRoutes.dietNurtion1:
        return MaterialPageRoute(builder: (_) => const DietNutritionScreen1());
      case AppRoutes.dietNurtion2:
        return MaterialPageRoute(builder: (_) => const DietNutritionScreen2());
      case AppRoutes.dietNurtion3:
        return MaterialPageRoute(builder: (_) => const DietNutritionScreen3());
      case AppRoutes.dietNurtion4:
        return MaterialPageRoute(builder: (_) => const DietNutritionScreen4());
      case AppRoutes.dietNurtion5:
        return MaterialPageRoute(builder: (_) => const DietNutritionScreen5());
      case AppRoutes.dietNurtion6:
        return MaterialPageRoute(builder: (_) => const DietNutritionScreen6());
      case AppRoutes.dietNurtion7:
        return MaterialPageRoute(builder: (_) => const DietNutritionScreen7());
      case AppRoutes.dietNurtion8:
        return MaterialPageRoute(builder: (_) => const DietNutritionScreen8());
      case AppRoutes.fitnessAndPhysicalActitvity1:
        return MaterialPageRoute(
            builder: (_) => const FitnessAndPhysicalActitvityScreen1());
      case AppRoutes.fitnessAndPhysicalActitvity2:
        return MaterialPageRoute(
            builder: (_) => const FitnessAndPhysicalActitvityScreen2());
      case AppRoutes.fitnessAndPhysicalActitvity3:
        return MaterialPageRoute(
            builder: (_) => const FitnessAndPhysicalActitvityScreen3());
      case AppRoutes.fitnessAndPhysicalActitvity4:
        return MaterialPageRoute(
            builder: (_) => const FitnessAndPhysicalActitvityScreen4());
      case AppRoutes.fitnessAndPhysicalActitvity5:
        return MaterialPageRoute(
            builder: (_) => const FitnessAndPhysicalActitvityScreen5());
      case AppRoutes.fitnessAndPhysicalActitvity6:
        return MaterialPageRoute(
            builder: (_) => const FitnessAndPhysicalActitvityScreen6());
      case AppRoutes.fitnessAndPhysicalActitvity7:
        return MaterialPageRoute(
            builder: (_) => const FitnessAndPhysicalActitvityScreen7());
      case AppRoutes.healthAndBiohackingScreen1:
        return MaterialPageRoute(
            builder: (_) => const HealthAndBiohakingGoalsScreen1());
      case AppRoutes.healthAndBiohackingScreen2:
        return MaterialPageRoute(
            builder: (_) => const HealthAndBiohakingGoalsScreen2());
      case AppRoutes.healthAndBiohackingScreen3:
        return MaterialPageRoute(
            builder: (_) => const HealthAndBiohakingGoalsScreen3());
      case AppRoutes.healthAndBiohackingScreen4:
        return MaterialPageRoute(
            builder: (_) => const HealthAndBiohakingGoalsScreen4());
      case AppRoutes.healthAndBiohackingScreen5:
        return MaterialPageRoute(
            builder: (_) => const HealthAndBiohakingGoalsScreen5());
      case AppRoutes.comprehensiveHealthTestingScreen1:
        return MaterialPageRoute(
            builder: (_) => const ComprehensiveHealthTestingScreen1());
      case AppRoutes.comprehensiveHealthTestingScreen2:
        return MaterialPageRoute(
            builder: (_) => const ComprehensiveHealthTestingScreen2());
      case AppRoutes.preferencesForPlanCustomizationScreen1:
        return MaterialPageRoute(
            builder: (_) => const PreferencesForPlanCustomizationScreen1());
      case AppRoutes.preferencesForPlanCustomizationScreen2:
        return MaterialPageRoute(
            builder: (_) => const PreferencesForPlanCustomizationScreen2());
      case AppRoutes.preferencesForPlanCustomizationScreen3:
        return MaterialPageRoute(
            builder: (_) => const PreferencesForPlanCustomizationScreen3());
      case AppRoutes.preferencesForPlanCustomizationScreen4:
        return MaterialPageRoute(
            builder: (_) => const PreferencesForPlanCustomizationScreen4());
      case AppRoutes.preferencesForPlanCustomizationScreen5:
        return MaterialPageRoute(
            builder: (_) => const PreferencesForPlanCustomizationScreen5());
      case AppRoutes.aiCoachSelectionScreen:
        return MaterialPageRoute(
            builder: (_) => const AICoachSelectionScreen());
      case AppRoutes.aiCoachChatScreen:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => AiCoachChatScreen(
            coachName: args['coachName']!,
            coachImage: args['coachImage']!,
          ),
        );
      case AppRoutes.aiCoachChatHistoryScreen:
        return MaterialPageRoute(builder: (_) => ChatHistoryScreen());
      case AppRoutes.mentalAndCognitveHealthScreen1:
        return MaterialPageRoute(
            builder: (_) => const MentalAndCognitveHealthScreen1());
      case AppRoutes.breathingExerciseScreen:
        return MaterialPageRoute(
            builder: (_) => const BreathingExerciseScreen());
      case AppRoutes.breathingExerciseDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const BreathingExerciseDetailsScreen());
      case AppRoutes.meditationDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const MeditationDetailsScreen());
      case AppRoutes.salmonDetailsScreen:
        return MaterialPageRoute(builder: (_) => const SalmonDetailsScreen());
      case AppRoutes.bluberriesDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const BlueberriesDetailsScreen());
      case AppRoutes.afteraveDetailsScreen:
        return MaterialPageRoute(builder: (_) => const AfteraveDetailsScreen());
      case AppRoutes.boneBaseDetailsScreen:
        return MaterialPageRoute(builder: (_) => const BoneBaseDetailsScreen());
      case AppRoutes.brainMDDetailsScreen:
        return MaterialPageRoute(builder: (_) => const BrainMDDetailsScreen());
      case AppRoutes.herbworksDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const HerbworksDetailsScreen());
      case AppRoutes.magnesiumSupplementDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const MagnesiumSupplementDetailsScreen());
      case AppRoutes.powerNapDetailsScreen:
        return MaterialPageRoute(builder: (_) => const PowerNapDetailsScreen());
      case AppRoutes.sleepAndRecoveryScreen:
        return MaterialPageRoute(
            builder: (_) => const SleepAndRecoveryScreen());
      case AppRoutes.longTermHealthScreen:
        return MaterialPageRoute(builder: (_) => const LongTermHealthScreen());
      case AppRoutes.metagenicsDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const MetagenicsDetailsScreen());
      case AppRoutes.cocoViaDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CocoViaDetailsScreen());
      case AppRoutes.biohackingAndAdvancedHealthScreen:
        return MaterialPageRoute(
            builder: (_) => BiohackingAndAdvancedHealthScreen( profileId: PreferenceUtils.getString(Strings.profileId) ?? ""));
      case AppRoutes.saunaSessionDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const SaunaSessionDetailsScreen());
      case AppRoutes.ashwagandhaDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const AshwagandhaDetailsScreen());
      case AppRoutes.creatineDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CreatineDetailsScreen());
      case AppRoutes.iceBathDetailsScreen:
        return MaterialPageRoute(builder: (_) => const IceBathDetailsScreen());
      case AppRoutes.grapefruitWarningDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const GrapefruitWarningDetailsScreen());
      case AppRoutes.b12DetailsScreen:
        return MaterialPageRoute(builder: (_) => const B12DetailsScreen());
      case AppRoutes.omega3DetailsScreen:
        return MaterialPageRoute(builder: (_) => const Omega3DetailsScreen());
      case AppRoutes.supplementConflictDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const SupplementConflictDetailsScreen());
      case AppRoutes.medicationAndSupplementScreen:
        return MaterialPageRoute(
            builder: (_) => const MedicationAndSupplementScreen());
      case AppRoutes.heartCheckScreen:
        return MaterialPageRoute(builder: (_) => const HeartCheckScreen());
      case AppRoutes.browseScreens:
        return MaterialPageRoute(builder: (_) => const BrowseScreens());
      case AppRoutes.checkHeartRateScreen1:
        return MaterialPageRoute(builder: (_) => const CheckHeartRateScreen1());
      case AppRoutes.checkHeartRateScreen2:
        return MaterialPageRoute(builder: (_) => const CheckHeartRateScreen2());
      case AppRoutes.checkHeartRateScreen3:
        return MaterialPageRoute(builder: (_) => const CheckHeartRateScreen3());
      case AppRoutes.readinessScreen:
        return MaterialPageRoute(builder: (_) => const Readiness());
      case AppRoutes.heartRateScreen:
        return MaterialPageRoute(builder: (_) => const HeartRate());
      case AppRoutes.stepCountScreen:
        return MaterialPageRoute(builder: (_) => const StepCount());
      case AppRoutes.caloriesConsumedScreen:
        return MaterialPageRoute(builder: (_) => const CaloriesConsumed());
      case AppRoutes.stressScreen:
        return MaterialPageRoute(builder: (_) => const Stress());
      case AppRoutes.weightScreen:
        return MaterialPageRoute(builder: (_) => const Weight());
      case AppRoutes.hydrationScreen:
        return MaterialPageRoute(builder: (_) => const Hydration());
      case AppRoutes.spo2Screen:
        return MaterialPageRoute(builder: (_) => const Spo2());
      case AppRoutes.respiratoryRateScreen:
        return MaterialPageRoute(builder: (_) => const RespiratoryRate());
      case AppRoutes.nutritionScreen1:
        return MaterialPageRoute(
            builder: (_) => NutritionScreen1(
                profileId: PreferenceUtils.getString(Strings.profileId) ?? ""));
      case AppRoutes.addDietGoalsScreen:
        return MaterialPageRoute(builder: (_) => const AddDietGoalsScreen());
      case AppRoutes.nutritionScreen3:
        return MaterialPageRoute(builder: (_) => const NutritionScreen3());
      case AppRoutes.nutritionScreen4:
        return MaterialPageRoute(builder: (_) => const NutritionScreen4());
      case AppRoutes.fitnessScreen1:
        return MaterialPageRoute(builder: (_) => const FitnessScreen1());
      case AppRoutes.massGainerDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const MassGainerDetailsScreen());
      case AppRoutes.hydeDetailsScreen:
        return MaterialPageRoute(builder: (_) => const HydeDetailsScreen());
      case AppRoutes.fitnessSummaryScreen:
        return MaterialPageRoute(builder: (_) => const FitnessSummaryScreen());
      case AppRoutes.fitnessPushUpsAllExercisesScreen:
        return MaterialPageRoute(
            builder: (_) => const FitnessPushUpsAllExercisesScreen());
      case AppRoutes.bandPushUpsDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const BandPushUpsDetailsScreen());
      case AppRoutes.cablePushUpsDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CablePushUpsDetailsScreen());
      case AppRoutes.corbaPushUpsDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CorbaPushUpsDetailsScreen());
      case AppRoutes.dbOverheadPushPressDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const DbOverheadPushPressDetailsScreen());
      case AppRoutes.bandPushUpsExerciseCompleted:
        return MaterialPageRoute(
            builder: (_) => const BandPushUpsExerciseCompleted());
      case AppRoutes.bandPushUpsExerciseScreen:
        return MaterialPageRoute(
            builder: (_) => const BandPushUpsExerciseScreen());
      case AppRoutes.profileScreen:
        return MaterialPageRoute(builder: (_) => const Profilescreen());
      case AppRoutes.scanHistoryScreen:
        return MaterialPageRoute(builder: (_) => const ScanHistoryScreen());
      case AppRoutes.securityAndPrivacyPolicyScreen:
        return MaterialPageRoute(
            builder: (_) => const SecurityAndPrivacyPolicy());
      case AppRoutes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case AppRoutes.reportScreen1:
        return MaterialPageRoute(builder: (_) => const ReportScreen1());
      case AppRoutes.setGoalsScreen1:
        return MaterialPageRoute(builder: (_) => const SetGoalsScreen1());
      case AppRoutes.setGoalsScreen2:
        return MaterialPageRoute(builder: (_) => const SetGoalsScreen2());
      case AppRoutes.subscriptionScreen1:
        return MaterialPageRoute(builder: (_) => const SubscriptionScreen1());
      case AppRoutes.subscriptionScreen2:
        return MaterialPageRoute(builder: (_) => const SubscriptionScreen2());
      case AppRoutes.scannerScreen:
        return MaterialPageRoute(builder: (_) => const ScannerScreen());

      case AppRoutes.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case AppRoutes.avocadoToastDetailsScreen:
        return MaterialPageRoute(builder: (_) => AvocadoToastDetailsScreen());
      case AppRoutes.personalizedMealPlans:
        return MaterialPageRoute(builder: (_) => const PersonalizedMealPlans());
      case AppRoutes.nutritionScreen5:
        return MaterialPageRoute(builder: (_) => const NutritionScreen5());
      case AppRoutes.nutritionScreen6:
        return MaterialPageRoute(builder: (_) => const NutritionScreen6());
      case AppRoutes.fitnessLogsScreen:
        return MaterialPageRoute(builder: (_) => const FitnessLogsScreen());
      case AppRoutes.allMaleFitnessExercisesScreen:
        return MaterialPageRoute(
            builder: (_) => const AllMaleFitnessExercisesScreen());
      case AppRoutes.allFemaleFitnessExercisesScreen:
        return MaterialPageRoute(
            builder: (_) => const AllFemaleFitnessExercisesScreen());
      case AppRoutes.scannerScreen2:
        return MaterialPageRoute(builder: (_) => const ScannerScreen2());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page not found")),
          ),
        );
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text("Error: Missing phone number")),
      ),
    );
  }
}
