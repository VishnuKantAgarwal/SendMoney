
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../model/balance/balance.dart';
import '../model/transaction/transaction.dart';
import '../model/user/users.dart';
import 'constants.dart';


part 'api_client.g.dart';

@RestApi(baseUrl: api_url)
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("users")
  Future<List<Users>> users(@Query("username") String username, @Query("password") String password);

  @GET("balance/{id}")
  Future<Balance> balance(@Path("id") int id);

  @POST("transaction")
  Future<Transaction> transaction(@Body() dynamic request);

  @GET("transaction/{id}")
  Future<Transaction> getTransaction(@Path("id") int id);

/*@POST("Account/registration")
  Future<String> signup(@Body() SignupRequest request);

  @GET("ResearchProgram/getPrograms")
  Future<List<ProgramResult>> getPrograms();

  @POST("ResearchProgram/createProgram")
  Future<String> createProgram(@Body() ProgramResult request);

  @PUT("ResearchProgram/updateProgram")
  Future<String> updateProgram(@Body() ProgramResult request);

  @DELETE("ResearchProgram/deleteProgram/{id}")
  Future<String> deleteProgram(@Path("id") int id);

  @GET("ResearchProgram/getParticipants")
  Future<List<ParticipantsResult>> getParticipants();

  @MultiPart()
  @POST("ResearchProgram/createParticipant")
  Future<CreateParticipantResponse> createParticipant(@Body() FormData formData);
*/
}
