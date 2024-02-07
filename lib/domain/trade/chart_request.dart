import 'package:equatable/equatable.dart';

class ChartRequest extends Equatable {
  const ChartRequest({
    required this.refresh,
    required this.marketId,
  });

  final String refresh;
  final String marketId;

  @override
  List<Object> get props => [
        refresh,
        marketId,
      ];
}
