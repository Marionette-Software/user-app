import 'package:equatable/equatable.dart';

class GetMarketReqData extends Equatable {
  const GetMarketReqData({
    this.refresh,
  });

  final String? refresh;

  @override
  List<Object> get props => [
        refresh!,
      ];
}
