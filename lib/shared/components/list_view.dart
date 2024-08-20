import 'package:blockchain_wallet/shared/components/components.dart';
import 'package:flutter/material.dart';

class BWListView extends StatefulWidget {
  /// ## Scroll Bar
  ///
  /// ### Parameters:
  /// * **children**(List<Widget>,***required***): 內容
  /// * **horizontalPadding**(double,_optional_): 橫向Padding
  ///
  /// ### Example:
  /// ```dart
  /// BWListView(
  ///   children: [
  ///     SizedBox(height: 100),
  ///     SizedBox(height: 100),
  ///     SizedBox(height: 100),
  ///   ],
  /// );
  /// ```
  ///
  const BWListView({
    super.key,
    required this.children,
    this.horizontalPadding = 16,
  }) : assert(horizontalPadding >= 0);

  /// 內容
  final List<Widget> children;

  /// 橫向Padding
  final double horizontalPadding;

  @override
  State<BWListView> createState() => _BWListViewState();
}

class _BWListViewState extends State<BWListView> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BWScrollBar(
      controller: _controller,
      horizontalPadding: widget.horizontalPadding,
      child: ListView(
        controller: _controller,
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: widget.children,
      ),
    );
  }
}
