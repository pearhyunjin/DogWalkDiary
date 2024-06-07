//
//  DogWalkDiaryApp.swift
//  DogWalkDiary
//
//  Created by 배현진 on 5/22/24.
//

import SwiftUI

@main
struct DogWalkDiaryApp: App {
    var body: some Scene {
            WindowGroup {
                
                // DateHolder 변수 지정
                let dateHolder = DateHolder()
                
                // ContentView에 dateHolder 연결
                ContentView()
                    .environmentObject(dateHolder)
            }
        }
}
