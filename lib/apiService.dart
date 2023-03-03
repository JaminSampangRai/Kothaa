// ignore_for_file: avoid_print

import 'dart:convert';
// ignore: unused_import
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:kotha_new/config.dart';
import 'package:kotha_new/model/login_request_model.dart';
import 'package:kotha_new/model/login_response_model.dart';
import 'package:kotha_new/model/room_model.dart';
import 'package:kotha_new/model/signup_response_model.dart';
import 'package:kotha_new/sharedService.dart';

import 'model/signup_request_model.dart';

class APIService {
  static var client = http.Client();

  // ignore: duplicate_ignore
  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    // var url = Uri.http(Config.apiURL, Config.loginAPI);
    // var url = Uri.parse("${Config.apiURL}${Config.loginAPI}");
    // var url = Uri.parse(Config.apiURL + Config.loginAPI);
    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    // ignore:
    print(response.statusCode);
    // ignore:
    print(response.body);

    if (response.statusCode == 200) {
      //shared
      await SharedService.setLoginDetails(loginResponseJson(response.body));

      return true;
    } else {
      return false;
    }
  }

  static Future<SignupResponseModel> signup(SignupRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.signupAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    // // ignore:
    // print(response.statusCode);
    // print(response.body);

    // var data =  json.decode(response.body);
    // print(data['status']);

    // if (response.statusCode == 200) {
    //   // return response.body;
    // } else {
    //   return "";
    // }
    // return data;

    return signupResponseModel(response.body);
  }

//for room
  static Future<List<RoomModel>?> getRooms() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.RoomAPI);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return roomsFromJson(data("data"));
    } else {
      return null;
    }
  }

  // static Future<bool> saveRoom(
  //   RoomModel model,
  //   bool isEditMode,
  // ) async {
  //   var RoomAPI = Config.RoomAPI;
  //   if (isEditMode) {
  //     RoomAPI = RoomAPI + "/" + model.id.toString();
  //   }
  //   // Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
  //   var url = Uri.http(Config.apiURL, Config.RoomAPI);
  //   var requestMethod = isEditMode ? "PUT" : "POST";
  //   var request = http.MultipartRequest(requestMethod, url);
  //   request.fields["address"] = model.address!;
  //   request.fields["city "] = model.address!;
  //   request.fields["contact"] = model.contact!;
  //   request.fields["address"] = model.country;
  //   request.fields["address"] = model.id;
  //   request.fields["address"] = model.parkingType;
  //   request.fields["address"] = model.postalCode;
  //   request.fields["address"] = model.priceType;
  //   request.fields["address"] = model.roomDescription;
  //   request.fields["address"] = model.state;
  //   request.fields["address"] = model.street;
  //   request.fields["address"] = model.latitude.toString();
  //   request.fields["address"] = model.longitude.toString();
  //   request.fields["address"] = model.price.toString();
  //   request.fields["address"] = model.roomQuantity.toString();
  //   if(model.images != null) {
  // //     List<http.MultipartFile> files = [];
  // //      for (String imagePath in model.images) {
  // //   http.MultipartFile file = await http.MultipartFile.fromPath('Images', imagePath);
  // //   files.add(file);
  // // }

  //     http.MultipartFile multipartFile = await http.MultipartFile.fromPath('Images', model.images!,
  //     );
  //     request.files.add(multipartFile);
  //   }

  //   // var response = await client.get(url, headers: requestHeaders);
  //   var response = await request.send();

  //   if (response.statusCode == 200) {
  //     // var data = jsonDecode(response.body);

  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  static Future<bool> saveRoom(
    RoomModel model,
    bool isEditMode,
  ) async {
    var roomAPI = Config.RoomAPI;
    if (isEditMode) {
      roomAPI = roomAPI + "/" + model.id.toString();
    }

    var url = Uri.http(Config.apiURL, roomAPI);
    var requestMethod = isEditMode ? "PUT" : "POST";
    var request = http.MultipartRequest(requestMethod, url);

    request.fields["address"] = model.address!;
    request.fields["city"] = model.city!;
    request.fields["contact"] = model.contact!;
    request.fields["country"] = model.country!;
    request.fields["id"] = model.id.toString();
    request.fields["parkingType"] = model.parkingType!;
    request.fields["postalCode"] = model.postalCode!;
    request.fields["priceType"] = model.priceType!;
    request.fields["roomDescription"] = model.roomDescription!;
    request.fields["state"] = model.state!;
    request.fields["street"] = model.street!;
    request.fields["latitude"] = model.latitude.toString();
    request.fields["longitude"] = model.longitude.toString();
    request.fields["price"] = model.price.toString();
    request.fields["roomQuantity"] = model.roomQuantity.toString();

    if (model.images != null) {
      var multipartFiles = <http.MultipartFile>[];
      for (String imagePath in model.images!) {
        var file = await http.MultipartFile.fromPath('Images', imagePath);
        multipartFiles.add(file);
      }
      request.files.addAll(multipartFiles);
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteRoom(roomId) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.RoomAPI + "/" + roomId);
    var response = await client.delete(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
