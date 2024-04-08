//
//  10773.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/7/24.
//

import Foundation

func _10773() {
    let k: Int = Int(readLine()!)!
    var arr: [Int] = []
    
    for _ in 0..<k {
        let num: Int = Int(readLine()!)!
        
        if num == 0 {
            arr.popLast()
        } else {
            arr.append(num)
        }
    }
    print(arr.reduce(0, +))
}
