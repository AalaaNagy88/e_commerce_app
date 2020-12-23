import 'package:flutter/material.dart';

class HomeTitles extends StatelessWidget {
  final String name;
  final Function expand;

  const HomeTitles({Key key, this.name,this.expand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Text(name,style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.black),),
        ),
        TextButton(child:Text("See all",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.grey),),
          onPressed: expand,
        )
      ],
    );
  }
}