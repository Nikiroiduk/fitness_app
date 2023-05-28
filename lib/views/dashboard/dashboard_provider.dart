
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dashboardProvider = StateNotifierProvider<DashboardNotifier, int>(
    (ref) => DashboardNotifier(1));

class DashboardNotifier extends StateNotifier<int> {
  DashboardNotifier(super.state);

  void setValue(int value) {
    state = value;
  }
}