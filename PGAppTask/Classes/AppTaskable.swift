//
//  AppTaskable.swift
//  BaseProject
//
//  Created ipagong.dev on 27/11/2019.
//  Copyright © 2019 ipagong.dev. All rights reserved.
//

import Foundation

/// 우선순위의 인터페이스 (Recommended Integer Enumeration)
public protocol AppTaskComparable {
    var rawValue: Int { get }
    
    var taskType: AppBaseTask.Type { get }
}

extension AppTaskComparable {
    public var level: Int { return self.rawValue }
    
    public func task() -> AppBaseTask { self.taskType.init(level: self) }
}

/// Task들의 인터페이스
public protocol AppTaskable: class, Comparable {
    associatedtype Queue: TaskQueueProtocol
    
    /// 다음 Task로 이동하기 위한 것.
    /// 테스크 전환 시, 큐에서 직접 주입해줌. (직접 호출할 필요는 없음)
    var queue: Queue? { get set }
    
    /// Task의 우선순위 레벨링을 위한 값.
    var level: AppTaskComparable { get set }

    /// 최초 Task 생성 시 주입되는 값.
    var options: [AnyHashable: Any]? { get set }
    
    /// queue 내부의 이전 Task 에서 전달해주는 값.
    var parameter: [AnyHashable: Any]? { get set }
    
    /// task 내부에서 사용할 데이타.
    var object: Any? { get set }
    
    /// Task 실행을 위한 트리거. (필수 구현 필요)
    func execute()
}

extension AppTaskable {
    public func next(_ param: [AnyHashable: Any]? = nil) {
        self.queue?.next(param ?? self.parameter)
    }
    
    public func stop() {
        self.queue?.clear()
    }
}
