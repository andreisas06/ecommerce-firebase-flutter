import 'package:flutter/material.dart';

class ProductBanner extends StatelessWidget {
  const ProductBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 255, 123, 0), Colors.black],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "New release",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Cool Shoes",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )
            ],
          ),
          Image.network(
              "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/shoe2.png?alt=media&token=8c9f66f4-bbfb-42f2-80ce-1811e7d7fab7")
        ],
      ),
    );
  }
}
