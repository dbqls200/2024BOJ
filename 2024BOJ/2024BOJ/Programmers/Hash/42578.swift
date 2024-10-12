//
//  42578.swift
//  2024BOJ
//
//  Created by 김유빈 on 10/11/24.

//  42578 의상 https://school.programmers.co.kr/learn/courses/30/lessons/42578
//  241012 solve

/*
 #input
 solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])
 
 #output
 5
 */

import Foundation

func solution(clothes:[[String]]) -> Int {
    var kind: [String: Int] = [:]
    var result = 1
    
    clothes.forEach { kind[$0[1], default: 0] += 1 }

    kind.values.forEach{ result *= ($0 + 1) }

    return result - 1
}
