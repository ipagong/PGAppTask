//
//  AppTaskHandler.swift
//  PGAppTask_Example
//
//  Created by ipagong.dev on 2021/04/26.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import PGAppTask

enum AppTaskType : Int, AppTaskComparable {
    case vendorSetup
    case doSomthing
    case scheme
    
    var taskType: AppBaseTask.Type {
        switch self {
        case .vendorSetup: return VendorSetupTask.self
        case .doSomthing: return DoSomethingTask.self
        case .scheme: return SchemeTask.self
        }
    }
}

struct AppTaskHandler {
    static func didFinishLaunchingWithOptions(_ options: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppTaskQueue.shared.push(.vendorSetup, options: options)
        return true
    }
    
    static func initialize(_ options: [UIApplication.LaunchOptionsKey: Any]? = nil) {
        AppTaskQueue.shared.push(.doSomthing, options: options)
        AppTaskQueue.shared.start()
    }
    
    static func destroy() {
        AppTaskQueue.shared.clear()
    }
}

extension AppTaskQueue {
    func push(_ type: AppTaskType, options: [AnyHashable: Any]? = nil, object: Any? = nil) {
        self.push(with: type, options: options, object: object)
    }
}
