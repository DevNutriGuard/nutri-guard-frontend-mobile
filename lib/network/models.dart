import 'package:nutri_guard_mobile/models/add_diet_goal_response_model.dart';
import 'package:nutri_guard_mobile/models/check_grocery_items_response_model.dart';
import 'package:nutri_guard_mobile/models/generate_report_response_model.dart';
import 'package:nutri_guard_mobile/models/get_all_meal_plans_response_model.dart';
import 'package:nutri_guard_mobile/models/get_calories_response_model.dart';
import 'package:nutri_guard_mobile/models/get_daily_intakes_response_model.dart';
import 'package:nutri_guard_mobile/models/get_grocery_list_items_response_model.dart';
import 'package:nutri_guard_mobile/models/get_hydration_response_model.dart';
import 'package:nutri_guard_mobile/models/get_logged_or_not_logged_meal_plans_response_model.dart';
import 'package:nutri_guard_mobile/models/get_meal_options_response_model.dart';
import 'package:nutri_guard_mobile/models/get_meal_types_response_model.dart';
import 'package:nutri_guard_mobile/models/get_nutrition_plan_response_model.dart';
import 'package:nutri_guard_mobile/models/get_plans_subscription_response_model.dart';
import 'package:nutri_guard_mobile/models/get_readiness_data.dart';
import 'package:nutri_guard_mobile/models/get_reports_history_response_model.dart';
import 'package:nutri_guard_mobile/models/get_respiratory_response_model.dart';
import 'package:nutri_guard_mobile/models/get_sleep_duration_response_model.dart';
import 'package:nutri_guard_mobile/models/get_steps_response_model.dart';
import 'package:nutri_guard_mobile/models/get_subscriptions_status.dart';
import 'package:nutri_guard_mobile/models/get_weight_response_model.dart';
import 'package:nutri_guard_mobile/models/home_model_response.dart';
import 'package:nutri_guard_mobile/models/login_response.dart';
import 'package:nutri_guard_mobile/models/long_term_health_response_model.dart';
import 'package:nutri_guard_mobile/models/medicine_and_supplment_response_model.dart';
import 'package:nutri_guard_mobile/models/mental_and_cognitive_health_response_model.dart';
import 'package:nutri_guard_mobile/models/patch_gender_model_response.dart';
import 'package:nutri_guard_mobile/models/report_history_response_model.dart';
import 'package:nutri_guard_mobile/models/save_goals_response_model.dart';
import 'package:nutri_guard_mobile/models/save_meal_response_model.dart';
import 'package:nutri_guard_mobile/models/set_daily_intake_reminder_response_model.dart';
import 'package:nutri_guard_mobile/models/sleep_and_recovery_response_model.dart';
import 'package:nutri_guard_mobile/models/update_daily_intake_response_model.dart';
import '../models/biohacking_response_model.dart';
import '../models/common_model.dart';
import '../models/diet_and_nutrition_response.dart';
import '../models/email_otp_verfiy_response.dart';
import '../models/error_response.dart';
import '../models/fitness_and_physical_activity_response.dart';
import '../models/forgot_password_response.dart';
import '../models/google_login_response.dart';
import '../models/health_and_bio_hacking_response.dart';
import '../models/home_response.dart';
import '../models/life_style_response.dart';
import '../models/medical_history_response.dart';
import '../models/phone_signup_response.dart';
import '../models/phone_verification_response.dart';
import '../models/preferences_for_plan_customization_model.dart';
import '../models/refresh_token_model.dart';
import '../models/scanner/food_scan_response.dart';
import '../models/scanner/meal_scan_response.dart';
import '../models/scanner/medicine_scan_response.dart';
import '../models/scanner/supplement_scan_response.dart';
import '../models/signup_response.dart';
import '../models/update_age_response.dart';
import '../models/update_gender_response.dart';
import '../models/update_height_response.dart';
import '../models/update_weight_response.dart';
import '../models/upload_doc_common_response.dart';

