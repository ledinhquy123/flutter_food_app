import 'package:flutter/material.dart';
import 'package:food_app_yt/datas/food_data.dart';
import 'package:food_app_yt/models/food.dart';
import 'package:food_app_yt/views/screens/taps/search_screen.dart';
import 'package:food_app_yt/views/widgets/custom_binary_option.dart';
import 'package:food_app_yt/views/widgets/custom_category_list.dart';
import 'package:food_app_yt/views/widgets/custom_product_item.dart';
import 'package:food_app_yt/views/widgets/custom_text_form_field.dart';
import 'package:iconly/iconly.dart';

class HomeTap extends StatefulWidget {
  // Dùng static biến sẽ chuyển thành biến dung cho 1 lớp (không phải 1 đối tượng cụ thể)
  static List previousSearchs = []; // Thêm phần tử rỗng để không bị lỗi 'null'
  @override
  State<StatefulWidget> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(24),
                child: Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => SearchScreen()
                            )
                          );
                          
                        },
                        child: CustomTextFormField(
                          hintText: 'Search',
                          prefixIcon: IconlyLight.search,
                          filled: true,
                          border: InputBorder.none,
                          enabled: false,
                        ),
                      ),
                      const SizedBox(height: 32.0),

                      CustomCategoryList()
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              Container(
                color: Colors.white,
                child: Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CustomBinaryOption(textLeft: 'Left', textRight: 'Right',),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Lưu ý: muốn dùng grid view phải đưa vào trong một widget chưa đựng nó
              // Expanded(
              //   child: GridView(
              //     // Tìm kếm theo điều kiện
              //     // children: FOOD_DATA.where((element) => element.name == HomeTap.previousSearchs.last.toString()).map((e) => CustomProductItem(food: e)).toList(),
              //     children: FOOD_DATA.map((e) => CustomProductItem(food: e)).toList(),
              //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //       maxCrossAxisExtent: 200,
              //       crossAxisSpacing:  10,
              //       mainAxisSpacing: 10,
              //       childAspectRatio: 1 / 1.5
              //     ),
              //   ),
              // )

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 2/3,
                  shrinkWrap: true,
                  children: 
                  HomeTap.previousSearchs.length > 0 
                  ? FOOD_DATA.where(
                      (element) => element.name == HomeTap.previousSearchs.last.toString()
                    ).map((e) => CustomProductItem(food: e)).toList() 
                    : FOOD_DATA.map(
                      (e) => CustomProductItem(food: e)
                    ).toList(),
                ),
              )
              
            ],
          ),
        ),
      )
    );
  }
}