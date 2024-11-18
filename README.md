# Earthquake

EarthquakeDemo is an iOS application built with UIKit that displays a list of earthquakes fetched from a remote API. The app demonstrates modern iOS development practices, including MVVM architecture, async/await for network requests, and unit testing.

## Technical Overview

### Architecture
- **MVVM (Model-View-ViewModel)**: The app follows the MVVM architectural pattern for clear separation of concerns.

### Key Components
- **EarthquakeListModel**: The ViewModel responsible for fetching and managing earthquake data.
- **EarthquakeService**: A protocol defining the contract for fetching earthquake data.
- **Earthquake**: A model representing earthquake data, including properties like magnitude, location, and coordinates.

### Networking
- Uses Swift's modern concurrency model with `async/await` for network requests.
- Implements error handling for network operations.

### User Interface
- Built with UIKit

### Testing
- Includes unit tests for the `EarthquakeListModel`.
- Uses a `MockEarthquakeService` for isolated testing of the ViewModel.

### Dependencies
- No external dependencies are used, leveraging Apple's native frameworks.

## Getting Started

1. Clone the repository
2. Open `EarthquakeDemo.xcodeproj` in Xcode
3. Build and run the project on your simulator or device

## Running Tests

To run the unit tests:
1. In Xcode, go to Product > Test or use the shortcut `⌘U`
2. View the test results in the Test Navigator


