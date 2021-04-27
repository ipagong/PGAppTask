//
//  AppBaseTask.swift
//  BaseProject
//
//  Created ipagong.dev on 27/11/2019.
//  Copyright © 2019 ipagong.dev. All rights reserved.
//

import Foundation

/// Task의 기본 콘크리트 클래스.
/// 기본적인 프로퍼티들을 대신 구현하기 위한 목적.
open class AppBaseTask : NSObject,  AppTaskable {
    weak public var queue: AppTaskQueue?
    
    public var level: AppTaskComparable
    
    public var options: [AnyHashable : Any]?
    public var parameter: [AnyHashable : Any]?
    
    public var object:Any?
    
    open func execute() {}
    
    /// 생성자
    /// - Parameter level: 우선순위로 초기화.
    required public init(level: AppTaskComparable) {
        self.level = level
        
        super.init()
        
        self.initialized()
    }
    
    /// 생성 시점에 호출됨.
    open func initialized() {}
    
    /// Task 종료후 메모리에서 해제되는 지 체크 필요.
    deinit {
        debugPrint("<---- TASK Finished ----> AppTaskType.\(level) (level :\(level.rawValue))")
    }
}

extension AppBaseTask {
    public static func < (lhs: AppBaseTask, rhs: AppBaseTask) -> Bool  {
        return lhs.level.rawValue <  rhs.level.rawValue
    }
    
    public static func == (lhs: AppBaseTask, rhs: AppBaseTask) -> Bool {
        return lhs.level.rawValue == rhs.level.rawValue
    }
}
