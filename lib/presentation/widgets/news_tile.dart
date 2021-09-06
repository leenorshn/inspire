import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspire/data/repository/article_help_db.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsTile extends StatelessWidget {
  final News article;
  final VoidCallback onTap;

  const NewsTile({Key? key, required this.article, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('fr', timeago.FrMessages());
    //var t=utf8.decode();
    // var encoded = utf8.encode(this.article.title);
    // var decoded = utf8.decode(encoded);
    // var encodedShort = utf8.encode(this.article.content );
    var trr = this.article.content;

    if (trr.contains("<p>")) {
      trr = trr.replaceAll("<p>", " ");
    }
    return InkWell(
      onTap: this.onTap,
      child: Container(
        child: Column(
          children: [
            ...[
              if (article.imageUrl != "")
                CachedNetworkImage(
                  imageUrl: "${article.imageUrl}",
                )
              else
                Text("Pas d'image pour cet information")
            ],
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Text(
                "${article.title}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 12,
                top: 4,
              ),
              child: Text(
                "${article.title}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[500],
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      size: 20,
                      color: Colors.grey[700],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      timeago.format(
                        DateTime.parse(this.article.createdAt),
                        locale: 'fr',
                      ),
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
