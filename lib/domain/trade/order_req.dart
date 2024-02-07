import 'package:equatable/equatable.dart';

class OrderReqData extends Equatable {
  const OrderReqData({
    this.market,
    this.status,
    this.refresh,
    this.limit = 1000,
    this.page = 1 ,
  });

  final String? market;
  final String? status;
  final String? refresh;
  final int limit;
  final int page;

  @override
  List<Object> get props => [
    market!,
    status!,
    refresh!,
    limit,
    page,
  ];
}
