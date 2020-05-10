# WeatherAppTask
Developed an application to get current weather and forecast of next 5 days of the cities.

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
This project is developer using "MVVM" desing pattern focusing totaly in to code reuseablity and optimization technique.
* View layer seprate to handle all the UI
* ViewModel layer to communicated between UI and Model layer
* Model layer to handle all date and network related task
* Using Combine framework to manage state.
* Creating bindings between your UI and your ViewModel with SwiftUI.
```
## Testing

Project has few UnitTest up and running.

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

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

