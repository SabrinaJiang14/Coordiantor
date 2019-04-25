//
//  Coordinator.swift
//  testCoordinator
//
//  Created by csnt on 2019/4/1.
//  Copyright © 2019 csnt. All rights reserved.
//

import UIKit

protocol Coordinator : AnyObject {
    var childCoordinators: [Coordinator] { get set }
    
    // All coordinators will be initilised with a navigation controller
    init(navigationController:UINavigationController)
    
    func start()
}
