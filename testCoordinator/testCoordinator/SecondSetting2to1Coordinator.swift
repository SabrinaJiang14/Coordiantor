//
//  SecondSetting2to1Coordinator.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/29.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

protocol SecondSetting2to1CoordinatorDelegate : AnyObject {
    func backToSecondSettingVC()
    func navigateToSecondSettingVC(mCoordinator:SecondSetting2to1Coordinator)
}

class SecondSetting2to1Coordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var delegate: SecondSetting2to1CoordinatorDelegate?
    
    unowned let navigationController:UINavigationController
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondSetting2to1ViewController") as! SecondSetting2to1ViewController
        vc.delegate = self
        self.navigationController.show(vc, sender: nil)
    }
    
    deinit {
        print("== SecondSetting2to1Coordinator deinit ====")
    }
}

extension SecondSetting2to1Coordinator:SecondSetting2to1ViewControllerDelegate {
    func tapToBackPage() {
        delegate?.backToSecondSettingVC()
    }
    
    func backSecondSetting2to1VC() {
        navigationController.popViewController(animated: true)
    }
    
    func navigateToBackPage() {
        delegate?.navigateToSecondSettingVC(mCoordinator: self)
    }
    
    func navigateToNextPage() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "SecondSetting3to1ViewController") as! SecondSetting3to1ViewController
        vc.delegate = self
        self.navigationController.show(vc, sender: nil)
    }
}
