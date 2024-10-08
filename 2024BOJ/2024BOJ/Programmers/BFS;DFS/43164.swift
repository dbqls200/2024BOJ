//
//  43164.swift
//  2024BOJ
//
//  Created by 김유빈 on 9/28/24.

//  43164 여행경로 https://school.programmers.co.kr/learn/courses/30/lessons/43164
//  

/*
 #input
 solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]])
 solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]])
 #output
 
 */

import Foundation

// 출발지는 무조건 ICN
// ICN 출발이 여러개면? -> 도착지 알파벳 빠른 순.
// 도착지가 출발지가 되는 항공권 찾기

func solution(_ tickets:[[String]]) -> [String] {
    var result: [String] = []
    
    var isUsed = [Bool](repeating: false, count: tickets.count)
    var sortedTickets: [[String]]
    
    var lastIndex = 0
    
    sortedTickets = tickets.sorted { ($0[0], $0[1]) < ($1[0], $1[1]) }
    print(sortedTickets)
    
    func dfs(_ depth: Int, start: String) {
        if depth == sortedTickets.count + 1 {
            // 지금까지 가져온 거 보관해야 함.
            return
        }
        
        let index = sortedTickets.indices.filter( { sortedTickets[$0][0] == start })
        

        // 사용한 항공권이면 넘어가기
        for idx in index where !isUsed[idx] {
            result.append(start)

            isUsed[idx] = true
            
//            lastIndex = idx
            
            dfs(depth + 1, start: sortedTickets[idx][1])
            // 배열에 추가한 거 삭제해야 함.
            isUsed[idx] = false
        }

    }
    
    dfs(0, start: "ICN")
    
    
    // 마지막 항공권 도착지만 추가하면 끝남.
//    result.append(sortedTickets[lastIndex][1])
    
    return result
}
