# SI1-ProgressView

[![CI Status](https://img.shields.io/travis/SI-Du/SI1-ProgressView.svg?style=flat)](https://travis-ci.org/SI-Du/SI1-ProgressView)
[![Version](https://img.shields.io/cocoapods/v/SI1-ProgressView.svg?style=flat)](https://cocoapods.org/pods/SI1-ProgressView)
[![License](https://img.shields.io/cocoapods/l/SI1-ProgressView.svg?style=flat)](https://cocoapods.org/pods/SI1-ProgressView)
[![Platform](https://img.shields.io/cocoapods/p/SI1-ProgressView.svg?style=flat)](https://cocoapods.org/pods/SI1-ProgressView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SI1-ProgressView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SI1-ProgressView'
```
## Screen Shot
<br>
<img height="500" src="https://github.com/SI-Du/SI1-ProgressView/blob/master/Screen%20Shot.png" />
<br>

## Usage

### Get started
Import the library where you want to use it. Create a `CircleProgressView` object, init it to your `views`. Otherwise, you have also create a `IBOutlet` and init it in your storyboard or xib file. 

```swift
import SI1_ProgressView

// ...
let progressView: CircleProgressView!

override func viewDidLoad() {
    super.viewDidLoad()
    progressView = CircleProgressView(frame: // ...)
}
```

### Example Configuration

```
class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var containChartProgressView: UIView!
    
     // MARK: - Properties
    private var chartProgressView: CircleProgressView!
    
    //...
    
    // MARK: - Initialization Method
    private func configurationView() {
        chartProgressView = CircleProgressView(frame: CGRect(x: 0, y: 0, width: containChartProgressView.frame.width, height: containChartProgressView.frame.height))
        containChartProgressView.addSubview(chartProgressView)
        chartProgressView.circleProgressType = .chart
        chartProgressView.progressPathWidth = 0.4
        chartProgressView.countLabelFontSize = 40
        chartProgressView.progressValue = 69
        chartProgressView.circleProgressPathColor = .cyan
    }
}
```

### Customization

```
- circleStrokePathColor // Defines the stroke shape color, defaults is `lightGray`

- progressPathColor  // Defines the progress path color, defaults is `blue`
 
- progressPathWidth  // Defines the progress path width, defaults is `0.25`. That would means, It’s gain 25% of content view

- circleProgressType  // Defines the type for circle progress , defaults is `chart`

- duration // The time that progress would be active. It’s just available on `countdown` type

- progressValue // Defines the values for progress. It’s available on `chart` type

- countLabelFontSize // Defines the count label font size, defaults is `15`

```

## Author

SI1 Team, du.bv@neo-lab.vn

## License

SI1-ProgressView is available under the MIT license. See the LICENSE file for more info.
