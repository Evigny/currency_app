import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/models.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.nbrb.by/exrates/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("rates?periodicity=0")
  Future<List<ExchangedRatesModel>> getCurrencyRates(
      @Query("ondate") String date);
}
