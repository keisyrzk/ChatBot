//
//  UserData.swift
//  ChatBot
//
//  Created by Esteban on 18/11/2020.
//

import Foundation

struct UserData {
    
    private static let names = ["Esteban", "Zia", "Natalie", "Bob", "Chris", "Tao"]
    
    /**
        Return a random number of randomly named users
     */
    static var generatedUsers: [User] {

        var names = UserData.names
        return Array(1...Int.random(in: 1...UserData.names.count - 1))
            .map{ _ in User(name: names.remove(at: Int.random(in: 0...names.count - 1))) }
    }
    
    static var generatedUser: User {
        return User(name: UserData.names[Int.random(in: 0...UserData.names.count - 1)])
    }
}
