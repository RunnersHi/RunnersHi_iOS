# RUNNERS HI - iOS
🏃🏻‍♂️🏃🏻‍♀️ 러너스하이 iOS "진심" 레포 🏃🏻‍♂️🏃🏻‍♀️

![logo_runnershi](https://user-images.githubusercontent.com/51286963/86894016-6af79e00-c13d-11ea-8f03-012e98962257.jpg)

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
- [ Coding Convention ](CodingConvention.md)<br>
- [ Foldering ](Foldering.md)<br>

------------
### B-1. 개발 환경 및 라이브러리
![Xcode](https://img.shields.io/badge/Xcode-11.5-blue)
![swift](https://img.shields.io/badge/swift-5.0-green)
![Alamofire](https://img.shields.io/badge/Alamofire-4.8.2-orange)
  
------------

### B-2. 기능 명세서
<img width="827" alt="스크린샷 2020-07-08 오후 8 13 05" src="https://user-images.githubusercontent.com/51286963/86912193-866fa280-c157-11ea-9abb-3ec1230a6946.png">
: 서버 연동, 특히 소켓 통신 중심이라 아직 공부 중 입니다.

------------
### B-3. 현재 개발 상황
#### Tab Bar
> 담당 김민희 <br>

: Tab Bar을 이용해 각 스토리보드를 이어주며 이동 가능

|  기능|  구현 | 비고 |
|:--------|:--------:|--------:|
|Custom Tabbar 생성 | 🔵 | |
|각 스토리보드 잇기| 🔵 | |
![TabBar](https://user-images.githubusercontent.com/51286963/86910362-8b7f2280-c154-11ea-9edd-db3f1a7b3ad5.gif)

#### 회원가입 화면
> 담당 최영재 <br>

: 회원가입 화면, 아이디와 닉네임, 비밀번호는 주어진 조건(정규표현식)을 만족해야한다. 그리고 회원가입시에는 자동로그인을 통해 MainView로 넘어간다.

|  기능 |  구현 | 비고 |
|:--------|:--------:|--------:|
|AutoLayout | 🔵 | |
|아이디 정규표현식| 🔵|
|닉네임 정규표현식 | 🔵 | |
|비밀번호 정규표현식 |  | |
|아이디 중복검사|  |서버 통신을 통해 구현 목표|
|닉네임 중복검사 |  | 서버 통신을 통해 구현 목표|
|조건버튼 중복선택X |  |CollectionView 통해 isSelected 사용 예정|
|자동로그인| ||

#### Running Tab - 홈화면
> 담당 김민희 <br>

: Main 화면. 일러스트롤 포함하며, Run now 버튼 클릭시 주요 기능은 매칭 서비스가 시작된다.

|  기능 |  구현 | 비고 |
|:--------|:--------:|--------:|
|AutoLayout | 🔵 | |
|이미지 적용| | 아직 디자인 파트에서 구현X|
|Run Now 버튼 클릭 | 🔵 | |
|Pop up|🔵| 테이블 뷰로 구현|
|pop up 올라올 때 background 블러 |  | 코드로 UIView를 새로 생성해서 구현중|
![Main](https://user-images.githubusercontent.com/51286963/86910650-faf51200-c154-11ea-9dda-1fdad7f1f058.gif)

#### Healthkit 액세스
> 담당 김민희 <br>

: 아이폰의 '건강' 어플리케이션을 연동한다. 연동함으로써 내가 뛴 거리(Km)를 접근할 수 있다.

|  기능|  구현 | 비고 |
|:--------|:--------:|--------:|
|Healthkit 유효성 | 🔵 | |
|요소 삽입 : 걷기+달리기 | 🔵 | |
|요소 삽입 : 심박수 | 🔵 | |
|요소 삽입 : 운동 | 🔵 | |
|요소 삽입 : 활동에너지 | 🔵 | |
![Healthkit](https://user-images.githubusercontent.com/51286963/86910660-fcbed580-c154-11ea-9213-ae936ea6db7f.gif)

------------

### B-4. HealthKit(🌟새로 알게 된 기능🌟)
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
   
------------
### C. 팀원 역할 및 소개
- 김민희 [ Repo ](https://www.notion.so/Kim-Min-Hee-b8c50856e43943ce9611baea5c14dd8b) : 러너스하이 iOS 리드개발자, MainTab 구현 및 소켓 통신 담당 <br>
- 최영재 [ Repo ](https://github.com/realwhyjay) : 러너스하이 iOS 서브개발자, RankTab / RecordTab / MyPabeTab / SignTab 담당 및 http 통신 담당
