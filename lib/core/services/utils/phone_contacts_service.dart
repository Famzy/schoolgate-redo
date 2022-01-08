// import 'package:contacts_service/contacts_service.dart';
// import 'package:sproutly/core/network/network_provider.dart';
//
// import 'package:oktoast/oktoast.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class PhoneContactsService {
//   NetworkProvider _networkProvider = NetworkProvider();
//   Future<bool> setupPermissions() async {
//     // check if contact permission exists
//     PermissionStatus permission = await Permission.contacts.request();
//     // if permission is not granted
//     if (permission != PermissionStatus.granted) {
//       // request permission
//       Map<Permission, PermissionStatus> permissions = await [
//         Permission.contacts,
//         Permission.camera,
//         Permission.sms,
//         Permission.notification,
//         Permission.mediaLibrary
//       ].request();
//       // if not granted
//       if (await Permission.contacts.request().isGranted != true) {
//         showToastWidget(
//           ToastWidget(type: 'error', description: "No access to contacts"),
//           duration: Duration(seconds: 3),
//         );
//         return false;
//       }
//       return true;
//     }
//     return true;
//   }
//
//   readContacts() async {
//     List<String> parsedContacts = [];
//     List<String> duplicateBuffer = [];
//     bool canRead = await setupPermissions();
//     if (canRead == true) {
//       Iterable<Contact> contacts = await ContactsService.getContacts(
//           withThumbnails: false, photoHighResolution: false);
//       contacts.forEach((Contact contact) {
//         // for the phone numbers
//         contact.phones!.forEach((f) async {
//           if (!duplicateBuffer.contains({
//             "phone": f.value!.trim().replaceAll(" ", ""),
//             "display_name": contact.displayName
//           }.toString())) {
//             duplicateBuffer.add({
//               "phone": f.value!.trim().replaceAll(" ", ""),
//               "display_name": contact.displayName
//             }.toString());
//             parsedContacts.add(f.value!.trim().replaceAll(" ", ""));
//           }
//         });
//       });
//       return parsedContacts;
//     }
//     return false;
//   }
//
//   Future<List<String>> sanitizePhoneContacts() async {
//     List<String> newContacts = [];
//     newContacts = await readContacts();
//     return newContacts;
//   }
//
//   Future<bool> isInPhoneContacts(String number) async {
//     Iterable<Contact> contacts =
//         await ContactsService.getContacts(query: number);
//     if (contacts.length > 0) {
//       return true;
//     }
//     return false;
//   }
//
//   Future<SyncResult> syncContacts() async {
//     SyncResult result = SyncResult();
//     try {
//       List<String> contacts = await sanitizePhoneContacts();
//       Map<String, dynamic> payload = {"phone_numbers_array": contacts};
//       if (contacts.length > 0) {
//         var data = await _networkProvider.call(
//             "/api/v1/accounts-v/get-list-of-users-with-phone-numbers",
//             RequestMethod.post,
//             data: payload);
//         result = SyncResult.fromJson(data.data);
//         return result;
//       }
//       return result;
//     } on Exception catch (e, stack) {
//       print(e.toString());
//       print(stack.toString());
//       return SyncResult();
//     }
//   }
// }
