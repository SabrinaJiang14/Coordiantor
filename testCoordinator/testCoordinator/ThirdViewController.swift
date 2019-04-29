//
//  ThirdViewController.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/1.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    weak var delegate:SecondViewControllerDelegate?
    let btnBack:UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "ThirdViewController"
        
        btnBack.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
        btnBack.setTitle("Back To Root", for: .normal)
        btnBack.addTarget(self, action: #selector(navigateToRootPageAction), for: .touchUpInside)
        btnBack.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(btnBack)
    }
    
    @objc func navigateToRootPageAction() {
        delegate?.navigateToRootPage()
    }
    
    @objc func navigateToFirstPageAction() {
        delegate?.navigateToFirstPage()
    }
    
    deinit {
        print("== ThirdViewController deinit")
    }
}
