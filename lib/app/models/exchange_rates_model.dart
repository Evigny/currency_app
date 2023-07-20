import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rates_model.freezed.dart';
part 'exchange_rates_model.g.dart';

@freezed
class ExchangedRatesModel with _$ExchangedRatesModel {
  factory ExchangedRatesModel({
    @JsonKey(name: 'Cur_Name') String? currency,
    @JsonKey(name: 'Cur_OfficialRate') double? rates,
  }) = _ExchangedRatesModel;

  factory ExchangedRatesModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangedRatesModelFromJson(json);
}
