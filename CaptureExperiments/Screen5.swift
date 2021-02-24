//
//  Screen5.swift
//  CaptureExperiments
//
//  Created by Rafael Peñates on 24/02/21.
//

import SwiftUI

struct Screen5: View {
    var body: some View {
        VStack {
            EmptyView()
            Spacer()
            Button(action: {
                PersonViewModel.instance.sendData()
            }){
                HStack{
                    Text("Enviar info")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }.padding(10)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct Screen5_Previews: PreviewProvider {
    static var previews: some View {
        Screen5()
    }
}
