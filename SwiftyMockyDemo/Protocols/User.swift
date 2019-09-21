//
//  User.swift
//  SwiftyMockyDemo
//
//  Created by 今入　庸介 on 2019/09/21.
//

import Foundation

protocol User {
    var name: String { get }
    var age: Int { get }
    
    func profile() -> String
    func update(age: Int)
    func update(name: String, completion:(() -> Void))
}
