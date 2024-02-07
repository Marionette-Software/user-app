// class for convert  JSON to dart object
class RampCoin {
  int? minPurchaseAmountEur;
  int? maxPurchaseAmountEur;
  double? minFeePercent;
  double? maxFeePercent;
  double? minFeeAmountEur;
  List<Assets>? assets;

  RampCoin(
      {this.minPurchaseAmountEur,
      this.maxPurchaseAmountEur,
      this.minFeePercent,
      this.maxFeePercent,
      this.minFeeAmountEur,
      this.assets});

  RampCoin.fromJson(Map<String, dynamic> json) {
    minPurchaseAmountEur = json['minPurchaseAmountEur'];
    maxPurchaseAmountEur = json['maxPurchaseAmountEur'];
    minFeePercent = json['minFeePercent'];
    maxFeePercent = json['maxFeePercent'];
    minFeeAmountEur = json['minFeeAmountEur'];
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(Assets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['minPurchaseAmountEur'] = minPurchaseAmountEur;
    data['maxPurchaseAmountEur'] = maxPurchaseAmountEur;
    data['minFeePercent'] = minFeePercent;
    data['maxFeePercent'] = maxFeePercent;
    data['minFeeAmountEur'] = minFeeAmountEur;
    if (assets != null) {
      data['assets'] = assets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assets {
  String? symbol;
  String? type;
  String? apiV3Symbol;
  String? apiV3Type;
  String? chain;
  String? name;
  int? decimals;
  String? address;
  String? logoUrl;
  bool? enabled;
  bool? hidden;
  double? priceEur;
  String? priceUpdateTs;
  Price? price;
  double? minPurchaseAmountEur;
  int? maxPurchaseAmountEur;
  String? minPurchaseCryptoAmount;
  double? networkFeeEur;
  String? networkParamsUpdatedAt;

  Assets(
      {this.symbol,
      this.type,
      this.apiV3Symbol,
      this.apiV3Type,
      this.chain,
      this.name,
      this.decimals,
      this.address,
      this.logoUrl,
      this.enabled,
      this.hidden,
      this.priceEur,
      this.priceUpdateTs,
      this.price,
      this.minPurchaseAmountEur,
      this.maxPurchaseAmountEur,
      this.minPurchaseCryptoAmount,
      this.networkFeeEur,
      this.networkParamsUpdatedAt});

  Assets.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    type = json['type'];
    apiV3Symbol = json['apiV3Symbol'];
    apiV3Type = json['apiV3Type'];
    chain = json['chain'];
    name = json['name'];
    decimals = json['decimals'];
    address = json['address'];
    logoUrl = json['logoUrl'];
    enabled = json['enabled'];
    hidden = json['hidden'];
    priceEur = json['priceEur'];
    priceUpdateTs = json['priceUpdateTs'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    minPurchaseAmountEur = json['minPurchaseAmountEur'];
    maxPurchaseAmountEur = json['maxPurchaseAmountEur'];
    minPurchaseCryptoAmount = json['minPurchaseCryptoAmount'];
    networkFeeEur = json['networkFeeEur'];
    networkParamsUpdatedAt = json['networkParamsUpdatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['type'] = type;
    data['apiV3Symbol'] = apiV3Symbol;
    data['apiV3Type'] = apiV3Type;
    data['chain'] = chain;
    data['name'] = name;
    data['decimals'] = decimals;
    data['address'] = address;
    data['logoUrl'] = logoUrl;
    data['enabled'] = enabled;
    data['hidden'] = hidden;
    data['priceEur'] = priceEur;
    data['priceUpdateTs'] = priceUpdateTs;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['minPurchaseAmountEur'] = minPurchaseAmountEur;
    data['maxPurchaseAmountEur'] = maxPurchaseAmountEur;
    data['minPurchaseCryptoAmount'] = minPurchaseCryptoAmount;
    data['networkFeeEur'] = networkFeeEur;
    data['networkParamsUpdatedAt'] = networkParamsUpdatedAt;
    return data;
  }
}

class Price {
  double? pLN;
  double? uSD;
  double? eUR;
  double? gBP;

  Price({this.pLN, this.uSD, this.eUR, this.gBP});

  Price.fromJson(Map<String, dynamic> json) {
    pLN = json['PLN'];
    uSD = json['USD'];
    eUR = json['EUR'];
    gBP = json['GBP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PLN'] = pLN;
    data['USD'] = uSD;
    data['EUR'] = eUR;
    data['GBP'] = gBP;
    return data;
  }
}
