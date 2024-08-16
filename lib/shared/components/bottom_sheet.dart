import 'dart:ui';
import 'package:flutter/material.dart';
import '../styles/styles.dart';
import 'components.dart';

const double _kDividerWidth = 64;

const double _kDividerHeight = 4;

const EdgeInsets _kBodyPadding = EdgeInsets.symmetric(vertical: 16);

const BorderRadiusGeometry _kBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(24.0),
  topRight: Radius.circular(24.0),
);

const BorderRadius _kDividerBorderRadius = BorderRadius.all(
  Radius.circular(100.0),
);

Border _getBorder(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return Border.all(
    color: themeData.color.background02,
    width: 1.0,
  );
}

Color _getBarrierColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.transparent1001;
}

Color _getBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

Color _getDividerColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.neutral13;
}

List<BoxShadow> _getBoxShadow(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.shadow.light;
}

class BWBottomSheet extends StatelessWidget {
  /// ## BottomSheet Dialog
  ///
  /// ### Parameters:
  /// * **body**(Widget,***required***): 詳細內容
  ///
  /// ### Example:
  /// BWBottomSheet(
  ///   body: this,
  /// ).show(context);
  ///
  const BWBottomSheet({
    super.key,
    required this.children,
  });

  /// 內容
  final List<Widget> children;

  Widget _buildDivider(BuildContext context) {
    return Center(
      child: Container(
        width: _kDividerWidth,
        height: _kDividerHeight,
        decoration: BoxDecoration(
          color: _getDividerColor(context),
          borderRadius: _kDividerBorderRadius,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Flexible(
      child: BWListView(
        horizontalPadding: 16,
        children: children,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildDivider(context));
    children.add(const SizedBox(height: 16));
    children.add(_buildContent(context));

    return SafeArea(
      child: Padding(
        padding: _kBodyPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double maxHeight = mediaQuery.size.height / 2.5;

    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        boxShadow: _getBoxShadow(context),
        border: _getBorder(context),
        borderRadius: _kBorderRadius,
      ),
      child: _buildBody(context),
    );
  }

  Future<T?> show<T>(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      // 點擊外部區域是否關閉視窗
      isDismissible: true,
      // 啟用拖曳功能
      enableDrag: true,
      // 遮罩顏色
      barrierColor: _getBarrierColor(context),
      // 是否可滾動
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: _kBorderRadius),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: this,
        );
      },
    );
  }
}
