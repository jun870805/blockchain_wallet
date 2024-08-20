class MenuItem {
  MenuItem({
    required this.id,
    this.image,
    required this.title,
    this.isDisable = false,
  });

  /// ID(必填)
  final int id;

  /// 圖片
  final String? image;

  /// 標題(必填)
  final String title;

  /// 是否禁用
  final bool? isDisable;
}
