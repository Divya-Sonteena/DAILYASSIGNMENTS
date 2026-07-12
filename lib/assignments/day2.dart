//DAY:2 Images and Icons
import 'package:flutter/material.dart';
class ImagesIconsAssignment extends StatelessWidget {
  const ImagesIconsAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 2: Images and Icons'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/network.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://unsplash.com',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 180,
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Network Node Alpha',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    Icon(Icons.hub, color: Colors.blue),
                    SizedBox(width: 8),
                    Text('42 Links'),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.speed, color: Colors.green),
                    SizedBox(width: 8),
                    Text('12ms Latency'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text('Share'),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  label: const Text('Sync'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
