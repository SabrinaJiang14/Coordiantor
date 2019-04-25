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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "SecondLevel3ViewController"
    }
    
    func goBackTap() {
        delegate?.backForwardPage()
    }

    deinit {
        print("SecondLevel3ViewController deinit")
    }
}
