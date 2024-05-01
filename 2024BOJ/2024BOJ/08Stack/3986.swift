//
//  3986.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/20/24.
//  [좋은 단어]https://www.acmicpc.net/problem/3986
//  solve

func _3986() {
    var n: Int = Int(readLine()!)!

    for _ in 0..<n {
        let arr = readLine()!
        var tmp: [Character] = []
        
        for s in arr {
            let t = tmp.last
            if s == t {
                tmp.popLast()
            } else {
                tmp.append(s)
            }
        }
        
        if !tmp.isEmpty {
            n -= 1
        }
    }
    
    print(n)
}
