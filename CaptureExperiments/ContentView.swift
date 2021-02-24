//
//  ContentView.swift
//  CaptureExperiments
//
//  Created by Rafael Peñates on 24/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    @State var dni = ""
    @State var address = ""
    @State var city = ""
    @State var country = ""
    @State var phone = ""
    
    @State var next = false
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(destination: Screen2(), isActive: self.$next) {
                    EmptyView()
                }
                
                TextField("Nombre", text: self.$name)
                    .padding()
                TextField("Cedula", text: self.$dni)
                    .keyboardType(.decimalPad)
                    .padding()
                TextField("Direccion", text: self.$address)
                    .padding()
                TextField("Ciudad", text: self.$city)
                    .padding()
                TextField("Pais", text: self.$country)
                    .padding()
                TextField("Telefono", text: self.$phone)
                    .keyboardType(.phonePad)
                    .padding()
                
                Spacer()
                Button(action: {
                    let person = Person(name: self.name, dni: self.dni, address: self.address, city: self.city, country: self.country, phone: self.phone)
                    
                    PersonViewModel.instance.currentPerson = person
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
            .navigationBarTitle("Demo", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
