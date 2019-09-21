//
//  SwiftyMockyDemoTests.swift
//  SwiftyMockyDemoTests
//
//  Created by 今入　庸介 on 2019/09/21.
//

import XCTest
@testable import SwiftyMockyDemo
import SwiftyMocky
import Fakery

class SwiftyMockyDemoTests: XCTestCase {
    
    let user = UserMock()
    
    override func setUp() {
        user.given(.name(getter: "imairi"))
        user.given(.age(getter: 32))
        user.given(.profile(willReturn: "いまいりようすけ 32歳"))
    }

    override func tearDown() {
    }

    func test_プロフィールが3回表示されること() {
        let account = Account(user: user)
        account.displayProfileThreeTimes()
        
        user.verify(.profile(), count: 3)
        
        
//        user.verify(.profile(), count: .once)
//        user.verify(.profile(), count: .never)
//        user.verify(.profile(), count: .more(than: 2))
//        user.verify(.profile(), count: .custom({ count -> Bool in
//            guard self.user.age < 30 && count == 1 else {
//                return true
//            }
//            return false
//        }))
    }

}
