import 'package:flutter/material.dart';
import 'package:regena/News_Components/models.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(this.data,{Key? key}):super(key:key);
  NewsData data;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color(0xFF008000),),
      ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(widget.data.title!,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 8.0,),

            Text(
              widget.data.author!,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10.0,),
            Hero(
              tag: "${widget.data.title}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(widget.data.urlToImage!),
              ),
            ),
             SizedBox(height: 5.0,),
             Text(
              widget.data.content!,
              // style: TextStyle(
              //   color: Colors.black,
              //   fontSize: 15.0,
              //   fontWeight: FontWeight.normal,
              // ),
             ),
          ],
        ),
      ),
    );
  }
}