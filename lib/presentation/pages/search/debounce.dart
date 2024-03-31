import 'dart:async';
import 'dart:ui';

class Debouncer {
  final int milliseconds;
  late VoidCallback action;

  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    this.action = action;
    _timer = Timer(Duration(milliseconds: milliseconds), this.action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
