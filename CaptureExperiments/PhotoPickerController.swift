//
//  PhotoPickerController.swift
//  CaptureExperiments
//
//  Created by Rafael Peñates on 24/02/21.
//

import Foundation
import SwiftUI

struct PhotoPickerController: UIViewControllerRepresentable {
    
    @Binding var canShow: Bool
    @Binding var imageData: Data
    var source: UIImagePickerController.SourceType
    
    func makeCoordinator() -> PhotoPickerController.Coordinator {
        return PhotoPickerController.Coordinator(conexion: self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Empty stub, not used
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.allowsEditing = true
        controller.delegate = context.coordinator
        controller.navigationBar.isHidden = true
        return controller
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var conexion : PhotoPickerController
        
        init(conexion : PhotoPickerController){
            self.conexion = conexion
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.conexion.canShow.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            let data = image.jpegData(compressionQuality: 80)
            self.conexion.imageData = data!
            self.conexion.canShow.toggle()
        }
    }
}

