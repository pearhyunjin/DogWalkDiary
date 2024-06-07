
import Foundation

// 관찰 가능한 개체인 DateHoder 클래스를 만든다.
class DateHolder: ObservableObject
{
    // 오늘 날짜로 초기화할 게시 변수 날짜 소개
    @Published var date = Date() // todays date
}
