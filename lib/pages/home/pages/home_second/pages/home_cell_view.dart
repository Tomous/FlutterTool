import 'package:firstapp/constants/app_dialog.dart';
import 'package:firstapp/constants/cached_network_Image.dart';
import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/pages/home/pages/home_second/model/cook_info_model.dart';
import 'package:firstapp/pages/home/pages/home_second/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class HomeCellView extends StatefulWidget {
  final CookInfoModel model;
  const HomeCellView({super.key, required this.model});

  @override
  State<HomeCellView> createState() => _HomeCellViewState();
}

class _HomeCellViewState extends State<HomeCellView> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    UserModel user = widget.model.a!;

    /// 图片高度
    double imgHeight = 0;
    if (widget.model.ph == 'null') {
      imgHeight = MediaQuery.of(context).size.width / 3 * 2;
    } else {
      imgHeight = int.parse(widget.model.ph) *
          MediaQuery.of(context).size.width /
          int.parse(widget.model.pw);
    }
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 用户头像条
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 34.0,
                  height: 34.0,
                  margin:
                      const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/image1.jpeg',
                      image: user.p!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  user.n!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'LV.${user.lvl.toString()}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.yellow,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              AppDialog.showText(context, title: '点击了用户头像条');
            },
          ),

          /// 中间图片
          InkWell(
            child: CachedImage(
              url: widget.model.img!,
              width: MediaQuery.of(context).size.width,
              height: imgHeight,
            ),
            onTap: () => AppDialog.showText(context, title: '点击了图片'),
          ),

          /// 收藏用户头像 和 点赞 评论...按钮
          Container(
            height: 40.0,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '823283收藏',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Row(
                  children: [
                    LikeButton(
                      size: 22,
                      isLiked: isLike,
                      likeBuilder: (isLiked) {
                        return Image.asset(
                          isLiked
                              ? 'assets/common/collcetionicon_on.png'
                              : 'assets/common/collcetionicon_off.png',
                          width: 18,
                          height: 18,
                        );
                      },
                      onTap: (isLiked) {
                        setState(() {
                          isLike = !isLiked;
                        });
                        AppDialog.showText(
                          context,
                          title: isLike ? '点击了不喜欢按钮' : '点击了喜欢按钮',
                        );
                        return Future.value(isLiked);
                      },
                    ),
                    IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () {},
                      icon: const Image(
                        image:
                            AssetImage("assets/common/icon_home_comment.png"),
                        fit: BoxFit.cover,
                        width: 22,
                        height: 22,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage("assets/common/icon_home_share.png"),
                        fit: BoxFit.cover,
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              widget.model.n!,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.deepTextColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
