import 'package:coin_converter/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../components/currency_box.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(left: 30, bottom: 30, right: 20, top: 100),
            child: Column(
              children: [
                Image.network(
                  'https://cdn.shopify.com/app-store/listing_images/97b64b21046fad1b0727bc3fb9c4f9a7/icon/CIvJ98Oh1PsCEAE=.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 50),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model!;
                    });
                  },
                  controller: homeController.toText,
                ),
                SizedBox(height: 50),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  },
                  controller: homeController.fromText,
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {
                    homeController.convert();
                  },
                  child: Text('Converter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
