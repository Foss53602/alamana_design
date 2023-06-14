import 'dart:async';
import 'dart:math';

import 'package:alamana_design/theqa_color_schemes.g.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

ValueNotifier<ThemeMode> themeModeNotifier =
    ValueNotifier<ThemeMode>(ThemeMode.light);

void main() {
  runApp(MyApp());
}

bool isShowCase = false;

List<Store> imagesAddresses = [
  Store('أحمد العمر', 'الباب - دوار الكف', 1,
      image:
          'https://wesamalsebea.files.wordpress.com/2021/06/whatsapp-image-2021-06-01-at-9.52.44-am.jpeg',
      location: '36.371416, 37.515691'),
  Store('صالح الأحمد', 'الباب - دوار الكف', 1,
      image:
          'https://i0.wp.com/www.newphotodownload.info/wp-content/uploads/2018/10/%D8%A7%D8%AC%D8%AF%D8%AF-%D8%B5%D9%88%D8%B1-%D8%B4%D8%AE%D8%B5%D9%8A%D8%A9-%D9%84%D9%84%D9%81%D9%8A%D8%B3-%D8%A8%D9%88%D9%83-17.jpg',
      location: '36.371416, 37.515691'),
  Store('محمود المحمود', 'الباب - دوار الكف', 1,
      location: '36.371416, 37.515691'),
  Store('سمير', 'الباب - دوار الكف', 1,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxAbLXjO85VYF-v1zg4AU2_ZNVL9aPtzDZJg&usqp=CAU',
      location: '36.371416, 37.515691'),
  Store('دكتور اسنان', 'اعزار - دوار الكف', 0,
      image:
          'https://nafezly-production.fra1.digitaloceanspaces.com/uploads/portfolios/7196_5faea70a66ba5-1605281546.jpg',
      location: '36.586427107666005, 37.04279229380578'),
  Store('متجر العطور', 'اعزار - خلف الحديقة العامة', 0,
      location: '36.580215, 37.056237'),
];

List<Store> imagesAddressesStores = [
  Store('ميني ماركيت سعيد', 'الباب - دوار الجحجاح', 0,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbInTajUfL2gANCy8D1raX1y91CNR4yYmxWA&usqp=CAU',
      location: '36.371416, 37.515691'),
  Store('احذية الأناقة', 'الباب - دوار العلم', 0,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnj8M1QGU9dkXVIF_9tPx5hkqzLfFg1qJSI-sIDd5Zi4v3VIymwWkBrqSMJ6aTftt0HSY&usqp=CAU',
      location: '36.361421, 37.506785'),
  Store('دكتور اسنان', 'اعزار - دوار الكف', 0,
      image:
          'https://nafezly-production.fra1.digitaloceanspaces.com/uploads/portfolios/7196_5faea70a66ba5-1605281546.jpg',
      location: '36.586427107666005, 37.04279229380578'),
  Store('متجر العطور', 'اعزار - خلف الحديقة العامة', 0,
      location: '36.580215, 37.056237'),
  Store('ميني ماركيت سعيد', 'الباب - دوار الجحجاح', 0,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbInTajUfL2gANCy8D1raX1y91CNR4yYmxWA&usqp=CAU',
      location: '36.371416, 37.515691'),
  Store('احذية الأناقة', 'الباب - دوار العلم', 0,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnj8M1QGU9dkXVIF_9tPx5hkqzLfFg1qJSI-sIDd5Zi4v3VIymwWkBrqSMJ6aTftt0HSY&usqp=CAU',
      location: '36.361421, 37.506785'),
  Store('دكتور اسنان', 'اعزار - دوار الكف', 0,
      location: '36.580215, 37.056237'),
  Store('متجر العطور', 'اعزار - خلف الحديقة العامة', 0,
      image:
          'https://cdn.makane.com/cdn-cgi/image/quality=80,fit=scale-down,format=auto/20211229-store-nhqm/branding/logo-70727278579.jpg?height=45',
      location: '36.580215, 37.056237'),
  Store('ميني ماركيت سعيد', 'الباب - دوار الجحجاح', 0,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbInTajUfL2gANCy8D1raX1y91CNR4yYmxWA&usqp=CAU',
      location: '36.371416, 37.515691'),
  Store('احذية الأناقة', 'الباب - دوار العلم', 0,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnj8M1QGU9dkXVIF_9tPx5hkqzLfFg1qJSI-sIDd5Zi4v3VIymwWkBrqSMJ6aTftt0HSY&usqp=CAU',
      location: '36.361421, 37.506785'),
  Store('دكتور اسنان', 'اعزار - دوار الكف', 0,
      image:
          'https://nafezly-production.fra1.digitaloceanspaces.com/uploads/portfolios/7196_5faea70a66ba5-1605281546.jpg',
      location: '36.580215, 37.056237'),
  Store('متجر العطور', 'اعزار - خلف الحديقة العامة', 0,
      image:
          'https://cdn.makane.com/cdn-cgi/image/quality=80,fit=scale-down,format=auto/20211229-store-nhqm/branding/logo-70727278579.jpg?height=45',
      location: '36.580215, 37.056237'),
];

