//
//  3273.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/4/24.
//

import Foundation

//func _3273() {
//    let _ = Int(readLine()!)!
//    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
//    let x = Int(readLine()!)!
//
//    var resultArr = Array(repeating: 0, count: arr.max()! + 1)
//    var cnt: Int = 0
//    var temp: Int = 0
//
//    for i in arr {
//        if resultArr[i] == 0 {
//            resultArr[i] = 1
//        }
//    }
//
//    for i in arr {
//        temp = x - i
//
//        if temp > 0 && temp <= resultArr.count - 1 {
//            if resultArr[temp] == 1  {
//                cnt += 1
//                resultArr[temp] = 0
//                resultArr[i] = 0
//            }
//
//        }
//    }
//
//    print(cnt)
//}

func _3273() {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    let x = Int(readLine()!)!
    
    var resultArr = Array(repeating: 0, count: 2000001)
    var cnt: Int = 0
    var temp: Int = 0
    
    for i in arr {
        if resultArr[i] == 0 {
            resultArr[i] = 1
        }
    }
    
    for i in arr {
        temp = x - i
        
        if temp > 0 && temp != i {
            if resultArr[temp] == 1 {
                cnt += 1
                resultArr[temp] = 0
                resultArr[i] = 0
            }
        }
    }
    
    print(cnt)
}