class Models {
  ////////Authentication Models
  static const String commonModel = "COMMON_MODEL";
  static const String errorModel = "ERROR_MODEL";
  static const String googleLoginResponse = "googleLoginResponse";
  static const String refreshTokenModel = "RefreshTokenModel";
  static const String loginModel = "LoginModel";
  static const String signupResponse = "signupResponse";
  static const String forgotPasswordResponse = "forgotPasswordResponse";
  static const String homeDataResponse = "homeDataResponse";
  ///////Home Models
  static const String homeModelResponse = "homeModelResponse";
  static const String homeResponse = "HomeResponse";
  static const String getReadinessData = "getReadinessData";
  static const String getSp02ResponseModel = "getSp02ResponseModel";
  static const String getRespiratoryRateResponseModel =
      "getRespiratoryRateResponseModel";
  static const String getHydrationResponseModel = "getHydrationResponseModel";
  static const String getWeightResponseModel = "getWeightResponseModel";
  static const String getStressResponseModel = "getStressResponseModel";
  static const String getCaloriesResponseModel = "getCaloriesResponseModel";
  static const String getStepsResponseModel = "getStepsResponseModel";
  static const String getHeartRateResponseModel = "getHeartRateResponseModel";
  static const String getSleepDurationResponseModel =
      "getSleepDurationResponseModel";
  static const String patchGenderResponseModel = "patchGenderResponseModel";
  static const String updateAgeResponse = "updateAgeResponse";
  static const String updateGenderResponse = "updateGenderResponse";
  static const String updateHeightResponse = "updateHeightResponse";
  static const String updateWeightResponse = "updateWeightResponse";
  // static const String postLifestyleResponseModel = "postLifestyleResponseModel";
  static const String medicalHistoryResponse = "medicalHistoryResponse";
  static const String lifeStyleResponse = "lifeStyleResponse";
  static const String dietAndNutritionResponse = "dietAndNutritionResponse";
  static const String saveGoalsResponseModel = "saveGoalsResponseModel";
  static const String fitnessAndPhysicalActivityResponse =
      "fitnessAndPhysicalActivityResponse";
  static const String healthAndBioHackingResponse =
      "healthAndBioHackingResponse";
  static const String uploadDocCommonResponse = "uploadDocCommonResponse";
  static const String preferencesForPlanCustomizationModel =
      "preferencesForPlanCustomizationModel";
  static const String longTermHealthResponseModel =
      "longTermHealthResponseModel";
  static const String sleepAndRecoveryResponseModel =
      "sleepAndRecoveryResponseModel";
  static const String mentalAndCognitiveHealthResponseModel =
      "mentalAndCognitiveHealthResponseModel";
  static const String biohackingResponseModel = "biohackingResponseModel";
  static const String medicineAndSupplmentResponseModel = "medicineAndSupplmentResponseModel";
  static const String getPlansSubscriptionResponseModel = "getPlansSubscriptionResponseModel";
  static const String getSubscriptionStatus = "getSubscriptionStatus";
  static const String phoneSignupResponse = "phoneSignupResponse";
  static const String phoneVerificationResponse = "phoneVerificationResponse";
  static const String emailOtpVerfiyResponse = "emailOtpVerfiyResponse";


//Scanner
  static const String foodScanModel = "foodScanModel";
  static const String medicineScanModel = "medicineScanModel";
  static const String mealScanModel = "mealScanModel";
  static const String supplementScanModel = "supplementScanModel";
  static const String addDietGoalsResponseModel = "addDietGoalsResponseModel";
  static const String checkGroceryItemsResponseModel = "checkGroceryItemsResponseModel";
  static const String generateReportResponseModel = "generateReportResponseModel";
  static const String getAllMealPlansResponseModel = "getAllMealPlansResponseModel";
  static const String getDailyIntakesResponseModel = "getDailyIntakesResponseModel";
  static const String getGroceryListItemsResponseModel = "getGroceryListItemsResponseModel";
  static const String getLoggedOrNotLoggedMealPlansResponseModel = "getLoggedOrNotLoggedMealPlansResponseModel";
  static const String getMealOptionsResponseModel = "getMealOptionsResponseModel";
  static const String getMealTypesResponseModel = "getMealTypesResponseModel";
  static const String getNutritionPlansResponseModel = "getNutritionPlansResponseModel";
  static const String reportHistoryResponseModel = "reportHistoryResponseModel";
  static const String saveMealResponseModel = "saveMealResponseModel";
  static const String scanMealResponseModel = "scanMealResponseModel";
  static const String setDailyIntakeReminderResponseModel = "setDailyIntakeReminderResponseModel";
  static const String updateDailyIntakeResponseModel = "updateDailyIntakeResponseModel";
  static const String getReportHistoryResponseModel = "getReportHistoryResponseModel";

  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      case errorModel:
        return ErrorResponse.fromJson(json);
      case commonModel:
        return CommonResponse.fromJson(json);
      case refreshTokenModel:
        return RefreshTokenModel.fromJson(json);
      case loginModel:
        return LoginResponse.fromJson(json);
      case signupResponse:
        return SignupResponse.fromJson(json);
      case forgotPasswordResponse:
        return ForgotPasswordResponse.fromJson(json);
      case homeModelResponse:
        return HomeModelResponse.fromJson(json);
      case getReadinessData:
        return GetReadinessData.fromJson(json);
      case getRespiratoryRateResponseModel:
        return GetRespiratoryResponseModel.fromJson(json);
      case getHydrationResponseModel:
        return GetHydrationResponseModel.fromJson(json);
      case getWeightResponseModel:
        return GetWeightResponseModel.fromJson(json);
      case getCaloriesResponseModel:
        return GetCaloriesResponseModel.fromJson(json);
      case getStepsResponseModel:
        return GetStepsResponseModel.fromJson(json);
      case getHeartRateResponseModel:
        return GetStepsResponseModel.fromJson(json);
      case getSleepDurationResponseModel:
        return GetSleepDurationResponseModel.fromJson(json);
      case patchGenderResponseModel:
        return PatchGenderModelResponse.fromJson(json);
      // case postLifestyleResponseModel:
      // return LifestyleResponseModel.fromJson(json);
      case updateAgeResponse:
        return UpdateAgeResponse.fromJson(json);
      case updateGenderResponse:
        return UpdateGenderResponse.fromJson(json);
      case updateHeightResponse:
        return UpdateHeightResponse.fromJson(json);
      case updateWeightResponse:
        return UpdateWeightResponse.fromJson(json);

