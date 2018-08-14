//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Vincent Yang on 8/14/18.
//  Copyright © 2018 AeonNeo. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

  @IBOutlet weak var webView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
      // this part will only run if it exists
      let url = URL(fileURLWithPath: htmlPath)
      let request = URLRequest(url: url)
      webView.load(request)
    }
    
  
  }
  
  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }

}
