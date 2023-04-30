import 'styles.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(const MyApp());
}

class NavigationService {
  /// Creating the first instance
  static final NavigationService _instance = NavigationService._internal();
  NavigationService._internal();

  /// With this factory setup, any time  NavigationService() is called
  /// within the appication _instance will be returned and not a new instance
  factory NavigationService() => _instance;

  ///This would allow the app monitor the current screen state during navigation.
  ///
  ///This is where the singleton setup we did
  ///would help as the state is internally maintained
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  /// For navigating back to the previous screen
  dynamic goBack([dynamic popValue]) {
    return navigationKey.currentState?.pop(popValue);
  }

  /// This allows you to naviagte to the next screen by passing the screen widget
  Future<dynamic> navigateToScreen(Widget page, {arguments}) async => navigationKey.currentState?.push(
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );

  /// This allows you to naviagte to the next screen and
  /// also replace the current screen by passing the screen widget
  Future<dynamic> replaceScreen(Widget page, {arguments}) async => navigationKey.currentState?.pushReplacement(
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );

  /// Allows you to pop to the first screen to when the app first launched.
  /// This is useful when you need to log out a user,
  /// and also remove all the screens on the navigation stack.
  /// I find this very useful
  void popToFirst() => navigationKey.currentState?.popUntil((route) => route.isFirst);
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sortAI',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: const MyHomePage(title: 'SortAI'),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService().navigationKey,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectIndex = 0;
  late Widget _bodyWidget;


  @override
  void initState() {
    super.initState();
    onItemTepped(0);
  }

  void onItemTepped(int index) {
    setState(() {
      _selectIndex = index;
      _bodyWidget = _buildBodyWidget(index);
    });
  }


  Widget _buildBodyWidget(int widgetType) {
    switch (widgetType) {
      case 0:
        return Scaffold(
            body: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/plastic_photo.jpeg"),
                      height: 150,
                      width: 150,
                    ),
                    Container(
                        width: 150, height: 30,
                        child: ElevatedButton(
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainPlastic()));},
                            child: Center(
                              child: (
                                  Text('Plastic', style: const TextStyle(fontFamily: kButtonFont, fontSize: 18.0, fontWeight: FontWeight.w600,)
                                  )),
                            ))),
                    //
                    SizedBox(height: 50.0,),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/paper_photo.jpeg"),
                      height: 150,
                      width: 150,
                    ),
                    Container(
                      width: 140, height: 30,
                      child: ElevatedButton(
                          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyPaperPage()));},
                          child: Center(
                            child: (
                                Text('Paper', style: const TextStyle(fontFamily: kButtonFont, fontSize: 18.0, fontWeight: FontWeight.w600,)
                                )),
                          )),
                    ),
                    SizedBox(height: 50.0,),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/glass_photo.jpeg"),
                      height: 150,
                      width: 150,
                    ),
                    Container(
                        width: 150, height: 30,
                        child: ElevatedButton(
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainGlass()));},
                            child: Center(
                              child: (
                                  Text('Glass', style: const TextStyle(fontFamily: kButtonFont, fontSize: 18.0, fontWeight: FontWeight.w600,)
                                  )),
                            ))),
                    SizedBox(height: 50.0,),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/elec_photo.jpeg"),
                      height: 150,
                      width: 150,
                    ),
                    Container(
                        width: 150, height: 30,
                        child: ElevatedButton(
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainEWaste()));},
                            child: Center(
                              child: (
                                  Text('E-Waste', style: const TextStyle(fontFamily: kButtonFont, fontSize: 18.0, fontWeight: FontWeight.w600,)
                                  )),
                            ))),
                    SizedBox(height: 50.0,),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/medical_photo.jpeg"),
                      height: 150,
                      width: 150,
                    ),
                    Container(
                        width: 150, height: 30,
                        child: ElevatedButton(
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyMedicalPage()));},
                            child: Center(
                              child: (
                                  Text('Medical', style: const TextStyle(fontFamily: kButtonFont, fontSize: 18.0, fontWeight: FontWeight.w600,)
                                  )),
                            ))),
                    SizedBox(height: 50.0,),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/metal_photo.jpeg"),
                      height: 150,
                      width: 150,
                    ),
                    Container(
                        width: 150, height: 30,
                        child: ElevatedButton(
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainMetal()));},
                            child: Center(
                              child: (
                                  Text('Metal', style: const TextStyle(fontFamily: kButtonFont, fontSize: 18.0, fontWeight: FontWeight.w600,)
                                  )),
                            ))),
                    SizedBox(height: 50.0,),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/tetra_photo.jpg"),
                      height: 150,
                      width: 150,
                    ),
                    Container(
                        width: 150, height: 30,
                        child: ElevatedButton(
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyTetraPakPage()));},
                            child: Center(
                              child: (
                                  Text('Tetra Pak', style: const TextStyle(fontFamily: kButtonFont, fontSize: 18.0, fontWeight: FontWeight.w600,)
                                  )),
                            ))),
                ],
              ),
            )
            )
        );

      case 1:
        return MaterialApp(
          home: const MainApp(),
          debugShowCheckedModeBanner: false,
        );
      case 2:
        return MaterialApp(
          home: const Map(),
          debugShowCheckedModeBanner: false,
        );
      default:
        throw ArgumentError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: onItemTepped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
        iconSize: 40,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green.shade800,
      ),
    );
  }
}



