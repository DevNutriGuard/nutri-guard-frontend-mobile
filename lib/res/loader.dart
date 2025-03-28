import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/res/res.dart';
import 'assets.dart';

class Loader {
  showLoader({
    BuildContext? context,
  }) {
    showDialog(
      context: context!,
      builder: (_) {
        return Material(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Transform.scale(
              scale: 5,
              child: SizedBox(
                height: sizes!.height * 0.06,
                width: sizes!.width * 0.06,
                child: Image.asset(
                  Assets.loader,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }

  getLoader() {
    return Center(
      child: SizedBox(
        height: getHeight() * 0.1,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  static double getHeight() => sizes?.height ?? 2560;

  static double getWidth() => sizes?.width ?? 1440;
}
