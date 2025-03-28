import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/network/api_url.dart';

import '../../../../network/api_service.dart';

class FitnessProvider with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  List<Map<String, dynamic>> _femaleExercises = [];
  List<Map<String, dynamic>> _maleExercises = [];
  Map<String, dynamic> _selectedExercise = {};

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<Map<String, dynamic>> get femaleExercises => _femaleExercises;
  List<Map<String, dynamic>> get maleExercises => _maleExercises;
  Map<String, dynamic> get selectedExercise => _selectedExercise;
  List<Map<String, dynamic>> _fitnessLogs = [];
  List<Map<String, dynamic>> _pushUpsExercises = [];
  Map<String, dynamic> _fitnessSummary = {};
  List<Map<String, dynamic>> get fitnessLogs => _fitnessLogs;
  List<Map<String, dynamic>> get pushUpsExercises => _pushUpsExercises;
  Map<String, dynamic> get fitnessSummary => _fitnessSummary;


  Future<void> fetchFemaleFitnessExercises() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await MyApi.callGetApi(
        url: getFitnessUrl,
        modelName: 'FemaleExercisesModel',
      );

      if (response != null) {
        _femaleExercises = List<Map<String, dynamic>>.from(response);
      } else {
        _errorMessage = 'Failed to fetch female fitness exercises';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMaleFitnessExercises() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await MyApi.callGetApi(
        url: getFitnessUrl,
        modelName: 'MaleExercisesModel',
      );

      if (response != null) {
        _maleExercises = List<Map<String, dynamic>>.from(response);
      } else {
        _errorMessage = 'Failed to fetch male fitness exercises';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSelectedExercise(Map<String, dynamic> exercise) {
    _selectedExercise = exercise;
    notifyListeners();
  }

  Future<void> startWorkout(BuildContext context, String routeName) async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(Duration(seconds: 1));

      Navigator.of(context).pushNamed(routeName);
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchFitnessLogs() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate a dummy API call
      final response = await MyApi.callGetApi(
        url: getFitnessUrl,
        modelName: 'FitnessLogsModel', // Replace with your model name
      );

      if (response != null) {
        // Assuming the response is a list of fitness logs
        _fitnessLogs = List<Map<String, dynamic>>.from(response);
      } else {
        _errorMessage = 'Failed to fetch fitness logs';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Function to fetch push-ups exercises
  Future<void> fetchPushUpsExercises() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate a dummy API call
      final response = await MyApi.callGetApi(
        url: getExerciseUrl,
        modelName: 'PushUpsExercisesModel', // Replace with your model name
      );

      if (response != null) {
        // Assuming the response is a list of push-ups exercises
        _pushUpsExercises = List<Map<String, dynamic>>.from(response);
      } else {
        _errorMessage = 'Failed to fetch push-ups exercises';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Function to fetch fitness summary
  Future<void> fetchFitnessSummary() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate a dummy API call
      final response = await MyApi.callGetApi(
        url: getFitnessUrl,
        modelName: 'FitnessSummaryModel', // Replace with your model name
      );

      if (response != null) {
        // Assuming the response is a map of fitness summary data
        _fitnessSummary = Map<String, dynamic>.from(response);
      } else {
        _errorMessage = 'Failed to fetch fitness summary';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addFitnessPlan(Map<String, dynamic> plan) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await MyApi.callPostApi(
        url: postPersonalizedWorkoutPlanUrl,
        body: plan,
        modelName: 'FitnessPlanModel',
      );

      if (response != null) {
        // Assuming the response is the added fitness plan
        _fitnessLogs.add(Map<String, dynamic>.from(response));
      } else {
        _errorMessage = 'Failed to add fitness plan';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}