//
//  LoadingView.swift
//  CaptureExperiments
//
//  Created by Rafael Peñates on 24/02/21.
//

import SwiftUI
import Foundation

struct LoadingView<Content>: View where Content: View {
    @Binding var isShowing: Bool
    var text: String
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                if (!self.isShowing) {
                    self.content()
                } else {
                    self.content()
                        .disabled(self.isShowing)
                        .blur(radius: self.isShowing ? 3 : 0)
                    
                    HStack {
                        LoadingIndicator(style: .large)
                        Text(self.text)
                            .fontWeight(.bold)
                    }
                    .frame(width: geometry.size.width / 2.0, height: geometry.size.height / 6.0)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .opacity(self.isShowing ? 1 : 0)
                    .padding(.all)
                }
            }
        }
    }
}

