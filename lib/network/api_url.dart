// production url
// const String baseUrl = "https://dev-api.nutri-guard.ai/v1";
// staging urls
const String baseUrl = "http://3.147.20.61:8095/v1";

const String auth = "$baseUrl/auth";
const String loginApiUrl = "$auth/email";
const String phoneLoginApiUrl = "$auth/phone";
const String signUpApiUrl = "$auth/email-signup";
const String otpApiUrl = "$auth/otp";
const String forgotPasswordEmailApiUrl = "$auth/forgot-password";
const String phoneSignUpApiUrl = "$auth/phone-signup";
const String refreshTokenUrl = "$auth/refresh-token";
const String uploadImageUrl = "$auth/profile-picture";
const String googleSignUpUrl = "$auth/google-signup";
const String googleSignInUrl = "$auth/google";
const String homeApiUrl = "$baseUrl/home";
const String getReadinessUrl = "$homeApiUrl/home/readiness";
const String getRespiratoryRateUrl = "$homeApiUrl/home/respiratory-rate";
const String getSp02Url = "$homeApiUrl/home/sp02";
const String getHydrationUrl = "$homeApiUrl/home/hydration";
const String getWeightUrl = "$homeApiUrl/home/weight";
const String getStressUrl = "$homeApiUrl/home/stress";
const String getCaloriesUrl = "$homeApiUrl/home/calories";
const String getStepsUrl = "$homeApiUrl/home/steps";
const String getHeartRateUrl = "$homeApiUrl/home/heart-rate";
const String getSleepDurationUrl = "$homeApiUrl/home/sleep-duration";
const String patchUpdateGenderUrl = "$baseUrl/profile/gender";
const String patchUpdateAgeUrl = "$baseUrl/profile/age";
const String patchUpdateHeightUrl = "$baseUrl/profile/height";
const String patchUpdateWeightUrl = "$baseUrl/profile/weight";
const String postMedicalHistoryUrl = "$baseUrl/medical-history";
const String postLifestyleUrl = "$baseUrl/lifestyle";
const String dietPreferenceUrl = "$baseUrl/diet-preference";
const String workoutUrl = "$baseUrl/workout";
const String healthGoalUrl = "$baseUrl/health-goal";
const String uploadDocUrl = "$baseUrl/health-testing/upload";
const String savePreferencesForPlanCustomizationUrl =
    "$baseUrl/plan-customization";

const String postGoalsUrl = "$baseUrl/goals";
//Scanner
const String saveMedicalScanUrl = "$baseUrl/scanner/medicine";
const String saveFoodScanUrl = "$baseUrl/scanner/food-product";
const String saveSupplementScanUrl = "$baseUrl/scanner/supplement";
const String saveMealScanUrl = "$baseUrl/scanner/meal";
const String sleepRecoveryUrl = "$baseUrl/sleep-recovery/recommendations";
const String getLongTermHealthUrl = "$baseUrl/long-term-health/recommendations";
const String mentalAndCognitiveHealthUrl =
    "$baseUrl/mental-cognitive/recommendations";
const String biohackingUrl = "$baseUrl/biohacking/recommendations";
const String medicineAndSupplementUrl = "$baseUrl/medicine-supplement/recommendations";
const String getPlansSubscriptionUrl = "$baseUrl/subscriptions/plans";
const String getSubscriptionStatusUrl = "$baseUrl/subscriptions/status";
const String postNutritionProfileUrl = "$baseUrl/nutrition-profile";
const String getNutritionPlanUrl = "$baseUrl/nutrition-profile/nutrition-plan";
const String getAllMealPlansUrl = "$baseUrl/nutrition-profile/meal-plans";
const String getGroceryListItemsResponseModel = "$baseUrl/nutrition-profile/grocery-list";
const String patchCheckGroceryItemUrl = "$baseUrl/nutrition-profile/grocery-list/19db7d15-caa3-4e32-9a2d-59d4e445f4c8";
const String getDailyIntakesUrl = "$baseUrl/nutrition-profile/daily-intakes";
const String updateDailyIntakesUrl = "$baseUrl/nutrition-profile/daily-intakes/7fa9d828-dd5f-45e9-90a9-21f7f06ea742";
const String postSaveNutritionLogUrl = "$baseUrl/nutrition-profile/nutrition-log";
const String postScanMealUrl = "$baseUrl/nutrition-profile/scan-meal";
const String getMealTypesUrl = "$baseUrl/nutrition-profile/meal-types";
const String postSaveMealUrl = "$baseUrl/nutrition-profile/meal";
const String getMealOptionsUrl = "$baseUrl/nutrition-profile/meal-options";
const String postSetDailyIntakeRemindersUrl = "$baseUrl/nutrition-profile/daily-intake-reminder";
const String postAddDietGoalUrl = "$baseUrl/nutrition-profile/diet-goal";
/// Fitness Url
const String postNewRequestUrl = "$baseUrl/user-exercises/generate-week-exercises/";
/// Reports Url
const String postGenerateReportUrl = "$baseUrl/reports/generate";
const String getReportsHistoryUrl = "$baseUrl/reports/history";

/// Fitness Url
const String getFitnessUrl = "$baseUrl/workout/fitness-plan";
const String postPersonalizedWorkoutPlanUrl = "$baseUrl/workout/personalized-workout";
const String postLogExerciseUrl = "$baseUrl/workout/exercise/complete";
const String getExerciseUrl = "$baseUrl/workout/exercises";
const String getSupplementDetailUrl = "$baseUrl/workout/supplement/";
const String getCategoryDetailsUrl = "$baseUrl/workout/category-details";
const String getStartAllExerciseWorkoutUrl = "$baseUrl/start-workout/category";
const String getStartCategoryWorkoutUrl = "$baseUrl/workout/start-workout/category";
const String getStartSingleExerciseWorkoutUrl = "$baseUrl/workout/start-workout/exercise";
const String postSetLogUrl = "$baseUrl/workout/log-set";
const String getWorkoutSummaryUrl = "$baseUrl/workout/get-workout-summary";
const String getCaloriesBurnedUrl = "$baseUrl/workout/calories-burned";
