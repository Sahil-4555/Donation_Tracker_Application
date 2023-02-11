import 'package:flutter/material.dart';
import 'package:duckcart/Models/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatefulWidget {
  final Product product;
  const Body({required this.product}) : super(key: null);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String dropdownValue = '₹';
  final _amountController = TextEditingController();
  final _nameController = TextEditingController();
  final _optionalController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    _optionalController.dispose();
    super.dispose();
  }

  Future supportCreators() async {
    await FirebaseFirestore.instance.collection('CreatorsSupport').add({
      'Amount': int.parse(_amountController.text.trim()),
      'Creator ID': widget.product.id,
      'Currency': dropdownValue,
      'Message': _optionalController.text.trim(),
      'Name': _nameController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 260),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Send Your Love To ${widget.product.title} to \n  Become a Real Fan ',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18, left: 17),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            width: 365,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            // Text Field To Enter Amount
                            child: Row(
                              children: [
                                // Drop Down Menu for Currency
                                Container(
                                  padding: const EdgeInsets.only(left: 6),
                                  width: 40,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: dropdownValue,
                                      items: <String>[
                                        '\$',
                                        '€',
                                        '£',
                                        '₹',
                                        '¥',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style:
                                                const TextStyle(fontSize: 17),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 4,
                                ),

                                // Icon for arrow drop up and down
                                Column(
                                  children: const [
                                    Icon(
                                      Icons.arrow_drop_up,
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                    ),
                                  ],
                                ),

                                // Text Field
                                SizedBox(
                                  height: 70,
                                  width: 275,
                                  child: Center(
                                    child: TextField(
                                      controller: _amountController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(20),
                                        hintText: '2000',
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                        fillColor: Colors.white,
                                        // filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),

                          // Text Field For Name
                          Container(
                            width: 365,
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: TextField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: 'Your Name (Optional)',
                                  fillColor: Colors.white,
                                  // filled: true,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),

                          // Text Field for Something Nice
                          Container(
                            width: 365,
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: TextField(
                                controller: _optionalController,
                                maxLines: null,
                                expands: true,
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: 'Say Something nice.. (Optional)',
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          // Support Button
                          GestureDetector(
                            onTap: supportCreators,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'Support',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
