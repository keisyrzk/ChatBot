//
//  AnyCancellable+DisposeBag.swift
//  ChatBot
//

import Combine
import UIKit

extension AnyCancellable: ExtensionProperty {
    
    typealias T = CancellableBag
    
    private struct CustomProperties {
        static var bag = CancellableBag()
    }
    
    private var cancellableBag: CancellableBag {
        get {
            return getAssociatedObject(&CustomProperties.bag, defaultValue: CustomProperties.bag)
        }
        set {
            return objc_setAssociatedObject(self, &CustomProperties.bag, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    
    func dispose() {
        cancellableBag.add(object: self)
    }
    
    func dispose(by: CancellableBag) {
        by.add(object: self)
    }
}
