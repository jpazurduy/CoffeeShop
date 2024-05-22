//
//  FirebaseFirestoreHelper.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/15/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

enum FirebaseCollectionReference: String {
    case Order
    case Drinks
}

class FirebaseFirestoreHelper {
    static func firebaseReference(_ collectionReference: FirebaseCollectionReference) async ->  CollectionReference {
        let db = Firestore.firestore()
        let result = db.collection(collectionReference.rawValue)
        return result
    }
}
