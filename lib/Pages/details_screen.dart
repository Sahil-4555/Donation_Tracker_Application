import 'package:flutter/material.dart';
import 'package:duckcart/Models/Product.dart';
import 'package:duckcart/Components/body_detail_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(
        product: product,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 140),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left_sharp,
                  color: Colors.black,
                  size: 36,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(product.image),
                radius: 24,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                // color: Colors.blue,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    border: Border.all(color: Colors.white)
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 17,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
