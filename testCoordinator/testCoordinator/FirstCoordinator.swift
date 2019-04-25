//
//  FirstCoordinator.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/1.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

class FirstCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    unowned let navigationController:UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let first = story.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        first.delegate = self
        self.navigationController.viewControllers = [first]
    }
    
    deinit {
        print("FirstCoordinator deinit")
    }
}

extension FirstCoordinator:FirstViewControllerDelegate {
    func navigateToNextPage() {
        let second = SecondCoordinator(navigationController: navigationController)
        second.delegate = self
        childCoordinators.append(second)
        second.start()
    }
    
    func navigateToSecondLevelNextPage() {
        let secondLevel = SecondLevel2Coordinator(navigationController: navigationController)
        secondLevel.delegate = self
        childCoordinators.append(secondLevel)
        secondLevel.start()
    }
}

extension FirstCoordinator:BackToFirstViewControllerDelegate {
    func navigateBackToFirstPage(newOrderCoordinator: SecondCoordinator) {
        navigationController.popViewController(animated: true)
        childCoordinators.removeLast()
    }
}

extension FirstCoordinator:backToRootViewControllerDelegate {
    func navigateBackRoot(newCoordinator: SecondLevel2Coordinator) {
        navigationController.popViewController(animated: true)
        childCoordinators.removeLast()
    }
    
    
}
