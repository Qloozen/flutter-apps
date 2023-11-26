import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    if (favoriteMeals.contains(meal)) {
      setState(() {
        favoriteMeals.remove(meal);
      });
      _showInfoMessage("Removed '${meal.title}' from your favorites");
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
      _showInfoMessage("Added '${meal.title}' to your favorites");
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    if (identifier == "filters") {
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? activatePage;
    var activatePageTitle = "Categories";

    switch (_selectedPageIndex) {
      case 0:
        activatePage = CategoriesScreen(_toggleMealFavoriteStatus);
        activatePageTitle = "Categories";
        break;
      case 1:
        activatePage = MealsScreen(favoriteMeals, _toggleMealFavoriteStatus);
        activatePageTitle = "Favorite Meals";
        break;
    }

    return Scaffold(
      appBar: AppBar(title: Text(activatePageTitle)),
      drawer: MainDrawer(_setScreen),
      body: activatePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
