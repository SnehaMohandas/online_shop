import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Categorych {
  final int category_id;
  final String name;
  final String? description;

  Categorych({
    required this.category_id,
    required this.name,
    this.description,
  });

  factory Categorych.fromJson(Map<String, dynamic> json) {
    return Categorych(
      category_id: int.parse(json['category_id'].toString()),
      name: json['name'],
      description: json['description'],
    );
  }
}

class CategorychListPage extends StatefulWidget {
  const CategorychListPage({Key? key}) : super(key: key);

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategorychListPage> {
  List<Categorych> categories = [];
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
          'https://globosoft.org/2023/02/wayelle2/api/getchildCategories/cate_id/20/key/123456789',
        ),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse['category_info'] != null) {
          final List<dynamic> categoryList = jsonResponse['category_info'];

          setState(() {
            categories = categoryList
                .map((category) => Categorych.fromJson(category))
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
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        children: [
          SizedBox(height: 8,),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                final category = categories[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,),
                          child: Center(child: Text(category.name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w100,color: Colors.white),)),
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
