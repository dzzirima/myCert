import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          padding: EdgeInsets.only(left: 10, top: 10,right: 15),
          child: GestureDetector(
            onTap:(){
              FocusScope.of(context).unfocus();
            } ,
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 120,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius:2,
                                  blurRadius: 3,
                                  color: Colors.black.withOpacity(0.1)
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage('https://cdn.pixabay.com/photo/2015/03/03/18/58/woman-657753_960_720.jpg')
                            )
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Colors.white,
                                ),
                                color: Colors.blue
                            ),
                            child: PopupMenuButton(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 0,
                                  child: Column(
                                    children: [
                                      Text("Share With"),
                                    ],
                                  )
                                ),
                                PopupMenuItem(
                                    value: 0,
                                    child: Column(
                                      children: [
                                        Text("Private"),

                                      ],
                                    )
                                ),
                                PopupMenuItem(
                                    value: 0,
                                    child: Column(
                                      children: [
                                        Text("Public")
                                      ],
                                    )
                                ),
                              ],
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                buildTextField("Full Name", "Nicola Dyakonda"),
                buildTextField("Email address", "email@gmail.com"),
                buildTextField("Phone number", "123456789"),
                buildTextField("Bio", "small infor about yourself"),
                buildTextField("Work Experience","Hello summer"),
                buildTextField("  Education", "Hello summer"),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(onPressed:(){},
                      child: Text("Edit", style: TextStyle(
                        fontSize:15,
                        letterSpacing: 5,
                        color: Colors.black,
                      ),),
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                    ),
                    ElevatedButton(onPressed:() {},
                      child:Text("SAVE",style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white
                      ),),
                      style:ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 50,),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ) ,)
                  ],)
              ],
            ),
          ),
        )
    );
  }
  Widget buildTextField(String labelText, String placeholder){
    return Padding(padding:EdgeInsets.only(bottom: 30),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          labelStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black),

          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),);
  }

}