class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  CustomMap(),
      debugShowCheckedModeBanner: false,
      );
  }
}
class CustomMap extends StatefulWidget {
  const CustomMap({Key? key}) : super(key: key);

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  GoogleMapController? _controller;
  static const LatLng _center = LatLng(43.250000, 76.900000);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });

    rootBundle.loadString('assets/map_style.json').then((mapStyle) {
      _controller?.setMapStyle(mapStyle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: _center,
        zoom: 12,
      ),
      markers: {
        Marker(
            markerId: const MarkerId('marker1'),
            position: const LatLng(43.283238028738154, 76.91747813647363),
            draggable: true,
            onDragEnd: (value) {
              // value is the new position
            },
            infoWindow: InfoWindow(
              title: 'Прием вторсырья',
              snippet:
              ['Центр по переработке отходов', '+77017442643', 'улица Казыбаева 26', 'Алматы\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(", "),
            )
          // To do: custom marker icon
        ),

        Marker(
            markerId: const MarkerId('marker2'),
            position: const LatLng(43.29501417896099, 76.85756449315723),
            infoWindow: InfoWindow(
              title: 'ТОО "КазМакТрейд" пункт приема макулатуры и пластика',
              snippet:
              ['Центр по переработке отходов', '+77777072021\n', 'Ырысты 15 а', 'Алматы\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(", "),
            )
        ),

        Marker(
            markerId: const MarkerId('marker3'),
            position: const LatLng(43.36833290321793, 76.93757297515965),
            draggable: true,
            onDragEnd: (value) {
              // value is the new position
            },
            infoWindow: InfoWindow(
              title: 'ТОО "Технология А"',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '+77774975555\n', 'Алматы 050007\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(', '),
            )
          // To do: custom marker icon
        ),

        Marker(
            markerId: const MarkerId('marker6'),
            position: const LatLng(37.415768808487435, -122.08440050482749),
            infoWindow: InfoWindow(
              title: 'ТОО "EcoLog Kazakhstan"',
              snippet:
              ['Центр по переработке отходов', '+77773333444\n', 'ул. Серикова 61, Алматы 050000\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(', '),
            )
        ),
        Marker(
            markerId: const MarkerId('marker8'),
            position: const LatLng(43.20949468491954, 76.90803293181897),
            infoWindow: InfoWindow(
              title: 'Kazakhstan Waste Recycling',
              snippet:
              ['KWR', '+77272458143\n', 'ул. Исиналиева 2б, Алматы\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(', '),
            )
        ),

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(43.25251949960636, 76.93275216809252),
            infoWindow: InfoWindow(
              title: 'Ассоциация "Kaz-Waste"',
              snippet:
              ['Ассоциация или организация', '+77272558778\n', 'пр-т. Сейфуллина 597, Алматы 050022\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(', '),
            )
        ),

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(43.25251949960636, 76.93275216809252),
            infoWindow: InfoWindow(
              title: 'Ecosen',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '10:00-19:00\n', 'Розыбакиев көшесі 247/3, Алматы 050060\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(', '),
            )
        ),


        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(42.31444798717531, 69.5596636515622),
            infoWindow: InfoWindow(
              title: 'ПРИЕМ МАКУЛАТУРЫ В ШЫМКЕНТЕ №1 | САМОВЫВОЗ |',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '09:00–19:00\n', 'ул. Гагарина 112Б, Шымкент 160000\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(', '),
            )
        ),

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(42.31444798717531, 69.5596636515622),
            infoWindow: InfoWindow(
              title: 'Прием Макулатуры',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '09:00–19:00\n', 'ул. Гагарина 112Б, Шымкент 160000\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(', '),
            )
        ),

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(51.16561886811891, 71.46865135199161),
            infoWindow: InfoWindow(
              title: 'Taza',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '09:00–18:00\n', 'A 369, 10/4, Астана\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(', '),
            )


        ),

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(51.22284989303371, 71.39449364317097),
            infoWindow: InfoWindow(
              title: 'ПРИЕМ МАКУЛАТУРЫ В НУР-СУЛТАН',
              snippet:
              ['Пункт приёма перерабатываемых отходов', '+77029607755\n', 'ул. Өндіріс, 85/1, Астана 010000\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(', '),
            )


        ),

        Marker(
            markerId: const MarkerId('marker10'),
            position: const LatLng(51.10011749163738, 71.41794572954088),
            infoWindow: InfoWindow(
              title: 'Taza Qala',
              snippet:
              ['Центр по переработке отходов', '+77019900694\n', 'пр-т. Мангилик Ел. 50, Астана 020000\n', 'стекло', 'бумага', 'алюминий', 'асфальт', 'железо\n', 'ткани', 'пластик', 'органические отходы'].join(', '),
            )


        ),
      },
    );
  }}

