//
//  14891.swift
//  2024BOJ
//
//  Created by 김유빈 on 7/8/24.

//  [톱니바퀴] https://www.acmicpc.net/problem/14891
//

func _14891() {
    // 입력
    var board: [[Int]] = [[]] // 0번 비워두고 1번부터 사용할 수 있도록
    
    for _ in 0..<4 {
        board.append(readLine()!.split(separator: "").map{ Int(String($0))! })
    }
    
    let k = Int(readLine()!)!
    
    var info: [[Int]] = []
    
    for _ in 0..<k {
        info.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
    }
    
    print(board)
    print(info)
    
    var answer = 0
    
    // 점수 계산
    for i in 0..<4 {
        if board[i][0] == 1 {
            answer += 1 << i
        }
    }
    
    print(answer)
    
    func go(x: Int, dir: Int) {
        var dirs = [Int]()
        dirs[x] = dir
        
        // 왼쪽으로 회전 전파
        var idx = x
        while idx > 0 && board[idx][6] != board[idx - 1][2] {
            print("😍 \(dirs)")
            dirs[idx - 1] = -dirs[idx]
            print("🍎 \(dirs)")
            
            idx -= 1
        }
        
        // 오른쪽으로 회전 전파
        idx = x
        while idx < 3 && board[idx][2] != board[idx + 1][6] {
            dirs[idx + 1] = -dirs[idx]
            idx += 1
        }
        
        for i in 0..<4 {
            if dirs[i] == -1 {
                board.append(board.first!)
                board.removeFirst()
            } else if dirs[i] == 1 {
//                rotate(board[i].begin(), board[i].begin() + 7, board[i].end())
            }
        }
    }
}
