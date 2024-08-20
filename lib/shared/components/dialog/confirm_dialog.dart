import 'package:flutter/material.dart';
import '../../styles/styles.dart';
import '../components.dart';

const double _kButtonHeight = 48;

const EdgeInsets _kBodyPadding = EdgeInsets.only(
  top: 16,
  right: 16,
  left: 16,
  bottom: 24,
);

TextStyle _getTitleTextStyle(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.titleSmallBold.apply(
    color: themeData.color.title,
  );
}

TextStyle _getContentTextStyle(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.bodySmallRegular.apply(
    color: themeData.color.note,
  );
}

TextStyle _getCancelButtonTextStyle(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.buttonMediumRegular.apply(
    color: themeData.color.title,
  );
}

TextStyle _getConfirmButtonTextStyle(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.buttonMediumBold.apply(
    color: themeData.color.primary,
  );
}

class BWConfirmDialog extends StatelessWidget {
  /// ## Confirm Dialog
  ///
  /// ### Parameters:
  /// * **title**(String,_optional_): 標題文字
  /// * **content**(String,_optional_): 內容文字
  /// * **confirmText**(String,_optional_): 確認按鈕文字
  /// * **cancelText**(String,_optional_): 取消按鈕文字
  /// * **onPressedConfirm**(Function(),_optional_): 確認按鈕點擊事件(沒帶值則預設返回)
  /// * **onPressedCancel**(Function(),_optional_): 取消按鈕點擊事件(沒帶值則不顯示該按鈕)
  ///
  /// ### Example:
  /// BWConfirmDialog(
  ///   titleText: 'titleText',
  ///   body: this,
  /// ).show(context);
  ///
  const BWConfirmDialog({
    super.key,
    this.title,
    this.content,
    this.onPressedConfirm,
    this.onPressedCancel,
    this.confirmText,
    this.cancelText,
  });

  /// 標題文字
  final String? title;

  /// 內容文字
  final String? content;

  /// 確認按鈕文字
  final String? confirmText;

  /// 取消按鈕文字
  final String? cancelText;

  /// 確認按鈕點擊事件(沒帶值則預設返回)
  final VoidCallback? onPressedConfirm;

  /// 取消按鈕點擊事件(沒帶值則不顯示該按鈕)
  final VoidCallback? onPressedCancel;

  Widget _buildTitle(BuildContext context) {
    return Text(
      title!,
      style: _getTitleTextStyle(context),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text(
      content!,
      style: _getContentTextStyle(context),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> children = [];

    if (title != null) {
      children.add(_buildTitle(context));
      children.add(const SizedBox(height: 8));
    }
    if (content != null) {
      children.add(_buildContent(context));
    }

    return Padding(
      padding: _kBodyPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onPressedCancel,
        child: Center(
          child: Text(
            cancelText ?? '取消',
            style: _getCancelButtonTextStyle(context),
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onPressedConfirm ?? Navigator.of(context).pop,
        child: Center(
          child: Text(
            confirmText ?? '確認',
            style: _getConfirmButtonTextStyle(context),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    List<Widget> children = [];

    if (onPressedCancel != null) {
      children.add(_buildCancelButton(context));
      children.add(const BWDivider(type: DividerType.vertical));
    }
    children.add(_buildConfirmButton(context));

    return SizedBox(
      width: double.infinity,
      height: _kButtonHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width * 0.6;

    List<Widget> children = [];

    children.add(_buildBody(context));
    children.add(const BWDivider(type: DividerType.horizontal));
    children.add(_buildButtons(context));

    return BWDialog(
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }

  /// 顯示BottomSheet
  Future<T?> show<T extends Object?>(BuildContext context) async {
    return await showBWDialog(
      context: context,
      child: this,
    );
  }
}
