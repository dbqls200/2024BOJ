//
//  1874.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/7/24.

//  [스택 수열] https://www.acmicpc.net/problem/1874
//  solve

func _1874() {
    let n = Int(readLine()!)!
    var result: String = ""
    var stack: [Int] = []
    var cnt: Int = 1
    var state: Bool = true
    
    for _ in 0..<n {
        let num = Int(readLine()!)!
        
        while cnt <= num {
            stack.append(cnt)
            result.append("+")
            cnt += 1
        }
        
        if stack.last == num {
            stack.removeLast()
            result.append("-")
        } else {
            state = false
            break
        }
    }
    
    if state {
        print(result.map({ String($0) }).joined(separator: "\n"))
    } else {
        print("NO")
    }
}
