import '../utils/list_utils.dart';
import '../models/plan.dart';

class PlanController {
  final _plans = <Plan>[];
  List<Plan> get plans => List.unmodifiable(_plans);

  void addPlan(String name) {
    if (name.isEmpty) name = "Plan";
    name = ListUtils.checkForDuplicates(plans.map((plan) => plan.name), name);
    _plans.add(Plan(name: name));
  }

  void deletePlan(Plan plan) {
    _plans.remove(plan);
  }
}
