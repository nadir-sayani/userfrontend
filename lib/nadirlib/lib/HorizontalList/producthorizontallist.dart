import 'package:flutter/material.dart';


class ProductHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.0,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Category(
                image_loc: 'images/tracking.png',
                image_cap: 'activity',
              ),
              Category(
                image_loc: 'images/numof.png',
                image_cap: 'number',
              ),
              Category(
                image_loc: 'images/juggler.png',
                image_cap: 'activity',
              ),
              Category(
                image_loc: 'images/tracking.png',
                image_cap: 'number',
              ),
              Category(
                image_loc: 'images/juggler.png',
                image_cap: 'activity',
              ),
              Category(
                image_loc: 'images/numof.png',
                image_cap: 'number',
              )

            ]

        )
    );
  }
}

class Category extends StatelessWidget{
  final String image_loc;
  final String image_cap;

  Category({this.image_loc,this.image_cap});
  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(
      onTap: () {},

      child: Container(
        width: 100.0,

        child: ListTile(
          title: Image.asset(image_loc,width: 100.0,height: 60.0,),
          subtitle:Container(alignment: Alignment.topCenter,
                              child: Text(image_cap),),
        ),
      ),
    ),);
  }

}