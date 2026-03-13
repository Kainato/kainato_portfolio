enum Assets {
  dashatar
}

extension AssetsExtension on Assets {
  String get path {
    switch (this) {
      case Assets.dashatar:
        return 'assets/home/dashatar.png';
    }
  }
}