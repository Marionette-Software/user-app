import 'package:equatable/equatable.dart';

class PrecisionCurrencyState extends Equatable {
  const PrecisionCurrencyState({
    required this.swapBaseToQuotePricePrecision,
    required this.swapQuoteToBasePricePrecision,
  });

  final int swapBaseToQuotePricePrecision;
  final int swapQuoteToBasePricePrecision;

  @override
  List<Object> get props => [
        swapBaseToQuotePricePrecision,
        swapQuoteToBasePricePrecision,
      ];
}
