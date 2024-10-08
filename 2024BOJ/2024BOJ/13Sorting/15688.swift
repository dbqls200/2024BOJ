//
//  15688.swift
//  2024BOJ
//
//  Created by 김유빈 on 7/24/24.

//  [수 정렬하기 5] https://www.acmicpc.net/problem/15688
//  

func _15688() {
    /// 입력
    let n = Int(readLine()!)!
    var arr = [Int]()
    
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    
    /// 정렬하기
    // 비내림차순.
    // 카운팅 정렬로 풀까
    // -> 아닝 ... 런타임 에러 뜸.
    
    var cnt = [Int](repeating: 0, count: 10001)
    
    // 숫자 등장 횟수 카운트
    for i in 0..<n {
        cnt[arr[i]] += 1
    }
    
    // 카운팅 배열 누적합 계산
    for i in 1..<10001 {
        cnt[i] += cnt[i - 1]
    }
    
    var result = [Int](repeating: 0, count: n + 1)
    
    // sorting 시작
    for i in 1..<n + 1 {
        result[cnt[arr[n - i]]] = arr[n - i]
        cnt[arr[n - i]] -= 1
    }
    
    /// 출력
    for i in 1..<n + 1 {
        print(result[i])
    }
}
