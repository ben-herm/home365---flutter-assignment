part of '../theme/theme.dart';

class _Assets {
  String get logo => _jpg('home365');

  static String _jpg(String fileName) {
    return 'assets/jpg/$fileName.jpg';
  }
}
