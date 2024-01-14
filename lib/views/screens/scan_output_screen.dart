import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/datas/food_data.dart';
import 'package:food_app_yt/views/widgets/custom_product_item.dart';

class ScanOutputScreen extends StatefulWidget { 
  String title;

  ScanOutputScreen({required this.title});

  @override
  State<StatefulWidget> createState() => _ScanOutputScreenState();
}

class _ScanOutputScreenState extends State<ScanOutputScreen> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      setState(() {}); // LƯU Ý: phải có thì điều kiện ẩn appbar mới dùng được
    });

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView( // Sử dụng để tuỳ chỉnh scroll phức tạp hơn
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                height: 16.0,
              ),
            ),

            SliverAppBar( // Là một loại sliver tạo appBar có thể mở rộng
              pinned: true, // true thì appbar sẽ xuất hiện trên góc màn hình ngay cả khi cuộn
              elevation: 0,
              toolbarHeight: 80.0,
              titleSpacing: 0,
              title: _scrollController.hasClients && _scrollController.offset > 250.0 
              ? Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    child: Image.asset(
                      'assets/images/Captured Food.png'
                    ),
                  ),
                  const SizedBox(width: 24.0),

                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: const Color(0xFF3E5481)
                    ),
                  ),
                ],
              ) : const SizedBox(),
              expandedHeight: 350, // Độ cao của phần bị cuộn
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )
              ),

              flexibleSpace: FlexibleSpaceBar( // Hiển thị nội dung mở rộng, thay đổi trong quá trình cuộn
                background: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column( // Nội dung trong phần bị cuộn
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: const Color(0xFF3E5481)
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(24),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage(
                            'assets/images/Captured Food.png'
                          ),
                        ),
                      ),

                      Text(
                        'Pancakes',
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: const Color(0xFF3E5481)
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),

            // Đoạn khoảng cách ở giữa (Không được dùng sizedbox)
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                color: form,
                height: 8.0,
              ),
            ),

            SliverGrid.count(
              crossAxisCount: 2, // Số item trên 1 hàng
              childAspectRatio: 2/3,
              children: FOOD_DATA.map((e) => CustomProductItem(food: e)).toList(),
            )
          ],
        ),
      ),
    );
  }
}