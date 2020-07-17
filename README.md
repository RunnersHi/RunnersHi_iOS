# RUNNERS HI - iOS
🏃🏻‍♂️🏃🏻‍♀️ 러너스하이 iOS "진심" 레포 🏃🏻‍♂️🏃🏻‍♀️

<img width="400" src="https://user-images.githubusercontent.com/51286963/87784132-ad715700-c870-11ea-9ba6-d67ffe063c0a.png">

## 러닝을 게임처럼, 러너스하이
> 우리는 '함께' 뛸 때 더 많은 시너지를 만들어냅니다. 요즘 세대들은 러닝 크루에 소속되어 러닝을 즐기곤 하지만, Offline 러닝크루는 고정된 시간과 장소라는 한계점을 가지고 있습니다.  우리는 같이 달리고 싶지만, 달릴 수 없는 순간들이 존재한다는 점에 집중하고자 합니다.  우리의 서비스를 통해 시공간의 제약없이 다양한 사람들과 함께 달림으로써 건강한 라이프 스타일을 만들어나가길 바랍니다. 

####  ⭐️ 기존 러닝 어플리케이션과의 확실한 차별화 요소를 적용했습니다.  
: 기존 러닝 어플리케이션과의 확실한 차별화 요소를 적용했습니다.  

#### ⭐️ *따로, 또 같이*  함께 하는 가치를 추구하고자 합니다.   
: 어떤 단체에 소속되지 않아도, 굳이 친구와 약속을 잡고 만나지 않아도, 사용자는 언제 어디서든 나와 함께 뛸 상대를 찾아 같이 러닝을 즐길 수 있습니다.

####  ⭐️ 트렌디한 디자인적 요소를 통해 시각적인 즐거움을 얻을 수 있습니다.    
: 특정 목표를 달성하면 개성있는 여러 가지 뱃지를 획득할 수 있음과 동시에 다양한 러너 랭킹을 통해 사용자의 즐거움을 도모하고자 합니다. 또, 누구나 사용하기 쉬운 UX 요소는 즐거움을 배로 향상시켜 줄거에요.

------------
### A. Setting
- [ Coding Convention ](./README/CodingConvention.md)<br>
- [ Foldering ](./README/Foldering.md)<br>

