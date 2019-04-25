//
//  SecondViewController.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/1.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func navigateToFirstPage()
    func navigateToThirdPage()
}

class SecondViewController: UIViewController {

    weak var delegate: SecondViewControllerDelegate?
    var button:UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "SecondViewController"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(navigateBackToFirstpage))
        self.navigationItem.leftBarButtonItem = backButton
        
        button.frame = CGRect(x: 50, y: 100, width: 150, height: 50)
        button.setTitle("First Level - 2", for: .normal)
        button.addTarget(self, action: #selector(navigateToThirdPageAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func navigateBackToFirstpage() {
        self.delegate?.navigateToFirstPage()
    }
    
    @objc func navigateToThirdPageAction() {
        self.delegate?.navigateToThirdPage()
    }
    
    deinit {
        print("SecondViewController deinit")
    }
}
