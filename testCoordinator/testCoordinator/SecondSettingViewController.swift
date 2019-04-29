//
//  SecondSettingViewController.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/29.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

protocol SecondSettingViewControllerDelegate : AnyObject {
    func navigateBackToFirstPage()
    func navigateToSecond2to1Page()
    func navigateToSecond2to2Page()
}

class SecondSettingViewController: UIViewController {

    let button1:UIButton = UIButton(type: .custom)
    let button2:UIButton = UIButton(type: .custom)
    
    weak var delegate:SecondSettingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "SecondSettingViewController"
        
        button1.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
        button1.setTitle("Go to Setting 2-1", for: .normal)
        button1.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button1)
        
        button2.frame = CGRect(x: 100, y: 200, width: 150, height: 50)
        button2.setTitle("Go to Setting 2-2", for: .normal)
        button2.addTarget(self, action: #selector(tapAction2), for: .touchUpInside)
        view.addSubview(button2)
    }

    @objc func tapAction() {
        delegate?.navigateToSecond2to1Page()
    }
    
    @objc func tapAction2() {
        delegate?.navigateToSecond2to2Page()
    }
    
    @objc func tapBackAction() {
        delegate?.navigateBackToFirstPage()
    }
    
    deinit {
        print("= SecondSettingViewController deinit ====")
    }
}
