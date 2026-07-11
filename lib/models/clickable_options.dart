class ClickableOptions {
  final String iconName;
  final String title;
  final bool isEnabled;
  final void Function()? onClick;
  final void Function(bool)? onChange;

  ClickableOptions({
    required this.iconName,
    required this.title,
    this.isEnabled = false,
    this.onClick,
    this.onChange,
  });
}
