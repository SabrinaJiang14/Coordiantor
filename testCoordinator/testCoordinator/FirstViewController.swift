//
//  FirstViewController.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/1.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegate : AnyObject {
    func navigateToNextPage()
    func navigateToSecondLevelNextPage()
    func navigateToSecondSettingPage()
}

class FirstViewController: UIViewController {

    weak var delegate : FirstViewControllerDelegate?
    var button:UIButton = UIButton(type: .custom)
    var button2:UIButton = UIButton(type: .custom)
    let button3:UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "First"
        button.frame = CGRect(x: 50, y: 100, width: 150, height: 50)
        button.setTitle("First Level - 1", for: .normal)
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
        
        button2.frame = CGRect(x: 50, y: 200, width: 150, height: 50)
        button2.setTitle("Second Level - 1", for: .normal)
        button2.addTarget(self, action: #selector(tapAction2), for: .touchUpInside)
        view.addSubview(button2)
        
        button3.frame = CGRect(x: 50, y: 300, width: 150, height: 50)
        button3.setTitle("Second Setting - 1", for: .normal)
        button3.addTarget(self, action: #selector(tapAction3), for: .touchUpInside)
        view.addSubview(button3)
        
        self.navigationController?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @objc func tapAction() {
        delegate?.navigateToNextPage()
    }
    
    @objc func tapAction2() {
        delegate?.navigateToSecondLevelNextPage()
    }
    
    @objc func tapAction3() {
        delegate?.navigateToSecondSettingPage()
    }
    
    deinit {
        print("FirstViewController deinit")
    }
}

extension FirstViewController:UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        // ensure the view controller is popping
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(fromViewController) else {
                return
        }
        
        // and it's the right type
        if let sec = fromViewController as? SecondViewController {
            sec.navigateBackToFirstpage()
        } else if let secLevel = fromViewController as? SecondLevel2ViewController {
            secLevel.btnBackTap()
        } else if let secSetting = fromViewController as? SecondSettingViewController {
            secSetting.tapBackAction()
        } else if let secSetting2to1 = fromViewController as? SecondSetting2to1ViewController {
            secSetting2to1.navigateBackAction()
        }
    }
        
}

extension FirstViewController:UIGestureRecognizerDelegate{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
