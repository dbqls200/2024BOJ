//
//  7562.swift
//  2024BOJ
//
//  Created by 김유빈 on 5/7/24.

//  [나이트의 이동] https://www.acmicpc.net/problem/7562
//  solve

func _7562() {
    let t = Int(readLine()!)!
        
    let dx = [-2, -2, -1, -1, 1, 1, 2, 2]
    let dy = [-1, 1, -2, 2, -2, 2, -1, 1]

    var queue: [[Int]] = []
    
    for _ in 0..<t {
        let length = Int(readLine()!)!
        let now = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let will = readLine()!.split(separator: " ").map{ Int(String($0))! }
        
        var graph = [[Int]](repeating: Array(repeating: 0, count: length), count: length)
        var visited = [[Bool]](repeating: Array(repeating: false, count: length), count: length)

        queue.append(now)
        visited[now[0]][now[1]] = true

        while !queue.isEmpty {
            let next = queue.removeFirst()
            let (x, y) = (next[0], next[1])
            
//            if next == will { break }
            
            for i in 0..<8 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || ny < 0 || nx >= length || ny >= length { continue }
                
                if visited[nx][ny] { continue }
                
                queue.append([nx, ny])
                visited[nx][ny] = true
                graph[nx][ny] = graph[x][y] + 1
                
            }
        }
        
        print(graph[will[0]][will[1]])
    }
    
    
}

