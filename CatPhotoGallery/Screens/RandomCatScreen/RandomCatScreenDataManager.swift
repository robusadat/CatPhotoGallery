//
//  RandomCatScreenDataManager.swift
//  CatPhotoGallery
//
//  Created by Sadat on 1/24/24.
//

import Foundation
import UIKit

struct RandomCatScreenDataManager {
    
    func getRandomCatImage(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: "https://cataas.com/cat") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error Downloading")
                completion(nil)
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                print("Error: HTTP Status Code is \(response.statusCode)")
                completion(nil)
            }
                        
            if let data = data,
               let image = UIImage(data: data) {
                completion(image)
            }
            
        }
        
        task.resume()
    }
}
