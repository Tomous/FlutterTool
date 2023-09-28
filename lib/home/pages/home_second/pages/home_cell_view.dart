import 'package:firstapp/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class HomeCellView extends StatefulWidget {
  const HomeCellView({super.key});

  @override
  State<HomeCellView> createState() => _HomeCellViewState();
}

class _HomeCellViewState extends State<HomeCellView> {
  @override
  Widget build(BuildContext context) {
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
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/image1.jpeg',
                      image:
                          'https://cp1.douguo.com/upload/tuan/a/4/e/a4c12ff33797dc8a271812f1e7382a5e.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                const Text(
                  '标题',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'LV.2',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.yellow,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onTap: () {
              print('点击了用户头像条');
            },
          ),

          /// 中间图片
          Image.asset(
            'assets/images/image10.jpeg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 300.0,
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
                      isLiked: true,
                      likeBuilder: (isLiked) {
                        return Image.asset(
                          isLiked
                              ? 'assets/common/hot.png'
                              : 'assets/common/hot.png',
                          width: 18,
                          height: 18,
                        );
                      },
                      onTap: (isLiked) {
                        setState(() {
                          isLiked = !isLiked;
                        });
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
            child: const Text(
              '这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容',
              style: TextStyle(
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
