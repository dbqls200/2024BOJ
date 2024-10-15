//
//  42586.swift
//  2024BOJ
//
//  Created by 김유빈 on 10/14/24.

//  42586 기능개발 https://school.programmers.co.kr/learn/courses/30/lessons/42586
//

/*
 #input
 solution([93, 30, 55], [1, 30, 5])
 
 #output
 [2, 1]
 */

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer = [Int]()
    
    let days = zip(progresses, speeds).map { progress, speed -> Int in
        let remaining = 100 - progress
        
        return (remaining + speed - 1) / speed
    }
    
    var now = 0
    for i in 1..<days.count {
        if days[now] < days[i] {
            answer.append(i - now)
            now = i
        }
    }
    
    answer.append(days.count - now)

    return answer
}
