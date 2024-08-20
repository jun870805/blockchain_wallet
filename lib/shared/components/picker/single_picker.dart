import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/models/models.dart';
import '../../styles/styles.dart';
import '../components.dart';

const double _kPickerHeight = 160.0;

const double _kPickerItemHeight = 36.0;

const double _kItemImageSize = 18.0;

const EdgeInsets _kItemPadding = EdgeInsets.symmetric(
  horizontal: 16.0,
);

Color _getItemImageBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background02;
}

TextStyle _getItemTextStyle(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.bodyMediumRegular.apply(
    color: themeData.color.title,
  );
}

class BWSinglePicker extends StatefulWidget {
  /// ## Single Picker BottomSheet的選擇項目
  /// ### Parameters:
  /// * **items**(List<MenuItem>,_optional_): 選項
  /// * **selectedId**(int,_optional_): 選中的選項id
  /// * **onChanged**(Function(int),_optional_): 回傳選中的選項id
  ///
  /// ### Example:
  /// ```dart
  /// BWSinglePicker(
  ///   items: _menuItem,
  ///   selectedId: _selectedId,
  ///   onChanged: (int? id) {
  ///     _selectedId = id;
  ///     setState(() {});
  ///   },
  /// ).show(context);
  /// ```
  const BWSinglePicker({
    super.key,
    this.items = const [],
    this.selectedId,
    this.onChanged,
  });

  /// 選項
  final List<MenuItem> items;

  /// 選中的選項id
  final int? selectedId;

  /// 回傳選中的選項id
  final Function(int)? onChanged;

  @override
  State<BWSinglePicker> createState() => _BWSinglePickerState();

  Future<T?> show<T>(BuildContext context) async {
    return showBWBottomSheet(
      context: context,
      child: this,
    );
  }
}

class _BWSinglePickerState extends State<BWSinglePicker> {
  FixedExtentScrollController? _pickerController;

  void _initPickerController() {
    int initIndex = 0;
    if (widget.selectedId != null) {
      int itemIndex = widget.items.lastIndexWhere(
        (e) => e.id == widget.selectedId,
      );
      if (itemIndex != -1) {
        initIndex = itemIndex;
      }
    }
    _pickerController = FixedExtentScrollController(initialItem: initIndex);
  }

  @override
  void initState() {
    super.initState();
    _initPickerController();
  }

  @override
  void dispose() {
    _pickerController?.dispose();
    super.dispose();
  }

  Widget _buildItemImage(BuildContext context, String image) {
    return Container(
      width: _kItemImageSize,
      height: _kItemImageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _getItemImageBackgroundColor(context),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildItemText(BuildContext context, String title) {
    return Flexible(
      child: Text(
        title,
        style: _getItemTextStyle(context),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildPickerItem(BuildContext context, MenuItem item) {
    List<Widget> children = [];

    if (item.image != null) {
      children.add(_buildItemImage(context, item.image!));
      children.add(const SizedBox(width: 8));
    }
    children.add(_buildItemText(context, item.title));

    return Padding(
      padding: _kItemPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: children,
      ),
    );
  }

  Widget _buildPicker(BuildContext context) {
    return SizedBox(
      height: _kPickerHeight,
      child: CupertinoPicker(
        scrollController: _pickerController,
        itemExtent: _kPickerItemHeight,
        onSelectedItemChanged: (index) {
          setState(() {});
        },
        children: widget.items
            .map((item) => _buildPickerItem(context, item))
            .toList(),
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return BWPrimaryButton(
      size: ButtonSize.M,
      text: '確認',
      onPressed: () {
        int selectIndex = _pickerController!.selectedItem;
        if (widget.onChanged != null && widget.items.length > selectIndex) {
          int itemId = widget.items[selectIndex].id;
          widget.onChanged!(itemId);
        }
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildPicker(context));
    children.add(const BWDivider(type: DividerType.horizontal));
    children.add(const SizedBox(height: 16));
    children.add(_buildConfirmButton(context));

    return BWBottomSheet(
      children: children,
    );
  }
}
