//
//  10799.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/20/24.
//  [쇠막대기] https://www.acmicpc.net/problem/10799
//  solve

import Foundation

func _10799() {
    let str = readLine()!
    
    var cutCnt: Int = 0 // result, 잘린 막대 수
    var barCnt: Int = 0 // 놓인 막대기
    var pre: Character = " "
    
    for s in str {
        if s == "(" {
            barCnt += 1
            
        } else {  // ")"
            if pre == s { // "))"
                cutCnt += 1
                barCnt -= 1
            } else {
                // "()"
                barCnt -= 1
                cutCnt += barCnt
            }
        }
        pre = s
    }

    print(cutCnt)
}
 // 스택으로 풀어보기. + 스트링 배열 써서 풀어보기.
