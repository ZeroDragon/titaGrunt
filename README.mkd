#TitaGrunt  

**Titagrunt** is a set of grunt actions to use *coffeescript* in your Titanium + Alloy application.  
  
###Requirements  
You will need node package manager installed  

###Setup  
- Copy *package.json* to your app root folder  
- Add:  

	`node_modules/*`  
	
	To .gitignore
- Install with `npm install` from the command line  
- To use .coffee files on your controllers, create a new directory: `app/controllers/src/` and place your Coffee Script files there with the same name as it sould. Eg:
	`app/controllers/src/index.coffee` will compile `app/controllers/index.js`
  
###Usage
Once is instaled, just type `grunt` to start listening for changes on the `app/controllers/src` folder.  
  
Also there are two titanium test configs that can be trigger like this:  
- `grunt titanium:iosTest` : to do a test build on ios (--build-only)  
- `grunt titanium:ios` : to do a full build to the default ios simulator
  
Feel free to tweak the `Gruntfile.coffee` for your needs.
