//
//  11931.swift
//  2024BOJ
//
//  Created by 김유빈 on 7/24/24.

//  [수 정렬하기 4] https://www.acmicpc.net/problem/11931
//  solve

func _11931() {
    /// 입력
    let n = Int(readLine()!)!
    var arr = [Int]()
    
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    
    /// 내림차순 정렬하기
    
    /// 방법 1.
    // sorted는 O(n log n) 시간복잡도를 가진다.
//    arr.sorted(by: >).forEach { a in
//        print(a)
//    }
    
    var temp = 0
    
    /// 방법 2.
    
    // 시간 초과 난다 ~
    for i in 0..<n {
        for j in i + 1..<n {
            if arr[i] < arr[j] {
                temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            }
        }
    }
    
    arr.forEach { a in
        print(a)
    }
}
