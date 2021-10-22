//
//  ContentView.swift
//  Assignment2
//
//  Created by Adilzhan Jumakanov on 23.09.2021.
//

import SwiftUI
S	
struct Contact: Identifiable {
    var name: String
    var phoneNumber: String
    var imageName: String
    var id = UUID()
}


 
class ContactViewModel: ObservableObject {
    @Published var contacts: [Contact] = [
        .init(name: "Adilzhan Dzhumakanov", phoneNumber: "87073453355", imageName: "male"),
        .init(name: "Natasha Romanov", phoneNumber: "87777777777", imageName: "female")
    ]



//func showAllContacts() {
//    contacts = [
//        .init(name: "Adilzhan Dzhumakanov", phoneNumber: "87073453355", imageName: "male"),
//        .init(name: "Natasha Romanov", phoneNumber: "987777777777", imageName: "female")
//    ]
//}
}

struct ContentView: View {
   @ObservedObject var contactViewModel = ContactViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contactViewModel.contacts) { contact in
                    NavigationLink(destination: DetailView(contact: contact, contactViewModel: contactViewModel)) {
                        ContactView(contact: contact)
                    }
                }.onDelete(perform: removeContact)
            }
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                NavigationLink(destination: AddContactView(contactViewModel: contactViewModel, name: "", phoneNumber: "", image: "male")) {
                Button("Add contact") {
                
                }
                }
            })
        }
    }
    
    
    private func removeContact(at indexSet: IndexSet) {
        contactViewModel.contacts.remove(atOffsets: indexSet)
    }
    
    private func addContact(name: String, phoneNumber: String, imageName: String) {
        let contact: Contact = Contact.init(name: name, phoneNumber: phoneNumber, imageName: imageName)
        contactViewModel.contacts.append(contact)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ContactView: View {
    var contact: Contact
    
    var body: some View {
        HStack(spacing: 15) {
            Image(contact.imageName)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            VStack(spacing: 15) {
                Text(contact.name)
                    .bold()
                Text(contact.phoneNumber)
            }
        }
    }
}
