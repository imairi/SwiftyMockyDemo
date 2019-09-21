//
//  Account.swift
//  SwiftyMockyDemo
//
//  Created by 今入　庸介 on 2019/09/21.
//

import Foundation

final class Account {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func displayProfileThreeTimes() {
        for _ in 0..<3 {
            print("\(user.profile())")
        }
    }
}
