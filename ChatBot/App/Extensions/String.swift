//
//  String.swift
//  ChatBot
//

import Foundation

extension String {
    
   static func randomAlphanumeric(length: Int = 10) -> String {
        
        let alphanumeric : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(alphanumeric.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = alphanumeric.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}
