//
//  ContentView.swift
//  DogWalkDiary
//
//  Created by 배현진 on 5/22/24.
//

import SwiftUI

struct ContentView: View 
{
    // DateHolder 연결
    @EnvironmentObject var dateHolder: DateHolder
    // Splash 이용하기 위해 변수 지정
    @State private var showMainView = false
//    @State var clickedDates : Set<Date> = []
    
    var body: some View
    {
        // 네비게이션뷰
        NavigationView {
            
            // 수직 정렬
            VStack {
                
                // 여백
                Spacer().frame(height: 100)
                
                // 텍스트 삽입 -> 이후에는 산책 횟수에 따라 텍스트 바뀌도록 지정
                Text("오늘도 행복하게 산책 완료!")
                    .padding()
                
                // 앞뒤정렬
                ZStack {
                    // showMainView = true일때(하지만 화면시작에는 무조건 false, 앞서 변수 지정해주었기 때문)
                    // 메인 콘텐츠나 이후의 뷰들 작성
                    if showMainView {
                        
                        // 수직 정렬
                        VStack(spacing: 5) {
                            
                            // DateScrollerView (dateHolder 변수로) 가져옴 -> 즉 현재 날짜에 해당하는 형태의 달력 가져옴
                            DateScrollerView()
                                        .environmentObject(dateHolder)
                                        .padding()
                            // 일주일(요일) 출력
                            dayOfWeekStack
                            calendarGrid
                                    
                        }
                        .frame(width: 300, height: 400)
                    
                    } else {
                        
                        SplashView()
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        showMainView = true
                                    }
                                }
                            }
                        }
                    }
                Spacer()
                
                HStack {
                    Spacer().frame(width: 20)
                    NavigationLink(destination: NaviView()) {
                        Text("일기")
                            .foregroundColor(.blue)
                            .padding()
//                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                    Spacer()
                    NavigationLink(destination: NaviView()) {
                        Text("설명")
                            .foregroundColor(.blue)
                            .padding()
//                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                    Spacer().frame(width: 20)
                }
                
            }
            .navigationTitle("")
//            .navigationBarBackButtonHidden(true)
        }
    }
    
    // 일요일 시작 형태로 요일 출력
    var dayOfWeekStack: some View
    {
        // 수평 정렬
        HStack(spacing: 1)
        {
            Text("Sun").dayOfWeek()
            Text("Mon").dayOfWeek()
            Text("Tue").dayOfWeek()
            Text("Wed").dayOfWeek()
            Text("Thu").dayOfWeek()
            Text("Fri").dayOfWeek()
            Text("Sat").dayOfWeek()
        }
    }
    
    // 캘린터 형태로 생성
    var calendarGrid: some View
    {
        // 수직 정렬
        VStack(spacing: 1)
        {
            // CalendarHelper통해 각각 daysInMonth, firstOfMonth, weekDay, minusMonth, daysInMonth 함수 선언
            // 변수로는 dateHoler.date로 현재 날짜 사용 (startingSpaces, daysInPrevMonth 제외)
            
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
            let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth)
            let clicked = false
            
            // 6번 반복
            ForEach(0..<6)
            {
                // 열 (몇째 주)
                row in
                
                // 수평 정렬
                HStack(spacing: 1)
                {
                    // 7번 반복
                    ForEach(1..<8)
                    {
                        // 행 (요일 -> 일 : 1, 월 : 2, ... 토 : 7)
                        column in
                        
                        // count 변수에 column(행) + row(열) * 7 대입 -> 날짜!!!
                        let count = column + (row * 7)
                        CalendarCell(count: count, startingSpaces:startingSpaces, daysInMonth: daysInMonth, daysInPrevMonth: daysInPrevMonth, clicked: clicked)
                            .environmentObject(dateHolder)
                        
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct NaviView: View {
    var body: some View {
        VStack {
            Text("Navi View")
                .padding()
        }
        .navigationTitle("Navi2")
//        .navigationBarTitleDisplayMode(/*<#T##displayMode: NavigationBarItem.TitleDisplayMode##NavigationBarItem.TitleDisplayMode#>*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Text
{
    func dayOfWeek() -> some View
    {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}
