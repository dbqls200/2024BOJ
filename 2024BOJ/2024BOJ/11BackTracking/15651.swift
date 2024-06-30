//
//  15651.swift
//  2024BOJ
//
//  Created by 김유빈 on 6/30/24.

//  [N과 M (3)] https://www.acmicpc.net/problem/15651
//  solve

func _15651() {
    // 입력
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (n, m) = (input[0], input[1])
    
    /*
     1부터 N까지 자연수 중에서 M개를 고른 수열. 중복 가능.
     사전 순으로 증가하는 순서로 출력.
     
     중복 체크할 필요 없음.
     */
    
    var arr = [Int](repeating: 0, count: m)
    var answer = ""
    
    func back(k: Int) {
        if k == m {
            // 매번 print 해주는 부분에서 시간 초과 남.
            // answer 변수 하나 두고 마지막에 한 번만 출력하는 걸로 해결.
//            for i in 0..<m {
//                print(arr[i], terminator: " ")
//            }
//            print()
            
            for i in 0..<m {
                answer += "\(arr[i]) "
            }
            answer += "\n"
            
            return
        }
        
        for i in 1...n {
            arr[k] = i
            back(k: k + 1)
        }
    }
    
    back(k: 0)
    
    print(answer)
}
