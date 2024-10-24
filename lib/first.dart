import 'dart:convert';

import 'package:api_cart/Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Carts extends StatefulWidget {
  const Carts({super.key});

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  bool _isLoading=true;
  @override
  void initState(){
    super.initState();
    _getData();
  }
 Modelapi? dataFromAPI;
  _getData()async{
    try { String url="https://dummyjson.com/carts";
      http.Response res=await http.get(Uri.parse(url));
      if(res.statusCode ==200){
        dataFromAPI=Modelapi.fromJson(json.decode(res.body));
        _isLoading=false;
        setState(() {
          
        });
      }
      
    } catch (e) {
    debugPrint (e.toString());  
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 205, 252),
      appBar: AppBar(
        title: Text('TODO'),backgroundColor:const Color.fromARGB(255, 126, 205, 252) ,
      ),
      body:
      _isLoading?
      const Center(
        child: CircularProgressIndicator(),
      )
      :dataFromAPI==null?
      const Center(
        child: Text('Failed to load data'),
      )
      : ListView.separated( separatorBuilder: (context,index){
        return SizedBox(height: 20);

      },
      itemCount:dataFromAPI!.products.length ,
      itemBuilder: (context, index) {
          final Product= dataFromAPI!.products[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          
          child: Container(
            height: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color.fromARGB(255, 151, 176, 245),
          border: Border.all(color: Colors.black,
          width: 2,),
          ),
      
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Image.network(Product.thumbnail),
                Text("Id:${Product.id}"),
                SizedBox(height: 10),
                   Text('UsreId:${Product.title}'),
                      SizedBox(height: 10),
                  Text('Todo:${Product.price}'),
                    SizedBox(height: 10),
                Text('Completed:${Product.quantity}'),
             SizedBox(height: 10),
                Text('Completed:${Product.total}'),
             SizedBox(height: 10),
                Text('Completed:${Product.discountedTotal}'),
                 SizedBox(height: 10),
                Text('Completed:${Product.discountPercentage}'),
         
              ],
            ),
          ),
          ),
        );
        
      },),
    );
  }
}