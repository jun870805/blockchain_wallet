import 'package:flutter/material.dart';

import '../styles/theme_data.dart';

const double kAppBarHeight = 56.0;

const double _kBackIconSize = 24.0;

const EdgeInsets _kAppBarPadding = EdgeInsets.symmetric(
  horizontal: 18.0,
);

Color _getBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

Color _getBackIconColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.article;
}

TextStyle _getTitleTextStyle(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.titleSmallBold.apply(
    color: themeData.color.title,
  );
}

class BWAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Custom App Bar
  const BWAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.suffixAction = const [],
  });

  /// 標題
  final String? title;

  /// 自定義Widget
  final Widget? titleWidget;

  /// App Bar 右側按鈕
  final List<Widget> suffixAction;

  @override
  Size get preferredSize {
    return const Size.fromHeight(kAppBarHeight);
  }

  void _pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: _kBackIconSize,
        color: _getBackIconColor(context),
      ),
      onPressed: () => _pop(context),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Flexible(
      child: Text(
        title!,
        style: _getTitleTextStyle(context),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    List<Widget> children = [];

    if (title != null) children.add(_buildTitle(context));
    if (titleWidget != null) children.add(titleWidget!);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _buildSuffixRow(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < suffixAction.length; i++) {
      children.add(suffixAction[i]);
      children.add(const SizedBox(width: 24));
    }

    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ModalRoute<Object?>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    List<Widget> children = [];

    if (canPop) {
      children.add(_buildBackButton(context));
      children.add(const SizedBox(width: 16));
    }
    children.add(_buildTitleRow(context));
    if (suffixAction.isNotEmpty) {
      children.add(const SizedBox(width: 16));
      children.add(_buildSuffixRow(context));
    }

    return Container(
      width: double.infinity,
      height: kAppBarHeight,
      color: _getBackgroundColor(context),
      padding: _kAppBarPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
