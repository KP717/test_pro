

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlManager {

  static ValueNotifier<GraphQLClient>? graphQLNotifier;

  static void init(){

    final HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');

    graphQLNotifier = ValueNotifier(
      GraphQLClient(
        link: httpLink, 
        cache: GraphQLCache(store: HiveStore())
      )
    );
  }

}