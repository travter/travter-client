import 'package:flutter/material.dart';

extension MediaQuerySize on BuildContext {
  Size get mediaSize => MediaQuery.of(this).size;
}
