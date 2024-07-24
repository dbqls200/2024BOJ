//
//  10989.swift
//  2024BOJ
//
//  Created by 김유빈 on 7/19/24.

//  [수 정렬하기 3] https://www.acmicpc.net/problem/10989
//  solve

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

}

func _10989() {
    
    let fIO = FileIO()
    
    /// 입력
    let n = fIO.readInt()
    var arr = [Int]()
    print(n)
    
    for _ in 0..<n {
        let i = fIO.readInt()
        
        arr.append(i)
    }
    
    var cnt = [Int](repeating: 0, count: 10001)
    
    /// 방법 1.
    /// 카운팅 정렬 O(n)
    // 중복된 수도 있음. 입력 최대 개수 천만개임 ;; 제한시간 5초.
    
    // 숫자 등장 횟수 카운트
    for i in 0..<n {
        cnt[arr[i]] += 1
    }
    
    // 카운팅 배열 누적합 계산
    for i in 1..<10001 {
        cnt[i] += cnt[i - 1]
    }
    
    var answer = ""
    var result = [Int](repeating: 0, count: n + 1)
    
    // sorting 시작
    for i in 1..<n + 1 {
        result[cnt[arr[n - i]]] = arr[n - i]
        cnt[arr[n - i]] -= 1
    }
    
    for i in 1..<n + 1 {
        answer += "\(result[i])\n"
    }
    
    print(answer)
    
    
    /// 방법 2.
    // 시간 초과 뜸 -.-
    // O(n log n)인데, 수 개수가 최대 10,000,000 이만큼 들어옴.
//    arr.sorted(by: <).forEach { a in
//        print(a)
//    }
//    
//    /// 출력
//    arr.forEach { a in
//        print(a)
//    }
}
