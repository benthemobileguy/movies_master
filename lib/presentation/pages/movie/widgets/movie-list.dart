import 'package:flutter/material.dart';
import 'package:movie_app/presentation/pages/movie/widgets/custom-divider.dart';
import 'package:movie_app/presentation/resources/color-manager.dart';
class MovieList extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final String subtitle;
  final bool showDivider;
  final Function() iconPressed;
  bool isFavorited = false;
  final String image;
  MovieList({
    Key key,
    this.onPressed,
    this.isFavorited,
    this.showDivider,
    this.title,
    this.image,
    this.subtitle,
    this.iconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  new Image.network(
                    image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14.5,
                          height: 1.7,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Euclid',
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        width: 180,
                        child: Text(
                          subtitle,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.7,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Euclid',
                            color: ColorManager.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  new IconButton(
                    color:Colors.red,
                    icon: Icon(
                       !isFavorited?
                       Icons.favorite_border:
                       Icons.favorite
                    ),
                    onPressed: iconPressed,
                  )
                ],
              ),
              SizedBox(
                height: 14,
              ),
              showDivider?
              CustomDivider():Container(),

            ],
          ),
        ),
      ),
    );
  }
}