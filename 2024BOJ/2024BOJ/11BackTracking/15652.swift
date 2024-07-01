//
//  15652.swift
//  2024BOJ
//
//  Created by 김유빈 on 7/1/24.

//  [N과 M (4)] https://www.acmicpc.net/problem/15652
//  solve

func _15652() {
    // 입력
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (n, m) = (input[0], input[1])
    
    /*
     1부터 N까지 자연수 중에서 M개를 고른 수열.
     사전 순으로 증가하는 순서로 출력.
     
     같은 수 중복 가능.
     !! 비내림차순. 원소1 <= 원소2 <= 원소3 ... <= 원소n
     */
    
    var arr = [Int](repeating: 0, count: m)
    var answer = ""
    
    func back(k: Int) {
        if k == m {
            for i in 0..<m {
                answer += "\(arr[i]) "
            }
            answer += "\n"
            
            return
        }
        
        var start = 1
        if k != 0 {
            start = arr[k - 1]
        }
        
        for i in start..<n + 1 {
            arr[k] = i
            back(k: k + 1)
        }
    }
    
    back(k: 0)
    
    print(answer)
}
