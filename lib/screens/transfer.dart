import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  final PageController _pageController = PageController(viewportFraction: 0.4);
  double _currentPage = 0.0;

  final List<Map<String, String>> users = [
    {"name": "Liam Cole", "image": "assets/avatar/zebradev.jpg"},
    {"name": "Emma Grace", "image": "assets/avatar/monkeynft.jpg"},
    {"name": "Chaya Lindsey", "image": "assets/avatar/monkey.jpg"},
    {"name": "Noah Smith", "image": "assets/avatar/zebcream.jpg"},
    {"name": "Olivia Ray", "image": "assets/avatar/bigfoot.jpg"},
    {"name": "James Lee", "image": "assets/avatar/zebradev.jpg"},
    {"name": "Sophia Park", "image": "assets/avatar/zebradev.jpg"},
  ];
  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.arrow_left_outlined, color: Colors.black),
        ),
        title: const Text(
          "Transfer",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // 🎠 Avatar Carousel
            SizedBox(
              height: 140,
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  double distance = (_currentPage - index).abs();
                  double scale = 1 - (distance * 0.3);
                  scale = scale.clamp(0.75, 1.0);
                  double verticalOffset = distance * 25;

                  bool isCenter = distance < 0.5;

                  return Transform.translate(
                    offset: Offset(0, verticalOffset),
                    child: Transform.scale(
                      scale: scale,
                      child: Column(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(60),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => AvatarDetailScreen(
                                        imagePath: users[index]['image']!,
                                        index: index,
                                      ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: 'avatar_$index',
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        isCenter
                                            ? Colors.pink
                                            : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: isCenter ? 45 : 35,
                                  backgroundImage: AssetImage(
                                    users[index]['image']!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (isCenter)
                            Text(
                              users[index]['name']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // 💰 Amount Display
            const Text(
              "\$96.00",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 10),

            // 🔢 Number Grid with white boxes
            Expanded(
              child: GridView.builder(
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 2.5, // 👈 slimmer boxes
                ),
                itemBuilder: (context, index) {
                  String? label;
                  IconData? icon;

                  if (index < 9) {
                    label = '${index + 1}';
                  } else if (index == 9) {
                    label = '.'; // dot key
                  } else if (index == 10) {
                    label = '0';
                  } else if (index == 11) {
                    icon = Icons.backspace_outlined; // backspace key
                  }

                  // Identify keys that should have no box: "." and "x"
                  bool noBoxKey = (index == 9 || index == 11);

                  // Return either a plain key or boxed key
                  return noBoxKey
                      ? Center(
                        child:
                            icon != null
                                ? Icon(icon, size: 26, color: Colors.black87)
                                : Text(
                                  label!,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                      )
                      : Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.08),
                              blurRadius: 4,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child:
                              icon != null
                                  ? Icon(icon, size: 26, color: Colors.black87)
                                  : Text(
                                    label!,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                        ),
                      );
                },
              ),
            ),
            const SizedBox(height: 20),

            // 💸 Send Money Button
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 99, 187),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Send Money",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🖼️ Avatar Detail Screen
class AvatarDetailScreen extends StatelessWidget {
  final String imagePath;
  final int index;

  const AvatarDetailScreen({
    super.key,
    required this.imagePath,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar $index'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: 'avatar_$index',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  imagePath,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            "Liam Cole",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
