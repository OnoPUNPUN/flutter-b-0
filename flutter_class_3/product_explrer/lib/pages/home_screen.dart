import 'package:flutter/material.dart';
import 'package:product_explrer/models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = true;
  @override
  Widget build(BuildContext context) {
    final List<Product> sampleProducts = [
      const Product(
        name: "Goodnight Punpun",
        price: 520,
        description: "Goodnight Punpun is a Japanese manga series written and illustrated by Inio Asano. It was initially serialized in Shogakukan's seinen manga magazine Weekly Young Sunday between 2007 and 2008, and was later transferred to Weekly Big Comic Spirits, where it ran from 2008 to 2013.",
      ),
      const Product(
        name: "Happiness",
        price: 400,
        description: "Happiness (Japanese: ハピネス) is a dark fantasy and psychological horror manga series written and illustrated by Shūzō Oshimi",
      ),
      const Product(
        name: "Drifting Net Cafe",
        price: 450,
        description: "Drifting Net Cafe is a Japanese seinen manga illustrated and written by Shūzō Oshimi that was serialized in the manga magazine, Manga Action. Drifting Net Cafe is a science fiction mystery involving a group of patrons trapped in an internet café, which has become a strange universe of its own.",
      ),
      const Product(
        name: "Blood on the Tracks",
        price: 460,
        description: "Blood on the Tracks is a Japanese manga series written and illustrated by Shūzō Oshimi. It was serialized in Shogakukan's seinen manga magazine Big Comic Superior from February 2017 to September 2023, with its chapters collected into 17 tankōbon volumes.",
      ),
      const Product(
        name: "The Flowers of Evil",
        price: 360,
        description: "The Flowers of Evil is a Japanese manga series written and illustrated by Shūzō Oshimi. It was serialized in Kodansha's Bessatsu Shōnen Magazine between September 2009 and May 2014. ",
      ),
      const Product(
        name: "Goodnight Punpun",
        price: 520,
        description: "Goodnight Punpun is a Japanese manga series written and illustrated by Inio Asano. It was initially serialized in Shogakukan's seinen manga magazine Weekly Young Sunday between 2007 and 2008, and was later transferred to Weekly Big Comic Spirits, where it ran from 2008 to 2013.",
      ),
      const Product(
        name: "Happiness",
        price: 400,
        description: "Happiness (Japanese: ハピネス) is a dark fantasy and psychological horror manga series written and illustrated by Shūzō Oshimi",
      ),
      const Product(
        name: "Drifting Net Cafe",
        price: 450,
        description: "Drifting Net Cafe is a Japanese seinen manga illustrated and written by Shūzō Oshimi that was serialized in the manga magazine, Manga Action. Drifting Net Cafe is a science fiction mystery involving a group of patrons trapped in an internet café, which has become a strange universe of its own.",
      ),
      const Product(
        name: "Blood on the Tracks",
        price: 460,
        description: "Blood on the Tracks is a Japanese manga series written and illustrated by Shūzō Oshimi. It was serialized in Shogakukan's seinen manga magazine Big Comic Superior from February 2017 to September 2023, with its chapters collected into 17 tankōbon volumes.",
      ),
      const Product(
        name: "The Flowers of Evil",
        price: 360,
        description: "The Flowers of Evil is a Japanese manga series written and illustrated by Shūzō Oshimi. It was serialized in Kodansha's Bessatsu Shōnen Magazine between September 2009 and May 2014. ",
      ),
      const Product(
        name: "Goodnight Punpun",
        price: 520,
        description: "Goodnight Punpun is a Japanese manga series written and illustrated by Inio Asano. It was initially serialized in Shogakukan's seinen manga magazine Weekly Young Sunday between 2007 and 2008, and was later transferred to Weekly Big Comic Spirits, where it ran from 2008 to 2013.",
      ),
      const Product(
        name: "Happiness",
        price: 400,
        description: "Happiness (Japanese: ハピネス) is a dark fantasy and psychological horror manga series written and illustrated by Shūzō Oshimi",
      ),
      const Product(
        name: "Drifting Net Cafe",
        price: 450,
        description: "Drifting Net Cafe is a Japanese seinen manga illustrated and written by Shūzō Oshimi that was serialized in the manga magazine, Manga Action. Drifting Net Cafe is a science fiction mystery involving a group of patrons trapped in an internet café, which has become a strange universe of its own.",
      ),
      const Product(
        name: "Blood on the Tracks",
        price: 460,
        description: "Blood on the Tracks is a Japanese manga series written and illustrated by Shūzō Oshimi. It was serialized in Shogakukan's seinen manga magazine Big Comic Superior from February 2017 to September 2023, with its chapters collected into 17 tankōbon volumes.",
      ),
      const Product(
        name: "The Flowers of Evil",
        price: 360,
        description: "The Flowers of Evil is a Japanese manga series written and illustrated by Shūzō Oshimi. It was serialized in Kodansha's Bessatsu Shōnen Magazine between September 2009 and May 2014. ",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Explorere"),
        actions: [
          IconButton(
            tooltip: "Chage Layout",
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
            icon: Icon(isGrid ? Icons.view_list : Icons.grid_view),
          ),
        ],
      ),
      body: isGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: sampleProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
              itemBuilder: (context, index) {
                final product = sampleProducts[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Icon(Icons.shopping_bag, size: 48),
                          ),
                        ),
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: .w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text("Tk${product.price}"),
                      ],
                    ),
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: sampleProducts.length,
              itemBuilder: (context, index) {
                final product = sampleProducts[index]; // 0

                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.shopping_bag)),
                  title: Text(product.name),
                  subtitle: Text("Tk${product.price}"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
    );
  }
}
