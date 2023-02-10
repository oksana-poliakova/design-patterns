//
//  JobContacterFactory.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 09.02.2023.
//

import Foundation

// MARK: - Example 2

// First, we will create the interface (or rather, protocol) that we will use to send our customized emails to our potential clients with information on the type of job they are seeking.

protocol JobContactProtocol {
    func sendRequestResumeEmail() -> String
}

// Let’s also add a struct for the Contact object.

struct Contact {
    var name: String
    var email: String
    var job: Job
    var desiredSal: Double
    
    enum Job {
        case iOS
        case Android
        case Web
        case QA
        case Product_Owner
    }
}

// MARK: - Next, we will create several template objects that adhere to the JobContacterProtocol.

struct iOSDeveloperJobSeeker: JobContactProtocol {
    var contact: Contact
    
    init(contact: Contact){
        self.contact = contact
    }
     
    func sendRequestResumeEmail() -> String {
        return "Dear \(contact.name), this is the best time to be an iOS developer! Send me you're resume today! I have job opportunities that pay \(contact.desiredSal)."
    }
}

struct AndroidDeveloperJobSeeker: JobContactProtocol {
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func sendRequestResumeEmail() -> String {
        return "Dear \(contact.name), this is as decent time to be an Android developer! Send me you're resume today! I have job opportunities that pay close to the \(contact.desiredSal) you are looking for"
    }
}

struct WebDeveloperJobSeeker: JobContactProtocol {
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func sendRequestResumeEmail() -> String {
        return "Dear \(contact.name), Send me you're resume today! I have job opportunities for you."
    }
}

struct QADeveloperJobSeeker: JobContactProtocol {
    var contact: Contact
    
    init(contact: Contact){
        self.contact = contact
    }
    
    func sendRequestResumeEmail() -> String {
        return "Dear \(contact.name), The market is tough but the code is still buggy!  Good news for you because I know the best companies for buggy code and they need you!"
    }
}

struct ProductOwnerDeveloperJobSeeker: JobContactProtocol {
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func sendRequestResumeEmail() -> String {
        return "Dear \(contact.name), Times are still good to be in development.  Maybe you should consider learning to code or going back to code. If we can cut your desired salary of \(contact.desiredSal) in half, I should be able to place you as a contract to hire. Send me your resume!"
    }
}

// Our next step is to create the actual factory that our client will use to get a concrete object that adheres to our protocol. The factory object in our case has just one method to return the job seeker object that adheres to the JobContacterProtocol based on a contact object that is passed in as a parameter to the function.

// Our factory hides the need to know the type of object created because we will use our interface methods when we want to do anything with the created object.

struct JobContacterFactory {
    static func createJobSeeker(contact: Contact) -> JobContactProtocol {
        switch contact.job {
        case .iOS:
            return iOSDeveloperJobSeeker(contact: contact)
        case .Android:
            return AndroidDeveloperJobSeeker(contact: contact)
        case .Web:
            return WebDeveloperJobSeeker(contact: contact)
        case .QA:
            return QADeveloperJobSeeker(contact: contact)
        case .Product_Owner:
            return ProductOwnerDeveloperJobSeeker(contact: contact)
        }
    }
}

// In our example, we can create several contacts that we want to reach out to with opportunities. We can then contact these prospects with our exposed interface and cutdown our processing time with automation!

func createContacts() {
    var contacts = [Contact]()
    
    contacts.append(Contact(name: "J Rob", email: "jrob@example.com", job: .iOS, desiredSal: 135000))

    contacts.append(Contact(name: "K Rock", email: "krock@example.com", job: .Android, desiredSal: 134000))

    contacts.append(Contact(name: "P Money", email: "pmoney@example.com", job: .Web, desiredSal: 110000))

    contacts.append(Contact(name: "S Sham", email: "ssham@example.com", job: .QA, desiredSal: 95000))

    contacts.append(Contact(name: "L Roger", email: "lroger@example.com", job: .Product_Owner, desiredSal: 165000))
    
    contacts.forEach { contact in
        let client = JobContacterFactory.createJobSeeker(contact: contact)
        print (client.sendRequestResumeEmail())
    }
}






