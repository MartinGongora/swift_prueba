//
//  ViewModel.swift
//  swift_prueba
//
//  Created by Martin Gongora on 17/08/2023.
//

import Foundation

struct Photo: Decodable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let download_url: String
}


final class ViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    
    func getPhotos(){
        let url = URL(string: "https://picsum.photos/v2/list")
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: url!) { data, response, error in
            if let _ = error {
                print("Error")
            }
            
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    self.photos = try! JSONDecoder().decode([Photo].self, from: data)                }
                
            }
        }.resume()
    }
}
