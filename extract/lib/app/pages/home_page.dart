import 'package:extract/app/data/bloc/transfer_bloc.dart';
import 'package:extract/app/data/bloc/transfer_event.dart';
import 'package:extract/app/data/bloc/transfer_state.dart';
import 'package:extract/app/pages/extract_page.dart';
import 'package:extract/app/presenter/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isBalance = true;
  late final TransferBloc _transferBloc;

  @override
  void initState() {
    super.initState();
    _transferBloc = TransferBloc();
    _transferBloc.inputTransfer.add(GetTransfers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Extrato',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              //height: MediaQuery.of(context).size.height * 0.18,
              height: 140,
              color: AppColors.gray2,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Seu Saldo',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isBalance = !_isBalance;
                            });
                          },
                          icon: Icon(
                            !_isBalance
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  !_isBalance
                      ? Divider(
                          color: AppColors.blue,
                          height: 28,
                          thickness: 3,
                          indent: 0,
                          endIndent: 200,
                        )
                      : Text(
                          'R\$ 1.350,00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blue,
                            fontSize: 24,
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Sua movimentações',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: StreamBuilder<TransferState>(
                  stream: _transferBloc.outputTransfer,
                  builder: (context, state) {
                    if (state.data is TransferLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.data is TransferLoadedState) {
                      final list = state.data?.transfers ?? [];
                      return ListView.separated(
                        separatorBuilder: (_, __) => const Divider(),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExtractPage(
                                    type: list[index].type,
                                    from: list[index].from,
                                    value: list[index].value,
                                    date: list[index].date,
                                  ),
                                ),
                              );
                            },
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Container(
                                //   width: 2,
                                //   height: 20,
                                //   color: Colors.grey,
                                // ),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.blue,
                                  ),
                                ),
                                // Container(
                                //   width: 2,
                                //   height: 20,
                                //   color: Colors.grey,
                                // ),
                              ],
                            ),
                            tileColor: AppColors.gray2,
                            title: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                list[index].type,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                            subtitle: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        list[index].from,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.gray,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        list[index].date,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.gray,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'R\$ ${list[index].value}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text('Error'),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
