//
//  PresentViewController.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/25.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

protocol PresentViewControllerDelegate : AnyObject {
    func closeTap(from:UIViewController)
    func closeAllPresentViewController()
}

class PresentViewController: UIViewController {

    var btnClose:UIButton = UIButton(type: .custom)
    weak var delegate:PresentViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btnClose.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        btnClose.setTitle("Close", for: .normal)
        btnClose.addTarget(self, action: #selector(buttonCloseTap), for: .touchUpInside)
        self.view.addSubview(btnClose)
    }

    @objc func buttonCloseTap() {
        delegate?.closeTap(from: self)
    }
    
    
    deinit {
        print("PresentViewController deinit")
    }
}
