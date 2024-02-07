import 'package:user_app/domain/general/request_status.dart';

class RequestStatusWithDetail {
  final RequestStatus status;
  final String detail;
  RequestStatusWithDetail({
    required this.status,
    required this.detail,
  });
}
