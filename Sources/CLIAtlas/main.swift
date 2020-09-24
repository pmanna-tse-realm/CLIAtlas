//
//  main.swift
//  CLIAtlas
//
//  Created by Paolo Manna on 24/09/2020.
//

import Foundation
import MongoSwiftSync

var murl: String = "mongodb+srv://Realm-student:Realm-basics@realmcluster.16vag.mongodb.net/video?readPreference=primaryPreferred&retryWrites=true&w=majority"
let client = try MongoClient(murl)

defer {
    cleanupMongoSwift()
}

let db = client.db("video")
let session = client.startSession(options: ClientSessionOptions(causalConsistency: true))

let movieCollection = db.collection("movieDetails", withType: MovieDetail.self)

do {
	var count	= 0
    let movies  = try movieCollection.find(["actors": "Robert De Niro"], options: FindOptions(), session: session)
    
    movies.forEach { (nextMovie) in
		if let movie = try? nextMovie.get() {
			count	+= 1
			
			if let title = movie.title, let actors = movie.actors {
				print("\(title) => \(actors)")
			}
		}
    }
	
	print("All movies: \(count)")
} catch {
    print(error.localizedDescription)
}
