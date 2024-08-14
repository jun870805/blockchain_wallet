import 'package:flutter/material.dart';
import 'package:blockchain_wallet/shared/styles/styles.dart';

import '../../../../shared/components/components.dart';

Color _getBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _counter = 0;
  int? _selectedId;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return BWAppBar(
      // title: 'ssss',
      titleWidget: BWDropdownButton(
        width: 120,
        items: <MenuItem>[
          MenuItem(
            id: 0,
            title: 'Apple',
            image:
                'https://ipfs.boxtradex.io/ipfs/Qma4uqU9rg7PoLGsWaUDmELesmC45bBUKp3xVH2SeaM9Bf?filename=sporte_logo.jpg',
          ),
          MenuItem(id: 1, title: 'Mango'),
          MenuItem(id: 2, title: 'Banana'),
          MenuItem(id: 3, title: 'Peach'),
        ],
        selectedId: _selectedId,
        onChanged: (int? id) {
          _selectedId = id;
          setState(() {});
        },
        hintText: 'Choose your favorite Fruit',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(context),
      appBar: _buildAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                fontFamily: 'MicrosoftJhengHei',
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '妳好',
              style: TextStyle(
                fontFamily: 'MicrosoftJhengHei',
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '妳好',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}