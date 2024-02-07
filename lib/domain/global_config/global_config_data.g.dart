// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_config_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GlobalConfigDataAdapter extends TypeAdapter<GlobalConfigData> {
  @override
  final int typeId = 1;

  @override
  GlobalConfigData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlobalConfigData(
      url: fields[0] == null ? '' : fields[0] as String,
      enabledTradingPage: fields[1] == null ? true : fields[1] as bool,
      enabledNonCustodialWalletConnect:
          fields[4] == null ? true : fields[4] as bool,
      termsAndConditionsUrl: fields[6] == null ? '' : fields[6] as String,
      enabledNonCustodialExchangePage:
          fields[8] == null ? false : fields[8] as bool,
      withTradingBalance: fields[10] == null ? false : fields[10] as bool,
      enabledBuySell: fields[11] == null ? false : fields[11] as bool,
      googleAuthClientId: fields[3] == null ? '' : fields[3] as String,
      enabledStaking: fields[12] == null ? false : fields[12] as bool,
      enabledPhoneVerificationStep:
          fields[13] == null ? false : fields[13] as bool,
      enabledReferrals: fields[14] == null ? false : fields[14] as bool,
      enabledLoginCaptcha: fields[15] == null ? true : fields[15] as bool,
      orderBookMiddle: fields[16] == null ? false : fields[16] as bool,
      enabledSpread: fields[17] == null ? true : fields[17] as bool,
      withInstantBuy: fields[18] == null ? true : fields[18] as bool,
      withInstantSell: fields[19] == null ? true : fields[19] as bool,
      enabledSellWithdrawZeroBalance:
          fields[20] == null ? true : fields[20] as bool,
      extensionCodeError: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GlobalConfigData obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.enabledTradingPage)
      ..writeByte(3)
      ..write(obj.googleAuthClientId)
      ..writeByte(4)
      ..write(obj.enabledNonCustodialWalletConnect)
      ..writeByte(6)
      ..write(obj.termsAndConditionsUrl)
      ..writeByte(7)
      ..write(obj.extensionCodeError)
      ..writeByte(8)
      ..write(obj.enabledNonCustodialExchangePage)
      ..writeByte(10)
      ..write(obj.withTradingBalance)
      ..writeByte(11)
      ..write(obj.enabledBuySell)
      ..writeByte(12)
      ..write(obj.enabledStaking)
      ..writeByte(13)
      ..write(obj.enabledPhoneVerificationStep)
      ..writeByte(14)
      ..write(obj.enabledReferrals)
      ..writeByte(15)
      ..write(obj.enabledLoginCaptcha)
      ..writeByte(16)
      ..write(obj.orderBookMiddle)
      ..writeByte(17)
      ..write(obj.enabledSpread)
      ..writeByte(18)
      ..write(obj.withInstantBuy)
      ..writeByte(19)
      ..write(obj.withInstantSell)
      ..writeByte(20)
      ..write(obj.enabledSellWithdrawZeroBalance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalConfigDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
