//
//  getMenuPicture.swift
//  FoodWise
//
//  Created by dasoya on 27.03.23.
//

import SwiftUI


struct getMenuPicture: View {

    @State private var image: Image?
    @State private var showCaptureImageView: Bool = false

    @State private var showActionSheet = false
    @State private var showImagePicker = false

       var body: some View {
           Button(action: {
                   self.showActionSheet = true
               }) {
                   
                   HStack{
                       
                        Text("Select Photo")
                   }
               }
               .actionSheet(isPresented: $showActionSheet) {
                   ActionSheet(title: Text("Select Source"), buttons: [
                       .default(Text("Camera"), action: {
                           self.showImagePicker = true
                       }),
                       .default(Text("Photo Library"), action: {
                           self.showImagePicker = true
                       }),
                       .cancel()
                   ])
               }
               .sheet(isPresented: $showImagePicker) {
                  // ImagePicker(sourceType: self.showActionSheet ? .camera : .photoLibrary) { image in
                       // Do something with the selected image
                  // }
               }
       }
}


struct CaptureImageView {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    init(isShown: Binding<Bool>, image: Binding<Image?>) {
        _isShown = isShown
        _image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = Image(uiImage: uiImage)
        }
        isShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

//struct getMenuPicture_Previews: PreviewProvider {
//    static var previews: some View {
//     //   getMenuPicture()
//    }
//}
