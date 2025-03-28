import 'package:nutri_guard_mobile/features/auth/domain/google_sign_up_provider.dart';
import 'package:nutri_guard_mobile/features/auth/domain/signup_provider.dart';
import 'package:nutri_guard_mobile/features/home/domain/home_provider.dart';
import 'package:nutri_guard_mobile/features/questionare/domain/medical_background_provider.dart';
import 'package:nutri_guard_mobile/features/questionare/presentation/lifestyle_and_daily_habits/domain/lifestyle_provider.dart';
import 'package:nutri_guard_mobile/models/mental_and_cognitive_health_response_model.dart';
import 'package:nutri_guard_mobile/profile/presentation/biohacking-and-advanced-health/domain/biohacking_provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/fitness/domain/fitness_provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/long-term-heath/domain/long_term_health_provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/medication-and-supplement/domain/medicine_and_supplement_provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/mental-and-cognitve-health/domain/mental_and_cognitive_health_provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/nutrition/domain/nutrition_provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/set-goals/domain/set_your_goals_provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/sleep-and-recovery/domain/sleep_and_recovery_provider.dart';
import 'package:nutri_guard_mobile/profile/presentation/subscription/domain/subscription_provider.dart';
import 'package:provider/provider.dart';

import '../features/auth/domain/forgot_password_provider.dart';
import '../features/auth/domain/login_provider.dart';
import '../features/questionare/domain/diet_and_nutrition_provider.dart';
import '../features/questionare/domain/fitness_and_physical_activity_provider.dart';
import '../features/questionare/domain/health_and_bio_hacking_goals_provider.dart';
import '../features/questionare/domain/preferences_for_plan_customization.dart';
import '../features/setup-profile/domain/onboarding_provider.dart';
import '../profile/presentation/report/domain/report_provider.dart';
import '../profile/presentation/scanner/domain/scanner_provider.dart';

final multiProviders = [
  ChangeNotifierProvider<LoginProvider>(
    create: (context) => LoginProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SignupProvider>(
    create: (context) => SignupProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ForgotPasswordProvider>(
    create: (context) => ForgotPasswordProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<GoogleSignUpProvider>(
    create: (context) => GoogleSignUpProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<HomeProvider>(
    create: (context) => HomeProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<MedicalBackGroundProvider>(
    create: (context) => MedicalBackGroundProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<OnboardingProvider>(
    create: (context) => OnboardingProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<LifestyleAndHabitProvider>(
    create: (context) => LifestyleAndHabitProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<DietAndNutritionProvider>(
    create: (context) => DietAndNutritionProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SetYourGoalsProvider>(
    create: (context) => SetYourGoalsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<FitnessAndPhysicalActivityProvider>(
    create: (context) => FitnessAndPhysicalActivityProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<HealthAndBioHackingGoalsProvider>(
    create: (context) => HealthAndBioHackingGoalsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PreferencesForPlanCustomization>(
    create: (context) => PreferencesForPlanCustomization(),
    lazy: true,
  ),
  ChangeNotifierProvider<LongTermHealthProvider>(
    create: (context) => LongTermHealthProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SleepAndRecoveryProvider>(
    create: (context) => SleepAndRecoveryProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<MentalAndCognitiveHealthProvider>(
    create: (context) => MentalAndCognitiveHealthProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BiohackingProvider>(
    create: (context) => BiohackingProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<MedicineAndSupplementProvider>(
    create: (context) => MedicineAndSupplementProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ScannerProvider>(
    create: (context) => ScannerProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SubscriptionProvider>(
    create: (context) => SubscriptionProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<NutritionProvider>(
    create: (context) => NutritionProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ReportProvider>(
    create: (context) => ReportProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<FitnessProvider>(
    create: (context) => FitnessProvider(),
    lazy: true,
  ),
];
