class DialogRequest {
  final DialogType dialogType;
  final String title;
  final String message;
  final bool autoDismiss;
  final bool dismissable;
  final Duration duration;

  DialogRequest({
    this.dialogType = DialogType.simple,
    required this.title,
    required this.message,
    this.dismissable = true,
    this.autoDismiss = false,
    this.duration = const Duration(seconds: 3),
  });
}

enum DialogType { simple, floating }
