///================================== IMPORT =================================///
import 'package:file_manager/variable.dart';

///---------------------------------- IMPORT ---------------------------------///

button_pressed(var button) {
  print("$button button is pressed");
}

///================================ HOME PAGE ================================///
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  double _fontSize = 24.0; // Initial font size
  final int spaceUsed = 100;
  final int totalSpace = 128;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      if (_scrollController.offset > 0 && _scrollController.offset < 200) {
        _fontSize = 24.0 - (_scrollController.offset * 0.05);
      } else if (_scrollController.offset >= 200) {
        _fontSize = 16.0; // Minimum font size
      } else {
        _fontSize = 24.0; // Default font size when scrolled to the top
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,

      ///============================== APP BAR ===============================//
      appBar: AppBar(
        backgroundColor: color1,
        centerTitle: false,
        elevation: 0,
        iconTheme: IconThemeData(color: color0),
        title: Text(
          '$app_name',
          style: TextStyle(
              color: color0, fontWeight: FontWeight.bold, fontSize: _fontSize),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),

      ///------------------------------ APP BAR -------------------------------//

      ///================================ BODY ================================//
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildSearchField(searchController),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    _buildStorageCard("Device Storage", spaceUsed, totalSpace),
                    _buildStorageCard("NAS", 10000, 1000),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    _buildFormatCard("Photos", "assets/photo.png", 23443323),
                    _buildFormatCard("Videos", "assets/video.png", 232434),
                    _buildFormatCard("Audio", "assets/audio.png", 234),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    _buildFormatCard(
                        "Documents", "assets/document.png", 2344823),
                    _buildFormatCard("APKs", "assets/apk.png", 20),
                    _buildFormatCard("Archives", "assets/archieve.png", 234),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child:
                  Text("  " * 4 + "Sources", style: TextStyle(color: color0)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: color2,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSourceCard("Whatsapp", "assets/whatsapp.png"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      child: Divider(
                        color: color3,
                      ),
                    ),
                  ),
                  _buildSourceCard("Download", "assets/download.png"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      child: Divider(
                        color: color3,
                      ),
                    ),
                  ),
                  _buildSourceCard("Bluetooth", "assets/bluetooth.png"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: color2,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSourceCard("Private Safe", "assets/private_safe.png"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      child: Divider(
                        color: color3,
                      ),
                    ),
                  ),
                  _buildSourceCard(
                      "Recently Deleted", "assets/recycle_bin.png"),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),

      ///-------------------------------- BODY --------------------------------//
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

///-------------------------------- HOME PAGE --------------------------------///

///============================== SEARCH FIELD ==============================//
Widget _buildSearchField(TextEditingController searchController) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextField(
      controller: searchController,
      style: TextStyle(color: color0),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: color0),
        contentPadding: const EdgeInsets.all(10.0),
        filled: true,
        fillColor: color2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search',
        hintStyle: TextStyle(color: color0),
      ),
    ),
  );
}

///------------------------------ SEARCH FIELD ------------------------------//

///============================== STORAGE CARD ==============================//
Widget _buildStorageCard(var storage_name, int spaceUsed, int totalSpace) {
  return Container(
    margin: EdgeInsets.all(10),
    constraints: BoxConstraints(maxWidth: 250),
    decoration: BoxDecoration(
      color: color2,
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "$storage_name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color0,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "$spaceUsed GB / $totalSpace GB",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color4,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: LinearProgressIndicator(
            value: (spaceUsed / totalSpace),
            backgroundColor: color3,
            color: color4,
            minHeight: 8,
          ),
        ),
        SizedBox(height: 10)
      ],
    ),
  );
}

///------------------------------ STORAGE CARD ------------------------------//

///=============================== FORMAT CARD ================================//
Widget _buildFormatCard(var format_name, var image_path, int totalitem) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color2,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                '$image_path',
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "$format_name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "$totalitem",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color4,
              ),
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    ),
  );
}

///-------------------------------- FORMAT CARD -------------------------------//

///============================== SOURCES CARD ================================//
Widget _buildSourceCard(var source_name, var image_path) {
  return ElevatedButton(
    onPressed: button_pressed("whatsapp"),
    child: Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                '$image_path',
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "$source_name",
            style: TextStyle(color: color0),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: color3,
          ),
        ],
      ),
    ),
  );
}

///-------------------------------- SOURCES CARD ------------------------------//
