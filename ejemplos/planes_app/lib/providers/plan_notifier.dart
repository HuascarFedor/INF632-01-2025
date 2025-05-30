import 'package:flutter/material.dart';

import '../models/plan.dart';
import '../controllers/plan_controller.dart';

class PlanNotifier extends ChangeNotifier {
  final PlanController _planController;

  PlanNotifier(this._planController);

  List<Plan> get plans => _planController.plans;
  int get plansCount => plans.length;

  void addPlan(String name) {
    _planController.addPlan(name);
    notifyListeners();
  }

  void deletePlan(Plan plan) {
    _planController.deletePlan(plan);
    notifyListeners();
  }
}
