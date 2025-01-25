//
//  161989.swift
//  2024BOJ
//
//  Created by 김유빈 on 1/26/25.

//  161989 덧칠하기 https://school.programmers.co.kr/learn/courses/30/lessons/161989
//

/*
 section[0]에 m만큼 페인트칠 -> section[0] + m 이 값은 done에 저장해두기
 done이 section[1]보다 작으면 페인트칠 또 진행 -> section[1] + m
 done이 section[2]보다 크면? 반복문 종료 아니고 계속 진행 continue
 section을 전부 돌기는 해야 한다.
 
 이걸 정리해보면,
 section for문 {
    done > section[i] -> continue
    done <= section[i] -> done = section[i] + m / 페인트칠 횟수 +1
 */

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var done = 0
    var cnt = 0
    
    for now in section {
        if done > now { continue }
        
        done = now + m
        cnt += 1
    }
    
    return cnt
}
