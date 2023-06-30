import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Utils {
  static showSnackbarFunction(
      BuildContext context, SnackBarType type, String message) {
    switch (type) {
      case SnackBarType.success:
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.success(
            message: message,
          ),
        );
        break;
      case SnackBarType.error:
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        break;
      case SnackBarType.info:
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.info(
            message: message,
          ),
        );
        break;
      default:
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.success(
            message: message,
          ),
        );
    }
  }

  static giveBorder(Color color, {required double width}) {
    return BorderSide(width: width, color: color);
  }

  static giveRadius({required double radius}) {
    return BorderRadius.circular(radius);
  }
}

enum SnackBarType { info, success, error }
