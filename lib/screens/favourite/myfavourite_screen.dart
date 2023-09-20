import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/favourite_provider.dart';

class MyFavouriteItemScreen extends StatefulWidget {
  const MyFavouriteItemScreen({super.key});

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourite'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('Item $index'),
                      trailing: value.selectedItem.contains(index)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