class Store {
  String name;
  String? image;
  String address;
  String? location;
  int type;

  Store(this.name, this.address, this.type, {this.image, this.location});
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          locale: const Locale('ar'),
          title: 'Flutter Demo',
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: lightColorScheme,
              fontFamily: 'Janna'),
          darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: darkColorScheme,
              fontFamily: 'Janna'),
          themeMode: value,
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: ShowCaseWidget(builder: Builder(
              builder: (BuildContext context) {
                return Home();
              },
            )),
          ),
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawDrawer(context),
      appBar: _drawAppBar(context),
      body: _drawHomePageContent(context),
      bottomNavigationBar: _drawBottomNavigationBar(context),
    );
  }

  AppBar _drawAppBar(context) {
    return AppBar(
      title: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            height: 40,
            width: 40,
            child: Image.network(
                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/theqa_app_bar.png',
            width: 120,
          ),
          const Spacer(),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/images/qr-code-svgrepo-com.svg',
            height: 20,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '12',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 8),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  // final GlobalKey _tow = GlobalKey();

  Widget _drawHomePageContent(context) {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        if (_tabController.index != index) {
          _tabController.animateTo(index);
        }
      },
      children: [
        const HomePage(),
        Container(
          child: Center(child: Text('ads page')),
        ),
        const StoresPage(),
        Container(
          child: Center(child: Text('settings page')),
        ),
      ],
    );
  }

  Widget _drawBottomNavigationBar(BuildContext context) {
    return ConvexAppBar(
      items: [
        TabItem(icon: Icons.home_outlined, title: 'رئيسية'),
        TabItem(icon: Icons.ads_click_outlined, title: 'إعلانات'),
        TabItem(icon: Icons.storefront, title: 'المتاجر'),
        // TabItem(
        //     icon: Showcase(
        //         textColor: Theme.of(context).colorScheme.onPrimary,
        //         tooltipBackgroundColor: Theme.of(context).colorScheme.primary,
        //         titleAlignment: TextAlign.center,
        //         descriptionAlignment: TextAlign.center,
        //         key: _tow,
        //         description: 'يمكنك إضافة حسابك الخاص من هنا',
        //         child: Icon(Icons.add)),
        //     title: 'إضافة حساب'),
        TabItem(icon: Icons.settings_outlined, title: 'إعدادات'),
      ],
      initialActiveIndex: 0,
      controller: _tabController,
      onTap: (int i) {
        _pageController.animateToPage(i,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic);
      },
      backgroundColor: Theme.of(context).colorScheme.background,
      activeColor: Theme.of(context).colorScheme.primary,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      elevation: 0,
      curveSize: 80,
      curve: Curves.easeInOutCubic,
    );
  }

  Widget _drawDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                  ),
                  title: Text(
                    'احمد',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('الباب - الشارع الرئيسي'),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.qr_code_outlined),
                  title: const Text('المحفظة'),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('الدعم الفني'),
                  leading: const Icon(Icons.support_agent_outlined),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('سياسة الخصوصية'),
                  leading: const Icon(Icons.privacy_tip_outlined),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('شروط الاستخدام'),
                  leading: const Icon(Icons.privacy_tip_outlined),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('من نحن'),
                  leading: const Icon(Icons.info_outline),
                ),
                ListTile(
                  onTap: () {
                    themeModeNotifier.value == ThemeMode.light
                        ? themeModeNotifier.value = ThemeMode.dark
                        : themeModeNotifier.value = ThemeMode.light;
                  },
                  leading: Icon(themeModeNotifier.value == ThemeMode.light
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  title: Text(themeModeNotifier.value == ThemeMode.light
                      ? 'الوضع الليلي'
                      : 'الوضع النهاري'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text('الإعدادات'),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Divider(),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.logout_outlined),
                title: const Text('تسجيل الخروج'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _one = GlobalKey();
  double fakeBalance = 190;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 10),
        (Timer t) => setState(() {
              var nextDouble = Random().nextInt(500);
              fakeBalance = nextDouble.toDouble();
            }));
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (isShowCase) return;
        {
          ShowCaseWidget.of(context).startShowCase([_one]);
          isShowCase = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            SleekCircularSlider(
              innerWidget: (double value) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('الرصيد الحالي',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${(value * 100).toInt() % 100}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '.',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${value.toInt()}',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Text(
                                '\$',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                              // SvgPicture.asset(
                              //   'assets/images/flag-um-svgrepo-com.svg',
                              //   width: 20,
                              // ),
                              ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text('يعادله',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                    Showcase(
                      key: _one,
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      tooltipBackgroundColor:
                          Theme.of(context).colorScheme.primary,
                      titleAlignment: TextAlign.center,
                      descriptionAlignment: TextAlign.center,
                      title: 'الرصيد التوضيحي',
                      description:
                          'هو المبلغ بالليرة التركية ويعادل رصيدك الحالي \$ ${fakeBalance.toInt()} ',
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${(value * 100).toInt() % 100}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              Text(
                                '.',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              Text(
                                '${(value * 23.5).toInt()}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600,
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: 8),
                                child:

                                    // SvgPicture.asset(
                                    //   'assets/images/flag-tn-svgrepo-com.svg',
                                    //   width: 20,
                                    // ),

                                    Text(
                                  'LT',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600,
                                  ),
                                )
                                // SvgPicture.asset(
                                //   'assets/images/flag-tn-svgrepo-com.svg',
                                //   width: 20,
                                // ),
                                ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
              appearance: CircularSliderAppearance(
                customColors: CustomSliderColors(
                  progressBarColor: Theme.of(context).colorScheme.onPrimary,
                  trackColor: Theme.of(context).colorScheme.primary,
                  dotColor: Theme.of(context).colorScheme.primary,
                ),
                size: 250,
                customWidths: CustomSliderWidths(
                    progressBarWidth: 7,
                    trackWidth: 15,
                    shadowWidth: 25,
                    handlerSize: 2.5),
              ),
              min: 0,
              max: 500,
              initialValue: fakeBalance,
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: SwipeButton(
                height: 50,
                width: 200,
                onSwipeEnd: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.9,
                    ),
                    builder: (context) => PaymentPage(),
                  );
                },
                thumb: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 20,
                  ),
                ),
                inactiveTrackColor: Theme.of(context).colorScheme.primary,
                activeTrackColor:
                    Theme.of(context).colorScheme.primaryContainer,
                child: const Text(
                  'مرر للدفع',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    'ادفع مباشرة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text('عرض الكل',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Column(
                  children: [
                    InkResponse(
                      radius: 25,
                      onTap: () {},
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 2, left: 6),
                        child: DottedBorder(
                            borderType: BorderType.Circle,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            dashPattern: const [4, 2],
                            padding: const EdgeInsets.all(14),
                            child: SvgPicture.asset(
                              'assets/images/users-svgrepo-com.svg',
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'أضف',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (Store item in imagesAddresses)
                        SizedBox(
                          width: 60,
                          child: Column(
                            children: [
                              item.image != null
                                  ? InkResponse(
                                      radius: 25,
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          constraints: BoxConstraints(
                                            maxHeight: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.9,
                                          ),
                                          builder: (context) => PaymentPage(
                                            store: item,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        height: 50,
                                        width: 50,
                                        child: Image.network(
                                            item.image.toString(),
                                            fit: BoxFit.cover),
                                      ),
                                    )
                                  : InkResponse(
                                      radius: 25,
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          constraints: BoxConstraints(
                                            maxHeight: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.9,
                                          ),
                                          builder: (context) => PaymentPage(
                                            store: item,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline
                                                .withOpacity(0.2)),
                                        clipBehavior: Clip.antiAlias,
                                        child: Icon(
                                            item.type == 0
                                                ? Icons.storefront
                                                : Icons.person_outline,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline,
                                            size: 28),
                                      ),
                                    ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                item.name,
                                textHeightBehavior: const TextHeightBehavior(
                                    applyHeightToFirstAscent: true),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                )),
                const SizedBox(
                width: 8,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    'العمليات الأخيرة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RecentOperationsPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text('عرض الكل',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < 3; i++)
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    elevation: 0,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          imagesAddresses.reversed.toList()[i].image != null
                              ? Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  height: 50,
                                  width: 50,
                                  child: Image.network(
                                      imagesAddresses.reversed
                                          .toList()[i]
                                          .image
                                          .toString(),
                                      fit: BoxFit.cover),
                                )
                              : Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.1)),
                                  clipBehavior: Clip.antiAlias,
                                  child: Icon(
                                      imagesAddresses.reversed
                                                  .toList()[i]
                                                  .type ==
                                              0
                                          ? Icons.storefront
                                          : Icons.person_outline,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.8),
                                      size: 28),
                                ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(imagesAddresses.reversed.toList()[i].name),
                              Text(
                                '10/6/2023 10:30',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            '23.24 \$',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          SvgPicture.asset(
                            i % 2 == 0
                                ? 'assets/images/down-svgrepo-com.svg'
                                : 'assets/images/up-svgrepo-com.svg',
                            color: i % 2 == 0 ? Colors.green : Colors.red,
                            height: 35,
                          ),
                          const SizedBox(
                            width: 4,
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentPage extends StatefulWidget {
  Store? store;

  PaymentPage({Key? key, this.store}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  num fakeBalance = 450;
  num paymentAmount = 0;

  bool _isDollar = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            const Text('تحويل جديد',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: widget.store != null
                      ? widget.store!.image == null
                          ? widget.store!.type == 0
                              ? Icon(
                                  Icons.storefront,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.8),
                                  size: 40,
                                )
                              : Icon(
                                  Icons.person_outline,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.8),
                                  size: 40,
                                )
                          : null
                      : Icon(
                          Icons.storefront,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.8),
                          size: 40,
                        ),
                  backgroundImage: widget.store?.image != null
                      ? NetworkImage(widget.store!.image!)
                      : null,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        widget.store == null
                            ? Icon(
                                Icons.storefront,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            : Icon(
                                widget.store!.type == 0
                                    ? Icons.storefront
                                    : Icons.person_outline,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.store?.name != null
                              ? widget.store!.name
                              : 'الحساب الوجهة',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.store?.type == 1
                            ? Text('الفرع - أعزاز')
                            : Icon(
                                Icons.fmd_good_outlined,
                                size: 20,
                              ),
                        SizedBox(
                          width: 4,
                        ),
                        if (widget.store?.type != 1)
                          Text(widget.store?.address != null
                              ? widget.store!.address
                              : 'العنوان')
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  isDense: true,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.qr_code_outlined,
                        size: 25, color: Theme.of(context).colorScheme.primary),
                  ),
                  label: const Text('الحساب الوجهة'),
                ),
              ),
            ),
            Row(children: [
              SizedBox(
                width: 16,
              ),
              Text('الرصيد الحالي',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                width: 8,
              ),
              Text(fakeBalance.toString(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  )),
              Text(' \$',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ))
            ]),

            Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //tow animation controller swich between dollar and lira
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _isDollar
                                  ? Theme.of(context)
                                      .colorScheme
                                      .secondary
                                  : Theme.of(context)
                                  .colorScheme
                                  .outline.withOpacity(0.5) ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isDollar = true;
                              });
                            },
                            child: Center(
                              child: Text(
                                'دولار \$',
                                style: TextStyle(
                                    color: _isDollar
                                        ? Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        : Theme.of(context)
                                        .colorScheme
                                        .surface),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _isDollar
                                  ? Theme.of(context)
                                  .colorScheme
                                  .outline.withOpacity(0.5)
                                  : Theme.of(context)
                                      .colorScheme
                                      .secondary),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isDollar = false;
                              });
                            },
                            child: Center(
                              child: Text(
                                'تركي TL',
                                style: TextStyle(
                                    color: _isDollar
                                        ? Theme.of(context)
                                        .colorScheme
                                        .surface
                                        : Theme.of(context)
                                        .colorScheme
                                        .onSecondary),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              paymentAmount = 0;
                              return;
                            }
                            paymentAmount = num.parse(value);
                          });
                        },
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 11),
                            child: Text(_isDollar ? '\$' : 'LT',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          isDense: true,
                          label: Builder(
                            builder: (BuildContext context) {
                              String? text;
                              if (!_isDollar && paymentAmount > 0) {
                                text =
                                    'المبلغ / يعادله بالدولار ${(paymentAmount / 23.5).toStringAsFixed(2)}';
                              }
                              return Text(text ?? 'المبلغ');
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          isDense: true,
                          label: Text('البيان'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    FilledButton(
                      onPressed: () async {
                        // confirm payment dialog
                        var isCorrect = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('تأكيد الدفع',
                                    textAlign: TextAlign.center),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('المبلغ'),
                                    Text(
                                      '${paymentAmount.toStringAsFixed(2)} ${_isDollar ? '\$' : 'LT'}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text('الحساب الوجهة'),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'ميني ماركت سعيد',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Icon(Icons.storefront,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline),
                                      ],
                                    )
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: const Text('إلغاء')),
                                  FilledButton(
                                      onPressed: () {
                                        Navigator.pop(context, true);
                                        setState(() {
                                          fakeBalance -= paymentAmount;
                                        });
                                      },
                                      child: const Text('تأكيد'))
                                ],
                              );
                            });
                        if (isCorrect == true) {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('تمت العملية بنجاح',
                                      textAlign: TextAlign.center),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 50,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Text('تمت عملية الدفع بنجاح'),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'الرصيد الحالي ${fakeBalance.toStringAsFixed(2)} \$',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  actions: [
                                    FilledButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('إغلاق'))
                                  ],
                                );
                              });
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.primary),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      child: const Text('تأكيد الدفع'),
                    )
                  ],
                )),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text('الرصيد الحالي',
            //         textAlign: TextAlign.end,
            //         style: TextStyle(
            //           fontSize: 12,
            //           fontWeight: FontWeight.bold,
            //         )),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Text(fakeBalance.toString(),
            //         textAlign: TextAlign.end,
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         )),
            //     Text(' \$',
            //         textAlign: TextAlign.end,
            //         style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //         )),
            //     Text(' / ',
            //         textAlign: TextAlign.end,
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         )),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Text('سيتبقى',
            //         textAlign: TextAlign.end,
            //         style: TextStyle(
            //           fontSize: 12,
            //           fontWeight: FontWeight.bold,
            //         )),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Text(
            //         (fakeBalance -
            //                 (_isDollar
            //                     ? paymentAmount
            //                     : (num.parse((paymentAmount / 23.5)
            //                         .toStringAsFixed(2)))))
            //             .toString(),
            //         textAlign: TextAlign.end,
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         )),
            //     Text(' \$',
            //         textAlign: TextAlign.end,
            //         style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //         )),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class StoresPage extends StatefulWidget {
  const StoresPage({Key? key}) : super(key: key);

  @override
  State<StoresPage> createState() => _StoresPageState();
}

