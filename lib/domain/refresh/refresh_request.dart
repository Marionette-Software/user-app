import 'package:equatable/equatable.dart';

class RefreshRequest extends Equatable {
  const RefreshRequest({
    required this.refresh,
  });

  final String refresh;

  @override
  List<Object> get props => [refresh];
}

class RefreshRequestfff extends Equatable {
  const RefreshRequestfff({
    required this.refresh,
    required this.marketId,
  });

  final String refresh;
  final String marketId;

  @override
  List<Object> get props => [refresh, marketId];
}

class RefreshRequestPublicTradeHistory extends Equatable {
  const RefreshRequestPublicTradeHistory({
    required this.refresh,
    required this.marketId,
  });

  final String refresh;
  final String marketId;

  @override
  List<Object> get props => [refresh, marketId];
}
