import 'package:user_app/presentation/app/components/header_web/components/header_item_list.dart';

class HeaderResponse {
  HeaderResponse({
    required this.currentPage,
    required this.userName,
    required this.tabs,
  });

  final String currentPage;
  final String userName;
  final List<TabItem> tabs;
}
