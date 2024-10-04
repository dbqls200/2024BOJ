//
//  42748.swift
//  2024BOJ
//
//  Created by 김유빈 on 10/4/24.

//  42748 K번째수 https://school.programmers.co.kr/learn/courses/30/lessons/42748?language=swift
//

/*
 #input
 solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])

 #output
 [5, 6, 3]
 */

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var firstIndex = 0
    var lastIndex = 0
    var k = 0
    
    var tempArray: [Int]
    var result: [Int] = []
    
    for command in commands {
        firstIndex = command[0] - 1
        lastIndex = command[1] - 1
        k = command[2] - 1
        
        tempArray = array[firstIndex...lastIndex].sorted()
                
        result.append(tempArray[k])
    }
    
    return result
}

// map 사용해서 푸는 방법을 익혀보자 !~!
func solution2(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var firstIndex = 0
    var lastIndex = 0
    var k = 0
    
    return commands.map { command in
        firstIndex = command[0] - 1
        lastIndex = command[1] - 1
        k = command[2] - 1
        
        return array[firstIndex...lastIndex].sorted()[k]
        
    }
}
