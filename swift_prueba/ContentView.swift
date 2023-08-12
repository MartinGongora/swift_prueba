//
//  ContentView.swift
//  swift_prueba
//
//  Created by Martin Gongora on 05/08/2023.
//

import SwiftUI

struct Photo {
    let id: String
    let author: String
    let width: Int
    let heigth: Int
    let url: String
    let download_url: String
}

let photos = [
    Photo(id: "1", author: "yo", width: 300, heigth: 300, url: "algo.com", download_url: "algo.com"),
    Photo(id: "2", author: "yo", width: 300, heigth: 300, url: "algo.com", download_url: "algo.com"),
    Photo(id: "3", author: "yo", width: 300, heigth: 300, url: "algo.com", download_url: "algo.com"),
    Photo(id: "4", author: "yo", width: 300, heigth: 300, url: "algo.com", download_url: "algo.com"),
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                ForEach(photos, id: \.id){ photo in
                    NavigationLink(photo.id + " " + photo.author, destination: Text("some info"))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

