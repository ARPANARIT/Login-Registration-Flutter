import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailFieldWidget extends StatefulWidget {
 final controller;

  const EmailFieldWidget({ Key? key, required this.controller }) : super(key: key);

  @override
  State<EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  @override
  Widget build(BuildContext context) {
   
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
                prefixIconColor: Colors.black54,
                prefixIcon: Icon(Icons.person,),
                label: Text('Email ',style: TextStyle(fontSize: 30,color: Colors.black54),),
                 border: myinputborder(),
                iconColor: Colors.black54,
                focusedBorder: myfocusborder(),
                suffixIcon: IconButton(icon: Icon(Icons.close),
                  onPressed:()=>widget.controller.clear(),
                )
                ,),
                autofillHints: [AutofillHints.email],
                validator: (email){
                  email!=null && 
                  !EmailValidator.validate(email)
                  ?'Enter a Valid Email':null;
                },
      );
  }
}
OutlineInputBorder myfocusborder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
        color:Colors.black,
        width: 3,
      )
  );
}

OutlineInputBorder myinputborder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color:Colors.black,
        width: 3,
      )
  );
}