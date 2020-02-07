//
//  NetworkManager.swift
//  Dylans HackerNews Clone
//
//  Created by Dylan Perry on 2/6/20.
//  Copyright © 2020 Dylan Perry. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published
    var posts = [Post]()
    
    
    func fetchData(){
        
        //https://hn.algolia.com/api/v1/search?tags=front_page
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else {
            print("invalid URL!")
            return
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data  {
                    do {
                       let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                        
                    } catch {
                        print(error)
                    }
                }
                
            } else {
                print("No data returned")
            }
        }
        
        task.resume()
    }
}
