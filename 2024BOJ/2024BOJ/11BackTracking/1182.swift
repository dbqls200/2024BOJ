//
//  1182.swift
//  2024BOJ
//
//  Created by 김유빈 on 7/1/24.

//  [부분수열의 합] https://www.acmicpc.net/problem/1182
//  solve긴 한데 애매함 -.-

/*
 부분 수열 갯수별로 돌려야 함?
 원소 1개짜리 수열, 2개짜리 수열, ... 이렇게 ?
 하면 시간 초과 안 남?
 ㄴ 남. 젠장.
 ㄴ 어케 해결함? ㅜ
 */

func _1182() {
    // 입력
    var input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (n, s) = (input[0], input[1])

    input = readLine()!.split(separator: " ").map{ Int(String($0))! }

    var isUsed = [Bool](repeating: false, count: n + 1)

    var answer = 0 // 부분 수열 카운트
    var temp = 0 // 부분 수열 합

    func back(k: Int, cnt: Int) {
        if k == cnt {
            if temp == s {
                answer += 1
            }
            
            return
        }
        
        var start = k
        if k != 0 {
            start = k + 1
        }
        
        for i in start..<n {
            if !isUsed[i] {
                temp += input[i]
                isUsed[i] = true
                back(k: k + 1, cnt: cnt)
                isUsed[i] = false
                temp -= input[i]
            }
        }
    }

    for j in 1..<n + 1 {
        temp = 0
        back(k: 0, cnt: j)
    }

    print(answer)
}


// 풀이 참고해서 품.
func _1182_2() {
    // 입력
    var input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (n, s) = (input[0], input[1])
    
    input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    var answer = 0
    
    func back(k: Int, sum: Int) {
        if k == n {
            if sum == s {
                answer += 1
            }
            return
        }
        
        back(k: k + 1, sum: sum)
        back(k: k + 1, sum: sum + input[k - 1])
    }
    
    back(k: 0, sum: 0)
    
    if s == 0 {
        answer -= 1
    }
    
    print(answer)
}
