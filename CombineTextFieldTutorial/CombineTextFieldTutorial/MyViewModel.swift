//
//  MyViewModel.swift
//  CombineTextFieldTutorial
//
//  Created by 류창휘 on 2022/01/23.
//

import Foundation
import Combine

class MyViewModel {
    // publised 어노테이션을 통해 구독이 가능하도록 설정
    @Published var passwordInput : String = "" {
        didSet {
            print("MyViewModel / passwordInput: \(passwordInput)")
        }
    }
    @Published var passwordComfirmInput : String = "" {
        didSet {
            print("MyViewModel / passswordConfirmInput: \(passwordComfirmInput)")
        }
    }
    
    //돌아온 퍼블리셔들의 값 일치 여부를 변환 하는 퍼블리셔
    lazy var isMatchPasswordInput : AnyPublisher<Bool, Never> = Publishers
        .CombineLatest($passwordInput, $passwordComfirmInput)
        .map({ (password: String, passwordConfirm: String) in
            if password == "" || passwordConfirm == "" {
                return false
            }
            if password == passwordConfirm {
                return true
            } else  {
                return false
            }
        })
        .print()
        .eraseToAnyPublisher()
}
