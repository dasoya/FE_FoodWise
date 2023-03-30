//
//  getMenuPicture.swift
//  FoodWise
//
//  Created by dasoya on 27.03.23.
//

import SwiftUI


struct getMenuPicture: View {
    
    @State private var image: Image?
    
    
    @State private var showActionSheet = false
    
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            
            HStack{
                QuestionHeader(title: "어떤 음식을 드셨나요?", order: 2)
            }
            Button(action: {
                self.showActionSheet = true
            }) {
                
                
                
                if selectedImage != nil{
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 173)
                } else {
                    Image("photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 173)
                }
                
            }
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("음식 사진을 어떻게 가져올까요?"), buttons: [
                .default(Text("촬영하기"), action: {
                    self.isImagePickerDisplay = true
                    self.sourceType = .camera
                }),
                .default(Text("사진첩에서 고르기"), action: {
                    self.isImagePickerDisplay = true
                    self.sourceType = .photoLibrary
                }),
                .cancel()
            ])
        }
        .sheet(isPresented: self.$isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
        }
    }
}


struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator // confirming the delegate
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    // Connecting the Coordinator class with this struct
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: ImagePickerView
    
    init(picker: ImagePickerView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
    
}

struct getMenuPicture_Previews: PreviewProvider {
    static var previews: some View {
        getMenuPicture()
    }
}
