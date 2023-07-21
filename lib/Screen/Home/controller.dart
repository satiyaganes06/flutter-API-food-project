 
import 'package:food_list_api_app/Api/food_detail_api.dart';
import 'package:food_list_api_app/Model/food.dart';
import 'package:food_list_api_app/Model/product.dart';
import 'package:get/state_manager.dart';


class HomeController extends GetxController {
  RxBool selected = false.obs;

  onTapFunction(){
    selected.value = !selected.value;
  }


  RxBool loading = false.obs;
  var foodList = [].obs;

  HomeController(){
    loadFoodFromRes();
  }
  
  loadFoodFromRes() async {
    loading(true);
    foodList.value = await FoodApi.getFoodDetail();
    loading(false);
  }
}