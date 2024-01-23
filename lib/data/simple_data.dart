/*
sırayla DashboardContainerModel ,DashboardDetailModel
TitleItem,angerList dataalrın oldugu yer
*/
import 'package:flutter_application_1/model/dashboard_model.dart';
import 'package:flutter_application_1/model/listwiew_model.dart';
import 'package:flutter_application_1/screen/angerlist.dart';

final List<DashboardContainerModel> dashboardContainers = [
  DashboardContainerModel(
    image: "assets/servise_hazir.png",
    text: "Servise Hazır",
    count: 4,
  ),
  DashboardContainerModel(
    image: "assets/dsuk_uyarisi.png",
    text: "Düşük Uyarı",
    count: 4,
  ),
  DashboardContainerModel(
    image: "assets/kist_uyarisi.png",
    text: "Kist Uyarısı",
    count: 4,
  ),
  DashboardContainerModel(
    image: "assets/yatma_istisnasi.png",
    text: "Yatma İstisnası",
    count: 4,
  ),
  DashboardContainerModel(
    image: "assets/hareket_artisi.png",
    text: "Hareket Artışı",
    count: 4,
  ),
  DashboardContainerModel(
    image: "assets/refah.png",
    text: "Refaf",
    count: 4,
  ),
  DashboardContainerModel(
    image: "assets/uyku_istisnasi.png",
    text: "Uyku İstisnası",
    count: 4,
  ),
  DashboardContainerModel(
    image: "assets/mastisis.png",
    text: "Mastits",
    count: 4,
  ),
  DashboardContainerModel(
    image: "assets/sutu_dusenler.png",
    text: "Sütü Düşenler",
    count: 4,
  ),

  // Add other DashboardContainerModels...
];

final List<DashboardDetailModel> dashboardDetailModel = [
  DashboardDetailModel(text1: 'Sağmal', text2: '200'),
  DashboardDetailModel(text1: 'Kuru', text2: '200'),
  DashboardDetailModel(text1: 'Düve', text2: '200'),
  DashboardDetailModel(text1: 'Buzağı', text2: '200'),
  DashboardDetailModel(text1: 'Besi', text2: '200'),
];

final List<TitleItem> titleItems = [
  const TitleItem(title: "Çiftlik No"),
  const TitleItem(title: "Grup"),
  const TitleItem(title: "Jinek No"),
];

final List<List<String>> angerList = [
  ["004421", "Düve", "Gebe Düvedjdfjrfjrjfrjfoerj"],
  ["004422", "Düve", "Gebe Düve"],
  ["004423", "buzagı", "-"],
  ["004424", "Düve", "Gebe Düve"],
  ["004425", "Düve", "Gebe Düve"],
  ["004462", "Düve", "Gebe Düve"],
  ["004427", "Düve", "Gebe Düve"],
  ["004428", "Düve", "Gebe Düve"],
  ["004428", "kedi", "Gebe Düve"],
  ["004428", "Düve", "Gebe Düve"],
  ["004428", "Düve", "Gebe Düve"],
  ["004428", "Buzağı", "-"],
  ["004421", "Düve", "Gebe Düve"],
  ["004422", "Düve", "Gebe Düve"],
  ["004423", "Düve", "Gebe Düve"],
  ["004424", "Düve", "Gebe Düve"],
  ["004425", "Düve", "Gebe Düve"],
  ["004462", "Düve", "Gebe Düve"],
  ["004427", "Düve", "Gebe Düve"],
  ["004428", "Düve", "Gebe Düve"],
  ["004428", "kedi", "Gebe Düve"],
  ["004428", "Düve", "Gebe Düve"],
  ["004428", "Düve", "Gebe Düve"],
  ["004428", "Düve", "Gebe Düve"],
  ["004421", "Düve", "Gebe Düve"],
  ["004422", "Düve", "Gebe Düve"],
  ["004423", "Düve", "Gebe Düve"],
  ["004424", "Düve", "Gebe Düve"],
  ["004425", "Düve", "Gebe Düve"],
  ["004462", "Düve", "Gebe Düve"],
  ["004427", "Düve", "Gebe Düve"],
  ["004428", "Düve", "Gebe Düve"],
  ["004428", "kedi", "Gebe Düve"],
  ["004428", "Düve", "Gebe Düve"],
  ["004428", "Düve", "Gebe Düve"],
  ["004428", "Düve", "Gebe Düve"],
];
