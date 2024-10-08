//
//  86491.swift
//  2024BOJ
//
//  Created by 김유빈 on 9/11/24.

//  86491 최소직사각형 https://school.programmers.co.kr/learn/courses/30/lessons/86491
//  240907 solve

import Foundation

/*
 #input
 solution([[60, 50], [30, 70], [60, 30], [80, 40]])
 
 #output
 4000
 */

func solution(_ sizes:[[Int]]) -> Int {
    // 각 명함마다, 가로 길이 / 세로 길이 비교하여 max를 가로 길이로 생각하기
    // for문 돌면서 width / height 값 업데이트 하기
    // 결과 = 가로 길이 중에서 max 값 * 세로 길이 중에서 max 값
    
    var width = 0
    var height = 0
    
    for size in sizes {
        width = max(width, size.max()!)
        height = max(height, size.min()!)
    }
    
    return width * height
}
