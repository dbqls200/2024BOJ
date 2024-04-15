//
//  2164.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/15/24.
//

import Foundation


func _2164() {
    // 1. 시간 초과 !
//    let n: Int = Int(readLine()!)!
//    var array: [Int] = Array(1...n)
//    var cnt: Int = 1
//    
//    if n == 1 {
//        
//    } else {
//        while array.count > 1 {
//            switch(cnt % 2) {
//            case 1:
//                array.removeFirst()
//                cnt += 1
//            case 0:
//                array.append(array.first!)
//                array.removeFirst()
//                cnt += 1
//                
//            default:
//                break
//            }
//        }
//        
//    }
//    
//    
//    print(array[0])
    
    
    //2. remove 대신 0 값 넣기 - solve!
    let n: Int = Int(readLine()!)!
    var array: [Int] = Array(1...n)
    var cnt: Int = 0
    
    if n == 1 {
        print(1)
    } else {
        while array.count > 1 {
            array[cnt] = 0
            array.append(array[cnt + 1])
            array[cnt + 1] = 0
            
            if array[array.count - 2] == 0 {
                print(array.last!)
                break
            }
            
            cnt += 2
        }
        
    }
}
