//
//  TaskQueueProtocol.swift
//  BaseProject
//
//  Created ipagong.dev on 27/11/2019.
//  Copyright © 2019 ipagong.dev. All rights reserved.
//

import Foundation
import SwiftPriorityQueue

public protocol TaskQueueProtocol: class {
    associatedtype Task: AppTaskable
    
    var queue: PriorityQueue<Task> { get set }
    
    var runningTask: Task? { get set }
    
    static var shared: Self { get }
}

extension TaskQueueProtocol {
    
    public func start(delay: TimeInterval = 0.0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: { [weak self] in
            if self?.runningTask != nil { return }
            self?.next(nil)
        })
    }
    
    public func start() {
        if self.runningTask != nil { return }
        self.next(nil)
    }
    
    public func next(_ param:[AnyHashable:Any]?) {
        self.runningTask = self.deQueue()
        self.runningTask?.parameter = param
        
        DispatchQueue.main.async { [weak self] in
            self?.runningTask?.execute()
        }
    }
    
    public func clear() {
        self.runningTask = nil
        queue.clear()
    }
    
    public func enQueue(_ task: Task) {
        if let _ = self.findTask(task) { return }
        
        task.queue = self as? Self.Task.Queue
        queue.push(task)
    }
    
    public func peek() -> Task? {
        if let task = self.runningTask { return task }
        return queue.peek()
    }
    
    public func deQueue() -> Task? {
        self.runningTask = nil
        return queue.pop()
    }

}

extension TaskQueueProtocol {
    public func findTask(_ task: Task) -> Task? {
        return queue.first{ $0.level.rawValue == task.level.rawValue }
    }
}

