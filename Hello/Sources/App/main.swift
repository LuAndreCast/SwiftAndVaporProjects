import Vapor

let drop = Droplet()
drop.get("hello") { request in
    return "Hello, world!"
}
drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("posts", PostController())

drop.run()
