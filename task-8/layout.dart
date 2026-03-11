import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const PhotoWithScrollContent(),
      ),
    );
  }
}

class PhotoWithScrollContent extends StatelessWidget {
  const PhotoWithScrollContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          child: Image.network(
            'https://i.pinimg.com/736x/72/d9/af/72d9af964d384fc2a16fd087c1062a7c.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: const Column(
                  children: [
                    TitleSection(
                      name: 'Homemade Ramen',
                      location: 'By June Xie',
                    ),
                    ButtonSection(),
                    RecipeIngredients(),
                    Divider(height: 40),
                    Text(
                      "Preparation Steps...",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Homemade Ramen',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('4.5'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWithText(
          color: color,
          icon: Icons.update,
          label: '3h 30min',
        ),
        ButtonWithText(
          color: color,
          icon: Icons.person,
          label: 'Serve 4',
        ),
        ButtonWithText(
          color: color,
          icon: Icons.whatshot,
          label: 'Intermediate',
        ),
      ],
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class IngredientSection {
  final String title;
  final List<IngredientItem> items;

  IngredientSection({required this.title, required this.items});
}

class IngredientItem {
  final String quantity;
  final String name;

  IngredientItem({required this.quantity, required this.name});
}

class IngredientRow extends StatelessWidget {
  final String quantity;
  final String name;

  const IngredientRow({
    super.key,
    required this.quantity,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              quantity,
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
          ),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ingredients",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          SectionTitle("For Chicken Dashi"),
          IngredientRow(quantity: "8 Cups", name: "Low sodium chicken broth"),
          IngredientRow(quantity: "16", name: "Dried Shiitake mushrooms"),
          IngredientRow(quantity: "30 g", name: "Kombu (about 10\" square piece)"),
          IngredientRow(quantity: "20 g", name: "Dried Bonito flakes"),

          SizedBox(height: 20),

          SectionTitle("For Tare and Chashu"),
          IngredientRow(quantity: "1 1/4 Cups", name: "Low sodium soy sauce"),
          IngredientRow(quantity: "1 1/4 Cups", name: "Mirin"),
          IngredientRow(quantity: "1/2 Cup", name: "Sake"),
          IngredientRow(quantity: "1 1/2 Cups", name: "Water"),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}