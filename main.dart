import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buy Stock UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BuyStockScreen(),
    );
  }
}

class BuyStockScreen extends StatelessWidget {
  const BuyStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF7775F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7775F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Add back navigation functionality here
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.05),
            child: Image.asset(
              'assets/image.png',
              width: screenWidth * 0.08,
              height: screenHeight * 0.08,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Text(
                      'APPLE ₹443',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      '+1.80 (4.32%)',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: screenHeight * 0.02,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                width: screenWidth * 0.9,
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildInputField(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      label: 'Price',
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: buildInputField(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            label: 'Target Price',
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Expanded(
                          child: buildInputField(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            label: 'Stop Loss',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                width: screenWidth * 0.9,
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'IMPORTANT',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    buildImportantInfo(
                      screenHeight: screenHeight,
                      info: 'Achieve your target: +10 points',
                    ),
                    buildImportantInfo(
                      screenHeight: screenHeight,
                      info: 'Achieve your stop loss: +5 points',
                    ),
                    buildImportantInfo(
                      screenHeight: screenHeight,
                      info: 'If you don\'t achieve your target: -5  points',
                    ),
                    buildImportantInfo(
                      screenHeight: screenHeight,
                      info:
                      'If any four of your team\'s stocks don’t  achieve target, you will lose the match',
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Center(
                      child: SizedBox(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.07,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add buy functionality here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7775F8),
                            textStyle: TextStyle(
                              fontSize: screenHeight * 0.025,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Sell',
                            style: TextStyle(
                              fontSize: screenHeight * 0.025,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField({
    required double screenHeight,
    required double screenWidth,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: screenHeight * 0.02,
            color: Colors.black,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.06,
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
              ),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Widget buildImportantInfo({
    required double screenHeight,
    required String info,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.01),
      child: Text(
        '• $info',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: screenHeight * 0.02,
          color: Colors.black,
        ),
      ),
    );
  }
}
