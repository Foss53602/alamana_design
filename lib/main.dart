import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:alamana_design/color_schemes.g.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';

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
    _tabController = TabController(length: 5, vsync: this);
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
          InkResponse(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              height: 40,
              width: 40,
              child: Image.network(
                  'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/images/logo_appBar.png',
            color: Theme.of(context).colorScheme.primary,
            width: 110,
          ),
          const Spacer(),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return _qrCodeWidget();
                });
          },
          icon: SvgPicture.asset(
            'assets/images/qr-code-svgrepo-com.svg',
            height: 20,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsPage(),
                  ),
                );
              },
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
      children: const [
        HomePage(),
        AdsPage(),
        StoresPage(),
        ServicesPage(),
        // WelcomePage(),
        SettingsPage(),
      ],
    );
  }

  Widget _drawBottomNavigationBar(BuildContext context) {
    return ConvexAppBar(
      items: const [
        TabItem(icon: Icons.home_outlined, title: 'رئيسية'),
        TabItem(icon: Icons.ads_click_outlined, title: 'إعلانات'),
        TabItem(icon: Icons.storefront, title: 'المتاجر'),
        // TabItem(icon: Icons.person_outline, title: 'مرحباً'),
        TabItem(icon: Icons.local_offer_outlined, title: 'الخدمات'),
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
                ListTile(
                  leading: InkResponse(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                              radius: 35,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                          ),
                        ],
                      )),
                  title: Text(
                    'أحمد الأسمر',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('حساب شخصي'),
                ),
                Divider(
                  thickness: 0.2,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return _qrCodeWidget();
                        });
                  },
                  leading: Icon(Icons.qr_code_outlined,
                      color: Theme.of(context).colorScheme.secondary),
                  title: const Text('رمز حسابك'),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('الدعم الفني'),
                  leading: Icon(Icons.support_agent_outlined,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('الحوالات الخارجية'),
                  leading: Icon(Icons.import_export_outlined,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('سياسة الخصوصية'),
                  leading: Icon(Icons.privacy_tip_outlined,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('شروط الاستخدام'),
                  leading: Icon(Icons.privacy_tip_outlined,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('من نحن'),
                  leading: Icon(Icons.info_outline,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                ListTile(
                  onTap: () {
                    themeModeNotifier.value == ThemeMode.light
                        ? themeModeNotifier.value = ThemeMode.dark
                        : themeModeNotifier.value = ThemeMode.light;
                  },
                  leading: Icon(
                      themeModeNotifier.value == ThemeMode.light
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      color: Theme.of(context).colorScheme.secondary),
                  title: Text(themeModeNotifier.value == ThemeMode.light
                      ? 'الوضع الليلي'
                      : 'الوضع النهاري'),
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          var url =
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROypRzj56DF7XESq_LjGRn3cQsDWpRFMVoWA&usqp=CAU';
                          return Dialog(
                            insetPadding: EdgeInsets.all(16),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              height: 650,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          height: 200,
                                          width: double.infinity,
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16),
                                                  topRight:
                                                      Radius.circular(16))),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                  'assets/images/main_logo.png',
                                                  color: Colors.white,
                                                  height: 80),
                                              Text(
                                                'متاح للدفع عن طريق التطبيق',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -75,
                                          child: CircleAvatar(
                                            radius: 72,
                                            backgroundColor:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.white
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .surfaceVariant,
                                            child: CircleAvatar(
                                              radius: 70,
                                              backgroundImage:
                                                  NetworkImage(url),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 80,
                                  ),
                                  Text(
                                    'حازم لتجارة السيارات',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2,
                                        fontSize: 28),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'الباب - دوار الكف',
                                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.location_on_outlined,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          QrImage(
                                            data: '003348437001',
                                            version: QrVersions.auto,
                                            size: 180.0,
                                            padding: EdgeInsets.zero,
                                            eyeStyle: QrEyeStyle(
                                              eyeShape: QrEyeShape.circle,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                            dataModuleStyle: QrDataModuleStyle(
                                              dataModuleShape: QrDataModuleShape.circle,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            '003348437001',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Transform.scale(
                                        scale: 1.1,
                                        child: Image.asset('assets/images/virtical_logos.png',
                                          height: 220,),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  leading: Icon(Icons.qr_code_2,
                      color: Theme.of(context).colorScheme.secondary),
                  title: const Text('باركود متجر'),
                )
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                onTap: () {},
                leading: Icon(Icons.logout_outlined,
                    color: Theme.of(context).colorScheme.secondary),
                title: const Text('تسجيل الخروج'),
              ),
              Divider(
                thickness: 0.2,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Text('رقم النسخة 124'),
              SizedBox(
                height: 8,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _qrCodeWidget() {
    return Dialog(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Theme.of(context).colorScheme.surfaceVariant,
      elevation: 0,
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'الرمز الخاص بحسابك',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 36,
            ),
            SizedBox(
              width: 270,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 270,
                  height: 270,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 8)),
                ),
                Container(
                  width: 150,
                  height: 272,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).brightness ==
                                  Brightness.light
                              ? Colors.white
                              : Theme.of(context).colorScheme.surfaceVariant,
                          width: 10)),
                ),
                Container(
                  width: 272,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).brightness ==
                                  Brightness.light
                              ? Colors.white
                              : Theme.of(context).colorScheme.surfaceVariant,
                          width: 10)),
                ),
                QrImage(
                  data: '003348437001',
                  version: QrVersions.auto,
                  size: 220.0,
                  eyeStyle: QrEyeStyle(
                    eyeShape: QrEyeShape.circle,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  dataModuleStyle: QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.circle,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '003348437001',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'مشاركة',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.share_outlined,
                    size: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
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
            // هذا الزر يظهر فقط لحسابات الشركات
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: SwipeButton(
                    height: 50,
                    width: 170,
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
                      '      مرر للدفع',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: SwipeButton(
                    height: 50,
                    width: 170,
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
                        color: Theme.of(context).colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Theme.of(context).colorScheme.onSecondary,
                        size: 20,
                      ),
                    ),
                    inactiveTrackColor: Theme.of(context).colorScheme.secondary,
                    activeTrackColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    child: const Text(
                      '     مرر للسحب',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
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
                            fontSize: 11,
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('عرض السجل',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                              )),
                          const SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.history,
                            size: 16,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < 3; i++)
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return DisplayTransferMoneyDialog(
                              transferMoney:
                                  imagesAddresses.reversed.toList()[i],
                            );
                          });
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      elevation: 0,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: [
                            imagesAddresses.reversed.toList()[i].image != null
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
                                        imagesAddresses.reversed
                                            .toList()[i]
                                            .image
                                            .toString(),
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

  bool _isAddedToFavorite = false;

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
                Stack(
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
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkResponse(
                        onTap: () {
                          setState(() {
                            _isAddedToFavorite = !_isAddedToFavorite;
                          });
                        },
                        child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.7),
                                shape: BoxShape.circle),
                            child: _isAddedToFavorite
                                ? Icon(Icons.favorite,
                                    size: 25, color: Colors.red)
                                : Image.asset(
                                    'assets/images/add_to_favorite.png',
                                    width: 25,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  )),
                      ),
                    )
                  ],
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
                    ToggleSwitch(
                      minWidth: 100.0,
                      cornerRadius: 20.0,
                      activeBgColors: [
                        [Theme.of(context).colorScheme.primary],
                        [Theme.of(context).colorScheme.primary]
                      ],
                      activeFgColor: Theme.of(context).colorScheme.onSecondary,
                      inactiveBgColor: Theme.of(context)
                          .colorScheme
                          .outlineVariant
                          .withOpacity(0.3),
                      inactiveFgColor:
                          Theme.of(context).colorScheme.onSurfaceVariant,
                      initialLabelIndex: _isDollar ? 0 : 1,
                      totalSwitches: 2,
                      labels: const ['دولار  \$', 'تركي  TL'],
                      radiusStyle: true,
                      onToggle: (index) {
                        setState(() {
                          _isDollar = !_isDollar;
                        });
                      },
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
                            child: Text(_isDollar ? '\$' : 'TL',
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
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('المبلغ / يعادله بالدولار '),
                                    Text(
                                        '${(paymentAmount / 23.5).toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(' بسعر صرف '),
                                    Text('23.5',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                );
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
                Image.asset('assets/images/xls.png', width: 30, height: 30),
                SizedBox(
                  width: 16,
                ),
                Image.asset('assets/images/pdf.png', width: 30, height: 30),
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
                              items: const [
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
                              items: const [
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

class AdsPage extends StatefulWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  List<String> adsImages = [
    'assets/images/ad1.jpg',
    'assets/images/ad2.jpg',
    'assets/images/ad3.jpg',
    'assets/images/ad4.jpg',
    'assets/images/ad5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: adsImages.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        adsImages[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/share-forward-svgrepo-com.svg',
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            height: 20,
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'قراءة المزيد...',
                              ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              )),
                          Spacer(),
                          Text(
                            '24',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Icon(
                              index % 2 == 0
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: index % 2 == 0
                                  ? Colors.red
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                              size: 20),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            '12',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(
                            'assets/images/eye-svgrepo-com.svg',
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

//
// return AspectRatio(
// aspectRatio: 16 / 9,
// child: Card(
// clipBehavior: Clip.antiAlias,
// elevation: 0,
// color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
// margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20),
// ),
// child: Stack(
// children: [
// Image.asset(
// adsImages[index],
// fit: BoxFit.cover,
// width: double.infinity,
// height: double.infinity,
// ),
// //favorite, share,show count,read more in bottom
// Positioned(
// bottom: 0,
// left: 0,
// right: 0,
// child: Container(
// padding: const EdgeInsets.symmetric(
// horizontal: 4, vertical: 4),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// gradient: LinearGradient(
// colors: [
// Colors.black.withOpacity(0.1),
// Colors.black.withOpacity(0.8),
// ],
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// ),
// ),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 16, vertical: 8),
// child: Row(
// children: [
// SvgPicture.asset(
// 'assets/images/share-forward-svgrepo-com.svg',
// color:
// Theme.of(context).colorScheme.onPrimary,
// height: 20,
// ),
// Spacer(),
// //read more
// Text(
// 'قراءة المزيد',
// style: TextStyle(
// color: Theme.of(context)
//     .colorScheme
//     .onPrimary,
// fontSize: 12,
// fontWeight: FontWeight.bold),
// ),
// Spacer(),
// Text(
// '24',
// style: TextStyle(
// color: Theme.of(context)
//     .colorScheme
//     .onPrimary,
// fontSize: 12,
// fontWeight: FontWeight.bold),
// ),
// const SizedBox(
// width: 8,
// ),
// Icon(
// index % 2 == 0
// ? Icons.favorite
//     : Icons.favorite_border,
// color:
// Theme.of(context).colorScheme.onPrimary,
// size: 20),
// const SizedBox(
// width: 16,
// ),
// Text(
// '12',
// style: TextStyle(
// color: Theme.of(context)
//     .colorScheme
//     .onPrimary,
// fontSize: 12,
// fontWeight: FontWeight.bold),
// ),
// const SizedBox(
// width: 8,
// ),
// SvgPicture.asset(
// 'assets/images/eye-svgrepo-com.svg',
// color:
// Theme.of(context).colorScheme.onPrimary,
// height: 20,
// ),
// ],
// ),
// )),
// )
// ],
// ),
// ),
// );

class DisplayTransferMoneyDialog extends StatefulWidget {
  final Store transferMoney;

  const DisplayTransferMoneyDialog({Key? key, required this.transferMoney})
      : super(key: key);

  @override
  State<DisplayTransferMoneyDialog> createState() =>
      _DisplayTransferMoneyDialogState();
}

class _DisplayTransferMoneyDialogState
    extends State<DisplayTransferMoneyDialog> {
  bool _isAddedToFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Theme.of(context).colorScheme.surfaceVariant,
        elevation: 0,
        insetPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'إشعار تحويل',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'رقم: 156789',
                        style: TextStyle(
                            fontSize: 12,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text('15/6/2023 12:36 PM',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Image.asset(
                      'assets/images/logo_appBar.png',
                      color: Theme.of(context).brightness == Brightness.light
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onBackground,
                      height: 45,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 8,
                thickness: 0.2,
                color: Theme.of(context).colorScheme.secondary,
              ),
              // المبلغ المحول, تفقيط
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'المبلغ',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '273 \$',
                            style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'مئتان وثلاثة وسبعون دولاراً أمريكياً فقط',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Text(
                            'المرسل',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(imagesAddresses.first.image!)),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'محمد عبد الله',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  'بن سعيد',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'الباب',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: Text(
                            'المستقبل',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: widget.transferMoney != null
                                  ? widget.transferMoney.image == null
                                      ? widget.transferMoney.type == 0
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
                              backgroundImage: widget.transferMoney.image !=
                                      null
                                  ? NetworkImage(widget.transferMoney.image!)
                                  : null,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.transferMoney.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  widget.transferMoney.type == 1
                                      ? 'حساب شخصي'
                                      : 'اعزاز',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'البيان',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'تحويل مبلغ 273\$ لمحمد عبدالله من حسابي الشخصي',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/share_transfer.png',
                          width: 30,
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/pdf-file-svgrepo-com.svg',
                          width: 25,
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _isAddedToFavorite = !_isAddedToFavorite;
                          });
                        },
                        icon: _isAddedToFavorite
                            ? Icon(Icons.favorite, size: 30, color: Colors.red)
                            : Image.asset(
                                'assets/images/add_to_favorite.png',
                                width: 33,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          //sessions list (user info, language, notifications, dark mode, logout)
          children: [
            Text('الإشتراكات',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            Text(
                'نص يناسب قسم الإشتراكات بحيث يكون وجيز ولا يتجاوز سطرين ولا يتجاوز سطرين',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.outline,
                )),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                        initiallyExpanded: true,
                        childrenPadding: EdgeInsets.all(8),
                        title: Text('الإشتراك الحالي',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text('الأساسية',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ],
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text('تاريخ البداية',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      )),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text('16/12/2022',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('تاريخ النهاية',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      )),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text('30/6/2023',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('المدة المتبقية',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      )),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text('13 يوم',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.2),
                            height: 24,
                            thickness: 0.2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8, right: 8, left: 8),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(children: [
                                    Text('الحد الأعلى للرصيد',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        )),
                                    Spacer(),
                                    Text('150 \$',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                                  Row(children: [
                                    Text('الحد الأعلى للحوالات الخارجية',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        )),
                                    Spacer(),
                                    Text('50 \$',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                                  Row(children: [
                                    Text('عدد الإعلانات المسموح بها',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        )),
                                    Spacer(),
                                    Text('0 إعلان',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                                ],
                              ),
                            ),
                          )
                        ]),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                        childrenPadding: EdgeInsets.all(8),
                        title: const Text('الإشتراك المستقبلي',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text('VIP',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ],
                        ),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text('تاريخ البداية',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      )),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text('16/11/2022',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('تاريخ النهاية',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      )),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text('30/12/2023',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('المدة المتبقية',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      )),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text('6 أشهر و 5 يوم',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.2),
                            height: 24,
                            thickness: 0.2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8, right: 8, left: 8),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(children: [
                                    Text('الحد الأعلى للرصيد',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        )),
                                    Spacer(),
                                    Text('820 \$',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                                  Row(children: [
                                    Text('الحد الأعلى للحوالات الخارجية',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        )),
                                    Spacer(),
                                    Text('200 \$',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                                  Row(children: [
                                    Text('عدد الإعلانات المسموح بها',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        )),
                                    Spacer(),
                                    Text('1 إعلان',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                                ],
                              ),
                            ),
                          )
                        ]),
                  ),
                  ListTile(
                    title: Text('تمديد اشتراك باقة'),
                    leading: Icon(
                      Icons.replay_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ),
                  ListTile(
                    title: Text('تعديل شريحة الإشتراك'),
                    leading: Icon(
                      Icons.credit_card_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text('الحساب',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            Text('نص يناسب قسم الحساب بحيث يكون وجيز ولا يتجاوز سطرين',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.outline,
                )),
            const SizedBox(
              height: 8,
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('تغيير كلمة المرور'),
                      leading: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                    ListTile(
                      title: Text('تأكيد التحويل بواسطة'),
                      leading: Icon(
                        Icons.verified_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.fingerprint_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text('مدة الجلسة'),
                      leading: Icon(
                        Icons.timer_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                    ListTile(
                      title: Text('قنوات الإشعارات'),
                      leading: Icon(
                        Icons.notifications_none_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                    ListTile(
                      title: Text('الأجهزة المرتبطة'),
                      leading: Icon(
                        Icons.phone_android_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 16,
            ),
            Text('الدفع بدون انترنت',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            Text(
                'نص يناسب قسم الدفع بدون انترنت بحيث يكون وجيز ولا يتجاوز سطرين سطرين',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.outline,
                )),
            const SizedBox(
              height: 8,
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('توليد باركود جديد'),
                      leading: Icon(
                        Icons.qr_code_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                    ListTile(
                      title: Text('استعراض الباركود'),
                      leading: Icon(
                        Icons.qr_code_scanner_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      )),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('الإشعارات'),
          actions: [
            Row(
              children: [
                Text('قراءة الكل'),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.07),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Wrap(
                    runAlignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        'تم استلام حوالة من حساب محمد الأسمر',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('بقيمة ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.outline,
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              Random().nextInt(100).toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text('دولار أميركي',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.outline,
                              )),
                        ],
                      )
                    ],
                  ),
                  leading: Icon(
                    index % 2 == 0
                        ? Icons.notifications_none_outlined
                        : Icons.notifications_active_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  trailing: Text('منذ 5 دقائق',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.outline,
                      )),
                ));
          },
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isEmail = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('تسجيل الدخول'),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 64,
                ),
                Image.asset(
                  'assets/images/single_logo.png',
                  height: 110,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text('سجل دخول عن طريق',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.outline,
                    )),
                const SizedBox(
                  height: 32,
                ),
                ToggleSwitch(
                  minWidth: 120.0,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [Theme.of(context).colorScheme.primary],
                    [Theme.of(context).colorScheme.primary]
                  ],
                  activeFgColor: Theme.of(context).colorScheme.onSecondary,
                  inactiveBgColor: Theme.of(context)
                      .colorScheme
                      .outlineVariant
                      .withOpacity(0.3),
                  inactiveFgColor:
                      Theme.of(context).colorScheme.onSurfaceVariant,
                  initialLabelIndex: _isEmail ? 0 : 1,
                  totalSwitches: 2,
                  labels: const ['البريد الإلكتروني', 'رقم الهاتف'],
                  radiusStyle: true,
                  onToggle: (index) {
                    setState(() {
                      _isEmail = !_isEmail;
                    });
                  },
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: _isEmail ? 'البريد الإلكتروني' : 'رقم الهاتف',
                        isDense: true,
                        prefixIcon: Icon(
                          _isEmail
                              ? Icons.email_outlined
                              : Icons.phone_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'كلمة المرور',
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CheckboxListTile(
                      value: true,
                      onChanged: (c) {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      title: Text(
                        'تذكرني',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: FilledButton(
                        onPressed: () {}, child: Text('تسجيل الدخول'))),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text('الملف الشخصي'),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 72,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80')),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.edit_outlined,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'أحمد الأسمر',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'حساب شخصي',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      indent: 32,
                      endIndent: 32,
                      height: 32,
                      thickness: 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                              title: Text(
                                'الجنس',
                              ),
                              leading: Icon(
                                Icons.person_outline,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              trailing: Text('ذكر',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))),
                          ListTile(
                            title: Text('العمر'),
                            leading: Icon(
                              Icons.cake_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            trailing: Text('28',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          ListTile(
                            title: Text('تاريخ الولادة'),
                            leading: Icon(
                              Icons.calendar_today_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            trailing: Text('2/7/1993',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          ListTile(
                            title: Text('مكان الولادة'),
                            leading: Icon(
                              Icons.location_on_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            trailing: Text('دمشق',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          ListTile(
                            title: Text('المهنة'),
                            leading: Icon(
                              Icons.work_outline_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            trailing: Text('محاسب مالي',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Stack(children: [
        Lottie.asset(
          'assets/images/37799-starry-background.json',
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحباً بك في',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Image.asset(
                'assets/images/logo_with_color.png',
                height: 150,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                height: 128,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CreateAccountPage(),
                    ),
                  );
                },
                child: Text(
                  'إنشــــاء حســاب',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        )
      ])),
    );
  }
}

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text('إنشاء حساب'),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/images/single_logo.png',
                    height: 110,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('قم بإنشاء حسابك الخاص بمفردك',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.outline,
                      )),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('معلومات الحساب',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.secondary,
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  title: Text('شخصي'),
                                  value: 0,
                                  groupValue: 0,
                                  onChanged: (value) {},
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  title: Text('شركة'),
                                  value: 1,
                                  groupValue: 0,
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'البريد الإلكتروني',
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'رقم الهاتف',
                              isDense: true,
                              suffixIcon: Container(
                                width: 45,
                                margin: const EdgeInsets.only(
                                    top: 8, bottom: 8, left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                child: Center(
                                  child: Text(
                                    '90+',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                                  ),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.phone_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'كلمة المرور',
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'تأكيد كلمة المرور',
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          // protected by
                          const SizedBox(
                            height: 8,
                          ),
                          ListTile(
                            title: Text('الحماية بواسطة'),
                            leading: Icon(
                              Icons.security_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.password_outlined,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('معلومات المستخدم',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  title: Text('ذكر'),
                                  value: 0,
                                  groupValue: 0,
                                  onChanged: (value) {},
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  title: Text('أنثى'),
                                  value: 1,
                                  groupValue: 0,
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'الأسم الأول',
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'الأسم الأخير',
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'مكان وسنة الولادة',
                              isDense: true,
                              suffixIcon: Container(
                                width: 65,
                                margin: const EdgeInsets.only(
                                    top: 8, bottom: 8, left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '1990',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.cake_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'العنوان',
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.location_on_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          // protected by
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'رقم الهوية',
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.credit_card_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ListTile(
                            onTap: () {},
                            title: const Text('المهنة'),
                            leading: Icon(Icons.work_outline_outlined,
                                color: Theme.of(context).colorScheme.secondary),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'محاسب',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Center(
                            child: Text('هوية الشخصية / شهادة سواقة',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(20),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.camera_alt_outlined,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                          Text(
                                            'الوجه الأمامي',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(20),
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.camera_alt_outlined,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                            Text(
                                              'الوجه الخلفي',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: FilledButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('تسجيل'),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )));
  }
}

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 0,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 16,
                                  left: 16,
                                  right: 16,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone_android_outlined,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'شحن رصيد جوال',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ), //
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'تركي / سوري',
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'بعض الشرح المبسط عن الخدمة',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: FilledButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text('اطلب الآن'),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      //whatsapp icon
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: SvgPicture.asset(
                                  'assets/images/undraw_mobile_pay_re_sjb8.svg',
                                  height: 100),
                            )),
                      ],
                    ),
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 0,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 16,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'متجر الكتروني',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'شرح مبسط عن الخدمة وما تقدمه للعميل',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: FilledButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('تسوق الآن'),
                                SizedBox(
                                  width: 8,
                                ),
                                //web site icon
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: SvgPicture.asset(
                            'assets/images/undraw_shopping_app_flsj.svg',
                            height: 100),
                      )),
                ],
              )),
        ),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 0,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 16,
                          ),
                          child: Row(
                            children: [
                              //icon of delivery
                              Icon(
                                Icons.delivery_dining_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'توصيل طلبات',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Text(
                            'شرح مبسط عن الخدمة وما تقدمه للعميل',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: FilledButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('اطلب الآن'),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: SvgPicture.asset(
                            'assets/images/undraw_delivery_address_re_cjca.svg',
                            height: 100),
                      )),
                ],
              )),
        ),
      ],
    )));
  }
}
