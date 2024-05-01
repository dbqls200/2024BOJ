//
//  2178.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/23/24.
//  [미로 탐색] https://www.acmicpc.net/problem/2178

func _2178() {
    let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    
    var graph: [[Int]] = []
    
    let dx = [-1, 1, 0, 0] // 좌우 이동
    let dy = [0, 0, -1, 1] // 상하 이동
    
    var nx = 0
    var ny = 0
    
    var deque: [[Int]] = []
    var x = 0
    var y = 0
    
    for _ in 0..<n {
        graph.append(readLine()!.map{ Int(String($0))! })
    }
        
    deque.append([x, y])
    
    while !deque.isEmpty {
        let tmp = deque.removeFirst()
        x = tmp[0]
        y = tmp[1]
        
        for i in 0..<4 {
            nx = x + dx[i]
            ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m {
                continue
            }
            if graph[nx][ny] == 0 { continue }
            
            if graph[nx][ny] == 1 {
                graph[nx][ny] = graph[x][y] + 1
                deque.append([nx, ny])
            }
        }
    }
    
    print(graph[n-1][m-1])
}
