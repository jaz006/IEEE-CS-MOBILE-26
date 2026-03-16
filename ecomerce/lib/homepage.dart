import 'package:ecomerce/details.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: " "),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: " ",
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          border: InputBorder.none,
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.menu, size: 40),
                  ],
                ),
                SizedBox(height: 20),

                Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _categoryItem(Icons.book, 'Books'),
                    _categoryItem(Icons.umbrella, 'Umbrella'),
                    _categoryItem(Icons.card_giftcard, 'Gifts'),
                    _categoryItem(Icons.bike_scooter, 'Bike'),
                  ],
                ),
                SizedBox(height: 20),

                Text(
                  "Best Selling",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),

                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                  children: [
                    _productCard(
                      "https://i.pinimg.com/1200x/a6/fd/df/a6fddfca3dd3392bc95423dd9571d9fe.jpg",
                      "Elgant Black Heels",
                      "\$49.99",
                    ),
                    _productCard(
                      "https://i.pinimg.com/1200x/55/03/1c/55031c27b934fdff286ebaf9c6edde89.jpg",
                      "Elegant Red High Heels",
                      "\$59.99",
                    ),
                    _productCard(
                      "https://i.pinimg.com/1200x/85/92/e5/8592e55ef36356de046a2fe25cf00061.jpg",
                      "The white one",
                      "\$49.99",
                    ),
                    _productCard(
                      "https://i.pinimg.com/1200x/24/98/f8/2498f81e76850d26527c8a892625bd92.jpg",
                      "The Brown 😍",
                      "\$79.99",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 40),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget _productCard(String image, String title, String price) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetails(
              data: {"Image": image, "title": title, "price": price},
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text(price, style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
