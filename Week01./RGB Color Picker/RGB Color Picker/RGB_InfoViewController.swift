//
//  RGB_InfoViewController.swift
//  RGB Color Picker
//
//  Created by Jaron Christopher Grigsby on 5/31/20.
//  Copyright © 2020 JcCorp. All rights reserved.
//

import UIKit
import WebKit

class RGB_InfoViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        webview.load(URLRequest(url: URL(string: "https://en.wikipedia.org/wiki/RGB_color_model")!))
        
    }
  
    @IBAction func exitButton(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
    }
}
