//
//  Screen3.swift
//  CaptureExperiments
//
//  Created by Rafael Peñates on 24/02/21.
//

import SwiftUI
import MapKit

struct Screen3: View {
    
    @ObservedObject var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 5.06889, longitude:  -75.51738), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State var next = false
    
    var body: some View {
        VStack {
            
            NavigationLink(destination: Screen4(), isActive: self.$next) {
                EmptyView()
            }
            
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
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
        .onAppear(perform: {
            self.locationManager.startLocationService()
        })
    }
}

struct Screen3_Previews: PreviewProvider {
    static var previews: some View {
        Screen3()
    }
}
