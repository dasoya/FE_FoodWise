//
//  GoogleAPIREST.swift
//  FoodWise
//
//  Created by dasoya on 26.03.23.
//

//import Foundation
//import GoogleAPIClientForREST
//import GoogleSignIn
//
//func fetchImage(fileID: String, service: GTLRDriveService, completion: @escaping (UIImage?, Error?) -> Void) {
//    
//    let query = GTLRDriveQuery_FilesGet.query(forMediaWithFileId: fileID)
//    service.executeQuery(query) { (_, dataObject, error) in
//        guard error == nil else {
//            completion(nil, error)
//            return
//        }
//        
//        if let imageData = dataObject?.data, let image = UIImage(data: imageData) {
//            completion(image, nil)
//        } else {
//            completion(nil, NSError(domain: "Error converting data to image", code: 0, userInfo: nil))
//        }
//    }
//}
