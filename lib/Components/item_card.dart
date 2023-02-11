import 'package:flutter/material.dart';
import 'package:duckcart/Models/Product.dart';
import 'package:duckcart/Constants/constants.dart';

class ItemCard extends StatefulWidget {
  final Product product;
  final VoidCallback press;
  const ItemCard({
    super.key,
    required this.product,
    required this.press,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: widget.product.color,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              child: Hero(
                tag: "${widget.product.id}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 4),
                    child: Text(
                      // products is out demo list
                      widget.product.title,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Text(
                    widget.product.price,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() => _isPressed = !_isPressed);
                },
                child: Icon(Icons.favorite_sharp,
                    color: (_isPressed) ? Colors.red : Colors.black12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
