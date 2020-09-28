//
//  main.swift
//  CLIAtlas
//
//  Created by Paolo Manna on 24/09/2020.
//

import Foundation
import MongoSwiftSync

guard CommandLine.argc > 3 else {
	print("Usage: \(CommandLine.arguments[0]) <user> <password> <host>")
	exit(1)
}

let mUserStr	= CommandLine.arguments[1]
let mPwdStr		= CommandLine.arguments[2]
let mHostStr	= CommandLine.arguments[3]
let mURLStr		= "mongodb+srv://\(mUserStr):\(mPwdStr)@\(mHostStr).mongodb.net/video?readPreference=primaryPreferred&retryWrites=true&w=majority"
let mClient		= try MongoClient(mURLStr)

defer {
    cleanupMongoSwift()
}

let db = mClient.db("video")
let session = mClient.startSession(options: ClientSessionOptions(causalConsistency: true))

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
