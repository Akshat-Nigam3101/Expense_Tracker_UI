//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_app/first.dart';
import 'package:my_app/home_screen.dart';
import 'package:my_app/model/transaction.dart';
import 'package:my_app/provider/transactions_provider.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';

class PaymentsApp extends StatelessWidget {
  const PaymentsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color.fromARGB(255, 0, 0, 0),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.comment_bank,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(Icons.home),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Home',
          ),
        ],
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(
            top: 12,
            bottom: 8,
            left: 8,
            right: 8,
          ),
          child: Text(
            "Tanya Myroniuk",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.black,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCardSection(),
                _buildCardSection(),
                _buildCardSection(),
              ],
            ),
          ),
          _buildTransactionsSection()
        ],
      ),
    );
  }

  Widget _buildCardSection() {
    return Container(
      width: 370,
      color: Theme.of(context).primaryColor,
      child: Card(
        color: Colors.transparent,
        elevation: 4,
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Container(
          padding: const EdgeInsets.all(
            24,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(
              8,
            )),
            gradient: LinearGradient(
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
                Color(0xffa805ee),
                Color(0xffC147EF),
                Color(0xffDB61E7),
                Color(0xffE863EC),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Card Balance",
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const Text(
                      "\$",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text(
                      "14,530",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "CARD NUMBER",
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 2,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "1234 1234 1234 1234",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Text(
            "",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.search,
            size: 30,
          )
        ],
      ),
    );
  }

  Widget _buildTransactionsSection() {
    return Container(
      color: const Color(0xff090909),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "TRANSACTIONS",
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[100],
                  ),
                ),
                Text(
                  "SEE MORE",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[900],
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            itemBuilder: (_, position) {
              Transaction transaction =
                  TransactionsProvider.transactions[position];
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  // ignore: sort_child_properties_last
                  child: Text(
                    transaction.name.substring(0, 2).toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: Color.fromARGB(
                    _random.nextInt(256),
                    _random.nextInt(256),
                    _random.nextInt(256),
                    _random.nextInt(256),
                  ),
                ),
                title: Text(transaction.name),
                subtitle: Text(transaction.timestamp),
                trailing: Text(
                  transaction.amount,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            },
            itemCount: TransactionsProvider.transactions.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          ),
        ],
      ),
    );
  }

  Widget _buildSendMoneySection(context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "SEND MONEY",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
                letterSpacing: 2,
              ),
            ),
          ),
          Row(
            children: TransactionsProvider.transactions.map((transaction) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      child: Text(
                        transaction.name.substring(0, 2).toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      backgroundColor: Color.fromARGB(
                        _random.nextInt(256),
                        _random.nextInt(256),
                        _random.nextInt(256),
                        _random.nextInt(256),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      transaction.name,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
