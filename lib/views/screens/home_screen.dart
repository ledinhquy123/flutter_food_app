import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/views/screens/scan_output_screen.dart';
import 'package:food_app_yt/views/screens/taps/home_tap.dart';
import 'package:food_app_yt/views/screens/taps/notification_tap.dart';
import 'package:food_app_yt/views/screens/taps/profile_tap.dart';
import 'package:food_app_yt/views/screens/taps/scan_tap.dart';
import 'package:food_app_yt/views/screens/taps/upload_tap.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[_currentIndex],
      bottomNavigationBar: bottomNavigationBar(),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // nằm giữa thanh bar bottom che lên 1 nửa
    );
  }
  // Lưu dangh sách các widget khi được click (Lưu ý để đúng thứ tự trong bar)
  List<Widget> taps = [
    HomeTap(),
    UploadTap(),
    ScanTap(),
    NotificationTap(),
    ProfileTap()
  ];

  bottomNavigationBar() {
    return BottomNavigationBar(
      unselectedItemColor: const Color(0xFF000000).withOpacity(.25), // chỉnh màu icon khi chưa chọn
      currentIndex: _currentIndex,
      items: items,
      type: BottomNavigationBarType.fixed,
      fixedColor: primary, // Màu khi được chọn vào
      backgroundColor: Colors.white,
      elevation: 0,
      onTap: (index) {
        setState(() {
          // index: 1 -> 4
          if(index == 1){
            // Upload => screen
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => UploadTap())
            );
          }else if(index != 2) _currentIndex = index;
          else{
            showModalBottomSheet(
              context: context, 
              builder: (context) => bottomSheet(context)
            );
          }
          
        });
        // if(index == 0){
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // }else if(index == 1){
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // }else if(index == 2){
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // }else if(index == 3){
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // }else if(index == 4){
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // }
      },
    );
  }

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.home,
      ),
      label: 'Home'
    ),

    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.edit,
      ),
      label: 'Upload'
    ),

    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.scan,
      ),
      label: 'Scan'
    ),

    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.notification,
      ),
      label: 'Notification'
    ),

    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.profile,
      ),
      label: 'Profile'
    ),
  ];

  floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context, 
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32))
          ),
          builder: (context) => bottomSheet(context)
        );
      },
      backgroundColor: primary,
      child: const Icon(
        IconlyBold.scan,
        size: 24,
      ),
    );
  }

  bottomSheet(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context), 
                icon: const Icon(
                  Icons.close
                )
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: Text(
                    'Choose one option',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: const Color(0xFF3E5481)
                    ),
                  ),
                )
              )
            ],
          ),
          const SizedBox(height: 8.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => ScanOutputScreen(title: 'Food'))
                  );
                },
                child: Container(
                  width: 155,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    border: Border.all(
                      width: 1,
                      color: outline
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/image 6.png',
                        width: 96,
                        height: 82,
                      ),
                      const SizedBox(height: 8),

                      Text(
                        'Food',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: const Color(0xFF3E5481)
                        ),
                      )
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => ScanOutputScreen(title: 'Ingredients'))
                  );
                },
                child: Container(
                  width: 155,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    border: Border.all(
                      width: 1,
                      color: outline
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/image 7.png',
                        width: 96,
                        height: 82,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Ingredient',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: const Color(0xFF3E5481)
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}