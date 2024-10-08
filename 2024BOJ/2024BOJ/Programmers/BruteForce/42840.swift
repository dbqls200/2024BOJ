//
//  42840.swift
//  2024BOJ
//
//  Created by 김유빈 on 9/11/24.

//  42840 모의고사 https://school.programmers.co.kr/learn/courses/30/lessons/42840
//  240907 solve

import Foundation

/*
 #input
 solution([1,2,3,4,5])
 
 #output
 [1]
 */

func solution(_ answers:[Int]) -> [Int] {
    // 수포자 1, 2, 3의 답안과 정답지 비교하기
    // 1, 2, 3마다 문제 맞힌 수 기록하기
    // 가장 많이 맞힌 사람 파악하기
    // 여러 명일 경우, 오름차순으로 return
    
    let supo1 = [1, 2, 3, 4, 5]
    let supo2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let supo3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var checking = [0, 0, 0]
    
    var result: [Int] = []
    
    for i in 0..<answers.count {
        if answers[i] == supo1[i % supo1.count] {
            checking[0] += 1
        }
        
        if answers[i] == supo2[i % supo2.count] {
            checking[1] += 1
        }
        
        if answers[i] == supo3[i % supo3.count] {
            checking[2] += 1
        }
    }
    
    for i in 0..<checking.count {
        if checking.max()! == checking[i] {
            result.append(i + 1)
        }
    }

    return result
}
