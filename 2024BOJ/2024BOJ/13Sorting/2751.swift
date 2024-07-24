//
//  2751.swift
//  2024BOJ
//
//  Created by 김유빈 on 7/19/24.

//  [수 정렬하기 2] https://www.acmicpc.net/problem/2751
//

func _2751() {
    // 입력
    let n = Int(readLine()!)!
    var arr = [Int]()
    
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    
    var temp = 0
    
    // 정렬
    // 방법 1. 시간 초과
    for i in 0..<n {
        for j in i + 1..<n {
            if arr[i] > arr[j] {
                temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            }
        }
    }
    
    // 방법 2. 통과
    arr.sorted(by: <).forEach { a in
        print(a)
    }
    
    // 출력
    arr.forEach { a in
        print(a)
    }
}
