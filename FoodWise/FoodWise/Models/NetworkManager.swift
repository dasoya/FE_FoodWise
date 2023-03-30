//
//  NetworkManager.swift
//  FoodWise
//
//  Created by dasoya on 22.02.23.
//

import Foundation
import UIKit
import SwiftUI

struct Wrapper<T:Decodable> : Decodable{
    let items : [T]
}



struct Resource<T> {
    let url: URL
    // Other properties and methods
}

protocol APIResource {
    
    associatedtype ModelType: Decodable
    var methodPath: String {get}
    var filter: String? {get}
    
}

extension APIResource {
    var url: URL {
        var components = URLComponents(string: "http://34.64.139.210")!
        components.path = methodPath
        return components.url!
    }
}

struct RecipesResource: APIResource {
    
    typealias ModelType = RecipeAPIModel
    var id : Int?
    
    var methodPath: String{
        guard let id = id else {
            return "/recipe/recommend"
            
        }
        
        return "/recipe/\(id)"
    }
    
    var filter: String?
}

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func execute(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    fileprivate func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _ , _) -> Void in
            guard let data = data else { return }
                    
            guard let value = self?.decode(data) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
        
            DispatchQueue.main.async { completion(value) }
               
        }
        task.resume()
    }
}



class APIRequest<Resource: APIResource>{

    let resource: Resource

    init(resource: Resource){
        self.resource = resource
    }

}

extension APIRequest: NetworkRequest {

    func decode(_ data: Data) -> [Resource.ModelType]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let wrapper = try? decoder.decode(Wrapper<Resource.ModelType>.self, from: data)
        
        guard let wrapper = wrapper else {
            print("recipe decode fail")
            return nil }
        
        return wrapper.items
       
    }

    func execute(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void){
        load(resource.url, withCompletion: completion)
    }
}

class ImageRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
}

extension ImageRequest: NetworkRequest {
    func decode(_ data: Data) -> Image? {
        let str = String(decoding: data, as: UTF8.self)
        print("^^^"+str)
    do {
        guard let image = UIImage(data: data, scale: 1.0) else {
            print("Unsupported image format")
            return nil }
        return Image(uiImage: image)
    } catch let error {
            print("Error decoding image: \(error)")
            return nil
        }
    }
    
    func execute(withCompletion completion: @escaping (Image?) -> Void) {
        load(url, withCompletion: completion)
    }
}
