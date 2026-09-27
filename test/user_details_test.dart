

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_pro/core/networking/api_client.dart';
import 'package:test_pro/testing/user.dart';
import 'package:test_pro/testing/user_details_repository.dart';


class MockClient extends Mock implements APIClient{}
class MockDio extends Mock implements Dio {}


late UserDetailsRepository userRepo;
late MockClient mockClient;
late MockDio mockDio;

void _mockGetAPI({required String endPoint, required int statusCode, Map<String, dynamic>? data}) {
      when(
        () => mockDio.get(endPoint)
      ).thenAnswer((res)async{
        return Response(
          data: data ?? {}, 
          statusCode: statusCode, 
          requestOptions: RequestOptions(path: endPoint)
        );
      });
}

void main(){

  setUp(() {
    mockClient = MockClient();
    mockDio = MockDio();

    // 2. Stub the sendRequest getter to return our MockDio instance
    when(() => mockClient.sendRequest).thenReturn(mockDio);
    
    userRepo = UserDetailsRepository(mockClient);
  });

  group("user details testing - ",(){
    test("fetching user from the server, parsing the details and expecting the user.", ()async{

      _mockGetAPI(
        endPoint: "/users/1", 
        statusCode: 200,
        data: {
          "id": 1,
          "name": "Kumar Pawar",
          "username": "Bret",
          "email": "Sincere@april.biz"
        }
      );

      final result = await userRepo.getUsers("1");

      expect(result, isA<User>());
      
    });

  });


}