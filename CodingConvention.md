## 코드 레이아웃

### 들여쓰기 및 띄어쓰기

- 들여쓰기에는 탭(tab) 대신 2개의 space를 사용합니다.
- 콜론(`:`)을 쓸 때에는 콜론의 오른쪽에만 공백을 둡니다.

    ```swift
    static let identifier: String = "MainVC"
    ```

### 임포트

모듈 임포트는 알파벳 순으로 정렬합니다. 내장 프레임워크를 먼저 임포트하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트합니다.

```swift
import UIKit

import SwiftyColor
import SwiftyImage
import Then
import URLNavigator
```

## 네이밍

### 클래스

- 클래스 이름에는 UpperCamelCase를 사용합니다.
``` swift
class MainVC: UIViewController
class PopUpCell: UITableViewCell
```

### 함수

- 함수 이름에는 lowerCamelCase를 사용합니다.
- 함수 이름 앞에는 되도록이면 `get`을 붙이지 않습니다.
 ``` swift 
  private func setbattleInformation()
  private func authorizeHealthKit()
```
- 버튼 클릭 시 Action 함수는 버튼 이름 + DidTab 이름으로 정의합니다.
``` swift
@IBAction func runButtonDidTap(_ sender: Any)
```
- 각 뷰의 viewDidLoad() 함수 안에는 최대한 함수만 사용합니다.
```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        mainBasicLayout()
        setbattleInformation()
    }
```
- 기본 레이아웃들은 함수로 만들어서 viewDidLoad()에 넣어줍니다.
```swift
func mainBasicLayout() {
        self.view.backgroundColor = UIColor.salmon
        secondView.backgroundColor = UIColor.white
        secondView.layer.cornerRadius = 20
        runButton.backgroundColor = UIColor.lightishBlue
```

### 변수,상수

- 변수(var)와 상수(let) 이름에는 lowerCamelCase를 사용합니다.

### 열거형

- enum의 각 case에는 lowerCamelCase를 사용합니다.

    **좋은 예:**

    ```swift
    enum Result {
      case .success
      case .failure
    }
    ```
    
    **나쁜 예:**

    ```swift
    enum Result {
      case .Success
      case .Failure
    }
    ```
    

## 클래스와 구조체

- 클래스와 구조체 내부에서는 `self`를 명시적으로 사용합니다.
- 구조체를 생성할 때에는 Swift 구조체 생성자를 사용합니다.

    **좋은 예:**

    ```swift
    UIColor(red: 253.0 / 255.0, green: 85.0 / 255.0, blue: 85.0 / 255.0, alpha: 1.0)
    ```
