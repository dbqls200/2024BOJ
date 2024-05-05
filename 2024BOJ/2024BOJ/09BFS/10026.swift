//
//  10026.swift
//  2024BOJ
//
//  Created by 김유빈 on 5/4/24.

//  [적록색약] https://www.acmicpc.net/problem/10026
//  solve

func _10026() {
    let n = Int(readLine()!)!
    var graph = [[String]]()
    
    var yesResult = 0 // 적록색약 O
    var noResult = 0 // 적록색약 X
    
    var queue: [[Int]] = []
    
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    for _ in 0..<n {
        graph.append(readLine()!.map{ String($0) })
    }
    
    var visited = [[Bool]](repeating: Array(repeating: false,count: n), count: n)
    
    /*
     1. 이중 for문 돌아야 하나 ?? yes. 모든 좌표 확인해야 같은 덩어리인지 다른 덩ㅇㅓ리인지 알 수 있듬.
     2. 적록yes랑 적록no랑 어케 구분함 ?? ㄱㄴㄲ 어케 함 ? BFS 따로 돌아줘야 하나 ? 한 번에 돌면서 체킹 못 합니꼬?
     
     - 첫 지점(0, 0) 큐에 넣기
     - 상하좌우 움직이면서
     - 현재 위치에 있는 단어랑 비교
     */
    
    // 일단 no적록부터 ㅎㅐ부자.
    for i in 0..<n {
        for j in 0..<n {
            if visited[i][j] == true { continue }
            
            visited[i][j] = true
            
            noResult += 1
            
            queue.append([i, j])
            
            while !queue.isEmpty {
                let next = queue.removeFirst()
                
                for k in 0..<4 {
                    let nx = next[0] + dx[k]
                    let ny = next[1] + dy[k]
                    
                    if nx >= n || ny >= n || nx < 0 || ny < 0 { continue }
                    
                    if visited[nx][ny] || graph[nx][ny] != graph[i][j] { continue }
                    
                    visited[nx][ny] = true
                    
                    queue.append([nx, ny])
                }
            }
        }
    }
    
    visited = [[Bool]](repeating: Array(repeating: false,count: n), count: n)
    queue = []
    
    // yes적록
    for i in 0..<n {
        for j in 0..<n {
            if visited[i][j] == true { continue }
            
            visited[i][j] = true
            
            yesResult += 1
            
            queue.append([i, j])
            
            while !queue.isEmpty {
                let next = queue.removeFirst()
                
                for k in 0..<4 {
                    
                    let nx = next[0] + dx[k]
                    let ny = next[1] + dy[k]
                    
                    if nx >= n || ny >= n || nx < 0 || ny < 0 { continue }
                    
                    if visited[nx][ny] {
                        continue
                    }
                    else {
                        if graph[nx][ny] != graph[i][j] {
                            if graph[i][j] == "B" || graph[nx][ny] == "B" { continue }
                            
                            visited[nx][ny] = true
                            queue.append([nx, ny])
                        } else {
                            visited[nx][ny] = true
                            queue.append([nx, ny])
                        }
                    }
                }
            }
        }
    }
    print("\(noResult) \(yesResult)")
}