class _StoresPageState extends State<StoresPage> {
  void openGoogleMaps(String location) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$location';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.outline.withOpacity(0.2),
                    shape: BoxShape.circle),
                child: const Text(
                  'الكل',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          ' ماركت 🛒',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'مطاعم 🍔',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'عيادات سنية 🦷',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          ' ألبسة 👖',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'عطورات 🌺',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'أحذية 👠',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          ' صيدليات 💊',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          '  محلات ذهب 💰',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'معارض سيارات 🚗',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'بحث',
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: imagesAddressesStores.length,
        itemBuilder: (context, int index) {
          return ListTile(
            onTap: () {
              if (imagesAddressesStores[index].location != null) {
                openGoogleMaps(imagesAddressesStores[index].location!);
              }
            },
            leading: imagesAddressesStores[index].image != null
                ? CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(imagesAddressesStores[index].image!))
                : Container(
                    width: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.2),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Icon(Icons.storefront,
                          color: Theme.of(context).colorScheme.outline,
                          size: 30),
                    ),
                  ),
            title: Text(imagesAddressesStores[index].name),
            subtitle: Row(
              children: [
                Icon(
                  Icons.directions,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  imagesAddressesStores[index].address,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
            trailing: FilledButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.9,
                  ),
                  builder: (context) => PaymentPage(
                    store: imagesAddressesStores[index],
                  ),
                );
              },
              child: const Text('ادفع'),
            ),
          );
        },
      ),
    );
  }
}

