//
//  SecondSettingCoordinator.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/29.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

protocol SecondSettingCoordinatorDelegate : AnyObject {
    func navigateToFirstViewController(coordinator:SecondSettingCoordinator)
}

class SecondSettingCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    unowned let navigationController:UINavigationController
    weak var delegate:SecondSettingCoordinatorDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondSettingViewController") as! SecondSettingViewController
        vc.delegate = self
        self.navigationController.show(vc, sender: nil)
    }
    
    deinit {
        print("= SecondSettingCoordinator deinit ====")
    }
}

extension SecondSettingCoordinator:SecondSettingViewControllerDelegate {
    func navigateBackToFirstPage() {
        navigationController.popViewController(animated: true)
        delegate?.navigateToFirstViewController(coordinator: self)
    }
    
    func navigateToSecond2to1Page() {
        let secondSetting2to1 = SecondSetting2to1Coordinator(navigationController: navigationController)
        secondSetting2to1.delegate = self
        childCoordinators.append(secondSetting2to1)
        secondSetting2to1.start()
    }
    
    func navigateToSecond2to2Page() {
        
    }
}

extension SecondSettingCoordinator:SecondSetting2to1CoordinatorDelegate{
    func navigateToSecondSettingVC(mCoordinator: SecondSetting2to1Coordinator) {
        childCoordinators.removeLast()
    }
    
    func backToSecondSettingVC() {
        navigationController.popViewController(animated: true)
        childCoordinators.removeLast()
    }
}
