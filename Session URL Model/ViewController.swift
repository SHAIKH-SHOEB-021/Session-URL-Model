//
//  ViewController.swift
//  Session URL Model
//
//  Created by shoeb on 07/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    struct userData : Codable{
        let id : Int
        let name : String
        let gender : String
        let status : String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getApiData()
    }

    func getApiData(){
        let url = URL(string: "https://gorest.co.in/public/v2/users")
        let task = URLSession.shared.dataTask(with: url!){
            data, response, error in
            let decoder = JSONDecoder()
            if let data = data {
                do{
                    let tasks = try decoder.decode([userData].self, from: data)
                    tasks.forEach{i in
                        print(i.gender)
                    }
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
    }

}
