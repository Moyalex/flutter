import 'package:flutter/material.dart';
import 'package:trial/src/screens/activities_user.dart';
import 'package:trial/src/screens/administer.dart';
import 'package:trial/src/screens/login.dart';
import 'package:trial/src/screens/reasignar_actividades.dart';
import 'package:trial/src/screens/reportes.dart';
import 'package:trial/src/screens/results.dart';
import 'package:trial/src/screens/validar_actividades.dart';


Map<String,WidgetBuilder> getApplicationRoutes(){

      return <String,WidgetBuilder>{ 
        '/'       :(BuildContext context) =>Login(),
        'activities'       :(BuildContext context) =>ActivitiesUser(),
        'administer'       :(BuildContext context) =>Administer(),
        'results'       :(BuildContext context) =>Results(),
        'reports'       :(BuildContext context) =>Reportes(),
        'valid'       :(BuildContext context) =>ValidarActividades(),
        'reasign'       :(BuildContext context) =>ReAsignarActividades(),
      };

}