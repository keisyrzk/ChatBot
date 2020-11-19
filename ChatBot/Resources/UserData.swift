//
//  UserData.swift
//  ChatBot
//
//  Created by Esteban on 18/11/2020.
//

import Foundation

struct UserData {
    
    private static let names = ["Leo", "Zia", "Natalie", "Bob", "Chris", "Tao"]
    
    /**
        Return a random number of randomly named users
     */
    
    private static let meUser = User(name: "Esteban", isMe: true)
    
    static var generatedOneToManyUsers: [User] {

        var names = UserData.names
        var users = Array(1...Int.random(in: 1...UserData.names.count - 1))
            .map{ _ in User(name: names.remove(at: Int.random(in: 0...names.count - 1))) }
        users.append(UserData.meUser)
        
        return users
    }
    
    static var generatedOneOnOneUsers: [User] {
        return [User(name: UserData.names[Int.random(in: 0...UserData.names.count - 1)]),
                UserData.meUser]
    }
}
