# 35-COLLABORATION-iOS-LINKAREER
> 35기 AND SOPT 합동세미나 모바일 앱 5팀 iOS - 링커리어
<img src="https://github.com/user-attachments/assets/ecbfe250-3fe5-4535-b934-3569f2c0cac2">
<br>
<br>

![Frame 10](https://github.com/user-attachments/assets/3278239a-8cc5-4a20-afa9-1b07b20ffb7c)
| [김민서](https://github.com/kms0233) | [김가현](https://github.com/mcrkgus) | [안재현](https://github.com/Ohjackson) | 
| --- | --- | --- |
| <img src = "https://github.com/user-attachments/assets/5e9d39db-d0a0-4882-aa52-a1bc9e277e72" width = "200" align='center'> | <img src = "https://github.com/user-attachments/assets/93162dec-b290-488c-a767-d14df0057b76" width = "200" align='center'> | <img src = "https://github.com/user-attachments/assets/c472cfca-d797-4eb1-abd4-72ca9b52ac72" width = "200" align='center'> |
| <p align="center">`홈-기본`<br>`채팅룸`</p>| <p align="center">`채팅홈`<br>`채팅룸 인증`<br>`하단 탭바`</p>| <p align="center">`홈-신입/인턴`</p>|

![Frame 11](https://github.com/user-attachments/assets/1024320a-c983-4c74-85d5-d947083f1d4b)
- [Feat]: 새로운 기능 구현
- [Fix]: 버그, 오류 해결, 코드 수정
- [Add]: Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 View 생성
- [Del]: 쓸모없는 코드, 주석 삭제
- [Refactor]: 전면 수정이 있을 때 사용합니다
- [Remove]: 파일 삭제
- [Chore]: 그 이외의 잡일/ 버전 코드 수정, 패키지 구조 변경, 파일 이동, 파일이름 변경
- [Docs]: README나 WIKI 등의 문서 개정
- [Setting] : 세팅

![Frame 12](https://github.com/user-attachments/assets/fe89b0eb-f348-4d6f-bbe1-7744a40fab12)
| 라이브러리 | 목적        | 버전(Version)                                                |
| ------------------- | ------------------------ | ------------------------------------------------------------ |
| Moya           | 간결한 네트워크 요청과 구조화된 관리 방식으로 코드 가독성과 유지보수성 향상        | ![Alamofire](https://img.shields.io/badge/Moya-15.0.3-orange) |
| Kingfisher          | 쉽고 간편한 이미지 처리          | ![Kingfisher](https://img.shields.io/badge/Kingfisher-7.12.0-yellow) |
| SnapKit             | Auto Layout을 쉽고 간결하게 작성하기 위함 & 가독성 향상| ![Kingfisher](https://img.shields.io/badge/SnapKit-5.7.1-black) |
| Then                | 짧고 간결한 코드 처리 & 가독성 향상        | ![Kingfisher](https://img.shields.io/badge/Then-3.0.0-white) |

![Frame 14](https://github.com/user-attachments/assets/4b862702-1a2e-4d36-8d51-1a94463b146f)
<img src="https://github.com/user-attachments/assets/998e10ec-1847-405b-92bb-c72cdc877719" width="800">
```
1. main branch에서 이슈번호를 가진 branch 생성
2. 생성한 branch에서 작업 진행 (Add - Commit - Push - Pull Request 의 과정)
3. Pull Request가 작성되면 팀원의 Code Review → Code Review 반영까지
4. 로컬 main branch로 넘어가서 원격 main branch를 pull 받기 (💡로컬 main 브랜치 최신화 작업💡)
5. 본인 로컬 main 브랜치  → merge into '본인 작업 브랜치' (본인 작업 브랜치에 최신화된 main 반영하는 작업)
6. 컨플릭 생기면 해결하고 다시 머지 반영하고 push (push 하기 전에 한 번 실행해보기)
7. 깃허브 돌아가서 merge 가능한지 확인하고 merge
```

![Frame 13](https://github.com/user-attachments/assets/43788510-37f0-496f-8c5a-3a91bd433b09)
> [StyleShare 의 Swift Style Guide](https://github.com/StyleShare/swift-style-guide) 를 기반으로 추가/수정

![Frame 15](https://github.com/user-attachments/assets/9c4b432a-a577-436e-ab85-94a46cff4d44)
```swift
├── Application
│   ├── Appdelegate
│   ├── SceneDelegate
│   ├── LaunchScreen
├── Global
│   ├── Extension
│   ├── Literals
│   ├── UIComponents
│   ├── Resources
│   │   ├── Font
│   │   ├── Assets
│   ├── Settings
│   │   ├── Info.plist
│   │   │
├── Network
│   ├── 🗂️ View1
│   │   ├── DTO
│   │   ├── View1Service
│   ├── Base
├── Presentation
│   ├── 🗂️ View1
│   │   ├── 🗂️ Model
│   │   ├── 🗂️ View
│   │   │   ├── 🗂️ Cell
│   │   ├── 🗂️ ViewController
```
![Frame 18](https://github.com/user-attachments/assets/5c7117f9-adb7-4953-8c17-7915dbab4fc1)
<img src="https://github.com/user-attachments/assets/af2caa42-1546-415a-ad66-b7812b3b38ae" width="400">




