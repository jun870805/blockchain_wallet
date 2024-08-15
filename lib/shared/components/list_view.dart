import 'package:blockchain_wallet/shared/components/components.dart';
import 'package:flutter/material.dart';

class BWListView extends StatefulWidget {
  const BWListView({
    super.key,
    required this.children,
    this.horizontalPadding = 16,
  }) : assert(horizontalPadding >= 0);

  final List<Widget> children;

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
