//
//  1021.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/14/24.
//

import Foundation

func _1021() {
    let input: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let n = input[0], m = input[1]
    var target = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var array = [Int](1...n)
    var result = 0
    
    while !array.isEmpty {
        if array.first! == target.first! {
            array.removeFirst()
            target.removeFirst()
            continue
        }
        
        let startToDistance = array.firstIndex(of: target.first!)!
        let endToDistance = array.count - array.firstIndex(of: target.first!)!
        
        if startToDistance < endToDistance {
            array.append(array.removeFirst())
        } else {
            array.insert(array.removeLast(), at: 0)
        }
        
        result += 1
        
    }
}
