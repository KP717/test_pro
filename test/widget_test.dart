
import 'package:flutter_test/flutter_test.dart';
import 'package:test_pro/testing/user_details.dart';

void main(){

  late UserDetails uDetails;

  setUp((){
    uDetails = UserDetails();
  });



  group("User Details testing - ",(){

    test("Given a user details instance, default name should be Kumar",(){
      expect(uDetails.name, "Kumar");
    });


    test("Given a user details instance, updating name, it should be Vishal",(){

      uDetails.setName("Vishal");
      expect(uDetails.name, "Vishal");
    });
  });


  tearDown((){
    uDetails.eraseName();
  });

}