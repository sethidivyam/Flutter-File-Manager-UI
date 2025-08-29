///================================== IMPORT =================================///
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

export "package:file_manager/Home.dart";
export "package:file_manager/main.dart";
export "package:flutter/material.dart";
export "package:url_launcher/url_launcher.dart";

///---------------------------------------------------------------------------///

///=============================== APP VERSION ===============================///
var app_version = 1.0;
var app_name = "File Manager";

///---------------------------------------------------------------------------///

///============================== COLOR VARIABLE =============================///
var color0 = Color.fromRGBO(255, 255, 255, 1);
var color1 = Color.fromRGBO(0, 0, 0, 1);
var color2 = Color.fromRGBO(25, 25, 25, 1);
var color3 = Color.fromRGBO(63, 63, 63, 1);
var color4 = Color.fromRGBO(39, 198, 210, 1);
var color5 = Colors.cyan[400]!;

///---------------------------------------------------------------------------///

///============================= CONTACT US EMAIL ============================///
void Contact_Email(mail_id, subject, body) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: mail_id,
    query: 'subject=${subject}&body=${body}',
  );

  var url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

///---------------------------------------------------------------------------///

///============================= CONTACT US EMAIL ============================///
void Contact_Phone(phone) async {
  final Uri params = Uri(
    scheme: 'tel',
    path: phone,
  );

  var url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

///---------------------------------------------------------------------------///

///========================= READ OUR PRIVACY POLICY =========================///
read_privacy_policy() async {
  var url = Uri.parse(
      "https://github.com/duecred/duecredprivacypolicy/blob/main/privacy-policy.md");
  await launchUrl(url);
}

///---------------------------------------------------------------------------///
