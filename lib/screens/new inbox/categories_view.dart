import 'package:finalproject/screens/new%20inbox/new_inbox_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../controllers/categories_controller.dart';
import '../../models/category_model.dart';
import '../../providers/category_notifier.dart';
import '../widgets/app_bar.dart';

class CategoryView extends StatelessWidget {
  CategoryView({Key? key}) : super(key: key);
  CategoryElement? selectedCategory;

  @override
  Widget build(BuildContext context) {
    Future<List<CategoryElement>?> categoriesFuture = getCategories(context);

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: CustomAppBar(
              title: 'Category',
              doneFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewInboxView(
                        selectedCategory: selectedCategory,
                      ),
                    ));
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add Category',
                          style: TextStyle(
                            color: kinProgressStatus,
                            fontSize: 20,
                            letterSpacing: 2,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: kinProgressStatus,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  FutureBuilder<List<CategoryElement>?>(
                    future: categoriesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data == null) {
                        return Text('No categories available.');
                      } else {
                        final categories = snapshot.data!;
                        final categoryProvider =
                            Provider.of<CategoryProvider>(context);
                        final clickedIndex = categoryProvider.clickedIndex;

                        return Expanded(
                          child: ListView.separated(
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return index != clickedIndex
                                  ? ListTile(
                                      onTap: () {
                                        categoryProvider.setClickedIndex(index);
                                        selectedCategory =
                                            snapshot.data![index];
                                      },
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          categories[index].name ?? '',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    )
                                  : ListTile(
                                      onTap: () {
                                        categoryProvider.setClickedIndex(index);
                                        selectedCategory =
                                            snapshot.data![index];
                                      },
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          categories[index].name ?? '',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.check,
                                        size: 25,
                                        color: Colors.blue,
                                      ),
                                    );
                            },
                            separatorBuilder: (context, index) => index != 2
                                ? Divider(
                                    thickness: 1,
                                    indent: 15,
                                  )
                                : Divider(
                                    thickness: 2,
                                  ),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
