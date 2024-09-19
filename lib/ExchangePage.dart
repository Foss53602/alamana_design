import 'package:flutter/material.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  num exchangePrice = 0;

  bool replace = false;

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
            const Text('صرف العملات',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.surface),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الرصيد الحالي',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/img_31.png',
                              height: 25,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '165.27 \$',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/img_30.png',
                              height: 25,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  '3250.00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Image.asset(
                                  'assets/images/img_7.png',
                                  color: Theme.of(context).colorScheme.primary,
                                  height: 18,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.surface),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.1)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Image.asset(
                            replace
                                ? 'assets/images/img_30.png'
                                : 'assets/images/img_31.png',
                            height: 40,
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                replace = !replace;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Theme.of(context).colorScheme.primary),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Image.asset(
                                'assets/images/img_18.png',
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 30,
                              ),
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            replace
                                ? 'assets/images/img_31.png'
                                : 'assets/images/img_30.png',
                            height: 40,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        replace
                            ? Text('من التركي إلى الدولار بسعر صرف',
                                style: TextStyle(fontSize: 16))
                            : Text('من الدولار إلى التركي بسعر صرف',
                                style: TextStyle(fontSize: 16)),
                        SizedBox(
                          width: 8,
                        ),
                        Text(!replace ? '34.05' : '0.029',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 16, right: 16, bottom: 8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  exchangePrice = !replace
                                      ? (int.tryParse(value) ?? 0) * 34.01
                                      : (int.tryParse(value) ?? 0) / 34.01;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: replace
                                      ? 'ادخل المبلغ بالتركي'
                                      : 'ادخل المبلغ بالدولار',
                                  prefixIcon: replace
                                      ? Padding(
                                          padding: const EdgeInsets.all(14),
                                          child: Image.asset(
                                            'assets/images/img_7.png',
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                            height: 12,
                                          ),
                                        )
                                      : Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 16,
                                                  bottom: 8,
                                                  top: 8),
                                              child: Text(
                                                '\$',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 6,
                          ),
                          !replace
                              ? Image.asset(
                                  'assets/images/img_7.png',
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  height: 18,
                                )
                              : Text(
                                  '\$',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(exchangePrice.toStringAsFixed(2),
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                        child: FilledButton(
                            onPressed: () {}, child: Text('موافق')))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
