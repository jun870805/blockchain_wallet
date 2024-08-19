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
  int? _selectedId;

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

  Widget _buildBody(BuildContext context) {
    return BWListView(
      children: <Widget>[
        BWPrimaryButton(
          size: ButtonSize.M,
          text: '確認',
          onPressed: _openDialog,
        ),
        const Text(
          'You have pushed the button this many times:',
          style: TextStyle(
            fontFamily: 'MicrosoftJhengHei',
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 220),
        const Text(
          'You have pushed the button this many times:',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 220),
        const Text(
          '妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好',
          style: TextStyle(
            fontFamily: 'MicrosoftJhengHei',
            fontSize: 10,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 220),
        const Text(
          '妳好',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  void _openDialog() {
    const BWDetailDialog(
      // title: 'aaaaa',
      // subtitle: 'bbbb',
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
          style: TextStyle(
            fontFamily: 'MicrosoftJhengHei',
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        BWDivider(type: DividerType.horizontal),
        SizedBox(height: 220),
        Text(
          'You have pushed the button this many times:',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 220),
        Text(
          '妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好妳好',
          style: TextStyle(
            fontFamily: 'MicrosoftJhengHei',
            fontSize: 10,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 220),
        Text(
          '妳好',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ).show(context);
  }

  void _openConfirmDialog() {
    BWConfirmDialog(
      title: '妳好',
      content: '請問是否要離開',
      onPressedCancel: Navigator.of(context).pop,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(context),
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _openConfirmDialog,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
