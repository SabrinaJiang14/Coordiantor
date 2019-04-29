//
//  SecondLevel3ViewController.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/25.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit


class SecondLevel3ViewController: UIViewController {
    
    weak var delegate:SecondLevel2ViewControllerDelegate?
    
    let button:UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "SecondLevel3ViewController"
        
        button.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Back to Last", for: .normal)
        button.addTarget(self, action: #selector(goBackTap), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func goBackTap() {
        delegate?.backToSecondLevel2VC()
    }

    deinit {
        print("== SecondLevel3ViewController deinit")
    }
}
