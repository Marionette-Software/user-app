import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_app/infrastructure/blockchain/ramp_coin.dart';

// Using only when you want to use the ramp
class RampService {
  // read the JSON data from the server RampCoin
  Future<RampCoin> fetchCoins() async {
    final response = await http
        .get(Uri.parse('https://api-instant.ramp.network/api/host-api/assets'));
    if (response.statusCode == 200) {
      return RampCoin.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  //write to hive
  // Future<void> writeToHiveRamp(RampCoin rampCoin) async {
  //   var box =  Hive.box<GlobalConfigData>(Constants.globalConfig);
  //   box.put('rampCoin', rampCoin);
  // }

  //read from hive or fetch from api
  // Future<RampCoin> readFromHiveRamp() async {
  //   var box = await Hive.box<GlobalConfigData>(Constants.globalConfig);
  //   if (box.containsKey('rampCoin')) {
  //     return box.get('rampCoin');
  //   } else {
  //     RampCoin data = await fetchCoins();
  //     writeToHiveRamp(data);
  //     return data;
  //   }
  // }

  // //Get list ramp coins
  // Future<RampCoin> getCoins() async {
  //   RampCoin rampCoin = await readFromHiveRamp();
  //   return rampCoin;
  // }
}

// find current currecy in the ramp
// bool isActiveRamp(
//     String shortName, // e.g. 'ETH'
//     RampCoin rampCoin, // ramp data array
//     GGetBLData blockchain // data from graphql
//
//     ) {
//   for (var i = 0; i < rampCoin.assets!.length; i++) {
//     for (int j = 0;
//         j < blockchain.depositCurrencyPaymentInterfaces!.length;
//         j++) {
//       if (rampCoin.assets![i].apiV3Type != 'NATIVE' &&
//           blockchain.depositCurrencyPaymentInterfaces![j].contractAddress !=
//               null &&
//           rampCoin.assets![i].address != null &&
//           shortName.toLowerCase() ==
//               rampCoin.assets![i].apiV3Symbol!.toLowerCase()) {
//         if (blockchain.depositCurrencyPaymentInterfaces![j].contractAddress!
//                 .toLowerCase() ==
//             rampCoin.assets![i].address!.toLowerCase()) {
//           return true;
//         }
//       } else if (shortName.toLowerCase() ==
//               rampCoin.assets![i].apiV3Symbol!.toLowerCase() &&
//           rampCoin.assets![i].chain == 'ETH') {
//         return true;
//       }
//     }
//   }
//   return false;
// }
