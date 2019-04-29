//
//  SecondCoordinator.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/1.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit


protocol BackToFirstViewControllerDelegate: AnyObject {
    func navigateBackToFirstPage(newOrderCoordinator: SecondCoordinator)
    func navigateBackRootPage()
}

class SecondCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    unowned let navigationController:UINavigationController
    weak var delegate: BackToFirstViewControllerDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let second = story.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        second.delegate = self
        self.navigationController.show(second, sender: nil)
    }
    
    deinit {
        print("= SecondCoordinator deinit")
    }
}

extension SecondCoordinator:SecondViewControllerDelegate {
    func navigateToFirstPage() {
        delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
    
    func navigateToThirdPage() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let third = story.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        third.delegate = self
        self.navigationController.show(third, sender: nil)
    }
    
    func navigateToRootPage() {
        delegate?.navigateBackRootPage()
    }
}
