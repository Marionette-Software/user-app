class TabItem {
  TabItem({
    required this.title,
    required this.iconSrc,
    required this.tabName,
    required this.controller,
    this.selected = false,
  });

  String title;
  String iconSrc;
  bool selected;
  String tabName;
  // ignore: prefer_typing_uninitialized_variables
  var controller;
}
