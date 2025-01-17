//
//  Utils.swift
//  
//
//  Created by v.a.prusakov on 01/07/2019.
//

import Foundation

class Weak<T: AnyObject> {
    weak var value: T?
    
    init(value: T) {
        self.value = value
    }
}

class Lazy {
    
    var initBlock: () -> Any
    
    init(initBlock: @escaping () -> Any) {
        self.initBlock = initBlock
    }
    
    func resolve<T>() -> T {
        return self.initBlock() as! T
    }
    
}
