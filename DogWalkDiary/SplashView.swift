//
//  SplashView.swift
//  DogWalkDiary
//
//  Created by 배현진 on 5/25/24.
//

import SwiftUI

struct SplashView: View
{
    var body: some View {
            ZStack {
                Color.blue
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
//                    Image(systemName: "star.fill")
//                        .font(.system(size: 100))
//                        .foregroundColor(.white)
                    Text("산책 일기")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
        }
}
