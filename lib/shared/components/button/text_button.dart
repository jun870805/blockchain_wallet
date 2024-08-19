import 'package:flutter/material.dart';
import '../../styles/styles.dart';

TextStyle _getTextStyle(
  BuildContext context,
  TextStyle? customTextStyle,
  bool disabled,
  bool heldDown,
) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  Color color = themeData.color.primary;

  if (disabled) color = themeData.color.placeholder;
  if (heldDown) color = themeData.color.primaryShade;

  TextStyle textStyle =
      customTextStyle ?? themeData.typography.bodyMediumRegular;

  return textStyle.apply(color: color);
}

class BWTextButton extends StatefulWidget {
  /// ## Text Button 文字按鈕
  /// ### Parameters:
  /// * **text**(String,***required***): 顯示文字
  /// * **onPressed**(VoidCallback,_optional_): 點擊事件(當為null時是Disable狀態)
  /// * **textStyle**(String,_optional_):
  ///
  /// ### Example:
  /// ```dart
  /// BWTextButton(
  ///   text: 'click me',
  ///   onPressed: (){
  ///     print('on Pressed Click button');
  ///   },
  /// );
  /// ```
  const BWTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
  });

  /// 顯示文字
  final String text;

  /// 點擊事件(當為null時是Disable狀態)
  final VoidCallback? onPressed;

  /// 自定義文字Style
  final TextStyle? textStyle;

  /// 當onPressed為null時，自動disable按鈕
  bool get enabled => onPressed != null;

  @override
  State<BWTextButton> createState() => _BWTextButtonState();
}

class _BWTextButtonState extends State<BWTextButton> {
  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
    }
    setState(() {});
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
    }
    setState(() {});
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: widget.enabled ? _handleTapDown : null,
      onTapUp: widget.enabled ? _handleTapUp : null,
      onTapCancel: widget.enabled ? _handleTapCancel : null,
      child: Text(
        widget.text,
        style: _getTextStyle(
          context,
          widget.textStyle,
          !widget.enabled,
          _buttonHeldDown,
        ),
      ),
    );
  }
}
