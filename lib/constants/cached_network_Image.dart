// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firstapp/constants/constants.dart';
import 'package:flutter/material.dart';

/// 加载网络图片
class CachedImage extends StatefulWidget {
  /// 图片链接
  final String url;

  /// 图片宽度
  final double width;

  /// 图片高度
  final double height;
  const CachedImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
  });

  @override
  State<CachedImage> createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) {
        return SizedBox(
          width: widget.width,
          height: widget.height,
          child: Container(
            width: widget.width,
            height: widget.height,
            color: AppColors.page,
          ),
        );
      },
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
      imageUrl: widget.url,
      fit: BoxFit.cover,
      width: widget.width,
      height: widget.height,
    );
  }
}

/// 网络图片带loading效果
class CachLoadingImage extends StatefulWidget {
  /// 图片链接
  final String url;

  /// 图片宽度
  final double width;

  /// 图片高度
  final double height;
  const CachLoadingImage(
      {Key? key, required this.url, required this.width, required this.height})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CachLoadingImageState createState() => _CachLoadingImageState();
}

class _CachLoadingImageState extends State<CachLoadingImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => SizedBox(
        width: widget.width,
        height: widget.height,
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.yellow,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageUrl: widget.url,
      fit: BoxFit.cover,
      width: widget.width,
      height: widget.height,
    );
  }
}

/// 带圆角的网络图片 ClipRRect
class ClipRRectCachedImage extends StatefulWidget {
  /// 图片链接
  final String url;

  /// 图片宽度
  final double width;

  /// 图片高度
  final double height;

  /// 图片圆角
  final double radius;

  const ClipRRectCachedImage(
      {Key? key,
      required this.url,
      required this.width,
      required this.height,
      required this.radius})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ClipRRectCachedImageState createState() => _ClipRRectCachedImageState();
}

class _ClipRRectCachedImageState extends State<ClipRRectCachedImage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: CachedImage(
        url: widget.url,
        width: widget.width,
        height: widget.height,
      ),
    );
  }
}

/// 带圆角边框网络图片
class BoederClipImage extends StatefulWidget {
  /// 图片链接
  final String url;

  /// 图片宽度
  final double width;

  /// 图片高度
  final double height;

  /// 图片圆角
  final double radius;

  /// 边框宽度
  final double borderWidth;

  /// 边框宽度
  final Color borderColor;

  const BoederClipImage({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
    required this.radius,
    required this.borderWidth,
    required this.borderColor,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BoederClipImageState createState() => _BoederClipImageState();
}

class _BoederClipImageState extends State<BoederClipImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColors.page,
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
        borderRadius: BorderRadius.circular(widget.radius),
        image: DecorationImage(
            image: NetworkImage(widget.url), fit: BoxFit.cover // 填满
            ),
      ),
    );
  }
}

/// 用户头像图片
class IconImage extends StatefulWidget {
  /// 图片链接
  final String url;

  /// 图片宽度
  final double width;

  /// 图片高度
  final double height;

  /// 图片圆角
  final double radius;

  /// 边框宽度
  final double borderWidth;

  /// 边框宽度
  final Color borderColor;

  const IconImage({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
    required this.radius,
    required this.borderWidth,
    required this.borderColor,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IconImageState createState() => _IconImageState();
}

/// 用户圆头像
class _IconImageState extends State<IconImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: ClipOval(
        child: CachedImage(
          url: widget.url,
          width: widget.width,
          height: widget.height,
        ),
      ),
    );
  }
}
