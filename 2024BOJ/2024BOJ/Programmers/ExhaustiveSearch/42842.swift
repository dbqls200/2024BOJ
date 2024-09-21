//
//  42842.swift
//  2024BOJ
//
//  Created by 김유빈 on 9/21/24.

//  42842 카펫 https://school.programmers.co.kr/learn/courses/30/lessons/42842
//  240921 solve

import Foundation

/*
 #input
 solution(10, 2)
 
 #output
 [4, 3]
 
 */

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result: [Int] = []
    
    let area = brown + yellow
    var width = 0
    var length = 0

    for height in 1..<area {
        if area % height != 0 {
            continue
        }
        
        width = area / height
        
        length = 2 * (width + (height - 2))
        
        if brown == length {
            result.append(width)
            result.append(height)
            
            return [width, height]
        }
    }
    
    return result
}