class RecentOperationsPage extends StatefulWidget {
  const RecentOperationsPage({Key? key}) : super(key: key);

  @override
  State<RecentOperationsPage> createState() => _RecentOperationsPageState();
}

class _RecentOperationsPageState extends State<RecentOperationsPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const Text('كشف حساب'),
                Spacer(),
                Image.asset('assets/images/xls.png',
                    width: 30, height: 30 ),
                SizedBox(width: 16,),
                Image.asset('assets/images/pdf.png',
                    width: 30, height: 30 ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Column(
                children: [
                  SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                                right: 16, bottom: 8, left: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  child: Text('2023'),
                                  value: '2023',
                                ),
                                DropdownMenuItem(
                                  child: Text('2022'),
                                  value: '2022',
                                ),
                                DropdownMenuItem(
                                  child: Text('2021'),
                                  value: '2021',
                                ),
                              ],
                              onChanged: (value) {},
                              hint: const Text('السنة'),
                              underline: const SizedBox(),
                              isExpanded: true,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 16, bottom: 8, right: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  child: Text('يناير'),
                                  value: '1',
                                ),
                                DropdownMenuItem(
                                  child: Text('فبراير'),
                                  value: '2',
                                ),
                                DropdownMenuItem(
                                  child: Text('مارس'),
                                  value: '3',
                                ),
                                DropdownMenuItem(
                                  child: Text('ابريل'),
                                  value: '4',
                                ),
                                DropdownMenuItem(
                                  child: Text('مايو'),
                                  value: '5',
                                ),
                                DropdownMenuItem(
                                  child: Text('يونيو'),
                                  value: '6',
                                ),
                                DropdownMenuItem(
                                  child: Text('يوليو'),
                                  value: '7',
                                ),
                                DropdownMenuItem(
                                  child: Text('اغسطس'),
                                  value: '8',
                                ),
                                DropdownMenuItem(
                                  child: Text('سبتمبر'),
                                  value: '9',
                                ),
                                DropdownMenuItem(
                                  child: Text('اكتوبر'),
                                  value: '10',
                                ),
                                DropdownMenuItem(
                                  child: Text('نوفمبر'),
                                  value: '11',
                                ),
                                DropdownMenuItem(
                                  child: Text('ديسمبر'),
                                  value: '12',
                                ),
                              ],
                              onChanged: (value) {},
                              hint: const Text('الشهر'),
                              underline: const SizedBox(),
                              isExpanded: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'بحث',
                          border: InputBorder.none,
                          prefixIcon: const Icon(Icons.search)),
                    ),
                  )
                ],
              ),
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0,
                isFirst: true,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.all(6),
                  indicatorXY: 0,
                ),
                endChild: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4, right: 16),
                      child: const Text('اليوم',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var item in imagesAddresses)
                          Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Row(
                                children: [
                                  item.image != null
                                      ? Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          height: 50,
                                          width: 50,
                                          child: Image.network(
                                              item.image.toString(),
                                              fit: BoxFit.cover),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.1)),
                                          clipBehavior: Clip.antiAlias,
                                          child: Icon(
                                              item.type == 0
                                                  ? Icons.storefront
                                                  : Icons.person_outline,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.8),
                                              size: 28),
                                        ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.name),
                                      Text(
                                        '12:36 PM',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Text(
                                    '23.24 \$',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Builder(
                                    builder: (BuildContext context) {
                                      var nextInt = Random().nextInt(2);
                                      return SvgPicture.asset(
                                        nextInt % 2 == 0
                                            ? 'assets/images/down-svgrepo-com.svg'
                                            : 'assets/images/up-svgrepo-com.svg',
                                        color: nextInt % 2 == 0
                                            ? Colors.green
                                            : Colors.red,
                                        height: 35,
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  )
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                beforeLineStyle: LineStyle(
                  color: Theme.of(context).colorScheme.outline,
                  thickness: 2,
                ),
                afterLineStyle: LineStyle(
                  color: Theme.of(context).colorScheme.outline,
                  thickness: 2,
                ),
              ),
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.all(6),
                  indicatorXY: 0,
                ),
                endChild: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4, right: 16),
                      child: const Text('13/6/2023',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var item in imagesAddresses.take(2))
                          Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Row(
                                children: [
                                  item.image != null
                                      ? Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          height: 50,
                                          width: 50,
                                          child: Image.network(
                                              item.image.toString(),
                                              fit: BoxFit.cover),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.1)),
                                          clipBehavior: Clip.antiAlias,
                                          child: Icon(
                                              item.type == 0
                                                  ? Icons.storefront
                                                  : Icons.person_outline,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.8),
                                              size: 28),
                                        ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.name),
                                      Text(
                                        '12:36 PM',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Text(
                                    '23.24 \$',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Builder(
                                    builder: (BuildContext context) {
                                      var nextInt = Random().nextInt(2);
                                      return SvgPicture.asset(
                                        nextInt % 2 == 0
                                            ? 'assets/images/down-svgrepo-com.svg'
                                            : 'assets/images/up-svgrepo-com.svg',
                                        color: nextInt % 2 == 0
                                            ? Colors.green
                                            : Colors.red,
                                        height: 35,
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  )
                                ],
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                ),
                beforeLineStyle: LineStyle(
                  color: Theme.of(context).colorScheme.outline,
                  thickness: 2,
                ),
                afterLineStyle: LineStyle(
                  color: Theme.of(context).colorScheme.outline,
                  thickness: 2,
                ),
              ),
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.all(6),
                  indicatorXY: 0,
                ),
                endChild: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4, right: 16),
                      child: Text('12/6/2023',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var item in imagesAddresses.take(2))
                          Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Row(
                                children: [
                                  item.image != null
                                      ? Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          height: 50,
                                          width: 50,
                                          child: Image.network(
                                              item.image.toString(),
                                              fit: BoxFit.cover),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.1)),
                                          clipBehavior: Clip.antiAlias,
                                          child: Icon(
                                              item.type == 0
                                                  ? Icons.storefront
                                                  : Icons.person_outline,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.8),
                                              size: 28),
                                        ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.name),
                                      Text(
                                        '12:36 PM',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Text(
                                    '23.24 \$',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Builder(
                                    builder: (BuildContext context) {
                                      var nextInt = Random().nextInt(2);
                                      return SvgPicture.asset(
                                        nextInt % 2 == 0
                                            ? 'assets/images/down-svgrepo-com.svg'
                                            : 'assets/images/up-svgrepo-com.svg',
                                        color: nextInt % 2 == 0
                                            ? Colors.green
                                            : Colors.red,
                                        height: 35,
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  )
                                ],
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                ),
                beforeLineStyle: LineStyle(
                  color: Theme.of(context).colorScheme.outline,
                  thickness: 2,
                ),
                afterLineStyle: LineStyle(
                  color: Theme.of(context).colorScheme.outline,
                  thickness: 2,
                ),
              ),
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0,
                isLast: true,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  color: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.all(6),
                  indicatorXY: 0,
                ),
                endChild: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4, right: 16),
                      child: const Text('11/6/2023',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var item in imagesAddresses.reversed.take(4))
                          Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Row(
                                children: [
                                  item.image != null
                                      ? Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          height: 50,
                                          width: 50,
                                          child: Image.network(
                                              item.image.toString(),
                                              fit: BoxFit.cover),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.1)),
                                          clipBehavior: Clip.antiAlias,
                                          child: Icon(
                                              item.type == 0
                                                  ? Icons.storefront
                                                  : Icons.person_outline,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.8),
                                              size: 28),
                                        ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item.name),
                                      Text(
                                        '12:36 PM',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Text(
                                    '23.24 \$',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Builder(
                                    builder: (BuildContext context) {
                                      var nextInt = Random().nextInt(2);
                                      return SvgPicture.asset(
                                        nextInt % 2 == 0
                                            ? 'assets/images/down-svgrepo-com.svg'
                                            : 'assets/images/up-svgrepo-com.svg',
                                        color: nextInt % 2 == 0
                                            ? Colors.green
                                            : Colors.red,
                                        height: 35,
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  )
                                ],
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
