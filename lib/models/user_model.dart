import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String photo;
  // final String address;
  // final String city;
  // final String country;
  // final String zipCode;

 const UserModel({
    this.id,
    this.fullName = '',
    this.email = '',
   this.photo = '',
    // this.address = '',
    // this.city = '',
    // this.country = '',
    // this.zipCode = '',
  });

  static const empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? photo,
    // String? address,
    // String? city,
    // String? country,
    // String? zipCode,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      // address: address ?? this.address,
      // city: city ?? this.city,
      // country: country ?? this.country,
      // zipCode: zipCode ?? this.zipCode,
    );
  }


  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      id: snap.id,
      fullName: snap['fullName'],
      email: snap['email'],
      photo: snap['photo'],
      // address: snap['address'],
      // city: snap['city'],
      // country: snap['country'],
      // zipCode: snap['zipCode'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'fullName': fullName,
      'email': email,
      'photo': photo,
      // 'address': address,
      // 'city': city,
      // 'country': country,
      // 'zipCode': zipCode,
    };
  }

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
    photo,
        // address,
        // city,
        // country,
        // zipCode,
      ];
}
