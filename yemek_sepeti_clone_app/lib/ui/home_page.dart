import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemek_sepeti_clone_app/app_colors.dart';
import 'package:yemek_sepeti_clone_app/entity/images_entity.dart';

import '../entity/filter_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Future<List<ImagesEntity>> loadImages() async {
    var listBar = <ImagesEntity>[];
    var listImage1 = ImagesEntity(
      id: 0,
      image: "yüzde.png",
      name: "Fırsatlar",
    );
    var listImage2 = ImagesEntity(
      id: 0,
      image: "sepet.png",
      name: "Y-Market",
    );
    var listImage3 = ImagesEntity(
      id: 0,
      image: "kupon.png",
      name: "Kuponlarım",
    );
    var listImage4 = ImagesEntity(
      id: 0,
      image: "gelal.png",
      name: "Gel Al",
    );
    listBar.add(listImage1);
    listBar.add(listImage2);
    listBar.add(listImage3);
    listBar.add(listImage4);

    return listBar;
  }

  Future<List<ImagesEntity>> loadFoodImages() async {
    var listFood = <ImagesEntity>[];
    var listImage1 = ImagesEntity(
      id: 0,
      image: "food1.jpeg",
      name: "Tatlı",
    );
    var listImage2 = ImagesEntity(
      id: 0,
      image: "food2.jpeg",
      name: "Burger",
    );
    var listImage3 = ImagesEntity(
      id: 0,
      image: "food3.jpeg",
      name: "Pizza",
    );
    var listImage4 = ImagesEntity(
      id: 0,
      image: "food4.png",
      name: "Tavuk",
    );
    listFood.add(listImage1);
    listFood.add(listImage2);
    listFood.add(listImage3);
    listFood.add(listImage4);

    return listFood;
  }

  Future<List<ImagesEntity>> loadCoastImages() async {
    var listCoast = <ImagesEntity>[];
    var listImage1 = ImagesEntity(
      id: 0,
      image: "150tlindirim.jpg",
      name: "",
    );
    var listImage2 = ImagesEntity(
      id: 0,
      image: "100tlindirim.png",
      name: "",
    );
    var listImage3 = ImagesEntity(
      id: 0,
      image: "60tlindirim.png",
      name: "",
    );
    listCoast.add(listImage1);
    listCoast.add(listImage2);
    listCoast.add(listImage3);

    return listCoast;
  }

  Future<List<ImagesEntity>> loadRestourantImages() async {
    var listCoast = <ImagesEntity>[];
    var listImage1 = ImagesEntity(id: 0, image: "kebap.jpeg", name: "Kebapçım");
    var listImage2 = ImagesEntity(id: 1, image: "özsüt.jpeg", name: "Özsüt");
    var listImage3 =
        ImagesEntity(id: 2, image: "levent_borek.jpeg", name: "Levent Börek");
    listCoast.add(listImage1);
    listCoast.add(listImage2);
    listCoast.add(listImage3);
    return listCoast;
  }

  final List<FilterItem> filterItems = [
    FilterItem(
      title: "",
      options: ["Azalan Fiyat", "Artan Fiyat", "Uzaklık"],
      onSelected: (value) {
        print("-- -> $value");
      },
    ),
    FilterItem(
      title: "Sıralama",
      options: ["Önerilen", "Teslimat Süresi", "Restoran Puanı"],
      onSelected: (value) {
        print("Sıralama -> $value");
      },
    ),
    FilterItem(
      title: "Mutfak",
      options: ["Kahvaltı","Meze","Pizza","Döner","Kebap","Pide","Tatlı","Burger","Tavuk"],
      onSelected: (value) {
        print("Mutfak -> $value");
      },
    ),
    FilterItem(
      title: "Min. Sepet Tutarı",
      options: ["<150", "<350", "<500",">500"],
      onSelected: (value) {
        print("Min. Sepet Tutarı -> $value");
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primary,
            expandedHeight: 225,
            floating: true,
            pinned: false,
            snap: true,
            title: const Text(""),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppColors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          height: 40,
                          color:
                              CupertinoColors.systemGrey6.resolveFrom(context),
                          child: CupertinoSearchTextField(
                            backgroundColor: Colors.transparent,
                            placeholder: 'Restoran veya mağaza arayın',
                            placeholderStyle: const TextStyle(
                              fontFamily: "Sebino",
                              color: CupertinoColors.systemGrey,
                              fontSize: 16.0,
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Icon(
                                CupertinoIcons.search,
                                size: 32,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            suffixIcon: const Icon(
                              CupertinoIcons.clear_circled_solid,
                              color: CupertinoColors.systemGrey,
                              size: 32,
                            ),
                            suffixInsets: const EdgeInsets.only(right: 12.0),
                            onChanged: (value) {
                              print('Arama metni: $value');
                            },
                            onSubmitted: (value) {
                              print('Arama gönderildi: $value');
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "İlk Siparişe Özel İndirim!\n",
                                      style: TextStyle(
                                        fontFamily: "Sebino",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteTextColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Kupon Kodu: MERHABA\n",
                                      style: TextStyle(
                                        fontFamily: "Sebino",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteTextColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Şimdi sipariş ver",
                                      style: TextStyle(
                                        fontFamily: "Sebino",
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.whiteTextColor,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 4.0),
                                        child: Icon(
                                          Icons.arrow_circle_right,
                                          size: 20,
                                          color: AppColors.whiteTextColor,
                                        ),
                                      ),
                                      alignment: PlaceholderAlignment.middle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Image.asset(
                                      "images/topbaricontransparan.png"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: FutureBuilder<List<ImagesEntity>>(
                      future: loadImages(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return const Center(child: Text("Hata oluştu"));
                        } else {
                          var imageList = snapshot.data ?? [];

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: imageList.map((imageEntity) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: const Color(
                                              0xFFFFE4F3),
                                          borderRadius: BorderRadius.circular(
                                              30),
                                        ),
                                        child: Image.asset(
                                          "images/${imageEntity.image}",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        imageEntity.name,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontFamily: "Sebino",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        }
                      },
                    ),
                  ),

                  // Alt çizgi
                  //  const Divider(
                  //    color: Colors.grey,
                  //    thickness: 1,
                  //    height: 1,
                  //  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: filterItems.map((item) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: PopupMenuButton<String>(
                              onSelected: item.onSelected,
                              itemBuilder: (context) => item.options
                                  .map((option) => PopupMenuItem<String>(
                                        value: option,
                                        child: Text(option),
                                      ))
                                  .toList(),
                              child: item.title.isEmpty
                                  ? Image.asset("images/setting_lines.png",
                                      width: 18, height: 18)
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(item.title,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                            )),
                                        const SizedBox(width: 4),
                                        Image.asset("images/down.png",
                                            width: 12, height: 12),
                                      ],
                                    ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0,
                        top: 0,
                        bottom: 4),
                    child: Align(
                      alignment:
                          Alignment.centerLeft,
                      child: Text(
                        "Mutfaklar",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontFamily: "Sebino",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16,
                        top: 0,
                        right: 16),
                    child: FutureBuilder<List<ImagesEntity>>(
                        future: loadFoodImages(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            var imageList = snapshot.data ?? [];
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: imageList.map((imageEntity) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Image.asset(
                                            "images/${imageEntity.image}",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(imageEntity.name,
                                            style: TextStyle(
                                                fontFamily: "Sebino",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.8))),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          }
                        }),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 0, right: 16, bottom: 4),
                    child: FutureBuilder<List<ImagesEntity>>(
                      future: loadCoastImages(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          var imageList = snapshot.data ?? [];
                          return SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: imageList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: SizedBox(
                                    width: 200,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        "images/${imageList[index].image}",
                                        fit: BoxFit.fill,
                                        width: 200,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 0, bottom: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Restoranları keşfet",
                        style: TextStyle(
                          fontFamily: "Sebino",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Container(
                    child: FutureBuilder<List<ImagesEntity>>(
                      future: loadRestourantImages(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          var imageList = snapshot.data ?? [];
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: imageList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                        child: AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: Image.asset(
                                            "images/${imageList[index].image}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              imageList[index]
                                                  .name,
                                              style: TextStyle(
                                                  fontFamily: "Sebino",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                                      .withOpacity(0.8)),
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                Text(
                                                  "30-45 dk",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "Min. 120 TL",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.delivery_dining,
                                                  size: 16,
                                                  color: Colors.grey[700],
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "Ücretsiz",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[700],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Divider(color: Colors.grey[300]),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6,
                                                      horizontal: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.green[100],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.percent,
                                                    size: 14,
                                                    color: Colors.green[800],
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    "50 TL'ye %25 indirim",
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.green[800],
                                                      fontFamily: "Sebino",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          fontFamily: "Sebino",
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: "Sebino",
          fontSize: 12,
        ),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_outlined),
            label: 'Yemek',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Mahalle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Arama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Hesabım',
          ),
        ],
      ),
    );
  }
}
