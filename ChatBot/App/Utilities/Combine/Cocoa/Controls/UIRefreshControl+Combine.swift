//
//  UIRefreshControl+Combine.swift
//  ChatBot
//

import Combine
import UIKit

public extension UIRefreshControl {
    /// A publisher emitting refresh status changes from this refresh control.
    var isRefreshingPublisher: AnyPublisher<Bool, Never> {
        Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.isRefreshing)
                  .eraseToAnyPublisher()
    }
}
