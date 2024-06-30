//
//  15649.swift
//  2024BOJ
//
//  Created by 김유빈 on 6/30/24.

//  [N과 M (1)] https://www.acmicpc.net/problem/15649
//  solve

func _15649() {
    // 입력
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (n, m) = (input[0], input[1])
    
    /*
     1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열.
     사전 순으로 증가하는 순서로 출력.
     
     */
    
    var arr = [Int](repeating: 0, count: m) // 중복 없이 선택한 수열
    var isUsed = [Bool](repeating: false, count: n + 1) // 중복 확인하는 배열
    
    
    func back(k: Int) {
        if k == m {
            for i in 0..<m {
                print(arr[i], terminator: " ")
            }
            print()
            
            return
        }
        
        for i in 1...n {
            if !isUsed[i] {
                arr[k] = i
                isUsed[i] = true
                back(k: k + 1)
                isUsed[i] = false
            }
        }
    }
    
    back(k: 0)
}
