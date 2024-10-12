//
//  42579.swift
//  2024BOJ
//
//  Created by 김유빈 on 10/12/24.
//

/*
 #input
 solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500])
 
 #output
 [4, 1, 3, 0]
 */

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var bestAlbum: [Int] = []
    
    var genreTotalPlays: [String: Int] = [:]
    var genrePlays: [(Int, String, Int)] = [] // [(1, classic, 500)]
    
    for (index, (genre, play)) in zip(genres, plays).enumerated() {
        genreTotalPlays[genre, default: 0] += play
        genrePlays.append((index, genre, play))
    }

    // 플레이수 많은 곡 순서대로 정렬
    genrePlays.sort(by: { $0.2 > $1.2 })

    //
    let sortedGenre = genreTotalPlays.sorted(by: { $0.value > $1.value })

    for genre in sortedGenre {
        let songs = genrePlays.filter{ $0.1 == genre.key }.prefix(2).map{ $0.0 }
        bestAlbum += songs
    }

    return bestAlbum
}