class MainPlastic extends StatelessWidget{

  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: Center(
            child: Column(
                children: <Widget>[
                  Spacer(),
                  SizedBox(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyPlasticPage());},
                          child: Center(
                            child: (
                                Text('foam plastic', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  const Spacer(),

                  SizedBox(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyPlasticPage());},
                          child: Center(
                            child: (
                                Text('packages', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  const Spacer(),


                  Container(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyPlasticPage());},
                          child: Center(
                            child: (
                                Text('plastic tableware', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  Spacer(),
                  ])));
  }
}

class MyPlasticPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
      body: Center(
      child: Column(
      children: <Widget>[
      Container(
      alignment: Alignment.center,
      child: Image.asset("assets/photo_4.jpeg"),
      height: 300,
      width: 200,
    ),
    Container(
          child: Text(
          "There are seven types of plastic, some of them are recycled and reused, others are not, and it is important to distinguish them from each other by labeling them. Plastic products marked PET, PEHD(HDPE), LDPE, PP, PS are recyclable and can be recycled. But its important to pay attention to the trash can you throw in, as some only accept certain types of plastic. Plastic labeled PVC or OTHER is not recyclable due to its complex composition and harmful emissions during their disposal. They should be thrown into the general trash can. How to properly dispose of plastic?\n"
              "1. Prepare waste before disposal: containers must be clean, dried, it is advisable to remove stickers, labels;\n"
              "2. crumple plastic if possible;\n"
              "3. put the caps in a separate bag, as the material from which they are made differs from the material of the bottle.\n",
          style: const TextStyle(
            fontFamily: kButtonFont,
            fontSize: 13.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        )
    )])));
  }
}
class MyPaperPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
    body: Center(
    child: Column(
    children: <Widget>[
    Container(
    alignment: Alignment.center,
    child: Image.asset("assets/photo_2.jpeg"),
    height: 300,
    width: 200,
    ),
    Container(
          child: Text(
          "1. Tetra Pak: Tetra Pak does not belong to waste paper, therefore, waste paper cannot be thrown into the waste bin. It should be disposed of in a plastic/Tetra Pak container or in a general recycling bin.\n"
              "2. Paper cup. Does not apply to waste paper. Not subject to processing. Replace disposable paper cups with a thermal mug, take care of the environment.\n"
              "Notepads, notebooks, newspapers, magazines, documents, cardboard, colored paper, postcards, calendars, sketchbooks can be thrown into the paper container. But it is important - remove paper clips, staples, springs and adhesive inserts from them.\n",

          style: const TextStyle(
            fontFamily: kButtonFont,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        )
    )
    ]
    )
    )
    );
  }
}

