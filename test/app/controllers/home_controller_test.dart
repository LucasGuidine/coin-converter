import 'package:coin_converter/app/controllers/home_controller.dart';
import 'package:coin_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);
  testWidgets('deve converter de real para dólar', (WidgetTester tester) async {
    toText.text = '2,0';
    homeController.convert();

    await tester.pump(); // Aguarda a atualização da UI

    expect(fromText.text, '0.36');
  });

  testWidgets('deve converter de dólar para real', (WidgetTester tester) async {
    toText.text = '1.0';
    homeController.toCurrency = CurrencyModel(
        name: 'Dolar', real: 5.63, dolar: 1.0, euro: 0.85, bitcoin: 0.000088);
    homeController.fromCurrency = CurrencyModel(
        name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);
    homeController.convert();

    await tester.pump(); // Aguarda a atualização da UI

    expect(fromText.text, '5.63');
  });
}
