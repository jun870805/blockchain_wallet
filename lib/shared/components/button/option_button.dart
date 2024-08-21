import 'package:flutter/material.dart';
import '../../styles/styles.dart';

const double _kMinWidth = 48.0;

const double _kIconContainerSize = 56.0;

const double _kIconSize = 24.0;

const double _kTitleHeight = 24.0;

EdgeInsets _kPadding = const EdgeInsets.all(16);

Color _getIconColor(BuildContext context, bool heldDown) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  if (heldDown) return themeData.color.neutral12;

  return themeData.color.neutral14;
}

Color _getBackgroundColor(BuildContext context, bool heldDown) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  if (heldDown) return themeData.color.primaryShade;

  return themeData.color.primary;
}

TextStyle _getTitleTextStyle(BuildContext context, bool heldDown) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.typography.bodySmallRegular.apply(
    color: heldDown ? themeData.color.primaryShade : themeData.color.title,
  );
}

List<BoxShadow> _getButtonShadow(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.shadow.extraLight;
}

class BWOptionButton extends StatefulWidget {
  /// ## Option Button 入口按鈕
  ///
  /// ### Parameters:
  /// * **icon**(IconData,***required***): 顯示Icon
  /// * **title**(String,_optional_): 顯示名稱
  /// * **onPressed**(VoidCallback,_optional_): 點擊事件
  ///
  /// ### Example:
  ///```dart
  /// BWOptionButton(
  ///  icon: Icons.option,
  ///  title: 'Option1',
  ///  onPressed: () {},
  /// )
  /// ```
  const BWOptionButton({
    super.key,
    required this.icon,
    this.title,
    this.onPressed,
  });

  /// 顯示Icon
  final IconData icon;

  /// 顯示名稱
  final String? title;

  /// 點擊事件
  final VoidCallback? onPressed;

  @override
  State<BWOptionButton> createState() => _BWOptionButtonState();
}

class _BWOptionButtonState extends State<BWOptionButton> {
  // 是否按下按鈕
  bool _isHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_isHeldDown) {
      _isHeldDown = true;
    }
    setState(() {});
  }

  void _handleTapUp(TapUpDetails event) {
    if (_isHeldDown) {
      _isHeldDown = false;
    }
    setState(() {});
  }

  void _handleTapCancel() {
    if (_isHeldDown) {
      _isHeldDown = false;
    }
    setState(() {});
  }

  Widget _buildIcon(BuildContext context) {
    return Container(
      width: _kIconContainerSize,
      height: _kIconContainerSize,
      padding: _kPadding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _getBackgroundColor(context, _isHeldDown),
        boxShadow: _getButtonShadow(context),
      ),
      child: Icon(
        widget.icon,
        size: _kIconSize,
        color: _getIconColor(context, _isHeldDown),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      height: _kTitleHeight,
      alignment: Alignment.bottomCenter,
      child: Text(
        widget.title!,
        style: _getTitleTextStyle(context, _isHeldDown),
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildIcon(context));
    if (widget.title != null) {
      children.add(_buildTitle(context));
    }

    return Container(
      constraints: const BoxConstraints(minWidth: _kMinWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      behavior: HitTestBehavior.translucent,
      child: _buildBody(context),
    );
  }
}
