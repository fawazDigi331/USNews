//
//  ApiClient.swift
//  USNews
//
//  Created by D&C Dev on 25/08/2021.
//

import Foundation

class ApiClient {
    
    func getArticles (url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(Articles.self, from: data)
                if let articleList = articleList {
                    completion(articleList.all)
                }
                print(articleList ?? [])
            }
        }.resume()
    }
}
