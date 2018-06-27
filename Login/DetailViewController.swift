//
//  DetailViewController.swift
//  Login
//
//  Created by SWUCOMPUTER on 2018. 5. 29..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var textName: UILabel!
    @IBOutlet var textDate: UILabel!
    @IBOutlet var textDescription: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    
    var selectedData: FavoriteData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let favoriteData = selectedData else { return }
        textName.text = favoriteData.name
        textDate.text = favoriteData.date
        textDescription.numberOfLines = 0 // multiple lines
        textDescription.text = favoriteData.descript
        var imageName = favoriteData.image // 숫자.jpg 로 저장된 파일 이름
        if (imageName != "") {
            let urlString = "http://10.0.3.8:8888/favorite/"
            imageName = urlString + imageName
            let url = URL(string: imageName)!
            if let imageData = try? Data(contentsOf: url) {
                imageView.image = UIImage(data: imageData)
                // 웹에서 파일 이미지를 접근함
            } }
    }

    @IBAction func buttonDelete() {
        let alert=UIAlertController(title:"정말 삭제 하시겠습니까?", message: "",preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .cancel, handler: { action in
            let urlString: String = "http://10.0.1.8:8888/favorite/deleteFavorite.php"
            guard let requestURL = URL(string: urlString) else { return }
            var request = URLRequest(url: requestURL)
            request.httpMethod = "POST"
            guard let favoriteNO = self.selectedData?.favoriteno else { return }
            let restString: String = "favoriteno=" + favoriteNO
            request.httpBody = restString.data(using: .utf8)
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (responseData, response, responseError) in guard responseError == nil else { return }
                guard let receivedData = responseData else { return }
                if let utf8Data = String(data: receivedData, encoding: .utf8) { print(utf8Data) }
            }
            task.resume()
            self.navigationController?.popViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
  

