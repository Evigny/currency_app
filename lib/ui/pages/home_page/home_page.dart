import 'package:auto_route/annotations.dart';
import 'package:currency_app/app/api/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/models/models.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio _dio = Get.find();
  final RestClient _restClient = Get.find();

  bool _showCurrency = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Rates'),
        leading: const Icon(Icons.arrow_back),
        actions: [
          IconButton(
            onPressed: () {
              _showCurrency = !_showCurrency;
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<ExchangedRatesModel>>(
          future: _restClient.getCurrencyRates("2023-07-20"),
          builder: (context, snapshot) {
            final currencyRates = snapshot.data ?? [];
            return ListView.builder(
              itemCount: currencyRates.length,
              itemBuilder: (context, index) {
                final rate = currencyRates[index];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(rate.currency ?? ''),
                      _showCurrency
                          ? Text(rate.rates.toString() ?? '')
                          : Switch.adaptive(
                              value: _showCurrency,
                              onChanged: (value) {
                                _showCurrency = value;
                              },
                            ),
                    ],
                  ),
                  subtitle: Text('1 ${rate.currency}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
