import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wayelle/Anetwork/api.dart';

class Categorychpdts {
  final int id;
  final String name;
  final String? thumb;
  final String? price;

  Categorychpdts({
    required this.id,
    required this.name,
    this.thumb,
    this.price,
  });

  factory Categorychpdts.fromJson(Map<String, dynamic> json) {
    return Categorychpdts(
      id: int.parse(json['id'].toString()),
      name: json['name'],
      thumb: json['thumb'],
      price: json['price'],
    );
  }
}

class CategorychpdtsListPage extends StatefulWidget {
  const CategorychpdtsListPage({Key? key}) : super(key: key);

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategorychpdtsListPage> {
  List<Categorychpdts> categories = [];
  bool isLoading = false;
  int selectedCategoryId = -1;

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
        Uri.parse(
          '${baseurl}api/products/category/27/key/123456789',
        ),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse['products'] != null) {
          final List<dynamic> categoryList = jsonResponse['products'];
          setState(() {
            categories = categoryList
                .map((category) => Categorychpdts.fromJson(category))
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 16,
                                  mainAxisExtent: 260),
                          itemBuilder: (BuildContext context, int index) {
                            final category = categories[index];
                            return Stack(children: [
                              Container(
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      // Padding(
                                      //   padding:
                                      //   const EdgeInsets.only(top: 3,bottom: 3),
                                      //   child:
                                      //   // Row(
                                      //   //   children: [
                                      //   //     Spacer(),
                                      //   //     AddToCartBuon( product_id: allproducts!
                                      //   //         .subcategoryproducts![index].id !,),
                                      //   //   ],
                                      //   // ),
                                      // ),
                                      Container(
                                        height: 184,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.grey),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            "${category.thumb}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      // Align(
                                      //   alignment: Alignment.bottomRight,
                                      //   child: Container(
                                      //     height: 20,
                                      //     width: 20,
                                      //     child: IconButton(
                                      //         onPressed: () {},
                                      //         icon: Icon(
                                      //           Icons.favorite,
                                      //           color: Colors.red,
                                      //         )),
                                      //   ),
                                      // ),
                                      //Text("data"),

                                      SizedBox(
                                        height: 7,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xFFFFBA49),
                                              size: 16,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xFFFFBA49),
                                              size: 16,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xFFFFBA49),
                                              size: 16,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xFFFFBA49),
                                              size: 16,
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Colors.black38,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Text(
                                                category.name,
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
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Row(
                                          children: [
                                            Material(
                                              child: Text(
                                                category.name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 11,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationThickness: 2.85,
                                                    color: Color(0xFFFF0000)),
                                              ),
                                            ),
                                            Spacer(),
                                            Material(
                                              child: Text(
                                                category.price.toString(),
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
                                  )),
                            ]);
                          }),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
