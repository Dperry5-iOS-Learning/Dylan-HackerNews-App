//
//  PostData.swift
//  Dylans HackerNews Clone
//
//  Created by Dylan Perry on 2/6/20.
//  Copyright © 2020 Dylan Perry. All rights reserved.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}


struct Post: Decodable, Identifiable {
    let points: Int
    let title: String
    let url: String?
    let objectID: String
    var id: String {
        return objectID
    }
    
    
    
}
