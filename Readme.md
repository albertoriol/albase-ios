
# ALBase

## Introducction
Here you have my base project, using a real technical assesment as an example to build it and see if it is useful. This assesment consists in creating a demo app to retrieve a large json from an endpoint, show a list with gnomes and detailed view if you press one. You can also filter them by profession. 

## Architecture
The applications is build based on the VIPER architecture. 
Considering the size and the scope of the app it has been overenginered, but the purpose is to be used as a base project for a bigger one. 

## Libraries
### Alamofire
Used for network requests. It is a widely known and used library created by Matt (former Apple engineer).

### Kingfisher
For downloading and caching images.

### EasyPeasy
Easy way to code layout views. Specially useful working in a project with +1 iOS developer, as merging .storyboard and .xib files is a headache (and the performance for rendering this files in XCode is really bad).

### KRProgressHUD
Easy-to-use progress HUD to notify the user.

### iOSSnapshotTestCase
This library allows to compare view snapshots to a "reference image" stored in your source code repository and fails the test if the two images don't match.


I also would like to mention that in this repository Pod folder is included, to make it easy and just download and compile. But in a real project I would add a .gitignore file and ignore this folder, as it rises the size of the project and make tons of unnecessary changes.

Hope you like it,

Albert Oriol
aoriol91@gmail.com
