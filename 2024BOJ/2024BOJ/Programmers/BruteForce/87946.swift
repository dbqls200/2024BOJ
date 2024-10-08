//
//  87946.swift
//  2024BOJ
//
//  Created by 김유빈 on 9/25/24.

//  87946 https://school.programmers.co.kr/learn/courses/30/lessons/87946?language=swift
//  240928 solve

/*
 #input
 solution(80, dungeons: [[80,20],[50,40],[30,10]])
 
 #output
 3
 */

import Foundation

func solution(_ k:Int, dungeons:[[Int]]) -> Int {
    var result = 0
    
    var tempArr = [Int](repeating: 0, count: dungeons.count)
    var permuArr = [[Int]]()
    var isVisited = [Bool](repeating: false, count: dungeons.count)
    
    var recentLevel = k
    
    // 조합을 만들자.
    func permutation(cnt: Int) {
        if cnt == dungeons.count {
            permuArr.append(tempArr)
            
            return
        }
        
        for i in 0..<dungeons.count {
            if !isVisited[i] {
                tempArr[cnt] = i
                isVisited[i] = true
                permutation(cnt: cnt + 1)
                isVisited[i] = false
            }
        }
    }
    
    permutation(cnt: 0)
    
    // 만든 조합으로 탐험을 떠나보자.
    for i in 0..<permuArr.count {
        var tempResult = 0
        var order = permuArr[i]

        recentLevel = k
        
        for j in 0..<order.count {
            if dungeons[order[j]][0] > recentLevel {
                continue
            }
            
            tempResult += 1
            
            recentLevel -= dungeons[order[j]][1]
        }
        
        result = max(result, tempResult)
    }
    
    return result
}
