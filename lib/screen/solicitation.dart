/*import 'package:WeMeat_Mobile/src/data/enums/connectivity_status_enum.dart';
import 'package:WeMeat_Mobile/src/data/models/api_response_model.dart';
import 'package:WeMeat_Mobile/src/data/models/order_model.dart';
import 'package:WeMeat_Mobile/src/data/services/order_service/order_service.dart';
import 'package:WeMeat_Mobile/src/screens/profile.dart';
import 'package:WeMeat_Mobile/src/screens/widgets/custom_progress_indicator.dart';
import 'package:WeMeat_Mobile/src/screens/widgets/custom_refresh.dart';
import 'package:WeMeat_Mobile/src/screens/widgets/error_card.dart';
import 'package:flutter/material.dart';
import 'package:WeMeat_Mobile/src/screens/widgets/solicitation_card.dart';
import 'package:WeMeat_Mobile/src/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class Solicitation extends StatefulWidget {
  @override
  _SolicitationState createState() => _SolicitationState();
}

class _SolicitationState extends State<Solicitation> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String get search => searchController.text;
  Future<APIResponseModel> orders;
  bool isSearching;

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  Future<void> _refreshList() async {
    setState(() {
      isSearching = false;
      orders = getOrders();
    });
  }

  searchOder(val) {
    setState(() {
      isSearching = true;
      //orders = searchOrders(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Profile()));
              }),
          backgroundColor: backgroundColor,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkColor),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.autorenew),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Solicitation()));
                })
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextField(
                    decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(40.0)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: darkColor,
                  ),
                  hintText: "Pesquisar por pedidos",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, color: darkColor),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(40.0)),
                )),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RefreshIndicator(
                    backgroundColor: backgroundColor,
                    color: primaryColor,
                    onRefresh: _refreshList,
                    child: FutureBuilder<APIResponseModel>(
                      future:
                          orders, // a previously-obtained Future<String> or null
                      builder: (BuildContext context,
                          AsyncSnapshot<APIResponseModel> snapshot) {
                        var connectionStatus =
                            Provider.of<ConnectivityStatus>(context);

                        if (connectionStatus == ConnectivityStatus.Offline) {
                          return ErrorCard(
                            isNetIssue: true,
                            isCritical: false,
                            title: "Sem conexão à internet",
                            message:
                                "Verifique a sua conexão WIFI ou utilize dados móveis",
                            route: Solicitation(),
                          );
                        }

                        if (snapshot.hasData) {
                          //Retornado

                          APIResponseModel response = snapshot.data;

                          if (response.code == "200") {
                            List<OrderModel> orders =
                                OrderModel.fromJsonList(response.data);

                            if (orders.length == 0) {
                              return (!isSearching)
                                  ? CustomMessage(
                                      message:
                                          "Não há pedidos para serem aceites",
                                      page: Solicitation(),
                                    )
                                  : Text(
                                      "Nenhum pedido encontrado",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    );
                            }

                            return list(orders);
                          } else {
                            return ErrorCard(
                              isCritical: false,
                              title: "Não foi possível obter pedidos",
                              message:
                                  "Não foi possível obter pedidos ,tente novamente",
                              route: Solicitation(),
                            );
                          }
                        } else if (snapshot.hasError) {
                          //Erro
                          return ErrorCard(
                            isCritical: true,
                            title: "Erro ao obter pedidos",
                            message:
                                "Ocorreu um erro ao obter pedidos,tente novamente",
                            route: Solicitation(),
                          );
                        } else {
                          //AGUARDADNDO

                          return Center(
                            child: CustomProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget list(List<OrderModel> list) {
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: true,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          OrderModel order = list[index];
          return SolicitationCard(
              id: order.id,
              number: order.number,
              date: order.date,
              name: "${order.costumerName}",
              products: order.itemCount,
              address: "${order.address}");
        },
      ),
    );
  }
}

*/