      case medicalHistoryResponse:
        return MedicalHistoryResponse.fromJson(json);
      case lifeStyleResponse:
        return LifeStyleResponse.fromJson(json);
      case dietAndNutritionResponse:
        return DietAndNutritionResponse.fromJson(json);
      case fitnessAndPhysicalActivityResponse:
        return FitnessAndPhysicalActivityResponse.fromJson(json);
 case healthAndBioHackingResponse:
        return HealthAndBioHackingResponse.fromJson(json);
      case uploadDocCommonResponse:
        return UploadDocCommonResponse.fromJson(json);
      case preferencesForPlanCustomizationModel:
        return PreferencesForPlanCustomizationModel.fromJson(json);
      case saveGoalsResponseModel:
        return SaveGoalsResponseModel.fromJson(json);
      case longTermHealthResponseModel:
        return LongTermHealthResponseModel.fromJson(json);
      case sleepAndRecoveryResponseModel:
        return SleepAndRecoveryResponseModel.fromJson(json);
      case mentalAndCognitiveHealthResponseModel:
        return MentalAndCognitiveHealthResponseModel.fromJson(json);
      case biohackingResponseModel:
        return BiohackingResponseModel.fromJson(json);
      case medicineAndSupplmentResponseModel:
        return MedicineAndSupplmentResponseModel.fromJson(json);
        case getPlansSubscriptionResponseModel:
        return GetPlansSubscriptionResponseModel.fromJson(json);
        case getSubscriptionStatus:
        return GetSubscriptionsStatus.fromJson(json);

      case foodScanModel:
        return FoodScanResponse.fromJson(json);
      case mealScanModel:
        return MealScanResponse.fromJson(json);
      case supplementScanModel:
        return SupplementScanResponse.fromJson(json);
      case medicineScanModel:
        return MedicineScanResponse.fromJson(json);
      case addDietGoalsResponseModel:
        return AddDietGoalResponseModel.fromJson(json);
      case checkGroceryItemsResponseModel:
        return CheckGroceryItemsResponseModel.fromJson(json);
      case generateReportResponseModel:
        return GenerateReportResponseModel.fromJson(json);
      case getAllMealPlansResponseModel:
        return GetAllMealPlansResponseModel.fromJson(json);
      case getDailyIntakesResponseModel:
        return GetDailyIntakesResponseModel.fromJson(json);
      case getGroceryListItemsResponseModel:
        return GetGroceryListItemsResponseModel.fromJson(json);
      case getLoggedOrNotLoggedMealPlansResponseModel:
        return GetLoggedOrNotLoggedMealPlansResponseModel.fromJson(json);
      case getMealOptionsResponseModel:
        return GetMealOptionsResponseModel.fromJson(json);
      case getMealTypesResponseModel:
        return GetMealTypesResponseModel.fromJson(json);
      case getNutritionPlansResponseModel:
        return GetNutritionPlanResponseModel.fromJson(json);
      case reportHistoryResponseModel:
        return ReportHistoryResponseModel.fromJson(json);
      case saveMealResponseModel:
        return SaveMealResponseModel.fromJson(json);
      case setDailyIntakeReminderResponseModel:
        return SetDailyIntakeReminderResponseModel.fromJson(json);
      case updateDailyIntakeResponseModel:
        return UpdateDailyIntakeResponseModel.fromJson(json);
      case getReportHistoryResponseModel:
        return GetReportsHistoryResponseModel.fromJson(json);
     case phoneSignupResponse:
        return PhoneSignupResponse.fromJson(json);
        case phoneVerificationResponse:
        return PhoneVerificationResponse.fromJson(json);
        case homeResponse:
        return HomeResponse.fromJson(json);

 case emailOtpVerfiyResponse:
        return EmailOtpVerfiyResponse.fromJson(json);
        case googleLoginResponse:
        return GoogleLoginResponse.fromJson(json);
 case homeDataResponse:
        return HomeResponse.fromJson(json);


    }
  }
}
