//
//  SecondSetting2to1ViewController.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/29.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

protocol SecondSetting2to1ViewControllerDelegate : AnyObject {
    func navigateToNextPage()
    func tapToBackPage()
    func navigateToBackPage()
    func backSecondSetting2to1VC()
}

class SecondSetting2to1ViewController: UIViewController {

    weak var delegate:SecondSetting2to1ViewControllerDelegate?
    
    let button:UIButton = UIButton(type: .custom)
    let button2:UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SecondSetting2to1VC"
        
        // Do any additional setup after loading the view.
        button.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
        button.setTitle("Go to setting 3-1", for: .normal)
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button)
        
        button2.frame = CGRect(x: 100, y: 200, width: 150, height: 50)
        button2.setTitle("Back to setting", for: .normal)
        button2.addTarget(self, action: #selector(tapBackAction), for: .touchUpInside)
        button2.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button2)
    }

    @objc func tapAction() {
        delegate?.navigateToNextPage()
    }
    
    @objc func tapBackAction() {
        delegate?.tapToBackPage()
    }
    
    func navigateBackAction() {
        delegate?.navigateToBackPage()
    }
    
    deinit {
        print("== SecondSetting2to1ViewController deinit ====")
    }
}
