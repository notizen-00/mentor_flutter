import 'package:flutter/material.dart';
import 'package:internship_app/core/theme/app_colors.dart';
import 'package:toastification/toastification.dart';

void showSuccessToast(BuildContext context, String message) {
  _showCustomToast(
    context: context,
    title: 'Sukses!',
    message: message,
    type: ToastificationType.success,
    primaryColor: Colors.green,
    icon: const Icon(Icons.check_circle_outline, color: Colors.green),
  );
}

void showErrorToast(BuildContext context, String message) {
  _showCustomToast(
    context: context,
    title: 'Gagal!',
    message: message,
    type: ToastificationType.error,
    primaryColor: Colors.redAccent,
    icon: const Icon(Icons.error_outline, color: Colors.red),
  );
}

void showInfoToast(BuildContext context, String message) {
  _showCustomToast(
    context: context,
    title: 'Info',
    message: message,
    type: ToastificationType.info,
    primaryColor: AppColors.primary,
    icon: const Icon(Icons.info_outline, color: Colors.blue),
  );
}

void _showCustomToast({
  required BuildContext context,
  required String title,
  required String message,
  required ToastificationType type,
  required Color primaryColor,
  required Icon icon,
}) {
  toastification.show(
    context: context,
    type: type,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 4),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    description: Text(message),
    alignment: Alignment.bottomCenter,
    animationDuration: const Duration(milliseconds: 300),
    icon: icon,
    showIcon: true,
    primaryColor: primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
      )
    ],
    showProgressBar: true,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
  );
}
