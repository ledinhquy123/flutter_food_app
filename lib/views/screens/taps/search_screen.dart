import 'package:flutter/material.dart';
import 'package:food_app_yt/constants/colors.dart';
import 'package:food_app_yt/views/screens/home_screen.dart';
import 'package:food_app_yt/views/screens/taps/home_tap.dart';
import 'package:food_app_yt/views/widgets/custom_text_form_field.dart';
import 'package:iconly/iconly.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

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
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        icon: const Icon(
                          Icons.arrow_back_ios
                        )
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: CustomTextFormField(
                        hintText: 'Search',
                        prefixIcon: IconlyLight.search,
                        controller: searchController,
                        filled: true,
                        suffixIcon: searchController.text.isNotEmpty ? Icons.cancel_sharp : null,
                        onPressedSuffixIcon: () {
                          searchController.clear();
                        },
                        onEditingComplete: () {
                          // Thực hiện khi bấm tìm kiếm

                          // Thêm vào list đã tìm kiếm
                          HomeTap.previousSearchs.add(searchController.text);

                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => HomeScreen())
                          );
                        },
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: (){
                          
                        }, 
                        icon: const Icon(
                          IconlyBold.filter
                        )
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              
              Container(
                color: Colors.white,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(), // Không cho phép cuộn
                  shrinkWrap: true, // Thu gọn kích thước phù hợp với nội dung
                  itemCount: HomeTap.previousSearchs.length,
                  itemBuilder: (context, index) => previousSearchItem(index)
                ),
              ),
              const SizedBox(height: 8.0),

              Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search suggesttions',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: mainText
                      ),
                    ),
                    const SizedBox(height: 32),

                    Row(
                      children: [
                        searchSuggestItem('sushi'),
                        searchSuggestItem('sandwich'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    Row(
                      children: [
                        searchSuggestItem('seafood'),
                        searchSuggestItem('fried rice'),
                      ],
                    ),
                    
                  ],
                ),
              )
              
            ],
          ),
        )
      ),
    );
  }

  previousSearchItem(index) {
    return InkWell(
      onTap: () {
        searchController.text = HomeTap.previousSearchs[index];
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Dismissible( // Vuốt để xoá
          key: GlobalKey(), 
          onDismissed: (DismissDirection dir) {
            setState(() {
              HomeTap.previousSearchs.removeAt(index);
            });
          },
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: Icon(
                  IconlyLight.time_circle,
                  color: secondaryText,
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  HomeTap.previousSearchs[index],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: mainText
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Icon(
                    Icons.call_made_outlined
                  )
              )
            ],
          ),
        )
      )
    );
  }

  searchSuggestItem(String text) {
    return InkWell(
      onTap: () {
        searchController.text = text;
      },
      child:Container(
        margin: const EdgeInsets.only(right: 16.0),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: const BoxDecoration(
          color: form,
          borderRadius: BorderRadius.all(
            Radius.circular(32)
          )
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: mainText
          ),
        ),
      ),
    );
  }
}