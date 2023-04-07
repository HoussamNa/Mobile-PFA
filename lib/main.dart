
library my_globals;


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickLinker',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.green,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuickLinker'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
              },
              child: CircleAvatar(
                child: Icon(Icons.contact_mail),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('johndoe@example.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Professional Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfessionalProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Personal Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalProfilePage()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('Current location'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrentLocationPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                // Add code here to handle logout functionality
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Welcome to QuickLinker!',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfessionalProfilePage extends StatefulWidget {
  @override
  _ProfessionalProfilePageState createState() => _ProfessionalProfilePageState();
}

class _ProfessionalProfilePageState extends State<ProfessionalProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String _qrCodeData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Profile'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                 
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _generateQrCode,
                child: Text('Generate QR Code'),
              ),
              SizedBox(height: 16.0),
             
                QrImage(
                  data: _qrCodeData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _generateQrCode() {
    if (_formKey.currentState!.validate()) {
      String phoneNumber = _phoneController.text;
      String email = _emailController.text;
      String address = _addressController.text;
      print(email);
      print(address);
      setState(() {
        _qrCodeData = "$phoneNumber $email $address";
      });
    }
  }
}

class PersonalProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Profile'),
      ),
      body: Center(
        child: Text('Personal Profile Page'),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Center(
        child: Text('Contact Page'),
),
    );
  }
}

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({super.key});

  @override
  State<CurrentLocationPage> createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
String latitude= '';
  String longitude='';
   final formkey=GlobalKey<FormState>();
    final scaffoldkey=GlobalKey<ScaffoldState>();
    final nomController=TextEditingController();
    final emailController=TextEditingController();
    final numController=TextEditingController();
    late final List<String> infos2=[];
    String qrdata='';
    String myGlobalString = '';
    bool showQRCode = false;

     void dispose(){
       super.dispose();
        
      nomController.dispose();
      emailController.dispose();
      numController.dispose();

    }

    
  void getlocation() async{

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude=position.latitude.toString();
      longitude=position.longitude.toString();
       print(latitude);
      print(longitude);
      ScaffoldMessenger.of(context).showSnackBar(

                                const SnackBar(content: Text("location recupere"))

                             );
                             FocusScope.of(context).requestFocus(FocusNode());//clavier goes down
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location'),
      ),
      body: Center(
        //child: _position!=null ? Text('current loc:$_position'): const Text('no location'),
        /*child: Container(
        
          //child: ElevatedButton(onPressed: getlocation, child: const Text('get location'),)
          
          child: Column(
            children: [
              ElevatedButton(onPressed: getlocation, child: const Text('get location'),),
              //ElevatedButton(onPressed: openMap, child: const Text('open location'),),

            ],
          ),
          ),
        */  
        
      child: Container(
          margin: const EdgeInsets.all(20),
            child :Form(
              key: formkey,
              child: Column(
                  children: [
                    Container( 
                      margin: const EdgeInsets.all(10),

                      child: TextFormField( 
                      
                          decoration: const InputDecoration(
                          labelText: 'Nom',
                          
                          border: OutlineInputBorder()
                          
                      ),

                              validator: (value) { 
                                if (value==null || value.isEmpty){
                                    return 'Veuillez remplir le champ';

                                }
                              
                              
                              },
                              controller: nomController,
                              
                    ),
                     ),

                    Container( 
                      margin: const EdgeInsets.all(10),
                      child: TextFormField( 
                      
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          
                          border: OutlineInputBorder()
                      ),
                           validator: (value) { 
                                if (value==null || value.isEmpty){
                                    return 'Veuillez remplir le champ';

                                }
                              
                              
                              },
                              
                          controller: emailController,

                    ),
                     ),
                    

                    Container( 
                      margin: const EdgeInsets.all(10),
                      child: TextFormField( 
                      
                      decoration: const InputDecoration(
                          labelText: 'Numero',
                          
                          border: OutlineInputBorder()
                      ),
                                 validator: (value) { 
                                if (value==null || value.isEmpty){
                                    return 'Veuillez remplir le champ';

                                }
                              
                              
                              },
                              
                            controller: numController,

                    ),
                     ),

                  ElevatedButton(onPressed: getlocation , child: const Text('get location'), ),

                   ElevatedButton(
                        
                        onPressed: () {
                          
                          if (formkey.currentState!.validate()){
                            final nomvalue=nomController.text;
                            final emailvalue=emailController.text;
                            final numvalue=numController.text;
                            


                             ScaffoldMessenger.of(context).showSnackBar(

                                const SnackBar(content: Text("Correct"))

                             );
                             FocusScope.of(context).requestFocus(FocusNode());//clavier goes down

                             print('nom: '+nomvalue);
                             print('email: '+emailvalue);
                             print('num: '+numvalue);
                             print('latitude: '+latitude);
                            print('longitude: '+longitude);

                            List<String> infos = [nomvalue, emailvalue, numvalue,latitude,longitude];
                                 List infos2=List.from(infos);


                                 setState(() {
                                        qrdata='$nomvalue $emailvalue $numvalue $latitude $longitude';
                                            });
                                         }
                                setState(() {
                             showQRCode = !showQRCode;
                                           });
                           


                         },
                        child: const Text('qr code')
                        
                        
                        ),
                  
                            Visibility(
                              visible: showQRCode,
                              child:QrImage(
                                backgroundColor: Colors.grey,
                                  data: qrdata,
                                      version: QrVersions.auto,
                                        size: 200.0,
                                  
                                        
                                
                              ),    )    
                            
              
                  
                  ],
               

              ),

            )


        )




      ),
    
      
    );
  }
  }


