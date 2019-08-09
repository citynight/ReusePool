//
//  ViewReusePool.swift
//  UITableViewDemo
//
//  Created by 李小争 on 2019/8/9.
//  Copyright © 2019 红火台. All rights reserved.
//

import UIKit

class ViewReusePool: NSObject {
    
    ///MARK: - Open func

    /// 从重用池取一个可重用的view
    ///
    /// - Returns: 取出的视图
    func deqeueReuseableView() -> UIView? {
        if let view = waitUsedQueue.first {
            waitUsedQueue.remove(view)
            usingUsedQueue.insert(view)
            return view
        }
        return nil
    }
    
    
    /// 向重用池添加视图
    ///
    /// - Parameter view: 被添加的视图
    func addUsingView(_ view: UIView) {
        usingUsedQueue.insert(view)
    }
    
    
    /// 重置方法，将当前使用中的视图移动到可重用队列中
    func reset() {
        while let view = usingUsedQueue.first {
            usingUsedQueue.remove(view)
            waitUsedQueue.insert(view)
        }
    }
    
    
    //MARK: - private property
    
    /// 等待使用的队列
    private var waitUsedQueue:Set<UIView> = Set();
    /// 使用中的队列
    private var usingUsedQueue:Set<UIView> = Set();
    
    
    
    override init() {
        print("...")
    }
}
