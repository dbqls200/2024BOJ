//
//  42746.swift
//  2024BOJ
//
//  Created by 김유빈 on 10/4/24.

//  42746 가장 큰 수 https://school.programmers.co.kr/learn/courses/30/lessons/42746?language=swift
//  241004 solve

/*
 #input
 solution([6, 10, 2])
 solution([3, 30, 34, 5, 9])
 solution([0, 0, 0])
 
 #output
 "6210"
 "9534330"
 "0"
 */

import Foundation

func solution(numbers:[Int]) -> String {
    let strNumbers = numbers.map{ String($0) }.sorted {
        return $0 + $1 > $1 + $0
    }
    
    if strNumbers[0] == "0" { return "0" }

    return strNumbers.reduce("") { $0 + $1 }
}
