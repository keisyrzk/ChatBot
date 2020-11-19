//
//  Scrolling.swift
//  ChatBot
//

import Combine
import UIKit

extension ReactiveTableView {

    func scrollToBottom()  {
        let point = CGPoint(x: 0, y: self.contentSize.height + self.contentInset.bottom - self.frame.height)
        if point.y >= 0{
            self.setContentOffset(point, animated: true)
        }
    }
}
