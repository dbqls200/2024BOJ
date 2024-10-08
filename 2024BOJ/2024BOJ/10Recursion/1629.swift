//
//  1629.swift
//  2024BOJ
//
//  Created by 김유빈 on 6/4/24.

//  [곱셈] https://www.acmicpc.net/problem/1629

func _1629() {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let (A, B, C) = (input[0], input[1], input[2])
    var result = 0
    
    func recursion(count: Int) {
        if count == 1 {
            result = A % C
            return
        }
        
        recursion(count: count/2)

        result = ((result % C) * A) % C
        
        if B % 2 != 0 {
            result = result * A % C
        }
        
    }
    
    recursion(count: B)
    
    print(result)
}

// 어케 풀어야 됨?

/*
# input
99999 99999 100000
# answer
99999
 
# input
5 111 50888
# answer
16437
*/

