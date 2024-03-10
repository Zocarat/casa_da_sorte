
import 'package:flutter/material.dart';


Widget BarraMenuInferior() {
  return BottomAppBar(
    child: Container(
      width: 300,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home_filled)),
          IconButton(onPressed: (){}, icon: Icon(Icons.monetization_on))
        ],
      ),
    ),
  );
}