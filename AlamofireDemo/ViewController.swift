//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by Muhammad Hassan on 17/03/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    // text boxes and button insilization
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
         
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func postMethod() {
        let params: Parameters = [
            "email": txtEmail.text!,
            "password": txtPassword.text!, ]
        
        AF.request("http://198.101.12.193:30000/auth/token", method: .post,  parameters: params, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        if let json = value as? [String: Any] {
                            print(json["access_token"] as? String ?? String())
                            let newtoken = json["access_token"] as? String
                            
                            if newtoken != nil
                            { self.alertcall(msg: "success") }
                            
                            else
                            { self.alertcall(msg: "failure") }
                        }
                    case .failure(let error):
                        print(error)
            }
        }
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) { postMethod() }
    
    
    func alertcall(msg:String)
    {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
        
    }

}

