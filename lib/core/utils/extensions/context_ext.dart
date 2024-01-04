import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Widget get hSepartor => SizedBox(
        height: 15,
      );

  ThemeData get theme {
    return Theme.of(this);
  }

  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  MediaQueryData get mediaQuery {
    return MediaQuery.of(this);
  }

  NavigatorState get navigator {
    return Navigator.of(this);
  }
}
