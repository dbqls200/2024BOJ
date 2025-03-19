//
//  42889.swift
//  2024BOJ
//
//  Created by 김유빈 on 3/19/25.
//

/*
 반복문 돌면서,
 1. 현재 stage 지나간 플레이어 수 찾기
 2. 현재 stage에 머무르고 있는 플레이어 수 찾기
 3. 2번 / 1번 수식으로 각 스테이지 실패율 찾기
 4. 실패율 내림차순으로 스테이지 번호 정렬하기 (실패율 같은 경우에는 스테이지 번호 오름차순)
 */

func _42889(_ N: Int, _ stages: [Int]) -> [Int] {
    var failureRates: [(stage: Int, rate: Double)] = []
    var stageCounts = [Int](repeating: 0, count: N + 1)
    var totalPlayers = stages.count
    
    for stage in stages {
        if stage <= N {
            stageCounts[stage - 1] += 1
        }
    }
    
    var remainingPlayers = Double(totalPlayers)
    
    for stage in 1...N {
        let currentStagePlayers = Double(stageCounts[stage - 1])
        
        let failureRate = remainingPlayers > 0 ? currentStagePlayers / remainingPlayers : 0
        failureRates.append((stage, failureRate))
        
        remainingPlayers -= currentStagePlayers
    }
    
    return failureRates.sorted { $0.rate == $1.rate ? $0.stage < $1.stage : $0.rate > $1.rate }
        .map { $0.stage }
}
