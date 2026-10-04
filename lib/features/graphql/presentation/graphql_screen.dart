


import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_pro/testing/user.dart';

class GraphQLScreen extends StatefulWidget{

  const GraphQLScreen({super.key});

  @override
  State<GraphQLScreen> createState()=> _GraphQLScreenState();
}

class _GraphQLScreenState extends State<GraphQLScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("GraphQL"),),
      body: Query(
        options: QueryOptions(document: gql("""
            query {
              characters {
                results {
                  id
                  name
                  image
                  species
                }
              }
            }
          """)
        ), 
        builder: (result, {refetch, fetchMore}){
          print("GraphQL result: $result");

          if(result.isLoading){
            return Center(child: CircularProgressIndicator(),);
          }

          if(result.hasException){
            return Center(child: Text("Exception: ${result.exception.toString()}"));
          }

          final data = result.data?['characters']?['results'] as List?;

          if (data == null || data.isEmpty) {
            return const Center(child: Text('No characters found!'));
          }



          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final character = data[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(character['image']),
                ),
                title: Text(character['name']),
                subtitle: Text('Species: ${character['species']}'),
              );
            },
          );
        }
      )
    );
  }
}