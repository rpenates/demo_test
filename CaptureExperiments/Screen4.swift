//
//  Screen4.swift
//  CaptureExperiments
//
//  Created by Rafael Peñates on 24/02/21.
//

import SwiftUI

struct Screen4: View {
    
    @State var next = false
    
    var body: some View {
        VStack {
            
            NavigationLink(destination: Screen5(), isActive: self.$next) {
                EmptyView()
            }
            
            Text("Semaforo no implementado")
            Spacer()
            Button(action: {
                self.next.toggle()
            }){
                HStack{
                    Text("Siguiente")
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

struct Screen4_Previews: PreviewProvider {
    static var previews: some View {
        Screen4()
    }
}
