import 'package:flutter/material.dart';
import 'package:foody/widget/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0,right: 20.0,left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,)),
            Image.asset("images/salad1.png", width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height/2.5,fit:BoxFit.fill,),
            SizedBox(height: 15.0,),
            Row(

              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Fresh and Healthy!", style: AppWidget.semiBoldTextFeildStyle(),),
                  Text("Veggie Mash", style: AppWidget.boldTextFeildStyle(),),
                ],
              ),
              Spacer(),

              GestureDetector(
                onTap: (){
                  if(a>1){
                    --a;
                  }

                  setState(() {

                  });
                },
                child: Container(

                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.remove,color:Colors.white),
                ),
              ),
                SizedBox(width: 20.0,),
                Text(a.toString(),style: AppWidget.semiBoldTextFeildStyle(),),
                SizedBox(width: 20.0,),
                GestureDetector(
                  onTap: (){
                    ++a;
                    setState(() {

                    });
                  },
                  child: Container(

                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.add,color:Colors.white),
                  ),
                )
            ],),
            SizedBox(height: 20.0,),
            Text("Veggie Mash is a delightful vegetable salad dish that brings together the freshest, most vibrant produce in a harmonious medley of flavors and textures. This nutritious salad features a mix of crunchy carrots, sweet bell peppers, crisp cucumbers, and tender broccoli, all finely chopped and tossed together.",maxLines: 5,
              style: AppWidget.LightTextFeildStyle(),),
            SizedBox(height: 30.0,),
            Row(children: [
              Text("Delivary Time",style: AppWidget.semiBoldTextFeildStyle(),),
              SizedBox(width: 25.00,),
              Icon(Icons.alarm,color: Colors.black54,),
              SizedBox(width: 5.00,),
              Text("30 min", style: AppWidget.semiBoldTextFeildStyle(),)
            ],),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Total Price", style: AppWidget.semiBoldTextFeildStyle(),),
                  Text("\Rs.800", style: AppWidget.HeadlineTextFeildStyle(),),
                ],),
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text("Add to cart",style: TextStyle(color: Colors.white,fontSize: 16.0,fontFamily: 'Poppins'),),
                    SizedBox(width: 30.0,),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.grey, borderRadius: BorderRadius.circular(8)
                      ),
                      child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                    ),
                      SizedBox(width: 10.0,)
                  ],),
                )
              ],),
            )
      ],),),
    );
  }
}
