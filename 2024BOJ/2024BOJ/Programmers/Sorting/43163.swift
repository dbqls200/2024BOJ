//
//  43163.swift
//  2024BOJ
//
//  Created by 김유빈 on 10/6/24.

//  단어 변환 43163 https://school.programmers.co.kr/learn/courses/30/lessons/43163
//  2410006 solve

/*
 #input
 solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
 solution("hit", "cog", ["hot", "dot", "dog", "lot", "log"])

 #output
 4
 0
 
 */

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var stack = [begin]
    var index = 0

    var result = 0
    var isVisited = [Bool](repeating: false, count: words.count + 1)

    // target 단어가 words에 없으면 끝내기 위해서
    if !words.contains(target) {
        return 0
    }
    
    while !stack.isEmpty {
        let word = stack.popLast()!
        
        // 여기 너무 지저분함 ;;
        if word != begin {
            index = words.firstIndex(of: word)!
            isVisited[index] = true
        }
                
        if word == target { return result }
        
        for w in words {
            let index = words.firstIndex(of: w)!
            if zip(word, w).filter({ $0 != $1 }).count == 1 && !isVisited[index] {
                stack.append(w)
            }
        }
        
        result += 1
    }
    
    return 0
}