/*class CurrentLocationPage extends StatefulWidget {
  String latitude= '';
  String longitude='';
   final formkey=GlobalKey<FormState>();
    final scaffoldkey=GlobalKey<ScaffoldState>();
    final nomController=TextEditingController();
    final emailController=TextEditingController();
    final numController=TextEditingController();
    late final List<String> infos2=[];
    String qrdata='';
    String myGlobalString = '';

  CurrentLocationPage({super.key});
      
    
    void dispose(){
        
      nomController.dispose();
      emailController.dispose();
      numController.dispose();

    }



  void getlocation() async{

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude=position.latitude.toString();
      longitude=position.longitude.toString();
       print(latitude);
      print(longitude);
  }
 /* Future <void> openMap( ) async{

    String googleURL ='https://www.google.com/maps/search/?api=1&query=$latitude, $longitude' ;
     await canLaunchUrlString(googleURL) ? await launchUrlString(googleURL) : throw 'Could not: launch $googleURL';



  }
*/
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location'),
      ),
      body: Center(
        //child: _position!=null ? Text('current loc:$_position'): const Text('no location'),
        /*child: Container(
        
          //child: ElevatedButton(onPressed: getlocation, child: const Text('get location'),)
          
          child: Column(
            children: [
              ElevatedButton(onPressed: getlocation, child: const Text('get location'),),
              //ElevatedButton(onPressed: openMap, child: const Text('open location'),),

            ],
          ),
          ),
        */  
        
      child: Container(
          margin: const EdgeInsets.all(20),
            child :Form(
              key: formkey,
              child: Column(
                  children: [
                    Container( 
                      margin: const EdgeInsets.all(10),

                      child: TextFormField( 
                      
                          decoration: const InputDecoration(
                          labelText: 'Nom',
                          
                          border: OutlineInputBorder()
                          
                      ),

                              validator: (value) { 
                                if (value==null || value.isEmpty){
                                    return 'Veuillez remplir le champ';

                                }
                              
                              
                              },
                              controller: nomController,
                              
                    ),
                     ),

                    Container( 
                      margin: const EdgeInsets.all(10),
                      child: TextFormField( 
                      
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          
                          border: OutlineInputBorder()
                      ),
                           validator: (value) { 
                                if (value==null || value.isEmpty){
                                    return 'Veuillez remplir le champ';

                                }
                              
                              
                              },
                              
                          controller: emailController,

                    ),
                     ),
                    

                    Container( 
                      margin: const EdgeInsets.all(10),
                      child: TextFormField( 
                      
                      decoration: const InputDecoration(
                          labelText: 'Numero',
                          
                          border: OutlineInputBorder()
                      ),
                                 validator: (value) { 
                                if (value==null || value.isEmpty){
                                    return 'Veuillez remplir le champ';

                                }
                              
                              
                              },
                              
                            controller: numController,

                    ),
                     ),

                  ElevatedButton(onPressed: getlocation, child: const Text('get location'),),

                   ElevatedButton(
                        
                        onPressed: () {
                          
                          if (formkey.currentState!.validate()){
                            final nomvalue=nomController.text;
                            final emailvalue=emailController.text;
                            final numvalue=numController.text;


                             ScaffoldMessenger.of(context).showSnackBar(

                                const SnackBar(content: Text("Correct"))

                             );
                             FocusScope.of(context).requestFocus(FocusNode());//clavier goes down

                             print('nom: '+nomvalue);
                             print('email: '+emailvalue);
                             print('num: '+numvalue);
                             print('latitude: '+latitude);
                            print('longitude: '+longitude);

                            List<String> infos = [nomvalue, emailvalue, numvalue,latitude,longitude];
                                 List infos2=List.from(infos);


                                  setState() {
                                    qrdata=' $nomvalue $emailvalue $numvalue $latitude $longitude';
                                        };
                             /* setState(){
                                    qrdata=' $nomvalue $emailvalue $numvalue $latitude $longitude';

                              }*/
                              
                              
                                         }
                            
                         


                         },
                        child: const Text('qr code')
                        
                        
                        ),
                  
                                
                              QrImage(
                                backgroundColor: Colors.grey,
                                  data: qrdata,
                                      version: QrVersions.auto,
                                        size: 200.0,
                                  

                                        
                                
                              ),
              
                  
                  ],
               

              ),

            )


        )




      ),
    
      
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}*/