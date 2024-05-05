//
//  1012.swift
//  2024BOJ
//
//  Created by 김유빈 on 5/2/24.

//  [유기농 배추] https://www.acmicpc.net/problem/1012
//  solve

func _1012() {
    // 1926 그림문제랑 비슷한 것 같음.
    // 붙어있는 덩어리 세기 !
    
    // 입력받는 거 개까다롭네 ;;
    // 앞에 거처럼 입력 달ㄹㅏ고여 ;;
    let t = Int(readLine()!)! // 테스트 케이스 수
    
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    for _ in 0..<t {
        var result = 0

        var queue: [[Int]] = []
        
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! } // m: 가로/width, n: 세로/height, k: 배추 위치 총 개수
        let (width, height, k) = (input[0], input[1], input[2])
        
        var graph = [[Int]](repeating: Array(repeating: 0,count: width), count: height)
        var visited = [[Bool]](repeating: Array(repeating: false,count: width), count: height)
        
        for _ in 0..<k {
            let xy = readLine()!.split(separator: " ").map{ Int(String($0))! }
            let (x, y) = (xy[1], xy[0])
            graph[x][y] = 1
        }
        
        // bfs를 돌려부자
        
        /*
         그림 문제랑 비슷하게
         이중 for문 돌면서 -> 이ㅣ중 for문을 왜 또 돌아. 이미 좌표 주는데. -> 좀 더 생각해보기
         
         ... 1분도 안 지나서 생각 바뀜 ...
         
         돌아야 하나 ....? 돌아야 되네 미띤. -> 그림 문제처럼 일단 풀어보자.
         그래야 연결되어 있는지 파악 ㄱㄴ. 후엥
         
         width, height, x, y 개헷갈림요.
         
         */
         
        for i in 0..<height {
            for j in 0..<width {
                /*
                 1. 방문한 적 있으면 넘어가기, 0이면 넘어가기
                 2. 덩어리 체킹
                 3. 방문 표시
                 4. 큐에 현재 위치 추가
                 5. while 돌기
                    1. 큐에서 다음 좌표 값 꺼내기
                    2. 상하좌우 돌면서
                        1. nx, ny가 그래프 벗어나는지 체크하기 -> 벗어나면 continue
                        2. 이미 방문했거나 1이 아니면 넘어가기
                        3. 방문 표시
                        4. nx, ny 좌표 큐에 추가하기
                 */
                
                if graph[i][j] == 0 || visited[i][j] { continue }
                
                result += 1
                
                visited[i][j] = true
                
                queue.append([i, j])
                
                while !queue.isEmpty {
                    let next = queue.removeFirst()
                    
                    for k in 0..<4 {
                        let nx = next[0] + dx[k]
                        let ny = next[1] + dy[k]
                        
                        if nx >= height || ny >= width || nx < 0 || ny < 0 { continue }
                        
                        if graph[nx][ny] != 1 || visited[nx][ny] { continue }
                        
                        visited[nx][ny] = true
                        
                        queue.append([nx, ny])
                    }

                }
            }
        }
        print(result)
    }
}
