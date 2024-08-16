import 'package:flutter/material.dart';
import '../../styles/styles.dart';
import '../components.dart';

const double _kCloseIconSize = 24;

const EdgeInsets _kTitleRowPadding = EdgeInsets.symmetric(horizontal: 16);

Color _getCloseIconColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.placeholder;
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
  ///
  /// ### Parameters:
  /// * **body**(Widget,***required***): 詳細內容
  /// * **titleText**(String,_optional_): 標題文字
  /// * **subTitleText**(String,_optional_): 副標題文字
  ///
  /// ### Example:
  /// BWDetailDialog(
  ///   titleText: 'titleText',
  ///   body: this,
  /// ).show(context);
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
        color: _getCloseIconColor(context),
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

  @override
  Widget build(BuildContext context) {
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

    return BWDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
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
