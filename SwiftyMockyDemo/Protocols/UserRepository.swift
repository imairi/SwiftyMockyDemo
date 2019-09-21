//
//  UserRepository.swift
//  SwiftyMockyDemo
//
//  Created by 今入　庸介 on 2019/09/21.
//

import Foundation

protocol UserRepository {
    func fetch() -> User
}
