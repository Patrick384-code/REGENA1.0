
import 'package:flutter/material.dart';
import 'package:regena/News_Components/details_screen.dart';
import 'package:regena/News_Components/models.dart';

class NewsListTile extends StatefulWidget {
  NewsListTile(this.data,{Key? key}):super(key:key);
  NewsData data;
  @override
  State<NewsListTile> createState() => _NewsListTileState();
}

class _NewsListTileState extends State<NewsListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => DetailsScreen(widget.data)
          )
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20.0),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(26.0),
        ),
        child: Row(
          children: [
            Flexible(
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(widget.data.urlToImage!),
                    fit: BoxFit.fitHeight,
                  )
                ),
              ),
            ),
            SizedBox(width: 7.0,),
    
            Flexible(
              flex: 2,
              child: Hero(
                tag: "${widget.data.title}",
                child: Column(
                  children: [
                    Text(widget.data.title!,
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  
                  Text(
                    widget.data.content!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  )
                  
                  ],
                ),
              ),
              ),
          ],
        ),
      ),
    );
  }
}