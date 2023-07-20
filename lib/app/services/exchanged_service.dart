// import 'package:get/get.dart';

// import '../api/rest_client.dart';
// import '../models/models.dart';

// abstract class IExchangedService {
//   Future<List<ExchangedRatesModel>> getCurrencyRates();
// }

// class ExchangedService implements IExchangedService {
//   final _isBusyToLoad = false.obs;
//   bool get isBusyToLoad => _isBusyToLoad.value;
//   final CurrencyService _currencyService = Get.find();

//   @override
//   Future<List<ExchangedRatesModel>> getCurrencyRates() async {
//     try {
//       isBusyToLoad;
//       final res = await _currencyService.getCurrencyRates("2023-07-20"),
      
//       if (res.isFail) {
//         final error = res.errorMessage;

//         return fail(error);
//       }
//       return successWith(res.value);
//     } finally {
//       _isBusyToLoad(false);
//     }
//   }
// }
