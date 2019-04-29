//
//  SecondLevel2Coordinator.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/25.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

protocol backToRootViewControllerDelegate : AnyObject {
    func navigateBackRoot(newCoordinator: SecondLevel2Coordinator)
}

class SecondLevel2Coordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    unowned let navigationController:UINavigationController
    weak var delegate : backToRootViewControllerDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let secondLevel = story.instantiateViewController(withIdentifier: "SecondLevel2ViewController") as! SecondLevel2ViewController
        secondLevel.delegate = self
        self.navigationController.show(secondLevel, sender: nil)
    }
    
    deinit {
        print("= SecondLevel2Coordinator deinit")
    }
}

extension SecondLevel2Coordinator:SecondLevel2ViewControllerDelegate {
    func presentView() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let present = story.instantiateViewController(withIdentifier: "PresentViewController") as! PresentViewController
        present.delegate = self
        self.navigationController.viewControllers.last?.present(present, animated: true, completion: nil)
    }
    
    func gotoNextPage() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let secondLevel3 = story.instantiateViewController(withIdentifier: "SecondLevel3ViewController") as! SecondLevel3ViewController
        secondLevel3.delegate = self
        self.navigationController.show(secondLevel3, sender: nil)
    }
    
    func backForwardPage() {
        delegate?.navigateBackRoot(newCoordinator: self)
    }
    
    func backToSecondLevel2VC() {
        navigationController.popViewController(animated: true)
    }
}

extension SecondLevel2Coordinator:PresentViewControllerDelegate {
    func closeAllPresentViewController() {
        self.navigationController.viewControllers.last?.dismiss(animated: true, completion: nil)
    }
    
    func closeTap(from: UIViewController) {
        from.dismiss(animated: true, completion: nil)
    }
}
