//
//  ImageLoader.swift
//  HotList-iOS
//
//  Created by NAHØM on 22/03/2023.
//

import UIKit

extension UIImageView{
    func loadImage(from urlString: String){
        let url = URL(string: urlString)
        let session = URLSession.shared
        
        let downloadTask = session.downloadTask(with: url!) { url, response, error in
            if let error = error{
                print(error.localizedDescription)
            }
            else if let response = response as? HTTPURLResponse, response.statusCode != 200{
                print("\(response.statusCode) - \(response.description)")
            }
            else if let url = url{
                do{
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        self.image = nil
        downloadTask.resume()
    }
}
