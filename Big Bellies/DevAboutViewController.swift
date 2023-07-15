//
//  DevAboutViewController.swift
//  Big Bellies
//
//  Created by Nazar Dremach on 2/7/23.
//

import UIKit

class DevAboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    @IBAction func OpenTG(_ sender: Any) {
        let tgUrl = URL(string: "https://t.me/@herobrineee")!
        
        UIApplication.shared.open(tgUrl)
    }
}