class MainGlass extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: Center(
            child: Column(
                children: <Widget>[
                  Spacer(),
                  SizedBox(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyGlassPage());},
                          child: Center(
                            child: (
                                Text('Lamp', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  const Spacer(),

                  SizedBox(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyGlassPage());},
                          child: Center(
                            child: (
                                Text('Glassware', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  const Spacer(),


                  Container(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyGlassPage());},
                          child: Center(
                            child: (
                                Text('Ceramics', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  Spacer(),
                ])));
  }
}

class MyGlassPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
    body: Center(
    child: Column(
    children: <Widget>[
    Container(
    alignment: Alignment.center,
    child: Image.asset("assets/photo_3.jpeg"),
    height: 300,
    width: 200,
    ),
    Container(
          child: Text(
            "The following waste can be thrown into the glass container: glass bottles (for wine or juice), jars for jam or baby food, glass containers for medicines and cosmetics, glass bottles for perfumes. Thus, the following should not be thrown into the glass waste container: lead or crystal glass, light bulbs, window panes, mirror fragments, porcelain, ceramics, glass decorations such as Christmas balls. All this waste must be disposed of together with household waste or handed over to recycling centers.",
            style: const TextStyle(
              fontFamily: kButtonFont,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          )
        )
        ]
      ),
    ));
  }
}
class MainEWaste extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: Center(
            child: Column(
                children: <Widget>[
                  Spacer(),
                  SizedBox(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyEWastePage());},
                          child: Center(
                            child: (
                                Text('Cable', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  const Spacer(),

                  SizedBox(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyEWastePage());},
                          child: Center(
                            child: (
                                Text('Powersave lamp', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  const Spacer(),

                  SizedBox(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyEWastePage());},
                          child: Center(
                            child: (
                                Text('Fluorescent Lamp', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  const Spacer(),

                  Container(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyEWastePage());},
                          child: Center(
                            child: (
                                Text('LED lamp', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  Spacer(),
                ])));

  }
}
class MyEWastePage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
    body: Center(
    child: Column(
    children: <Widget>[
    Container(
    alignment: Alignment.center,
    child: Image.asset("assets/photo_4.jpeg"),
    height: 200,
    width: 100,
    ),
    Container(
          child: Text(
            "  1. Appliances:"
                "   Household appliances cannot be thrown into a landfill due to their chemical composition, so household appliances must be recycled:\n"
                "1 way: hand over household appliances to the store;\n"
                "2 way: hand over to the reception points of your city;\n"
                "3 way: call one of the recycling services that will help you take the device out.\n"

                "2. Communication and information technology devices:\n"
                "These include cell phones; smartphones; desktop computers; computer monitors; laptops; hard disks. First of all, do not throw the device in the trash. Disposal methods:\n"
                "1. Sell your old smartphone;"
                "2. Hand over to the manufacturing company. Almost all modern electronics manufacturers offer recycling of goods and post information on their websites with the addresses of points for returning old equipment.\n"
                "3. Recycling program from leading stores. Many electronics stores are introducing a recycling program for old electronics, where the customer is given a discount on new smartphone models in return. This allows you to save some money on the purchase of a new device and at the same time get rid of the old one in an environmentally friendly way.\n"
                "Computers can be handed over to metal collection points; find specialized recycling companies that will take out and disassemble the PC; take advantage of recycling programs at home appliance stores. Hard drives are also recycled when they are returned to the store, or you can disassemble the drive and take it to a metal collection point.\n"


                "3. Home Entertainment Devices:\n"
                "This category includes the following electronic waste: DVD, Blu-Ray players; stereo; televisions; video game systems; faxes; copiers; printers. Old video cassettes and CDs can be handed over to electrical waste collection points and some separate waste collection points. An unwanted device can be taken to a recycling center, thrown into an electrical waste container, exchanged for a discount in a store, or taken to a workshop.\n"

                "4. Electronic utilities:"
                "Remove the built-in battery pack before disposing of the remote control. In every city there are electronic waste collection points where you can hand over unnecessary cables, wires, batteries. Charges take them to a special collection point for hazardous waste; take it to a store specializing in chargers and batteries. Incandescent light bulbs do not contain harmful substances and plastic, so they should be thrown into the general trash can, but they should not be thrown into the glass bin. Fluorescent lamps should not be thrown into the general trash can, but must be taken to a special recycling center, due to the content of mercury in the lamp. LED lamps can be thrown away with regular trash, but they contain metals and plastics that can be separated and sent for recycling.\n",
            style: const TextStyle(
              fontFamily: kButtonFont,
              fontSize: 8.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            )
    )]
        ),
      )
    );
  }
}
class MainMetal extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("SortAI"),),
        body: Center(
            child: Column(
                children: <Widget>[
                  Spacer(),
                  SizedBox(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyMetalPage());},
                          child: Center(
                            child: (
                                Text('Foil', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  const Spacer(),

                  SizedBox(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyMetalPage());},
                          child: Center(
                            child: (
                                Text('tincan', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  const Spacer(),


                  Container(
                      width: 250, height: 100,
                      child: ElevatedButton(
                          onPressed: (){NavigationService().replaceScreen(MyMetalPage());},
                          child: Center(
                            child: (
                                Text('Aluminum can', style: const TextStyle(fontFamily: kButtonFont, fontSize: 20.0, fontWeight: FontWeight.w600,)
                                )),
                          ))),
                  Spacer(),
                ])));
  }
}
class MyMetalPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
        appBar: AppBar(title: Text("sortAI"),),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
            child: Image.asset("assets/photo_2.jpeg"),
              height: 300,
              width: 200,
            ),
            Container(
             child: Text( "This type of garbage includes metal caps; \ncans and aluminum cans, foil. Before you get rid of them, rinse each jar. \nSqueeze aluminum cans as much as possible so that they take up as little space as possible. The condition of the scrap metal for release does not really matter - it is burnt, rusty.",
              style: const TextStyle(
                fontFamily: kButtonFont,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,),),

            ]
          ),
        )
    );
  }
}

class MyMedicalPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
    body: Center(
    child: Column(
    children: <Widget>[
    Container(
    alignment: Alignment.center,
    child: Image.asset("assets/photo_1.jpeg"),
    height: 300,
    width: 200,
    ),
    Container(
          child: Text("Medical syringes are objects with an approved hazard class. Self-disposal of the syringe is not possible, but there are practical ways to significantly reduce the harm caused:"
              "1) After using it, you can not immediately throw it into the trash; \n"
              "2) Separate the cap with the needle from the syringe; "
              "3) Place the needle in special containers - they are made of puncture-resistant plastic with a tight-fitting lid. In the absence of such containers, you can use a suitable container for detergent or other household chemicals made of durable plastic. \n"
              "4) When filling the container, you need to place it in the middle of the trash can. Never throw needles down the toilet. ",
            style: const TextStyle(
              fontFamily: kButtonFont,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,)

    )]
    )
      ),
    );
  }
}
class MyTetraPakPage extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text("sortAI"),),
      body: Center(
          child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/photo_1.jpeg"),
                  height: 300,
                  width: 200,
                ),
                Container(
                    child: Text("In Kazakhstan, packaging such as Tetra Pak, Pure-Pak, Elopak is processed at the Kazakhstan Waste Recycling paper mill. The paper layer is used to make new paper, and the plastic-aluminum mixture is used in the manufacture of tiles, hatches and is added to the asphalt surface. However, most locations do not accept this type of waste. If you find where they accept, then do not forget to rinse, dry and squeeze the package. If not, try reducing your intake.",
                      style: const TextStyle(
                        fontFamily: kButtonFont,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,)

                )]
          )
      ),
    );
  }
}
