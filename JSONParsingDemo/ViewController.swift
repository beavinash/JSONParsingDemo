//
//  ViewController.swift
//  JSONParsingDemo
//
//  Created by Avinash Reddy on 12/30/18.
//  Copyright © 2018 Avinash Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadJSONData()
    }

    func loadJSONData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            do {
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                print("JSON Response: \(jsonResponse)")
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                print("JsonArray: \(jsonArray)")
//                guard let title = jsonArray[0]["title"] as? String else { return }
//                print("Title: \(title)")
                
                var model = [User]()
                
                model = jsonArray.compactMap{User($0)}
                print("USERID: \(model[0].userID)")
                
//                // Display all title
//                for dic in jsonArray {
//                    guard let title = dic["title"] as? String else { return }
//                    print("Title: \(title)")
//                }
                
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
            
            
        }
        task.resume()
        
        
    }
}

