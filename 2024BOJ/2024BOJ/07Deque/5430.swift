//
//  5430.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/15/24.
//  [AC] https://www.acmicpc.net/problem/5430


// R: 뒤집기, 배열에 있는 수의 순서를 뒤집는 함수
// D: 버리기, 첫 번째 수를 버리는 함수

func _5430() {
    
    // 1. 시간 초과 !
    let t: Int = Int(readLine()!)!
    
    for _ in 0..<t {
        let p: String = readLine()!
        let _: Int = Int(readLine()!)!
        var arr = readLine()!.dropFirst().dropLast().split(separator: ",").map{ Int($0)! }
        var cnt: Int = 0
        
        // 다시 풀기
        if arr.count >= p.count {
            for s in p {
                if s == "R" {
                    arr = arr.reversed()
                } else if s == "D" {
                    arr[cnt] = 0
                    cnt += 1
                }
            }

            print(arr[cnt...])
        } else {
            print("error")
        }                
    }
}
