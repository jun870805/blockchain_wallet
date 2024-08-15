import 'package:flutter/material.dart';
import '../../styles/styles.dart';
import '../components.dart';

const double _kCloseIconSize = 24;

const EdgeInsets _kTitleRowPadding = EdgeInsets.symmetric(horizontal: 16);

const BorderRadius _kBorderRadius = BorderRadius.all(
  Radius.circular(16.0),
);

Border _getBorder(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return Border.all(
    color: themeData.color.background02,
    width: 1.0,
  );
}

Color _getBackgroundColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

Color _getCloseIconcolor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.placeholder;
}

List<BoxShadow> _getBoxShadow(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.shadow.medium;
}

TextStyle _getTitleTextStyle(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.titleMediumBold.apply(
    color: themeData.color.title,
  );
}

TextStyle _getSubtitleTextStyle(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.bodyMedium.apply(
    color: themeData.color.note,
  );
}

class BWDetailDialog extends StatelessWidget {
  /// ## Detail Dialog
  /// * 顯示詳細內容視窗
  /// * 需將組好的詳細內容傳進來
  ///
  /// ### Parameters:
  /// * **body**(Widget,***required***): 詳細內容
  /// * **titleText**(String,_optional_): 標題文字
  /// * **subTitleText**(String,_optional_): 副標題文字
  ///
  /// ### Example:
  /// Future<T> show<T>(BuildContext context) async {
  ///  return await BWDetailDialog(
  ///    titleText: 'titleText',
  ///    body: this,
  ///  ).show(context);
  /// }
  ///
  const BWDetailDialog({
    super.key,
    required this.children,
    this.title,
    this.subtitle,
  });

  /// 內容
  final List<Widget> children;

  /// 標題文字
  final String? title;

  /// 副標題文字
  final String? subtitle;

  Widget _buildTitle(BuildContext context) {
    return Text(
      title!,
      style: _getTitleTextStyle(context),
    );
  }

  Widget _buildCloseIcon(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.close,
        size: _kCloseIconSize,
        color: _getCloseIconcolor(context),
      ),
      onTap: () => Navigator.of(context).pop(),
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    List<Widget> children = [];

    if (title != null) {
      children.add(_buildTitle(context));
    } else {
      children.add(const Spacer());
    }
    children.add(_buildCloseIcon(context));

    return Padding(
      padding: _kTitleRowPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: _kTitleRowPadding,
      child: Text(
        subtitle!,
        style: _getSubtitleTextStyle(context),
        textAlign: TextAlign.left,
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

    children.add(const SizedBox(height: 16));
    children.add(_buildTitleRow(context));
    if (subtitle != null) {
      children.add(const SizedBox(height: 4));
      children.add(_buildSubtitle(context));
    }
    children.add(const SizedBox(height: 16));
    children.add(_buildContent(context));
    children.add(const SizedBox(height: 16));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double width = mediaQuery.size.width - 16 * 2;
    double maxHeight = mediaQuery.size.height -
        56 * 2 -
        mediaQuery.viewInsets.top -
        mediaQuery.viewInsets.bottom;

    return BWDialog(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: maxHeight,
        ),
        width: width,
        decoration: BoxDecoration(
          color: _getBackgroundColor(context),
          boxShadow: _getBoxShadow(context),
          border: _getBorder(context),
          borderRadius: _kBorderRadius,
        ),
        child: _buildBody(context),
      ),
    );
  }

  /// 顯示BottomSheet
  Future<T?> show<T extends Object?>(BuildContext context) async {
    return await showBWDialog(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }
}
