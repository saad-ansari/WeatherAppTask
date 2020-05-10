# WeatherAppTask
Developed an application to get current weather and forecast of next 5 days of the cities using OpenWeatherMap API

# Screenshots
<img src="https://user-images.githubusercontent.com/2099415/81489438-6cfcc800-9286-11ea-90ca-852c7c183cad.png" width="200" height="433" hspace="20"/><img src="https://user-images.githubusercontent.com/2099415/81489444-7e45d480-9286-11ea-9a6f-8dce2005f292.png" width="200" height="433" hspace="20"/><img src="https://user-images.githubusercontent.com/2099415/81489441-79812080-9286-11ea-8b8c-0a4e4f488bde.png" width="200" height="433" hspace="20"/><img src="https://user-images.githubusercontent.com/2099415/81489445-7f770180-9286-11ea-906f-d3472554159d.png" width="577" height="433" hspace="20"/>

## Table of Contents (Optional)

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Coding](#coding)
- [Unit Testing](#testing)
- [Author](#author)
- [License](#license)
- [Acknowledgments](#acknowledgments)

### Prerequisites
```
iOS 13.0+
Xcode 11.4+
Swift 5
```
### Installation

Below are step by step series that tells how to get a development env running
```
### How to run the example?

* Clone this repo
* Open shell window and navigate to project folder
* Run `pod install`
* Open `WeatherAppTask.xcworkspace` and run the project on selected device or simulator
```
### Coding
```
* WeatherAppTask is developer using "MVVM" desing pattern.
* View layer seprate to handle all the UI.
* ViewModel layer to communicated between UI and Model layer.
* Model layer to handle all date and network related task.
* Using Combine framework to manage state.
* Creating bindings between your UI and your ViewModel with SwiftUI.
```
## Testing

WeatherAppTask has few UnitTest up and running.

### How to test UnitTest
```
* Run the tests using CMD+U
* To view test cases : open `WeatherAppTaskTests.swift` 
* To run separet test : open `Show the Test navigator` from the navigator panel.
* To view the code coverage of the UnitTest : open `Show the Report navigator` from the navigator panel.
```

## Author

* **Muhammad Saad Ansari** - *Initial work*

## License

WeatherAppTask is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

