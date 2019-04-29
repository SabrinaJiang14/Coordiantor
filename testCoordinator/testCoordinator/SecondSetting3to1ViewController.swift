//
//  SecondSetting3to1ViewController.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/29.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

class SecondSetting3to1ViewController: UIViewController {

    weak var delegate:SecondSetting2to1ViewControllerDelegate?
    
    let button:UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "SecondSetting3to1VC"
        
        button.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
        button.setTitle("Back to 2to1", for: .normal)
        button.addTarget(self, action: #selector(tapBackAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func tapBackAction() {
        delegate?.backSecondSetting2to1VC()
    }
    
    deinit {
        print("=== SecondSetting3to1ViewController deinit ====")
    }
}
