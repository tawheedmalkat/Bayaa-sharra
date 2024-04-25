import 'package:ecomm/Modules/Auth/Sign-In/sign-in-screen.dart';
import 'package:ecomm/Modules/Auth/Sign-Up/sign-up-screen.dart';
import 'package:ecomm/Modules/NavBar/nav-screen.dart';

import 'package:ecomm/Modules/Screens/home.dart';
import 'package:ecomm/Modules/start-screen/begining-screen.dart';
import 'package:get/get.dart';


import '../Modules/Categories/productsscreen.dart';
import '../Modules/Screens/add.dart';
import '../Modules/Screens/favoitre.dart';


import '../ScreensForProfile/Profilemycontroller/profile.dart';
import '../ScreensForProfile/favoritepage.dart';
import '../ScreensForProfile/myProfile.dart';
import '../ScreensForProfile/reviewspage.dart';
class AppPage{
  static String start='/';
  static String navbar='/navbar';
  static String home='/Home';
  static String add='/Add';
  static String profil='/profil';
  static String categoryee='/categoryee';
  static String favorite='/favorite';
  static String signin='/signin';
  static String signup='/signup';
  static String favor='/Favoritee';
  static String reviews='/myreview';
  static String myProf='/myprofilee';
  //
static gethome()=>Home;
  static getNave()=>NavBar;
static getstart()=>Start;
static getfavorite()=>Favorite;
  static getadd()=>Add;
  static getProfile()=> Profile;
  static getcategoryee()=>Categoryee ;
  static getsignin()=>SignInScreen;
  static getsignup()=>SignUpPage;
  static getfavoritee()=>FavoritePage ;
  static getreviews()=>MyReviewsPage ;
  static getmyProf()=>MyProfilePage;
//
static List<GetPage> routes=[
  GetPage(name: start, page: ()=>Start()),
  GetPage(name: home, page: ()=>Home()),
  GetPage(name:add , page: ()=>Add()),
  GetPage(name: profil, page: ()=>Profile()),
  GetPage(name: favorite, page: ()=>Favorite()),
  GetPage(name: signin, page:()=> SignInScreen()),
 GetPage(name: signup, page: ()=>SignUpPage()),
  GetPage(name: categoryee, page: ()=>Categoryee()),
  GetPage(name: navbar, page: ()=>NavBar()),
  GetPage(name: myProf, page: ()=>MyProfilePage()),
  GetPage(name: reviews, page: ()=>MyReviewsPage()),
  GetPage(name: favor, page: ()=>FavoritePage()),

];

}