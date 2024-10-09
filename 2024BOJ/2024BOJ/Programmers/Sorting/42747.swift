//
//  42747.swift
//  2024BOJ
//
//  Created by 김유빈 on 10/9/24.

//  42747 H-Index https://school.programmers.co.kr/learn/courses/30/lessons/42747
//  241009 solve

/*
 #input
 solution([3, 0, 6, 1, 5])
 solution([1, 11, 111, 1111])
 
 #output
 3
 3
 */

import Foundation

func solution(citations:[Int]) -> Int {
    var result: [Int] = []
    let sortedCitations = citations.sorted()
    
    for i in 0..<sortedCitations.count + 1 {
        if sortedCitations.filter({ $0 >= i }).count == i {
            return i
        }
    }
    
    return result.max()!
}
