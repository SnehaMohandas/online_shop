import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wayelle/A_comman_widget/Detail_page/pdt_details.dart';
import 'package:wayelle/Anetwork/api.dart';

/// category

class Category {
  final int category_id;
  final String name;
  final String? image;

  Category(
      {required this.category_id, required this.name, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      category_id: int.parse(json['category_id'].toString()),
      name: json['name'],
      image: json['image'],
    );
  }
}

/// subcategory

class SubCategory {
  final int category_id;
  final String name;

  SubCategory({required this.category_id, required this.name});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      category_id: int.parse(json['category_id'].toString()),
      name: json['name'],
    );
  }
}

/// product

class Product {
  final int id;
  final String name;
  final String? thumb;
  final String? price;

  Product({
    required this.id,
    required this.name,
    required this.thumb,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json['id'].toString()),
      name: json['name'],
      thumb: json['thumb'],
      price: json['price'],
    );
  }
}

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({Key? key, required this.switchLanguage})
      : super(key: key);
  final Function(String) switchLanguage;

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<Category> categories = [];
  List<SubCategory> subcategories = [];
  List<Product> products = [];
  bool isLoading = false;
  int selectedCategoryId = -1;
  int selectedSubCategoryId = -1;
  bool? success;
  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('${baseurl}api/getCategories/key/123456789'),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse['category_info'] != null) {
          final List<dynamic> categoryList = jsonResponse['category_info'];

          setState(() {
            categories = categoryList
                .map((category) => Category.fromJson(category))
                .toList();
            isLoading = false;
          });
        }
      } else {
        throw Exception('Failed to load categories from API');
      }
    } catch (error) {
      throw Exception('Failed to fetch categories: $error');
    }
  }

  Future<void> _fetchSubcategories(int categoryId) async {
    //  setState(() {
    isLoading = true;
    // });

    try {
      final response = await http.get(
        Uri.parse(
            '${baseurl}api/getchildCategories/cate_id/$categoryId/key/123456789'),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        success = jsonResponse['success'];

        if (jsonResponse['success'] != false) {
          final List<dynamic> subcategoryList = jsonResponse['category_info'];

          setState(() {
            subcategories = subcategoryList
                .map((subcategory) => SubCategory.fromJson(subcategory))
                .toList();
            isLoading = false;
          });
        } else {
          setState(() {});
        }
      } else {
        throw Exception('Failed to load subcategories from API');
      }
    } catch (error) {
      throw Exception('Failed to fetch subcategories: $error');
    }
  }

  void _navigateToSubcategoryList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubcategoryListPage(
          subcategories: subcategories,
          onSubcategorySelected: _onSubcategorySelected,
          switchLanguage: widget.switchLanguage,
        ),
      ),
    );
  }

  void _onSubcategorySelected(int subcategoryId) async {
    await _fetchProducts(subcategoryId);
  }

  Future<void> _fetchProducts(int subcategoryId) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse(
            '${baseurl}api/products/category/$subcategoryId/key/123456789'),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse['products'] != null) {
          final List<dynamic> productList = jsonResponse['products'];
          List<Product> fetchedProducts =
              productList.map((product) => Product.fromJson(product)).toList();

          setState(() {
            products = fetchedProducts;
            isLoading = false;
          });

          // Navigate to a new page to display products

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(
                products: products,
                switchLanguage: widget.switchLanguage,
              ),
            ),
          );
        }
      } else {
        throw Exception('Failed to load products from API');
      }
    } catch (error) {
      throw Exception('Failed to fetch products: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        // leading: Icon(
        //   Icons.arrow_back_ios,
        //   color: Colors.black,
        // ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 10)
        ],
      ),
      body: categories == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          'SUMMER SALES',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Up to 50% off',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final category = categories[index];
                      final imageUrl =
                          category.image ?? 'https://dummyurl.com/image.jpg';

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  print(categories[index].category_id);

                                  final categoryId =
                                      categories[index].category_id;
                                  print(categoryId);
                                  setState(() {
                                    selectedCategoryId = categoryId;
                                    selectedSubCategoryId = -1;
                                  });
                                  await _fetchSubcategories(selectedCategoryId);

                                  if (success == true) {
                                    _navigateToSubcategoryList();
                                  } else {
                                    _onSubcategorySelected(categoryId);
                                  }
                                },
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                      child: Text(
                                    category.name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.asset(
                                          'assets/logo/error-logo.png',
                                          fit: BoxFit.cover);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class SubcategoryListPage extends StatelessWidget {
  final List<SubCategory> subcategories;
  final Function(int) onSubcategorySelected;
  final Function(String) switchLanguage;

  const SubcategoryListPage({
    Key? key,
    required this.subcategories,
    required this.onSubcategorySelected,
    required this.switchLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Subcategories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: subcategories == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: subcategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final category = subcategories[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  final subcategoryId =
                                      subcategories[index].category_id;
                                  onSubcategorySelected(subcategoryId);
                                },
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                      child: Text(
                                    category.name,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.white),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class ProductPage extends StatelessWidget {
  final List<Product> products;
  final Function(String) switchLanguage;

  const ProductPage(
      {Key? key, required this.products, required this.switchLanguage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 260),
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Container(
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                productid: product.id.toString(),
                                switchLanguage: switchLanguage));
                          },
                          child: Container(
                            height: 184,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${product.thumb}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: [
                              RatingBar.builder(
                                itemSize: 14,
                                initialRating: 3.toDouble(),
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0.5),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  product.name,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: [
                              Material(
                                child: Text(
                                  product.price.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2.85,
                                      color: Color(0xFFFF0000)),
                                ),
                              ),
                              Spacer(),
                              Material(
                                child: Text(
                                  product.price.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
              }),
        ));
  }
}
