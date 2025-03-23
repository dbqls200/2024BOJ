//
//  155652.swift
//  2024BOJ
//
//  Created by 김유빈 on 3/22/25.
//

func _155652(_ s:String, _ skip:String, _ index:Int) -> String {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz").filter { !skip.contains($0) }
    var result = ""
    
    // skip 단어 제외하고 알파벳 배열 만들기
    
    /* skip 단어 제외하기 위해, 처음 사용했던 방법 */
    // for skipChar in skip {
    //     if let index = alphabet.firstIndex(of: skipChar) {
    //         alphabet.remove(at: index)
    //     }
    // }
    
    // 단어 변환하기
    for char in s {
        if var newIndex = alphabet.firstIndex(of: char) {
            newIndex = (newIndex + index) % alphabet.count
            result += String(alphabet[newIndex])
        }
    }
    
    return result
}
