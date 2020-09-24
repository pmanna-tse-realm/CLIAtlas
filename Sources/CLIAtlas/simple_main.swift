/*
import Foundation
import MongoSwiftSync

var murl: String = "mongodb+srv://m001Student:m001MongoDBBasics@sandbox.5drg2.mongodb.net/swiftcli?readPreference=primaryPreferred&retryWrites=true&w=majority"
let client = try MongoClient(murl)

let db = client.db("swiftcli")
let session = client.startSession(options: ClientSessionOptions(causalConsistency: true))

struct Person: Codable {
   let firstname: String
   let lastname: String
   let date: Date = Date()
   let assigned: Bool
   let _id: BSONObjectID
}

let personCollection = db.collection("students", withType: Person.self)

let url = URL(fileURLWithPath: "students.csv", relativeTo: nil)
var tempAssigned: Bool
var count: Int = 0
var header: Bool = true

do {
    let contents    = try String(contentsOf: url)
    let rows        = contents.components(separatedBy: .newlines)
    
	for aRow in rows {
		if !aRow.isEmpty {
			let values	= aRow.components(separatedBy: ",")
			
			guard values.count >= 3 else { continue }
			
			if header == true {
				header = false
			} else {
				if values[2].lowercased() == "false" || Bool(values[2]) == false {
					tempAssigned = false
				} else {
					tempAssigned = true
				}
				let person	= Person(firstname: values[0], lastname: values[1], assigned: tempAssigned, _id: BSONObjectID())
				
				try personCollection.insertOne(person, session: session)
				count += 1
				print("Inserted: \(count) \(aRow)")
			}
		}
	}
} catch {
    print(error.localizedDescription)
}
*/

