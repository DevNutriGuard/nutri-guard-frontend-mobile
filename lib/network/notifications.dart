
// class FirebaseMessagingService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   static final _notifications = FlutterLocalNotificationsPlugin();
//   bool resultNotified = false;
//
//   Future<String?> getFirebaseToken() async {
//     String? deviceId;
//     try {
//       NotificationSettings notificationSettings =
//       await _firebaseMessaging.requestPermission();
//       if (notificationSettings.authorizationStatus ==
//           AuthorizationStatus.authorized) {
//         if (Platform.isIOS) {
//           deviceId = await _firebaseMessaging.getAPNSToken();
//           await Future<void>.delayed(
//             const Duration(
//               seconds: 1,
//             ),
//           );
//           deviceId = await _firebaseMessaging.getToken();
//           debugPrint("Autherized Token");
//         } else {
//           deviceId = await _firebaseMessaging.getToken();
//         }
//       } else {
//         debugPrint('Notifications are not allowed on iOS.');
//         deviceId = await _firebaseMessaging.getToken();
//         debugPrint("Device=====>$deviceId");
//       }
//       if (deviceId != null) {
//         PreferenceUtils.setString(Strings.deviceId, deviceId);
//       }
//       return deviceId;
//     } catch (e) {
//       debugPrint('Error getting FCM token: $e');
//       return null;
//     }
//   }
//
//   Future<void> configureFirebaseMessaging() async {
//     await _firebaseMessaging.requestPermission();
//     await _firebaseMessaging.getToken();
//     _notifications
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.requestNotificationsPermission();
//
//     // const android = AndroidInitializationSettings("mipmap/ic_notification");
//     // const ios = DarwinInitializationSettings(
//     //   requestAlertPermission: true,
//     //   requestSoundPermission: false,
//     //   requestBadgePermission: true,
//     //   requestProvisionalPermission: true,
//     // );
//     // if (Platform.isIOS || Platform.isAndroid) {
//     //   await _notifications.initialize(
//     //     const InitializationSettings(
//     //       iOS: ios,
//     //       android: android,
//     //     ),
//     //     onDidReceiveNotificationResponse: (response) async {
//     //       debugPrint(" Working from Notification ${response.payload}");
//     //       // var feedProvider = navigatorKey.currentContext?.read<FeedsProvider>();
//     //       // if (response.payload != null) {
//     //       //   var value = feedProvider?.notificationData;
//     //       //   String? data;
//     //       //   int? postId, userId;
//     //       //   try {
//     //       //     data = value?['type'].toString();
//     //       //     postId = int.parse(value?['post_id']);
//     //       //     userId = int.parse(value?['user_id']);
//     //       //   } catch (e) {
//     //       //     debugPrint("Some Thing went wrong");
//     //       //     return;
//     //       //   }
//     //       //   if (data == "Follow Requested") {
//     //       //     navigatorKey.currentState
//     //       //         ?.push(SlideRightRoute(page: FollowingListScreen()));
//     //       //   } else if (data == "Followed By Someone") {
//     //       //     navigatorKey.currentState
//     //       //         ?.push(SlideRightRoute(page: FollowersListScreen()));
//     //       //   } else if (data == "Follow Request Approved") {
//     //       //     navigatorKey.currentState?.push(
//     //       //       SlideRightRoute(
//     //       //         page: OtherUserProfile(
//     //       //           userId: userId,
//     //       //         ),
//     //       //       ),
//     //       //     );
//     //       //   } else {
//     //       //     feedProvider?.singlePostIndicatorVal = 0;
//     //       //     feedProvider?.getSinglePost(postId);
//     //       //     feedProvider?.getAllCommentsOfPost(postId);
//     //       //     navigatorKey.currentState
//     //       //         ?.push(SlideRightRoute(page: SinglePostView()));
//     //       //   }
//     //       //   // provider.setNotificationAsSeen(data?.id??0);
//     //       //   feedProvider?.notificationData = data = userId = postId = null;
//     //       // }
//     //     },
//     //   );
//     // }
//
//     await initPushNotifications();
//   }
//
//
//   Future initPushNotifications() async {
//     _firebaseMessaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
//       debugPrint("1");
//       if (message != null) {
//         firebaseOnAppOpened(message);
//       }
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       firebaseOnAppOpened(event);
//     });
//
//
//     FirebaseMessaging.onMessage.listen((event) async {
//       showNotification(event);
//     });
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//   }
//
//   Future<void> showNotification(RemoteMessage message) async {
//     final title = message.notification?.title;
//     final body = message.notification?.body;
//     int id = DateTime.now().second;
//     final payload = jsonEncode(message.data);
//     AndroidNotificationDetails androidNotificationDetails =
//     const AndroidNotificationDetails(
//       "channelId",
//       "channelName",
//       importance: Importance.high,
//       priority: Priority.high,
//       channelDescription: "Description",
//       playSound: true,
//       icon: "mipmap/ic_notification",
//     );
//     DarwinNotificationDetails iosNotificationDetails =
//     const DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );
//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: iosNotificationDetails,
//     );
//     if (!Platform.isIOS) {
//       debugPrint("Notification Working");
//       _notifications.show(id, title, body, notificationDetails,
//           payload: payload);
//     }
//   }
//
//   void firebaseOnAppOpened(RemoteMessage message)  async{
//     debugPrint(message.toMap().toString());
//     var p = navigatorKey.currentContext?.read<FeedsProvider>();
//     p?.notificationData=  message.data;
//     debugPrint("My Data===> ${p?.appLifecycleState}");
//    if(p?.appLifecycleState == AppLifecycleState.detached){
//      debugPrint("Working for IOS Or Kill Mode");
//     navigatorKey.currentState?.push(MaterialPageRoute(builder: (_)=> SplashScreen(fromNotification: true,) ));
//     }else{
//      debugPrint("Working for IOS");
//      NotificationNavigation.moveToNextScreen(replace: false);
//    }
//   }
//
// }
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   debugPrint('New Message found');
// }

