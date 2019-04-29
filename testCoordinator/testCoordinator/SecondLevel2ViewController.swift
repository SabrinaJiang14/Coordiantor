//
//  SecondLevel2ViewController.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/25.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

protocol SecondLevel2ViewControllerDelegate : AnyObject {
    func gotoNextPage()
    func backForwardPage()
    func backToSecondLevel2VC()
    func presentView()
}

class SecondLevel2ViewController: UIViewController {

    weak var delegate : SecondLevel2ViewControllerDelegate?
    var button:UIButton = UIButton(type: .custom)
    var button2:UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "SecondLevel2ViewController"
        
        button.frame = CGRect(x: 50, y: 100, width: 150, height: 50)
        button.setTitle("Second Level - 2", for: .normal)
        button.addTarget(self, action: #selector(btnGoTap), for: .touchUpInside)
        view.addSubview(button)
        
        button2.frame = CGRect(x: 50, y: 200, width: 150, height: 50)
        button2.setTitle("Present", for: .normal)
        button2.addTarget(self, action: #selector(tapPresentView), for: .touchUpInside)
        view.addSubview(button2)
    }
    
    @objc func btnGoTap() {
        delegate?.gotoNextPage()
    }
    
    func btnBackTap() {
        delegate?.backForwardPage()
    }
    
    @objc func tapPresentView() {
        delegate?.presentView()
    }
    
    deinit {
        print("= SecondLevel2ViewController deinit")
    }
}
