//
//  12909.swift
//  2024BOJ
//
//  Created by 김유빈 on 10/13/24.

//  12909 올바른 괄호 https://school.programmers.co.kr/learn/courses/30/lessons/12909
//  241013 solve

/*
 #input
 solution("()()")
 solution("(())()")
 solution(")()(")
 solution("(()))")
 
 #output
 true
 true
 false
 false
 */

import Foundation

func solution(s:String) -> Bool {
    var stack: [Character] = []
    
    if s.count % 2 != 0 { return false }
        
    for bracket in s {
        if bracket == "(" {
            stack.append(bracket)
        } else {
            if stack.isEmpty {
                return false
            }
            stack.removeLast()
        }
    }
    
    return stack.isEmpty
}
