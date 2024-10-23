//
//  42587.swift
//  2024BOJ
//
//  Created by 김유빈 on 10/22/24.

//  42587 프로세스 https://school.programmers.co.kr/learn/courses/30/lessons/42587
//  241023 solve

import Foundation

/*
 #input
 solution([2, 1, 3, 2], 2)
 solution([1, 1, 9, 1, 1, 1], 0)
 
 #output
 1
 5
 */

func solution(priorities:[Int], location:Int) -> Int {
    var queue: [(Int, Int)] = []
    var result: [(Int, Int)] = []
    
    for (index, priority) in zip(priorities.indices, priorities) {
        queue.append((index, priority))
    }
    
    while !queue.isEmpty {
        var firstPriority = queue.max(by: { $0.1 < $1.1 })!.1
        
        if let first = queue.first?.1, first == firstPriority {
            result.append(queue.removeFirst())
        } else {
            queue.append(queue.removeFirst())
        }
    }
        
    return (result.enumerated().first(where: { $0.element.0 == location })?.offset ?? 0) + 1
}
