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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "ThirdViewController"
        
    }
    
    @objc func navigateToFirstPageAction() {
        delegate?.navigateToFirstPage()
    }
    
    deinit {
        print("ThirdViewController deinit")
    }
}
