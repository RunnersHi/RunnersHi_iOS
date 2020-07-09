# 파일 폴더링

## 목차

- Runners_Hi 파일
    - Surpporting File
    - Source
      - Cell
      - View)
      - Extensions
      - Model
      - Service
      - ViewController
    - Resource
      - Assets
      - StoryBoards
      - 폰트
    
### 🍎 Surpporting File
: 기본 파일 중 프로젝트에 도움이 되는 파일들이 들어있다.<br>
###### ->  AppDelegate.swift, SceneDelegate.swift, info.plist

### 🍎 Source
#### 🍏 Cell
: CollectionView, TableView 등에서 각 Cell에 적용할 Cell 파일들이 들어있다. <br>
###### ->  ex) PopUpCell.swift, GenderSelectCell.swift
#### 🍏 Controller
: 뷰컨을 제외한 컨트롤러가 들어있다. 현재는 UINavigationController와 UITabBarController가 들어있다. <br>
###### ->  ex)MainNC.swift, MainTBC.swift
``` swift
class MainNC: UINavigationController {
}
```
#### 🍏 Extensions
: 자주 쓰는 폰트, color들을 확장으로 선언해서 단순 선언을 통해 사용하기 편하게 만들어주는 파일들이 들어있다.   <br>
###### ->  ex) UIColor+Extension.swift
``` swift
extension UIColor {
  @nonobjc class var salmon: UIColor {
    return UIColor(red: 1.0, green: 113.0 / 255.0, blue: 112.0 / 255.0, alpha: 1.0)
  }
} 
```
#### 🍏 Model
: 구조체(Struct) 파일들이 들어있다. 이 파일들은 주로 서버에서 값을 받아올 때 사용된다.
###### ->  ex) SignupData.swift
``` swift
struct SignupData: Codable {
    var status: Int
    var success: Bool
    var message: String
}
```
#### 🍏 Service
: Service 폴더는 주로 서버와 연동하기 위해 사용되는 파일들이 들어있다.
###### ->  ex) APIConstants.swift, NetworkResult.swift, LoginService.swift

#### 🍏 ViewController
: ViewController 전용 폴더이다. 뷰컨의 파일 이름은 줄임말로 -VC 으로 표현했다.
###### ->  ex) MainVC.swift, RankVC.swift
``` swift
class RankVC: UIViewController {
 //코드
}
```

### 🍎 Resource
#### 🍏 Assets
: 에셋 카탈로그 (애플리케이션에 사용될 다양한 에셋을 관리하면서, 에셋과 다양한 디바이스의 속성에 대한 파일의 맵핑을 통해 어플리케이션 리소스에 접근할 수 있도록 도와주는 역할을 한다.)
#### 🍏 StoryBoards
: StoryBoard의 모임. 이번 프로젝트에서는 스토리보드를 TabBar 별+로그인/회원가입 + 탭바 + 런치스크린 + 온보딩 으로 구분했다.
###### ->  ex) LaunchScreen.storyboard, OnBoarding.storyboard, Sign.storyboard, RunningTab.storyboard, RankingTab.storyboard, MyPageTab.storyboard, RecordTab.storyboard, Tab.storyboard
#### 🍏 폰트
: 이번 프로젝트에서 사용하는 NanumSquare.ttf 폰트들을 넣어놨다.
