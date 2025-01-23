import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils.dart';
import 'package:news_app/features/details/details_view.dart';
import 'package:news_app/features/home/widgets/shimmer_image_loading.dart';
import 'package:news_app/models/NewsModel.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsView(
                      article: article,
                    )));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              placeholder: (context, url) => ShimmerLoading(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
              ),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
              height: MediaQuery.of(context).size.height * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          10.ph,
          Text(
            article.source?.name ?? 'Unknown Source',
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff79828B),
            ),
          ),
          2.ph,
          Text(
            article.description ?? 'No description available.',
            style: Theme.of(context).textTheme.titleSmall,

          ),
          2.ph,
          Text(
            article.publishedAt ?? 'Unknown Date',
            textAlign: TextAlign.end,
            style: GoogleFonts.inter(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xffA3A3A3),
            ),
          ),
          10.ph,
        ],
      ),
    );
  }
}
