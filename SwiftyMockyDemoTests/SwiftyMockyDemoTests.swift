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
    
    func test_正しい年齢で更新されていること() {
        let account = Account(user: user)
        account.incrementAge()
        
        // 引数もチェックする
        user.verify(.update(age: .value(33)), count: 1)
        
        // 引数はチェックしない
        user.verify(UserMock.Verify.update(age: .any), count: 1)
    }

    func test_クロージャーを呼ぶ() {
        let account = Account(user: user)
        
        user.perform(.update(name: .any, completion: .any, perform: { (name, completion) in
            completion()
        }))
        
        account.update(name: "てすと")
    }
}
