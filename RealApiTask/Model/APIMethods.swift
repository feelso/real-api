//
//  APIMethods.swift
//  RealApiTask
//
//  Created by Arsen on 10/20/19.
//  Copyright © 2019 Arsen. All rights reserved.
//
import UIKit
import Foundation

enum Endpoint {
    
    case jsonFile
    
    
    var url: URL {
        return URL(string: self.stringValue)!
    }
    
    var stringValue: String {
        switch self {
        case .jsonFile:
            return "https://debug.pokerup.net/user/userdetails?version=3.1&user_id=301&login_id=301&resolution=2x"
        }
    }
}


class APIMethods {
  
    func getData() {
        let randomImageEndpoint = Endpoint.jsonFile.url
        
        let task = URLSession.shared.dataTask(with: randomImageEndpoint) { (data, response, error) in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            let imageData = try! decoder.decode(CustomJson.self,
                                                from: data)
            
            
            let data2 = imageData.duelProgress[0]
            let image2Link = data2.badge
            let task = URLSession.shared.dataTask(with: URL(string: image2Link)!,
                                                  completionHandler: { (data, response, error) in
                                                    
                                                    guard let data = data else { return }
                                                    
                                                    let downloadedImage = UIImage(data: data)
                                                    DispatchQueue.main.async {
                                                      //  self.imageView.image = downloadedImage
                                                    }
            })
            task.resume()
            
            
            //            let imageLink = imageData.profilePic
            //
            //            let task = URLSession.shared.dataTask(with: URL(string: imageLink)!,
            //                                                  completionHandler: { (data, response, error) in
            //
            //                                                    guard let data = data else { return }
            //
            //                                                    let downloadedImage = UIImage(data: data)
            //                                                    DispatchQueue.main.async {
            //                                                        self.imageView.image = downloadedImage
            //                                                    }
            //            })
            //            task.resume()
        }
        
        task.resume()
    }
    
}

