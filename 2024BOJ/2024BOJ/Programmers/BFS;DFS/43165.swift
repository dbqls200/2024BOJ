//
//  43165.swift
//  2024BOJ
//
//  Created by 김유빈 on 9/11/24.

//  43165 타겟 넘버 https://school.programmers.co.kr/learn/courses/30/lessons/43165
//  240911 solve

import Foundation

/*
 #input
 solution([1, 1, 1, 1, 1], 3)
 
 #output
 5
 */

func solution(_ numbers:[Int], _ target:Int) -> Int {
    /*
     dfs로 풀자.
     모든 경우의 수를 다 살펴보자. +/-
     */
    var result = 0
    let sum = 0

    func dfs(index: Int, sum: Int) {
        if index == numbers.count {
            if sum == target {
                result += 1
            }
            
            return
        }
        
        dfs(index: index + 1, sum: sum + numbers[index])
        dfs(index: index + 1, sum: sum - numbers[index])
    }
    
    dfs(index: 0, sum: sum)
    
    return result
}
