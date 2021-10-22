//
//  AddContactView.swift
//  Assignment2
//
//  Created by Adilzhan Jumakanov on 23.09.2021.
//

import SwiftUI



struct AddContactView: View {
    
    @ObservedObject var contactViewModel: ContactViewModel
    @Environment(\.presentationMode) var presentation
    
    @State var name: String
    @State var phoneNumber: String
    @State var image: String
    
    var body: some View {
       
        NavigationView {
            
            VStack {
                
                Form {
                    Section {
                        TextField("Enter name and surname", text: $name)
                    }
                    Section {
                        TextField("Enter phone number", text: $phoneNumber)
                    }
                    Picker("",selection: $image) {
                            ForEach(["male", "female"], id: \.self) {
                                Text($0)
                            }
                    }.pickerStyle(WheelPickerStyle.init())
                    
                    
                }
                
                
                
            
                Button(action: {
                    
                    contactViewModel.contacts.append(Contact.init(name: name, phoneNumber: phoneNumber, imageName: image))
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                       
                    
                })
                
            }
            .navigationBarTitle("New contact", displayMode: .inline)
        }
        
    }
    
}


struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(contactViewModel: ContactViewModel(), name: "", phoneNumber: "", image: "")
    }
}
