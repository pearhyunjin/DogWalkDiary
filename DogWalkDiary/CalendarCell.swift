//
//  CalendarCell.swift
//  DogWalkDiary
//
//  Created by 배현진 on 5/25/24.
//

import SwiftUI

struct CalendarCell: View 
{
    // dateHolder 연결
    @EnvironmentObject var dateHolder: DateHolder
    @State var clickedDates : Set<Int> = []
    
    // 변수 선언
    let count : Int
    let startingSpaces : Int
    let daysInMonth : Int
    let daysInPrevMonth : Int
    
    var clicked : Bool = false
    
    var body: some View
    {
        // 앞뒤정렬
        ZStack {
            
            let clicked = clickedDates.contains(count)
            
            // monthStruct의 day()함수 이용해 날짜 String으로 출력
            Text(monthStruct().day())
                // monthStruct의 monthType(Previous, Current, Next)에 따라서 글자 색상 지정
                // 글자 클릭되었을 경우 지정하기
                .foregroundColor(textColor(type: monthStruct().monthType))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture {
                    if clicked {
                        clickedDates.remove(count)
                    } else {
                        clickedDates.insert(count)
                    }
                }
            
            if clicked {
                Circle()
                    .opacity(0.1)
                    .foregroundColor(.blue)
//                Text("Clicked")
//                    .font(.caption)
//                    .foregroundColor(.red)
            }
        }
        
    }
    
    // 텍스트 색상 지정 함수 MonthType(Previous, Current, Next)을 변수로 받는다.
    func textColor(type: MonthType) -> Color
    {
        // MonthType이 Current일 경우 검정색으로, 나머지(이전,다음)의 경우 회색으로
        return type == MonthType.Current ? Color.black : Color.gray
    }
    
    // monthStruct() 함수
    func monthStruct() -> MonthStruct
    {
        // startingSpaces 값이 0일 경우 7을 더한 값 반환하고 아닐 경우 그대로.
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        
        // count(시작은 1)가 start(위의 연산을 통해 시작은 1)값보다 작거나 같을때
        if(count <= start)
        {
            // 날짜 변수 지정
            let day = daysInPrevMonth + count - start
            
            // MonthStruct에 각각의 값 대입하며 선언
            return MonthStruct(monthType: MonthType.Previous, dayInt: day)
        }
        
        // count - start 값이 daysInMonth보다 큰 경우
        else if (count - start > daysInMonth)
        {
            // 날짜 변수 지정
            let day = count - start - daysInMonth
            return MonthStruct(monthType: MonthType.Next, dayInt: day)
        }
        
        // 날짜 변수 지정
        let day = count - start
        
        // 현재 날짜에 해당하는 월의 경우에 해당하는 변수들 대입해 MonthStruct 선언
        return MonthStruct(monthType: MonthType.Current, dayInt: day)
    }
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        // count = 1, startingSpaces = 1, daysInMonth = 1, daysInPrevMonth = 1, clicked = false
        // 위의 내용 CalendarCell에 대입하며 시작
        CalendarCell(count: 1, startingSpaces: 1, daysInMonth: 1, daysInPrevMonth: 1, clicked: false)
    }
}
