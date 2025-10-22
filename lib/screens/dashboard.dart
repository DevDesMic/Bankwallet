import 'package:bankwallet/screens/spender.dart';
import 'package:bankwallet/screens/transfer.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> _recipientImages = [
    'assets/avatar/zebcream.jpg',
    'assets/avatar/bigfoot.jpg',
    'assets/avatar/monkey.jpg',
    'assets/avatar/zebradev.jpg',
    'assets/avatar/monkeynft.jpg',
    'assets/avatar/zebcream.jpg',
    'assets/avatar/bigfoot.jpg',
    'assets/avatar/monkey.jpg',
    'assets/avatar/zebradev.jpg',
    'assets/avatar/monkeynft.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight, // start from top-right corner
            end: Alignment.centerLeft, // fade diagonally toward center-left
            stops: [
              0.0, // solid color start
              0.2, // fade ends quickly (adjust this for more/less spread)
              0.4, // fully white by here
            ],
            colors: [
              Color.fromARGB(255, 243, 227, 237), // soft pink accent
              Color.fromARGB(255, 255, 240, 245), // fade transition
              Color.fromARGB(255, 242, 237, 241), // white (dominant body color)
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Top row (profile and notification)
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/avatar/zebcream.jpg"),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hello Dev",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Welcome to your wallet",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Card container
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: const Text(
                                "USD",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                "**** 5462, Exp 08/26",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 35,
                              width: 45,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/image/visa.png',
                                  ), // your image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your balance",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "\$3,200.00",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 99, 187),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: Colors.white, size: 40),
                            SizedBox(height: 10),
                            Text(
                              "Add Money",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Transfer(),
                            ),
                          );
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_outward_outlined,
                                color: Colors.black,
                                size: 40,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Transfer",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Spender(),
                            ),
                          );
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(Icons.menu_outlined, size: 50),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Recent Recipients
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recent Recipient",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _recipientImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(_recipientImages[index]),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),

                // Transactions
                Row(
                  children: const [
                    Text(
                      "Transactions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "View all",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                    Icon(Icons.arrow_right_outlined, color: Colors.white70),
                  ],
                ),

                const SizedBox(height: 20),

                // Transaction tiles
                _transactionTile(
                  "Netflix",
                  "12 Aug, 02:11 pm",
                  "-\$18.60",
                  "assets/image/netflix.png",
                ),
                const SizedBox(height: 10),
                _transactionTile(
                  "Shopify",
                  "10 Aug, 10:23 am",
                  "-\$256.40",
                  "assets/image/shopify.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🧾 Transaction tile widget
  Widget _transactionTile(
    String title,
    String date,
    String amount,
    String imagePath,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 25,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(date, style: const TextStyle(color: Colors.black)),
        trailing: Text(
          amount,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
