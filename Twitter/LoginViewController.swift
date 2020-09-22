//
//  LoginViewController.swift
//  Twitter
//
//  Created by Melissa on 9/21/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "LoginToHome", sender: self)
        }
    }
    
    @IBAction func OnLoginButton(_ sender: Any) {
        
        let requestURL = "https://api.twitter.com/oauth/request_token"
        
        UserDefaults.standard.set(true, forKey: "userLoggedIn")
        
        TwitterAPICaller.client?.login(url: requestURL, success: {
            self.performSegue(withIdentifier: "LoginToHome", sender: self)}, failure: { (Error) in
            print("Could not login.\n")
        })
        
    }

}
