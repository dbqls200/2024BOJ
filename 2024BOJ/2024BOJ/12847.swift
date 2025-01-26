//
//  12847.swift
//  2024BOJ
//
//  Created by 김유빈 on 1/26/25.

//  12847 수열 https://www.acmicpc.net/problem/2559
//  250126 solve

import Foundation

/*
 #input
 5 3
 10 20 30 20 10
 
 #output
 70
 */

/*
 이것도 슬라이딩 윈도우 문제!
 
 0부터 m까지 더하기
 -> 0 빼고 1부터 m+1까지 더하기
 -> 1 빼고 2부터 m+2까지 더하기
 -> n - m번 반복 ...
 
 => 이렇게 하면 이중 포문을 돌지 않아도 답을 구할 수 있다!
 */

func _12847() {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (n, m) = (input[0], input[1])
    
    let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    var preSum = arr[0..<m].reduce(0, +)
    
    var result = preSum
    
    for i in 0..<n - m {
        preSum -= arr[i]
        preSum += arr[i+m]
        
        result = max(result, preSum)
    }
    
    print(result)
}
