import 'package:go_router/go_router.dart';
import 'package:go_router_practise/screens/category_screen.dart';
import 'package:go_router_practise/screens/login.dart';
import 'package:go_router_practise/screens/products_screen.dart';

class AppRouter{
final GoRouter  router = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context,state){
        return const LoginScreen();
      }),
    GoRoute(
        path: '/',
    builder: (context,state){
      return const CategoryScreen();
    }
    ,routes:[
    GoRoute(path: 'product_list/:category',
        name:'product_list',
        builder: (context,state){
          return   ProductListScreen(
            category: state.params['category']!,
            asc: state.queryParams['sort'] == 'asc',
            quantity: int.parse(state.queryParams['filter']??'0'),

          );
        }
    ),
  ],
    ),
  ],
  redirect: (context,state){
    const bool loggedIn =true;
    final bool loggingIn = state.subloc == '/login';

  // if(!loggedIn) {
  //   return loggingIn ? null : '/login';
  // }
    if(loggingIn){
    return '/';
  }
    return null;
}
);}