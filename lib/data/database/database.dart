// ignore_for_file: non_constant_identifier_names

//  APEX
import 'package:tree_view_application/data/database/apex/locations.dart' as al;
import 'package:tree_view_application/data/database/apex/assets.dart' as aa;

//  TOBIAS
import 'package:tree_view_application/data/database/tobias/assets.dart' as at;
import 'package:tree_view_application/data/database/tobias/locations.dart'
    as lt;

// JAGUAR
import 'package:tree_view_application/data/database/jaguar/locations.dart'
    as lj;
import 'package:tree_view_application/data/database/jaguar/assets.dart' as aj;

class Database {
  static final APEX = {
    "locations": al.locations,
    "assets": aa.assets,
  };

  static final TOBIAS = {
    "locations": lt.location,
    "assets": at.assets,
  };

  static final JAGUAR = {
    "assets": aj.assets,
    "locations": lj.locations,
  };
}
