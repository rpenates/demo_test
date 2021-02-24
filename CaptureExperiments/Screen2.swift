//
//  Screen2.swift
//  CaptureExperiments
//
//  Created by Rafael Peñates on 24/02/21.
//

import SwiftUI
import Kingfisher

struct Screen2: View {
    @State var showCamera = false
    @State private var imageData: Data = .init(capacity: 0)
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    @State var next = false
    
    var body: some View {
        
        NavigationLink(destination: PhotoPickerController(canShow: self.$showCamera, imageData: self.$imageData, source: self.sourceType), isActive: self.$showCamera) {
            EmptyView()
        }
        
        NavigationLink(destination: Screen3(), isActive: self.$next) {
            EmptyView()
        }
        
        
        VStack {
            if self.imageData.count != 0 {
                Image(uiImage: UIImage(data: self.imageData)!)
                    .resizable()
                    .frame(width: 310, height: 210)
                    .cornerRadius(10)
            } else {
                KFImage(URL(string: "https://picsum.photos/300"))
                    .resizable()
                    .frame(width: 310, height: 210, alignment: .center)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action: {
                self.showCamera.toggle()
            }){
                HStack{
                    Text("Tomar foto")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }.padding(10)
            .background(Color.blue)
            .cornerRadius(10)
            
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

struct Screen2_Previews: PreviewProvider {
    static var previews: some View {
        Screen2()
    }
}