------------
### B-1. 개발 환경 및 라이브러리
![Xcode](https://img.shields.io/badge/Xcode-11.5-blue)
![swift](https://img.shields.io/badge/swift-5.0-green)
![Alamofire](https://img.shields.io/badge/Alamofire-4.8.2-orange)
![Socket.IO-Client-Swift](https://img.shields.io/badge/Socket.IO--Client--Swift-15.2.0-blue)
![XLPagerTabStrip](https://img.shields.io/badge/XLPagerTabStrip-9.0-yellow)
![NMapsMape](https://img.shields.io/badge/NMapsMape-3.x-red)
  
------------
### B-2. WORKFLOW

![최종과제  RUNNER'S HI WORKFLOW_page-0001](https://user-images.githubusercontent.com/51286963/87786064-4c4b8280-c874-11ea-8b41-86404fccc6df.jpg)

------------

### B-3. 기능 명세서

|  우선순위 |  화면 이름 | 기능 이름 | 구현 |담당자|
|:--------|:--------:|--------:| --------:|--------:|
|P1 | 회원 가입 |기본 데이터(닉네임/아이디/비밀번호/성별/레벨) 받기 |🔵|최영재|
|P2 | 튜토리얼 |스플래쉬|🔵|김민희|
|P1 | 매칭화면 |매칭 데이터(목표시간/상대 성별)받기|🔵|김민희|
|P1 | 매칭화면 |매칭 기준(목표시간/성별/레벨)에 따라 매칭러너 찾기|🔵|김민희|
|P1 | 매칭성공화면 |상대러너 프로필, 레벨, 전적 보여주기|🔵|김민희|
|P1 | 로그인 |로그인 기능|🔵|최영재|
|P1 | 러닝중화면 |실시간으로 러닝거리, 페이스, 남은 시간 보여주기 |🔵|김민희|
|P1 | 러닝중화면 |카운트다운 |🔵|김민희|
|P1 | 러닝중화면 |휴대폰 사용자 동작 및 피트니스 활동 접근|🔵|김민희|
|P2 | 러닝중화면 |현재 위치 표시|🔵|김민희|
|P2 | 러닝랭킹화면 |1) 이동거리 높은순 2)승이 많은 순 3)패가 많은 순 사용자 랭킹|🔵|최영재|
|P2 | 러닝기록화면 |나의 러닝데이터 모아서 보여주기 기능|🔵|최영재|
|P2 | 러닝기록화면 |러닝 뱃지 모아서 보여주기 기능|🔵|최영재|
|P2 | 러닝결과화면 |두 러너의 이동거리 비교 기능|🔵|김민희|
|P1 | 러닝결과화면 |나의 기록/상대러너 기록 모아서 보여주기 기능 |🔵|김민희|
|P2 | 마이페이지 |나의 프로필 이미지/닉네임/승패/레벨/뱃지 표시|🔵|최영재|

------------

### C-1. 개발 설명

#### Tab Bar

: Tab Bar을 이용해 각 스토리보드를 이어주며 이동 가능


#### 회원가입, 로그인 화면

🥳 로그인, 회원가입 화면. 정규표현식 검사와 아이디, 닉네임 중복 검사 자동로그인 기능을 포함한다.<br>

<img width="200" alt="로그인" src="https://user-images.githubusercontent.com/51286963/87795324-da2e6a00-c882-11ea-9283-50c586dcb760.png"> <img width="200" alt="회원가입_기본" src="https://user-images.githubusercontent.com/51286963/87795339-de5a8780-c882-11ea-96cc-ba0bc009fd57.png"> <img width="200" alt="회원가입_중간" src="https://user-images.githubusercontent.com/51286963/87795345-e0bce180-c882-11ea-809d-c124fb2e68ff.png"> <img width="200" alt="회원가입_완료" src="https://user-images.githubusercontent.com/51286963/87795354-e286a500-c882-11ea-90e2-3548a591766b.png">

#### Running Tab(홈 화면)

🥳 Main 화면. 일러스트롤 포함하며, RUN NOW 버튼 클릭시 주요 기능은 매칭 서비스가 시작된다. 원하는 매칭 러너의 조건을 설정하고 매칭이 되면 상대방 프로필을 확인한 후, 러닝이 시작된다. <br>
🤓 추후 develop으로 혼자 달리기를 통해 매칭이 안되는 사람들 혹은 혼자 러닝을 측정해보고 싶은 사람들을 위한 서비스를 제공하고자 한다.
<br>
<img width="200" alt="RunningTab" src="https://user-images.githubusercontent.com/51286963/87796596-891f7580-c884-11ea-8cf8-99b4282ce165.png"> <img width="200" alt="RunningTab-매칭" src="https://user-images.githubusercontent.com/51286963/87796611-8de42980-c884-11ea-9ef5-bf6b83d8c537.png"> <img width="200" alt="스크린샷 2020-07-17 오후 11 06 42" src="https://user-images.githubusercontent.com/51286963/87796615-8e7cc000-c884-11ea-9142-45a08d8d01f7.png"> <br><img width="200" alt="스크린샷 2020-07-17 오후 11 06 46" src="https://user-images.githubusercontent.com/51286963/87796620-8faded00-c884-11ea-8515-7d4529d50817.png"> <img width="200" alt="스크린샷 2020-07-17 오후 11 06 49" src="https://user-images.githubusercontent.com/51286963/87796623-90468380-c884-11ea-8def-714195e5e0c1.png">

🥳 매칭이 되면 상대방 프로필을 확인한 후, 러닝이 시작된다. 실시간으로 자신의 속도(km), 페이스(pace), 남은 시간이 표시되고 현재 자신이 뛰고있는 위치가 지도(네이버)를 통해 표시된다.<br>
🤓 현재는 자신이 있는 위치만 표시되지만, 추후 자신이 러닝한 경로가 뜨게 할 생각이다. (현재 네이버측에서 points 속성을 막아둔것으로 보여 구현하지 못한 아쉬움이 있다.)[네이버 지도 iOS SDK](https://navermaps.github.io/ios-map-sdk/guide-ko/5-7.html)

<img width="180" alt="매칭된러너프로필" src="https://user-images.githubusercontent.com/51286963/87796841-e0254a80-c884-11ea-93cd-25f0d258638a.PNG"> <img width="180" alt="매칭_러닝중" src="https://user-images.githubusercontent.com/51286963/87796853-e4e9fe80-c884-11ea-98c2-9d7cb5e6a146.PNG"> <img width="180" alt="실시간러닝중" src="https://user-images.githubusercontent.com/51286963/87827334-ade01100-c8b5-11ea-8f5b-d069c660ac6e.gif">
<br><img width="180" alt="졌다" src="https://user-images.githubusercontent.com/51286963/87799758-90e11900-c888-11ea-8427-e297a727eb00.png"><img width="180" alt="이겼다" src="https://user-images.githubusercontent.com/51286963/87799763-92aadc80-c888-11ea-98fd-eb77e28c1044.png">


#### Record Tab

: 자신이 지금까지 쌓아온 러닝 기록과 모아온 러닝뱃지를 확인할 수 있다.

<img width="200" alt="RecordTab" src="https://user-images.githubusercontent.com/51286963/87797247-6346a080-c885-11ea-9542-31260ed38d7f.png"> <img width="200" alt="RecordTab-뱃지" src="https://user-images.githubusercontent.com/51286963/87797267-680b5480-c885-11ea-8edb-450fc514f81c.png">


#### Ranking Tab

: 현재 이 어플에서 '이달의 러너', '명예의 전당', '졌.잘.싸' 로 나눠진 3개의 랭킹 순위를 확인할 수 있다.

<img width="200" alt="RankingTab" src="https://user-images.githubusercontent.com/51286963/87797396-92f5a880-c885-11ea-999d-05bee8e66e71.png">

#### MyPage Tab

: 자신의 기본 정보(프로필 사진, 닉네임, 레벨, 전적)을 확인할 수 있고 모아둔 뱃지를 간략히 확인할 수 있다.

<img width="200" alt="MypageTab" src="https://user-images.githubusercontent.com/51286963/87797520-bf112980-c885-11ea-9010-2eca20b574c5.png">

------------

### C-2. 🌟새로 알게 된 기능🌟
#### 1) Healthkit
> 💪🏻운동 어플의 기본! '건강' 어플리케이션 연동해서 값 가져오기 ! 도전 !💪🏻 

1. 먼저 건강 어플리케이션을 연동하려면 Apple Developer Program Membership 이 필요합니다 (유료)
2. Capability에서 Healthkit를 추가해 활성화 시켜줍니다.
<img width="746" alt="Healthkit 연동" src="https://user-images.githubusercontent.com/51286963/86914216-e0be3280-c15a-11ea-8e32-03b764257f91.png">

3. info.plist 파일에서 Information Property List Key Reference를 추가해줍니다.
<img width="731" alt="스크린샷 2020-07-08 오후 8 40 09" src="https://user-images.githubusercontent.com/51286963/86914381-38f53480-c15b-11ea-8230-7348e6570176.png">

 4. HealthKit 액세스를 허용하는 코드를 짜야합니다.
  - 이 기기에서 HealthKit를 사용할 수 있는지 확인하기.
  
  ```swift
  guard HKHealthStore.isHealthDataAvailable() else {
      completion(false, HealthkitSetupError.notAvailableOnDevice)
      return
    }
  ```
  
  - HealthKit과 상호 작용할 데이터 유형 준비하기.
  ``` swift
      guard   let walkAddRun = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning),
      //걷기+달리기 거리(walkAddRun)
            let step = HKObjectType.quantityType(forIdentifier: .stepCount),
            // 심박수
            let activeEnergy = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)
            //활동에너지
            else {
            let activeEnergy = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else {
            completion(false, HealthkitSetupError.dataTypeNotAvailable)
            return
    }
  ```
  
  (데이터 유형은 https://developer.apple.com/documentation/healthkit/hkquantitytypeidentifier 에서 참고할 수 있습니다.)
  
   - HealthKit이 읽고 쓸 유형 목록 작성하기
   ``` swift
   let healthKitTypesToWrite: Set<HKSampleType> = [walkAddRun,
                                                    activeEnergy,
                                                    step,
                                                    HKObjectType.workoutType()
                                                    ]
    
    let healthKitTypesToRead: Set<HKObjectType> = [walkAddRun,
                                                   activeEnergy,
                                                   HKObjectType.workoutType()
                                                    ]
   ```
   
   healthKitTypesToWrite는 어플이 다음 데이터를 쓰기 허용하는 목록, healthKitTypesToRead는 어플이 다음 데이터를 읽기 허용하는 목록입니다.
   
   - 요청 승인 받기
   ```swift
   HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite,
                                         read: healthKitTypesToRead) { (success, error) in
      completion(success, error)
    }
   ```

#### 2) 실시간 통신 인생 첫 소켓 통신 도전 !💪🏻
 
 ```swift
 import SocketIO
    static let shared = SocketIOManager()
    var manager = SocketManager(socketURL: URL(string: "소켓주소")!, config: [.log(true), .compress])
    var socket: SocketIOClient!
    
    FindRunnerVC.socket = FindRunnerVC.self.manager.socket(forNamespace: "/matching")
 ```
 
  : 어플에서 소켓 통신을 쓰는 범위는 매칭 러너는 찾을 때부터 게임이 끝나고 결과 비교 전까지 소켓 통신을 사용했습니다. <br>
 한 뷰에서만 소켓 통신이 쓰이는 것이 아니라 소켓이 연결돼서 여러 뷰를 통과하기 때문에 싱글톤(static)을 사용해서 통신을 이어갔습니다. <br>
 
```swift
   FindRunnerVC.socket.on("start", callback: { (data, ack) in
     FindRunnerVC.self.socket.emit("joinRoom",myToken,myGoal,myWantGender,self.leftTime)
        })
```

: 서버는 시작해도 좋다는 응답 -> 클라는 내 정보와 내가 원하는 상대의 조건을 보내준다.
<br>
```swift
        FindRunnerVC.socket.on("roomCreated", callback: { (data, ack) in
            FindRunnerVC.self.socket.emit("startCount",data[0] as! SocketData)
        })
```
: 내가 원하는 조건의 상대를 찾지 못한다면 서버는 새로운 받을 만들어서 나를 넣어주고 -> 클라는 시간 카운트를 하라고 알려준다. roomCreated 때 받는 정보인 data[0]은 내가 속해있는 방의 번호가 된다.
<br>
```swift
        FindRunnerVC.socket.on("matched", callback: { (data, ack) in
            FindRunnerVC.self.socket.emit("endCount",data[0] as! SocketData)
        })
 ```
 : 대기중에 상대를 찾았을때는 서버는 matched와 data[0]으로 내가 속한 방 이름을 보내주고, 클라에서는 사용자가 속한 방의 이름과 endCount를 보내준다.
  <br>
 ```swift
         FindRunnerVC.socket.emit("compareResult",UserDefaults.standard.object(forKey: "opponentRoom") as? String ?? " ",UserDefaults.standard.object(forKey: "opponetDistance") as? Int ?? 2,UserDefaults.standard.object(forKey: "myGoalTime") as? Int ?? 0,array2,UserDefaults.standard.object(forKey: "createdTime") as? String ?? " ",UserDefaults.standard.object(forKey: "endTime") as? String ?? " ")
 ```
 : 러닝 게임이 끝나면 나의 방 번호, 달린 거리, 달린 시간, 방 번호, 지도 위치, 시작한 시간, 끝난 시간을 함께 보내준다.
 
#### 3) 회원가입 기능

- 정규표현식과 실시간 입력 체크

``` swift
   private func loginCheck() {
        idTextField.addTarget(self, action: #selector(idTextChecked(_:)), for: .editingChanged)
        nickTextField.addTarget(self, action: #selector(nickTextChecked(_:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextChecked(_:)), for: .editingChanged)
        pwReTextField.addTarget(self, action: #selector(pwReTextChecked(_:)), for: .editingChanged)
    }
```

editingChanged를 활용한 함수를 선언해주어 실시간으로 조건에 맞는 입력이 들어오는지 체크하고, 그에 따른 텍스트를 띄우거나, 조건에 맞아야 다른 동작들을 실행할 수 있도록 했다. 

``` swift
    func isValidNick(nick: String?) -> Bool {
        guard nick != nil else { return false }
        let regEx = "[ㄱ-ㅎㅏ-ㅣ가-힣A-Za-z0-9]{2,6}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: nick)
    }
```

닉네임 정규표현 조건

텍스트 필드가 조건에 맞지 않는다면, 오류 메세지와 함게 텍스트 필드의 디자인을 변경해주고 다음으로 넘어갈 수 있는  버튼을 비활성화 시키는 등의 구현을 했다. 정규표현식 자체보다는 실시간으로 사용자의 입력을 확인하여 조건을 검사해주는 부분이 어려웠는데, 우리 팀의 경우에는 회원가입시에 체크해야하는 조건이 다양했기 때문에 뷰를 짜는 과정이 까다롭고 시간이 오래걸렸다.  

- 컬렉션 뷰와 IsSelected를 활용한 선택지 구현

  ``` swift
    override var isSelected: Bool {
        willSet {
            self.genderActionLabel.backgroundColor = newValue ? UIColor.lightishBlue : UIColor.brownishGrey
            print(genderActionLabel.text ?? nil!)           

  ```

회원가입시에 사용자의 추가 정보를 입력해야하는 부분을 처음에는 단순하게 버튼으로 구현하려고 하였다. 그러나 사용자가 하나의 선택지만을 선택해야하고, 그 값만을 서버에 전달해야하는 조건 탓에 일반 버튼으로는 기획을 구현할 수가 없었다. 그렇기에 컬렉션 뷰에서 IsSelected를 활용하여 사용자가 하나만의 선택지를 고를 수 있게 구현하였다. 안드로이드에서는 기본적으로 제공되는 기능이지만, iOS에서는 일일이 구현해주어야하는 기능이었다. 전혀 알지 못하던 기능이었기에 많은 사람들의 도움을 받았고, 구글링과 작업을 하는데에 많은 시간이 들었다.

#### 4) CoreMotion
- CoreMotion은 휴대폰의 센서를 사용하는 방법이다. 원래 Healthkit를 사용했지만, Healthkit는 많은 정보를 제공해주지만 업데이트가 실시간(몇 초 단위)로 되지않는 문제가 발생해서 CoreMotion으로 수정하였다.coremotion을 이용해서 실시간 거리를 받아왔다. 물론 여기서도 페이스를 계산해주지만 우리가 원하는 단위와는 달랐기때문에 페이스는 직접 계산하는 방법을 사용했다.
[ CoreMotion ](https://developer.apple.com/documentation/coremotion)
<br>

------------
### D. 팀원 역할 및 소개
- 김민희 [ Repo ](https://www.notion.so/Kim-Min-Hee-b8c50856e43943ce9611baea5c14dd8b) : 러너스하이 iOS 리드개발자, MainTab 구현 및 소켓 통신 담당 <br>
- 최영재 [ Repo ](https://github.com/realwhyjay) : 러너스하이 iOS 서브개발자, RankTab / RecordTab / MyPabeTab / SignTab 담당 및 http 통신 담당

### 팀원들의 한마디
- 민희 : 
- 영재 : 
