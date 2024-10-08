//
//  42839.swift
//  2024BOJ
//
//  Created by 김유빈 on 9/9/24.

//  42839 소수 찾기 https://school.programmers.co.kr/learn/courses/30/lessons/42839
//  240911 solve

import Foundation

/*
 #input
 solution()
 
 #output
 
 */

func solution(_ numbers:String) -> Int {
    // 1. 종이 조각으로 나올 수 있는 모든 숫자 조합 찾기
    // 2. 숫자 조합에서 소수가 몇 개인지 파악하기 (소수 판별)
    
    var nums: [Int] = []
    var result: Set<Int> = []
    var answer = 0
        
    for num in numbers {
        nums.append(Int(String(num))!)
    }
    
    var isUsed = [Bool](repeating: false, count: numbers.count)
    let cnt = 0
    
    // 1. 종이 조각으로 나올 수 있는 모든 숫자 조합 찾기
    
    for i in 1..<nums.count + 1 {
        var temp = [Int](repeating: 0, count: i)
        
        permutation(length: i, cnt: cnt, temp: &temp, isUsed: &isUsed)
    }

    func permutation(length: Int, cnt: Int, temp: inout [Int], isUsed: inout [Bool]) {
        if length == cnt {
            var tmp = ""
            
            for i in 0..<cnt {
                tmp += String(temp[i])
            }
            
            result.insert(Int(tmp)!)

            return
        }
            
        for i in 0..<numbers.count {
            if !isUsed[i] {
                temp[cnt] = Int(String(nums[i]))!
                isUsed[i] = true
                permutation(length: length, cnt: cnt + 1, temp: &temp, isUsed: &isUsed)
                isUsed[i] = false
            }
        }
    }
    
    
    // 2. 소수 판별하기
    
    func isPrimeNumber(n: Int) -> Bool {
        if n < 2 {
            return false
        }
        
        for i in 2..<Int(sqrt(Double(n))) + 1 {
            if n % i == 0 { return false }
        }
        
        return true
    }
    
    for num in result {
        if isPrimeNumber(n: num) {
            answer += 1
        }
    }
    
    return answer
}



