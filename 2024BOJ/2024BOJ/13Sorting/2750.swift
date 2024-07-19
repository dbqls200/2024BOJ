//
//  2750.swift
//  2024BOJ
//
//  Created by 김유빈 on 7/19/24.

//  [수 정렬하기] https://www.acmicpc.net/problem/2750
//  solve

func _2750() {
    // 입력
    let n = Int(readLine()!)!
    var arr = [Int]()
    
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    
    var temp = 0
    
    // 정렬하기
    // 버블 ?
    for i in 0..<n {
        for j in i + 1..<n {
            if arr[i] > arr[j] {
                temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            }
        }
    }

    // 출력
    arr.forEach { a in
        print(a)
    }
}

func _2750Other() {
    // 입력
    let n = Int(readLine()!)!
    var arr = [Int]()
    
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    
    var temp = 0
    
    // 정렬 및 출력
    // sorted 복잡도 : O(n log n)
    arr.sorted(by: <).forEach { a in
        print(a)
    }
}
