//
//  AppTasks.swift
//  PGAppTask_Example
//
//  Created by ipagong.dev on 2021/04/26.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import PGAppTask

class VendorSetupTask: AppBaseTask {
    override func execute() {
        debugPrint("VendorSetupTask called.")
        
        self.next()
    }
}

class DoSomethingTask : AppBaseTask {
    override func execute() {
        debugPrint("DoSomethingTask called.")
        
        self.next()
    }
}

class SchemeTask : AppBaseTask {
    override func execute() {
        debugPrint("SchemeTask called.")
        self.next()
    }
}
