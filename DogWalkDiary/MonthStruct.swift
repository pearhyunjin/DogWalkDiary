//
//  MonthStruct.swift
//  DogWalkDiary
//
//  Created by 배현진 on 5/25/24.
//
import Foundation
import SwiftUI

struct MonthStruct
{
    // 변수 선언
    var monthType: MonthType
    var dayInt : Int
    
    func day() -> String
    {
        return String(dayInt)
    }
}

// enum 변수
enum MonthType
{
    case Previous
    case Current
    case Next
}
