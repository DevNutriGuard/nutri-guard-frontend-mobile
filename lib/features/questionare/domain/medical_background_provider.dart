import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/models/medical_history_response.dart';
import 'package:nutri_guard_mobile/network/api_service.dart';
import 'package:nutri_guard_mobile/res/toasts.dart';

import '../../../network/api_url.dart';
import '../../../network/models.dart';

class MedicalBackGroundProvider extends ChangeNotifier {
  MedicalHistoryResponse medicalHistoryResponse  = MedicalHistoryResponse();
  BuildContext ?context;
  int currentStep = 0;
  List<String> selectedConditions = [];
  TextEditingController medicalConditionController = TextEditingController();
  List<Map<String, String>> medications = [];
  String selectedOption = '';
  List<Map<String, String>> vitaminsAndSupplements = [];
  String selectedVitaminsAndSupplementsOptions = '';
  bool isHighlighted = false;
  List<String> selectedConditionsForAllergies = [];
  TextEditingController medicalConditionControllerForAllergies = TextEditingController();
  bool isHighlightedForAllergies = false;
  String selectedOptionForAllergies = '';
  List<String> selectedConditionsForPastMedicalConditions = [];
  TextEditingController medicalConditionControllerForPastMedicalConditions = TextEditingController();
  bool isHighlightedForPastMedicalConditions = false;
  String selectedOptionForPastMedicalConditions = '';
  List<String> selectedConditionsForHealthConcern = [];
  TextEditingController medicalConditionControllerForHealthConcern = TextEditingController();
  bool isHighlightedForHealthConcern = false;
  String selectedOptionForHealthConcern = '';
  // Predefined medical conditions for matching
  final List<String> predefinedConditions = [
    "Diabetes",
    "Hypertension",
    "Asthma",
    "Heart Disease",
    "Obesity",
    "Cancer",
    // Add more conditions as needed
  ];
  initContext({context})
  {
    this.context=context;
  }

  Future<bool> saveMedicalBackground({
    required String profileId,
  }) async {

    final body = {
      "medicalConditions": selectedConditions,
      "isTakingMedicines": medications.isNotEmpty?true:false,
      "medicines": medications,
      "isTakingSupplements": vitaminsAndSupplements.isNotEmpty?true:false,
      "isAnyAllergies": selectedConditionsForAllergies.isNotEmpty?true:false,
      "supplements": vitaminsAndSupplements,
      "allergies": selectedConditionsForAllergies,
      "isAnyPastCondition": selectedConditionsForPastMedicalConditions.isNotEmpty?true:false,
      "pastMedicalCondition": selectedConditionsForPastMedicalConditions,
      "isAnyHealthConcern": selectedConditionsForHealthConcern.isNotEmpty?true:false,
      "healthConcern": selectedConditionsForHealthConcern,
      "profileId": profileId,
    };
    print("body for medical background: $body");

    try {
      medicalHistoryResponse = await MyApi.callPostApi(url: postMedicalHistoryUrl,
          body: body,
      modelName: Models.medicalHistoryResponse);

      if (medicalHistoryResponse.statusCode == 201) {
        print("medicalHistoryResponse: ${medicalHistoryResponse.statusCode}");
        Toasts.getSuccessToast(text: medicalHistoryResponse.data?.message);
        return true;
      } else {
        print("medicalHistoryResponse: ${medicalHistoryResponse.statusCode}");
        return false;

      }
    } catch (e) {
      print("Exception occurred: $e");
      return false;
    }
  }
}