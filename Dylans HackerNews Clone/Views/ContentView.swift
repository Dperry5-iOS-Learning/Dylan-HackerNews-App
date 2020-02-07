//
//  ContentView.swift
//  Dylans HackerNews Clone
//
//  Created by Dylan Perry on 2/6/20.
//  Copyright © 2020 Dylan Perry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    var networkManager = NetworkManager()
        
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                       Text("\(post.points)")
                       Text(post.title)
                   }
                }
            }
            .navigationBarTitle("DP's HackerNews")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

// Allows list to recognize orders of post object based on id





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
