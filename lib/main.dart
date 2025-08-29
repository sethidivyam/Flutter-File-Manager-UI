import 'package:file_manager/variable.dart';

///============================ APP MAIN FUNCTION =============================//
void main() async {
  ///=========================== FLUTTER INITIALIZE ===========================//
  WidgetsFlutterBinding.ensureInitialized();
  /*if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyDLcAafTtlDp7RKng-ygKYkb0KnTQ_Pi5E",
          appId: "1:831318956585:web:d60626efb48d41d0a85a38",
          messagingSenderId: "831318956585",
          projectId: "kiraya-dfad3",
        ));
  } else {
    await Firebase.initializeApp();
  }

  ///--------------------------------------------------------------------------//

  ///================================ CONTACTS ================================//
  PermissionStatus permissionStatus = await Permission.contacts.request();
  if (permissionStatus != PermissionStatus.granted) {
    PermissionStatus permissionStatus = await Permission.contacts.request();
    print(permissionStatus);
  }
*/
  ///--------------------------------------------------------------------------//
  runApp(const MyApp());
}

///----------------------------------------------------------------------------//

///=============================== APP HOME PAGE ==============================//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "$app_name",
      //debugShowCheckedModeBanner: false,
      //theme: ThemeData(
      //  primarySwatch: color,
      // ),
      home: /*StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Auth data ${snapshot.data}");
            return Home_Page();
          }
          print("Auth data ${snapshot.data}");
          return Login_Page();
        },
      ), */
          HomePage(),
    );
  }
}

///----------------------------------------------------------------------------//
