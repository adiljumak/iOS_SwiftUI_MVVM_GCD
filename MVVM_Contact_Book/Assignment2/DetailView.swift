//
//  DetailView.swift
//  Assignment2
//
//  Created by Adilzhan Jumakanov on 23.09.2021.
//

import SwiftUI

struct DetailView: View {
    
    var contact: Contact
    @ObservedObject var contactViewModel: ContactViewModel
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        VStack {
            Image(contact.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(100)
                .shadow(radius: 10)
            Text(contact.name)
                .font(.title)
                .fontWeight(.medium)
            Form {
                Section{
                    HStack {
                    Text("Phone")
                    Spacer()
                    Text(contact.phoneNumber)
                        .foregroundColor(.gray)
                        .font(.callout)
                    }
                }
                Section {
                    Button(action: {
                        
                    }, label: {
                        Text("Call")
                            .foregroundColor(.green)
                    })
                    Button(action: {
                        
                        var i = 0
                        for con in contactViewModel.contacts {
                            if con.id == contact.id {
                                break
                            } else {
                                i = i + 1
                            }
                        }
                        contactViewModel.contacts.remove(at: i)
                        self.presentation.wrappedValue.dismiss()
                    }, label: {
                         
                            Text("Delete")
                                .foregroundColor(.red)
                        
                    })
                    
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(contact: Contact.init(name: "dasdsa", phoneNumber: "asdas", imageName: "male"), contactViewModel: ContactViewModel())
    }
}
