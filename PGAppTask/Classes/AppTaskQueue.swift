//
//  AppTaskQueue.swift
//  BaseProject
//
//  Created ipagong.dev on 27/11/2019.
//  Copyright © 2019 ipagong.dev. All rights reserved.
//

import Foundation
import SwiftPriorityQueue

/// Task 들을 관리하는 큐의 콘크리트 객체.
/// (우선순위 큐 베이스)
final public class AppTaskQueue: TaskQueueProtocol {
    /// 큐의 싱글톤 인스턴스.
    public static let shared = AppTaskQueue()
    
    /// 우선순위 큐.
    public var queue = PriorityQueue<AppBaseTask>(ascending: true)
    
    /// 현재 진행 중인 Task
    public var runningTask:AppBaseTask?
}

extension AppTaskQueue {
    /// 큐에 태스크를 전달해주는 헬퍼 메소드.
    /// - Parameters:
    ///   - type: 태스크로 정의된 타입 형식.
    ///   - options: AppDelegate 에서 전달되는 options.
    ///   - object: 태스크로 전달하고 싶은 object 인스턴스.
    public func push(with type: AppTaskComparable, options: [AnyHashable: Any]? = nil, object: Any? = nil) {
        let task = type.task()
        task.options = options
        task.object = object
        
        self.enQueue(task)
    }
}

