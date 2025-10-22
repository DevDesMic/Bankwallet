import 'package:flutter/material.dart';

class Spender extends StatefulWidget {
  const Spender({super.key});

  @override
  State<Spender> createState() => _SpenderState();
}

class _SpenderState extends State<Spender> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF8E0E6),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Spending',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.menu, color: Colors.black),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // 🔹 Total amount + Filter
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Total amount',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '\$600.00',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'This month',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 2),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // 🔹 Stack for overlapping container
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Bars section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _bar(100, Colors.white),
                      const SizedBox(width: 6),
                      _bar(200, Colors.pinkAccent),
                      const SizedBox(width: 6),
                      _bar(140, Colors.grey.shade300),
                      const SizedBox(width: 6),
                      _bar(90, Colors.pink.shade200),
                    ],
                  ),

                  // Categories overlay
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF8E0E6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Spending categories',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // 🔹 Centered Grid
                          Center(
                            child: SizedBox(
                              width:
                                  screenWidth *
                                  0.9, // keeps centered and trimmed width
                              child: GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                childAspectRatio: 2.0,
                                children: const [
                                  _CategoryCard(
                                    color: Colors.grey,
                                    title: 'Medicine',
                                    amount: '\$124.00',
                                    percent: '24%',
                                  ),
                                  _CategoryCard(
                                    color: Colors.pinkAccent,
                                    title: 'Restaurants',
                                    amount: '\$258.00',
                                    percent: '52%',
                                  ),
                                  _CategoryCard(
                                    color: Colors.grey,
                                    title: 'Transport',
                                    amount: '\$125.20',
                                    percent: '37%',
                                  ),
                                  _CategoryCard(
                                    color: Colors.pinkAccent,
                                    title: 'Utilities',
                                    amount: '\$92.80',
                                    percent: '12%',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 260),
            ],
          ),
        ),
      ),
    );
  }

  // 📊 Reusable bar widget
  static Widget _bar(double height, Color color) {
    return Container(
      width: 40,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

// 💳 Category card widget
class _CategoryCard extends StatelessWidget {
  final String title;
  final String amount;
  final String percent;
  final Color color;

  const _CategoryCard({
    required this.title,
    required this.amount,
    required this.percent,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Color dot + title
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // 🔹 Amount + Percent
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                percent,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
