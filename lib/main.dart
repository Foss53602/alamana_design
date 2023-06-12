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

ValueNotifier<ThemeMode> themeModeNotifier =
    ValueNotifier<ThemeMode>(ThemeMode.light);

void main() {
  runApp(MyApp());
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

class _HomeState extends State<Home> {
  double fakeBalance = 190;

  @override
  initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 10),
        (Timer t) => setState(() {
              var nextDouble = Random().nextInt(500);
              fakeBalance = nextDouble.toDouble();
            }));
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ShowCaseWidget.of(context).startShowCase([_one, _tow]);
      },
    );
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

  final GlobalKey _one = GlobalKey();

  final GlobalKey _tow = GlobalKey();

  Widget _drawHomePageContent(context) {
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
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
                  for (String key in imagesAddresses.keys)
                    SizedBox(
                      width: 60,
                      child: Column(
                        children: [
                          InkResponse(
                            radius: 25,
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              clipBehavior: Clip.antiAlias,
                              height: 50,
                              width: 50,
                              child: Image.network(
                                  imagesAddresses[key].toString(),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            key,
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
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text('عرض الكل',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
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
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            clipBehavior: Clip.antiAlias,
                            height: 50,
                            width: 50,
                            child: Image.network(
                                imagesAddresses.values
                                    .toList()
                                    .reversed
                                    .toList()[i]
                                    .toString(),
                                fit: BoxFit.cover),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(imagesAddresses.keys
                                  .toList()
                                  .reversed
                                  .toList()[i]
                                  .toString()),
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
                            height: 30,
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

  Map<String, String> imagesAddresses = {
    'احمد':
        'https://wesamalsebea.files.wordpress.com/2021/06/whatsapp-image-2021-06-01-at-9.52.44-am.jpeg',
    'صالح':
        'https://i0.wp.com/www.newphotodownload.info/wp-content/uploads/2018/10/%D8%A7%D8%AC%D8%AF%D8%AF-%D8%B5%D9%88%D8%B1-%D8%B4%D8%AE%D8%B5%D9%8A%D8%A9-%D9%84%D9%84%D9%81%D9%8A%D8%B3-%D8%A8%D9%88%D9%83-17.jpg',
    'محمود': 'https://pic.i7lm.com/wp-content/uploads/2020/02/2-8.jpg',
    'سمير':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxAbLXjO85VYF-v1zg4AU2_ZNVL9aPtzDZJg&usqp=CAU',
    'ميني ماركت سعيد':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbInTajUfL2gANCy8D1raX1y91CNR4yYmxWA&usqp=CAU',
    'احذية الأناقة':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnj8M1QGU9dkXVIF_9tPx5hkqzLfFg1qJSI-sIDd5Zi4v3VIymwWkBrqSMJ6aTftt0HSY&usqp=CAU',
    'دكتور اسنان':
        'https://nafezly-production.fra1.digitaloceanspaces.com/uploads/portfolios/7196_5faea70a66ba5-1605281546.jpg',
    'متجر العطور':
        'https://cdn.makane.com/cdn-cgi/image/quality=80,fit=scale-down,format=auto/20211229-store-nhqm/branding/logo-70727278579.jpg?height=45',
  };

  Widget _drawBottomNavigationBar(BuildContext context) {
    return ConvexAppBar(
      items: [
        TabItem(icon: Icons.home_outlined, title: 'رئيسية'),
        TabItem(icon: Icons.ads_click_outlined, title: 'إعلانات'),
        TabItem(
            icon: Showcase(
                textColor: Theme.of(context).colorScheme.onPrimary,
                tooltipBackgroundColor: Theme.of(context).colorScheme.primary,
                titleAlignment: TextAlign.center,
                descriptionAlignment: TextAlign.center,
                key: _tow,
                description: 'يمكنك إضافة حسابك الخاص من هنا',
                child: Icon(Icons.add)),
            title: 'إضافة حساب'),
        TabItem(icon: Icons.settings_outlined, title: 'إعدادات'),
      ],
      initialActiveIndex: 0,
      onTap: (int i) {
        if (i == 1) {}
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

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

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
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbInTajUfL2gANCy8D1raX1y91CNR4yYmxWA&usqp=CAU'),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.storefront,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('ميني ماركت سعيد'),
                      ],
                    ),
                    const Text('الباب - الشارع الرئيسي'),
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
            Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('الدفع بـ',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          width: 16,
                        ),
                        const Text('LT',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          width: 8,
                        ),
                        Switch(
                          value: _isDollar,
                          onChanged: (value) {
                            setState(() {
                              _isDollar = value;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('\$',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
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
                      onPressed: ()async {
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
                                        const Icon(Icons.store,color: Colors.grey),
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
                          // show success dialog
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('الرصيد الحالي',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 8,
                ),
                Text(fakeBalance.toString(),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                Text(' \$',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                Text(' / ',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 8,
                ),
                Text('سيتبقى',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 8,
                ),
                Text(
                    (fakeBalance -
                            (_isDollar
                                ? paymentAmount
                                : (num.parse((paymentAmount / 23.5)
                                    .toStringAsFixed(2)))))
                        .toString(),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                Text(' \$',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
