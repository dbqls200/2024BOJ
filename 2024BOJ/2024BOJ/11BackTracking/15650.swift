//
//  15650.swift
//  2024BOJ
//
//  Created by 김유빈 on 6/30/24.

//  [N과 M (2)] https://www.acmicpc.net/problem/15650
//  solve

func _15650() {
    // 입력
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (n, m) = (input[0], input[1])
    
    /*
     1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열.
     사전 순으로 증가하는 순서로 출력.
     
     !! N과 M (1)과 다른 점
     순서 안 중요함.
     (1, 2)랑 (2, 1)는 같은 거임.
     */
    
    var arr = [Int](repeating: 0, count: m)
    var isUsed = [Bool](repeating: false, count: n + 1)
    
    func back(k: Int) {
        if k == m {
            for i in 0..<m {
                print(arr[i], terminator: " ")
                
            }
            print()
            
            return
        }
        
        // 시작점 구하기
        var start = 1
        if k != 0 {
            start = arr[k - 1] + 1
        }
        
        for i in start..<n + 1 {
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
