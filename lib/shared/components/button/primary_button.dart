import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './button.dart';
import '../../styles/styles.dart';

double _getHeight(BuildContext context, ButtonSize size) {
  switch (size) {
    case ButtonSize.S:
      return 36;
    case ButtonSize.M:
      return 44;
    case ButtonSize.L:
      return 56;
  }
}

double _getMinWidth(BuildContext context, ButtonSize size) {
  switch (size) {
    case ButtonSize.S:
      return 141;
    case ButtonSize.M:
      return 150;
    case ButtonSize.L:
      return 150;
  }
}

double _getSpinKitSize(BuildContext context, ButtonSize size) {
  switch (size) {
    case ButtonSize.S:
      return 12;
    case ButtonSize.M:
      return 15;
    case ButtonSize.L:
      return 18;
  }
}

EdgeInsets _getPadding(BuildContext context, ButtonSize size) {
  switch (size) {
    case ButtonSize.S:
      return const EdgeInsets.symmetric(
        horizontal: 16.0,
      );
    case ButtonSize.M:
      return const EdgeInsets.symmetric(
        horizontal: 24.0,
      );
    case ButtonSize.L:
      return const EdgeInsets.symmetric(
        horizontal: 32.0,
      );
  }
}

const BorderRadius _kBorderRadius = BorderRadius.all(
  Radius.circular(35.0),
);

Color _getButtonBackgroundColor(
  BuildContext context,
  bool disabled,
  bool heldDown,
) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  Color color = themeData.color.primary;

  if (disabled) color = themeData.color.background02;
  if (heldDown) color = themeData.color.primaryShade;

  return color;
}

Color _getSpinKitColor(BuildContext context) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  return themeData.color.background;
}

TextStyle _getTextStyle(
  BuildContext context,
  ButtonSize size,
  bool disabled,
  bool heldDown,
) {
  BWThemeData themeData = Theme.of(context).extension<BWThemeData>()!;

  Color color = themeData.color.neutral14;

  if (disabled) color = themeData.color.placeholder;
  if (heldDown) color = themeData.color.neutral12;

  switch (size) {
    case ButtonSize.S:
      return themeData.typography.buttonSmallRegular.apply(
        color: color,
      );
    case ButtonSize.M:
      return themeData.typography.buttonMediumRegular.apply(
        color: color,
      );
    case ButtonSize.L:
      return themeData.typography.buttonLargeRegular.apply(
        color: color,
      );
  }
}

class BWPrimaryButton extends StatefulWidget {
  /// ## Primary Button 主按鈕
  /// ### Parameters:
  /// * **size**(ButtonSize,_optional_): 按鈕大小(可選S、M、L)
  /// * **onPressed**(VoidCallback,_optional_): 點擊事件
  /// * **text**(String,***required***): 顯示文字
  /// * **isLoading**(bool,_optional_): 是否載入中(預設false)
  /// * **isDisabled**(bool,_optional_): 是否禁止點擊(預設false)
  ///
  /// ### Example:
  /// ```dart
  /// BWPrimaryButton(
  ///   text: 'OK',
  ///   onPressed: (){
  ///     print('on Pressed OK button');
  ///   },
  /// );
  /// ```
  const BWPrimaryButton({
    super.key,
    required this.size,
    this.onPressed,
    this.text,
    this.isLoading = false,
    this.isDisabled = false,
  });

  /// 按鈕大小(可選S、M、L)
  final ButtonSize size;

  /// 點擊事件
  final VoidCallback? onPressed;

  /// 顯示文字
  final String? text;

  /// 是否載入中(預設false)
  final bool isLoading;

  /// 是否禁止點擊(預設false)
  final bool isDisabled;

  @override
  State<BWPrimaryButton> createState() => _BWPrimaryButtonState();
}

class _BWPrimaryButtonState extends State<BWPrimaryButton> {
  // 是否按下按鈕
  bool _isHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (widget.isDisabled || widget.isLoading) return;
    if (!_isHeldDown) {
      _isHeldDown = true;
    }
    setState(() {});
  }

  void _handleTapUp(TapUpDetails event) {
    if (widget.isDisabled || widget.isLoading) return;
    if (_isHeldDown) {
      _isHeldDown = false;
    }
    setState(() {});
  }

  void _handleTapCancel() {
    if (widget.isDisabled || widget.isLoading) return;
    if (_isHeldDown) {
      _isHeldDown = false;
    }
    setState(() {});
  }

  Widget _buildLoadingView(BuildContext context) {
    return SpinKitThreeBounce(
      color: _getSpinKitColor(context),
      size: _getSpinKitSize(context, widget.size),
    );
  }

  Widget _buildButtonBody(BuildContext context) {
    return Padding(
      padding: _getPadding(context, widget.size),
      child: AutoSizeText(
        widget.text ?? '',
        style: _getTextStyle(
          context,
          widget.size,
          widget.isDisabled,
          _isHeldDown,
        ),
        maxLines: 1,
        minFontSize: 10,
        wrapWords: false,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      height: _getHeight(context, widget.size),
      constraints: BoxConstraints(
        minWidth: _getMinWidth(context, widget.size),
      ),
      decoration: BoxDecoration(
        color: _getButtonBackgroundColor(
          context,
          widget.isDisabled,
          _isHeldDown,
        ),
        borderRadius: _kBorderRadius,
      ),
      child: Align(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: widget.isLoading
            ? _buildLoadingView(context)
            : _buildButtonBody(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDisabled || widget.isLoading) {
      return _buildButton(context);
    }

    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: _buildButton(context),
    );
  }
}
