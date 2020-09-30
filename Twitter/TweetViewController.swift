//
//  TweetViewController.swift
//  Twitter
//
//  Created by Melissa on 9/29/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // shows keyboard
        tweetTextView.becomeFirstResponder()
    }
    
    // Cancel tweet draft
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Tweet a tweet
    @IBAction func Tweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)}, failure: { (error) in
                print("Error posting tweet \(error).")
                self.dismiss(animated: true, completion: nil)
            })
        }
            
        else {
            // TO DO: display alert
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
