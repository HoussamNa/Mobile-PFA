import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String name='';
    final formkey=GlobalKey<FormState>();
  validateform(){
      if (formkey.currentState!.validate()){}



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: const Text('QuickLinker'),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
            onPressed: () {

              

            },
            
            icon: const Icon(Icons.menu),
        ),
        actions: <Widget>[ // icon on the right side 
          IconButton(
            icon: const Icon(Icons.account_circle) ,
            onPressed: () {},
          )

        ],
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
            child :Form(
              child: Column(
                  children: [
                    Container( 
                      margin: const EdgeInsets.all(10),

                      child: TextFormField( 
                      
                          decoration: const InputDecoration(
                          labelText: 'Nom',
                          
                          border: OutlineInputBorder()
                      ),

                              validator: (val) =>val?.length==0 ? 'Remplissez le champ nom':null ,
                              
                    ),
                     ),

                    Container( 
                      margin: const EdgeInsets.all(10),
                      child: TextFormField( 
                      
                      decoration: const InputDecoration(
                          labelText: 'Prenom',
                          
                          border: OutlineInputBorder()
                      ),



                    ),
                     ),
                    

                    Container( 
                      margin: const EdgeInsets.all(10),
                      child: TextFormField( 
                      
                      decoration: const InputDecoration(
                          labelText: 'email',
                          
                          border: OutlineInputBorder()
                      ),



                    ),
                     ),

                  ElevatedButton(
                        onPressed: validateform,
                        child: const Text('qr code')
                        
                        
                        ),
                  

                  ],


              ),

            )


        )





      )
     
    );
    
  }
}