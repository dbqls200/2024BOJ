//
//  2559.swift
//  2024BOJ
//
//  Created by 김유빈 on 1/26/25.

//  2559 수열 https://www.acmicpc.net/problem/2559
//  250126 solve

import Foundation

/*
 #input
 10 2
 3 -2 -4 -9 0 3 7 13 8 -3
 
 #output
 21
 */

/*
 첫번째 풀이. 이중 for문
 
 for i in 0..<n - k + 1 {
    for j in i..<i+k {
        temp에 k치 온도 합산하기
    }
    
    result랑 temp 비교해서 큰 값 저장하기
 }
 
 => 시간 초과 !! 날 줄 알았다.
 
 두번째 풀이. 슬라이딩 윈도우 !!
 0부터 k구간까지 처음에 다 더해놓는다.
 그다음에 0 빼고 k+1 더하기
 그다음에 1 빼고 k+2 더하기
 
 미리 더해둔 값을 계속 사용할 수 있기 때문에 이중 포문을 돌지 않아도 된다 !!
 */

// solution1
//func _2559() {
//    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
//    let (n, k) = (input[0], input[1])
//    
//    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
//    
//    var result = 0
//    
//    for i in 0..<n - k + 1 {
//        var temp = 0
//        
//        for j in i..<i + k {
//            temp = temp + arr[j]
//        }
//        
//        result = max(result, temp)
//    }
//    
//    print(result)
//}

// solution2
func _2559() {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (n, k) = (input[0], input[1])
    
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var preSum = arr[0..<k].reduce(0, +)
    var result = preSum
    
    for i in 0..<n - k {
        preSum -= arr[i]
        preSum += arr[i + k]
        
        result = max(result, preSum)
    }

    print(result)
}
