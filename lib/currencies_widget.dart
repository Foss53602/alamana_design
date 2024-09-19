import 'package:alamana_design/ExchangePage.dart';
import 'package:alamana_design/main.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CurrenciesWidget extends StatefulWidget {
  const CurrenciesWidget({super.key});

  @override
  State<CurrenciesWidget> createState() => _CurrenciesWidgetState();
}

class _CurrenciesWidgetState extends State<CurrenciesWidget> {
  @override
  Widget build(BuildContext context) {
    return design3();
  }

  Widget design2() {
    return Column(
      children: [
        Card(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.07),
          shadowColor: Colors.transparent,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/img_3.png',
                      height: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('الرصد الحالي',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/img_31.png',
                      height: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '165.27 \$',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    Spacer(),
                    barcodeWidget(0),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/img_30.png',
                      height: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          '3250.00',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                           'assets/images/img_7.png',color: Theme.of(context).colorScheme.onBackground,
                          height: 20,
                        )
                      ],
                    ),
                    Spacer(),
                    barcodeWidget(1),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            _cardButton('assets/images/img_24.png', 'تحويل', () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                ),
                builder: (context) => PaymentPage(),
              );
            }),
            _cardButton('assets/images/img_18.png', 'صرف', () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                ),
                builder: (context) => ExchangePage(),
              );
            }),
            _cardButton('assets/images/img_19.png', 'السجل', () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RecentOperationsPage(),
                ),
              );
            }),
            _cardButton('assets/images/img_21.png', 'التقرير', () {}),
          ],
        ),
      ],
    );
  }

  Widget barcodeWidget(int index) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return _qrCodeWidget(index);
            });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(4),
        child: Image.asset(
          'assets/images/img_11.png',
          color: Theme.of(context).colorScheme.primary,
          height: 25,
        ),
      ),
    );
  }

  Widget design1() {
    return SizedBox(
      height: 210,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/img_3.png',
                                  color: Colors.white,
                                  height: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  index == 0
                                      ? 'حساب الدولار'
                                      : 'حساب الليرة التركية',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Image.asset(
                                  index == 0
                                      ? 'assets/images/img_31.png'
                                      : 'assets/images/img_30.png',
                                  height: 30,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                index == 0
                                    ? Image.asset('assets/images/img_8.png',
                                        color: Theme.of(context).colorScheme.onBackground, height: 35)
                                    : Image.asset('assets/images/img_7.png',
                                          color: Theme.of(context).colorScheme.onBackground,  height: 32),
                                const SizedBox(width: 8),
                                Text(
                                  index == 0 ? '190.16' : '1260.00',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return _qrCodeWidget(index);
                              });
                        },
                        child: Image.asset('assets/images/img_11.png',
                            color: Colors.white, height: 50),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
                Spacer(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    _cardButton('assets/images/img_24.png', 'تحويل', () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.9,
                        ),
                        builder: (context) => PaymentPage(),
                      );
                    }),
                    _cardButton('assets/images/img_18.png', 'صرف', () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.9,
                        ),
                        builder: (context) => ExchangePage(),
                      );
                    }),
                    _cardButton('assets/images/img_19.png', 'السجل', () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RecentOperationsPage(),
                        ),
                      );
                    }),
                    _cardButton('assets/images/img_21.png', 'التقرير', () {}),
                  ],
                ),
              ],
            ),
          );
        },
        loop: false,
        itemCount: 2,
        viewportFraction: 0.9,
        scale: 0.95,
      ),
    );
  }

  Widget _qrCodeWidget(int index) {
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  index == 0
                      ? 'assets/images/img_31.png'
                      : 'assets/images/img_30.png',
                  height: 20,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'الرمز الخاص بحسابك ${index == 0 ? 'الدولار' : 'التركي'}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
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

  Widget _cardButton(
      String assetImagePath, String title, GestureTapCallback? onPressed) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                assetImagePath,
                color: Theme.of(context).colorScheme.primary,
                height: 24,
              )),
        ),
        const SizedBox(height: 2),
        Text(title),
      ],
    );
  }

  Widget _cardButton1(
      String assetImagePath, String title, GestureTapCallback? onPressed,
      {bool withTitle = true}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(
              assetImagePath,
              color: Theme.of(context).colorScheme.primary,
              height: 24,
            ),
            if (withTitle) const SizedBox(width: 2),
            if (withTitle)
              Text(title,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
          ],
        ),
      ),
    );
  }

  Widget design3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(4),
              height: 150,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Transform.rotate(
                        angle: 5.8,
                        child: Image.asset(
                          'assets/images/img_311.png',
                          height: 140,
                          color: Theme.of(context).colorScheme.background.withOpacity(0.3)
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/img_31.png', height: 50),
                            Spacer(),
                            _cardButton1('assets/images/img_11.png', 'QR', () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return _qrCodeWidget(0);
                                  });
                            }, withTitle: false)
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '50.',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  '165 \$',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Spacer(),
                        // Row(
                        //   children: [
                        //     _cardButton1('assets/images/img_24.png', 'تحويل', () {
                        //       showModalBottomSheet(
                        //         context: context,
                        //         isScrollControlled: true,
                        //         constraints: BoxConstraints(
                        //           maxHeight:
                        //           MediaQuery.of(context).size.height * 0.9,
                        //         ),
                        //         builder: (context) => PaymentPage(),
                        //       );
                        //     }),
                        //     Spacer(),
                        //     _cardButton1('assets/images/img_11.png', 'QR', () {
                        //       showDialog(
                        //           context: context,
                        //           builder: (context) {
                        //             return _qrCodeWidget(1);
                        //           });
                        //     }, withTitle: false),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(4),
              height: 150,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Transform.rotate(
                        angle: 5.8,
                        child: Image.asset(
                          'assets/images/img_301.png',
                          height: 140,
                            color: Theme.of(context).colorScheme.background.withOpacity(0.3)
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/img_30.png', height: 50),
                            Spacer(),
                            _cardButton1('assets/images/img_11.png', 'QR', () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return _qrCodeWidget(1);
                                  });
                            }, withTitle: false)
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '50.',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  '3890',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Image.asset('assets/images/img_7.png',color:Theme.of(context).colorScheme.onBackground, height: 24),
                          ],
                        ),
                        // Spacer(),
                        // Row(
                        //   children: [
                        //     _cardButton1('assets/images/img_24.png', 'تحويل', () {
                        //       showModalBottomSheet(
                        //         context: context,
                        //         isScrollControlled: true,
                        //         constraints: BoxConstraints(
                        //           maxHeight:
                        //               MediaQuery.of(context).size.height * 0.9,
                        //         ),
                        //         builder: (context) => PaymentPage(),
                        //       );
                        //     }),
                        //     Spacer(),
                        //     _cardButton1('assets/images/img_11.png', 'QR', () {
                        //       showDialog(
                        //           context: context,
                        //           builder: (context) {
                        //             return _qrCodeWidget(1);
                        //           });
                        //     }, withTitle: false),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
