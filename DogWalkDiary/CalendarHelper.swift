//
//  CalendarHelper.swift
//  DogWalkDiary
//
//  Created by 배현진 on 5/25/24.
//

import Foundation

class CalendarHelper
{
    // 변수 저장
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    
    // 날짜 String 표시 함수 (date 변수로 받음)
    func monthYearString(_ date: Date) -> String
    {
        // 날짜 형식 지정
        dateFormatter.dateFormat = "LLL yyyy"
        // 함수로 받은 date 변수 위에서 지정한 데이터 형식으로 변환시키고 리턴
        return dateFormatter.string(from: date)
    }
    
    // 입력된 변수(date)에서 +1 해주고 리턴 (date 변수로 받음)
    func plusMonth(_ date: Date) -> Date
    {
        // calendar 변수(Calendar.current)의 날짜 중 month에 대해 1을 추가하고 리턴
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    // 입력된 변수(date)에서 -1 해주고 리턴 (date 변수로 받음)
    func minusMonth(_ date: Date) -> Date
    {
        // calendar 변수(Calendar.current)의 날짜 중 month에 대해 -1 추가하고 리턴
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    // 입력받은 변수(date)를 이용해 해당 월의 날짜 수를 구한다. (1월 : 31일, 2월 : 28일, ...)
    func daysInMonth(_ date: Date) -> Int
    {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    // 입력받은 변수(date)를 통해 해당 월의 일자를 넣어준다. (1월 : 1~31일의 정수 리턴, 2월 : 1~28일, ...)
    func dayOfMonth(_ date: Date) -> Int
    {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    // 입력받은 변수(date)를 통해 해당 월의 첫 날짜를 구한다.
    func firstOfMonth(_ date: Date) -> Date
    {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    // 입력받은 변수(date)를 통해 일주일 중 어느 요일인지를 구한다..? (위의 함수를 이용해 구한 날짜를 통해 요일을 구하기..)
    func weekDay(_ date: Date) -> Int
    {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
    
}
