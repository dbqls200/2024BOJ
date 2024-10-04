//
//  43162.swift
//  2024BOJ
//
//  Created by 김유빈 on 9/11/24.

//  43162 네트워크 https://school.programmers.co.kr/learn/courses/30/lessons/43162
//  240911 solve

import Foundation

/*
 #input
 solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])
 
 #output
 2
 */

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var result = 0
    var isVisited = [Bool](repeating: false, count: n)
    
    func dfs(k: Int) {
        isVisited[k] = true
        
        for i in 0..<n {
            if computers[k][i] == 1 && !isVisited[i] {
                dfs(k: i)
            }
        }
    }
    
    for i in 0..<n {
        if !isVisited[i] {
            result += 1
            dfs(k: i)
        }
    }
    
    return result
}
