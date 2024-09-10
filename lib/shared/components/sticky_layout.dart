import 'package:flutter/material.dart';

class BWStickyLayout extends StatelessWidget {
  /// ## Sticky Layout
  ///
  /// ### Parameters:
  /// * **top**(List<BarItem>,_optional_): 滾動後要消失的view(可以不填)
  /// * **topHeight**(List<BarItem>,_optional_): top view的高度
  /// * **header**(List<BarItem>,***required***): 滾動後會吸頂的view
  /// * **headerHeight**(List<BarItem>,_optional_): header view的高度
  /// * **body**(List<BarItem>,***required***): 可以一直不斷滾動的view(通常是listview)
  ///
  /// ### Example:
  /// ```dart
  /// BWStickyLayout(
  ///   top: SizedBox(height: 100),
  ///   topHeight: 100,
  ///   header: BWTabBar(),
  ///   headerHeight: kTabBarHeight,
  ///   body: ListView(),
  /// );
  /// ```
  const BWStickyLayout({
    super.key,
    this.top,
    this.topHeight = 0,
    required this.header,
    this.headerHeight = 0,
    required this.body,
  });

  /// 滾動後要消失的view(可以不填)
  final Widget? top;

  /// top view的高度
  final double? topHeight;

  /// 滾動後會吸頂的view
  final Widget header;

  /// header view的高度
  final double? headerHeight;

  /// 可以一直不斷滾動的view(通常是listview)
  final Widget body;

  Widget _buildTopWidget(BuildContext context) {
    List<Widget> children = [];

    if (top != null) {
      children.add(top!);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: children,
    );
  }

  Widget _buildSliverWidget(BuildContext context) {
    double expandedHeight = topHeight! + headerHeight!;

    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      toolbarHeight: 0,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: _buildTopWidget(context),
      ),
      expandedHeight: expandedHeight,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(headerHeight!),
        child: header,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const ClampingScrollPhysics(),
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          _buildSliverWidget(context),
        ];
      },
      body: body,
    );
  }
}
