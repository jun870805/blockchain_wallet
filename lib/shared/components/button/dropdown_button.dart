import 'package:flutter/material.dart';
import '../../../core/models/models.dart';
import '../../styles/theme_data.dart';

const double _kDropdownMenuMaxHeight = 208.0;

const double _kDropdownButtonIconSize = 16.0;

const double _kItemImageSize = 18.0;

const EdgeInsets _kDropdownButtonPadding = EdgeInsets.symmetric(
  horizontal: 16.0,
  vertical: 8.0,
);

BorderRadius _kDropdownButtonBorderRadius = BorderRadius.circular(40);

BorderRadius _kDropdownMenuBorderRadius = BorderRadius.circular(16);

Color _getDropdownButtonBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background01;
}

Color _getDropdownButtonIconEnableColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.article;
}

Color _getDropdownButtonIconDisableColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.placeholder;
}

Color _getItemImageBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background02;
}

Color _getDropdownMenuBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

TextStyle _getHintTextStyle(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.bodyMediumRegular.apply(
    color: themeData.color.placeholder,
  );
}

TextStyle _getSelectedItemTextStyle(BuildContext context, bool isDisable) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.bodyMediumRegular.apply(
    color: isDisable ? themeData.color.placeholder : themeData.color.title,
  );
}

TextStyle _getDropdownMenuItemTextStyle(BuildContext context, bool isSelected) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.bodyMediumRegular.apply(
    color: isSelected ? themeData.color.primary : themeData.color.title,
  );
}

class BWDropdownButton extends StatelessWidget {
  /// ## Dropdown Button 下拉式選單按鈕
  /// ### Parameters:
  /// * **items**(List<MenuItem>,_optional_): 選項
  /// * **selectedId**(int,_optional_): 選中的選項
  /// * **onChanged**(Function(int),_optional_): 更換選項(若是沒有帶代表按鈕Disable)
  /// * **hintText**(String,_optional_): 說明文字
  /// * **width**(double,_optional_): 寬度(若是沒有帶預設120)
  ///
  /// ### Example:
  /// ```dart
  /// BWDropdownButton(
  ///   items: <MenuItem>[
  ///     MenuItem(id: 0, title: 'Apple'),
  ///     MenuItem(id: 1, title: 'Mango'),
  ///     MenuItem(id: 2, title: 'Banana'),
  ///     MenuItem(id: 3, title: 'Peach'),
  ///   ],
  ///   selectedId: _selectedId,
  ///   onChanged: (int? id) {
  ///     _selectedId = id;
  ///     setState(() {});
  ///   },
  ///   hintText: 'Choose your favorite Fruit',
  /// );
  /// ```
  const BWDropdownButton({
    super.key,
    this.items = const [],
    this.selectedId,
    this.onChanged,
    this.hintText,
    this.width = 120.0,
  });

  /// 選項
  final List<MenuItem> items;

  /// 選中的選項
  final int? selectedId;

  /// 更換選項(若是沒有帶代表按鈕Disable)
  final Function(int?)? onChanged;

  /// 說明文字
  final String? hintText;

  /// 寬度(若是沒有帶預設120)
  final double? width;

  Widget _buildHintText(BuildContext context) {
    if (hintText == null) return const SizedBox();

    return Text(
      hintText!,
      style: _getHintTextStyle(context),
      overflow: TextOverflow.ellipsis,
    );
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

  Widget _buildSelectedItemText(BuildContext context, String title) {
    bool isDisable = onChanged == null;

    return Expanded(
      child: Text(
        title,
        style: _getSelectedItemTextStyle(context, isDisable),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildSelectedItem(BuildContext context, MenuItem item) {
    List<Widget> children = [];

    if (item.image != null) {
      children.add(_buildItemImage(context, item.image!));
      children.add(const SizedBox(width: 8));
    }
    children.add(_buildSelectedItemText(context, item.title));

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildDropdownMenuItemText(BuildContext context, MenuItem item) {
    bool isSelected = false;
    if (selectedId != null) {
      isSelected = item.id == selectedId;
    }

    return Expanded(
      child: Text(
        item.title,
        style: _getDropdownMenuItemTextStyle(context, isSelected),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildDropdownMenuItem(BuildContext context, MenuItem item) {
    List<Widget> children = [];

    if (item.image != null) {
      children.add(_buildItemImage(context, item.image!));
      children.add(const SizedBox(width: 8));
    }
    children.add(_buildDropdownMenuItemText(context, item));

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField<int>(
        value: selectedId,
        hint: _buildHintText(context),
        onChanged: onChanged,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: _kDropdownButtonIconSize,
        iconDisabledColor: _getDropdownButtonIconDisableColor(context),
        iconEnabledColor: _getDropdownButtonIconEnableColor(context),
        decoration: InputDecoration(
          contentPadding: _kDropdownButtonPadding,
          isDense: true,
          filled: true,
          fillColor: _getDropdownButtonBackgroundColor(context),
          enabledBorder: OutlineInputBorder(
            borderRadius: _kDropdownButtonBorderRadius,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: _kDropdownButtonBorderRadius,
            borderSide: BorderSide.none,
          ),
        ),
        elevation: 1,
        dropdownColor: _getDropdownMenuBackgroundColor(context),
        menuMaxHeight: _kDropdownMenuMaxHeight,
        borderRadius: _kDropdownMenuBorderRadius,
        items: items.map<DropdownMenuItem<int>>((MenuItem item) {
          return DropdownMenuItem<int>(
            value: item.id,
            child: _buildDropdownMenuItem(context, item),
          );
        }).toList(),
        selectedItemBuilder: (context) {
          return items
              .map((MenuItem value) => _buildSelectedItem(context, value))
              .toList();
        },
      ),
    );
  }
}
