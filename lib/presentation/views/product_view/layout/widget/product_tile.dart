import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:k24/app/Custom_image_container.dart';
import 'package:k24/presentation/elements/custom_text.dart';

class ProductTile extends StatelessWidget {
  String title;
  String min;
  String max;
  String image;
  String price;

  ProductTile(
      {required this.title,
      required this.min,
      required this.max,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: image == ""
                        ? Icon(Icons.person_outline_rounded)
                        : CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: image,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Container(
                                    width: 50,
                                    height: 50,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                      ),
                                    )),
                          ))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: CustomText(
                      text: title,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            CustomText(text: '€ ${price}')
          ],
        ),
      ),
    );
  }
}
