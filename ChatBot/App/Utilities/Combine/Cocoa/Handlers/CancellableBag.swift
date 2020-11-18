//
//  CancellableBag.swift
//  ChatBot
//

import Combine
import Foundation

class CancellableBag {
    
    private var bag = Set<AnyCancellable>()
    
    func add(object: AnyCancellable) {
        bag.insert(object)
    }
}
