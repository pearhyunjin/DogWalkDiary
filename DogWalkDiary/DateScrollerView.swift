//
//  DateScrollerView.swift
//  DogWalkDiary
//
//  Created by 배현진 on 5/24/24.
//

import SwiftUI

// 캘린더 월 변경하는 부분 구현
// 왼,오른쪽 화살표를 클릭해 해당 월을 변경한다
struct DateScrollerView: View
{
    // dateHolder 연결
    // dateHolder.date -> 오늘 날짜
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View
    {
        // 수평 정렬
        HStack
        {
            // 이전 달 버튼
            Button(action: previousMonth)
            {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
            }
            
            // 여백
            Spacer()
            
            // 년도,월 표시
            // CalendarHelper에서 monthYearString 함수에 date 변수 값 넣어 연산하고 폰트와 동작 등 지정
            Text(CalendarHelper().monthYearString(dateHolder.date))
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
            
            // 여백
            Spacer()
            
            // 다음 달 버튼
            Button(action: nextMonth)
            {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
            }
        }
    }
    
    // 이전 달 버튼 클릭 이벤트
    func previousMonth()
    {
        // dateHolder의 date 변수에 (CalendarHelper의 minusMonth 함수에 현재 date 변수를 넣어 계산한) 값 대입
        dateHolder.date = CalendarHelper().minusMonth(dateHolder.date)
    }
    
    // 다음 달 버튼 클릭 이벤트
    func nextMonth()
    {
        // dateHolder의 date 변수에 (CalendarHelper의 plusMonth 함수에 현재 date 변수를 넣어 계산한) 값 대입
        dateHolder.date = CalendarHelper().plusMonth(dateHolder.date)
    }
}

struct DateScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollerView()
    }
}
