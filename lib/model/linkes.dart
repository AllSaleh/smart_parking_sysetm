class Applinks {
  static const String serverlink = 'http://10.0.2.2/smart_parking';
  static const String usersImaesLink = '$serverlink/useriamges';
  static const String disponseImaesLink = '$serverlink/despons _images';

  // ================== user links ========================//

  //auth

  static const Signup = '$serverlink/user/auth/signup.php';
  static const Login = '$serverlink/user/auth/login.php';

  // ==================user
  static const add_amount_link = '$serverlink/user/add_amount.php';
  static const displaybooking_link = '$serverlink/user/diplay_ordres.php';
  static const displayaccount_link =
      '$serverlink/user/account/dsiplay_account.php';
  static const display_notification =
      '$serverlink/user/display_notification.php';
  static const edit_account = '$serverlink/user/account/edite_account.php';
  static const display_bilds = '$serverlink/user/display_builds.php';
  static const display_parks = '$serverlink/user/display_parks.php';
  static const do_booking = '$serverlink/user/do_booking.php';

  // ============================admin links=============//

  //================== resports ======================//

  static const Admin_userreports =
      '$serverlink/admin/reports/users_reports.php';
  static const Admin_moneyreports =
      '$serverlink/admin/reports/revenue_reports.php';

  static const Admin_login = '$serverlink/admin/login.php';
  //    building
  static const Admin_add_build = '$serverlink/admin/building/add_build.php';
  static const Admin_delete_build =
      '$serverlink/admin/building/delete_building.php';
  static const Admin_display_builds =
      '$serverlink/admin/building/display_building.php';

  // super
  static const Admin_add_super = '$serverlink/admin/supers/add_super.php';
  static const Admin_delete_super = '$serverlink/admin/supers/delete_super.php';
  static const Admin_display_supers =
      '$serverlink/admin/supers/display_supers.php';

  // ======================= superviser ================//

  static const super_login = '$serverlink/super/login.php';
  static const display_ordrs = '$serverlink/super/blances/display_blances.php';
  static const add_blance = '$serverlink/super/blances/add_blance.php';
  static const reject_order = '$serverlink/super/blances/send_notification.php';
  static const accept_order = '$serverlink/super/blances/send_accpet_notif.php';
  static const display_park_super =
      '$serverlink/super/parking/display_parking.php';
  static const delete_park_super = '$serverlink/super/parking/delete_park.php';
  static const display_build_super =
      '$serverlink/super/parking/dispaly_bulding_super.php';
        static const add_parking =
      '$serverlink/super/parking/add_park.php';
}
