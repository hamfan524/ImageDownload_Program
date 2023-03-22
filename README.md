# ImageDownload_Program
## 📖 목차
1. [소개](#🌱-소개)
2. [Tree](#🌲-tree)
4. [실행 화면](#📱-실행-화면)

## 🌱 소개
>[원티드 프리온보딩 챌린지 iOS 2차과정 사전과제](https://yagomacademy.notion.site/iOS-2-3f670cc9788f4384b000bfe940447d59)

- `UIImageView` / `UIProgressView` / `UIButton` 으로 UI 구성
- `UIButton`을 누르면 `UIImageView`에 웹에서 받아온 이미지를 로드
- 해당 `View`를 5개 구성하고 아래에 전체 이미지를 받는 `UIButton`을 추가하여 `MainView`로 구성
- 전체 이미지를 받는 `UIButton`을 누르면 5개 `View`의 `UIImageVIew` 모두 이미지 로드

## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.7.2-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-14.2-blue)]()

## 🌲 Tree
```
📦ImageDownload_Program
 ┣ 📂App
 ┃ ┣ 📂Assets.xcassets
 ┃ ┃ ┣ 📂AccentColor.colorset
 ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┣ 📂AppIcon.appiconset
 ┃ ┃ ┃ ┗ 📜Contents.json
 ┃ ┃ ┗ 📜Contents.json
 ┃ ┣ 📂Base.lproj
 ┃ ┃ ┗ 📜LaunchScreen.storyboard
 ┃ ┣ 📜AppDelegate.swift
 ┃ ┣ 📜Info.plist
 ┃ ┗ 📜SceneDelegate.swift
 ┣ 📂Extension
 ┃ ┗ 📜UIButton+.swift
 ┣ 📂Helpers
 ┃ ┗ 📜ImageURLs.swift
 ┣ 📂ViewControllers
 ┃ ┗ 📜ViewController.swift
 ┣ 📂Views
 ┃ ┣ 📜ContentStackView.swift
 ┃ ┣ 📜LoadButton.swift
 ┃ ┗ 📜MainView.swift
 ┗ 📜.DS_Store
```

## 📱 실행 화면

|개별 이미지 로드|전체 이미지 로드|
|:--:|:--:|
|![load](https://user-images.githubusercontent.com/37105602/226990528-23bd2bbf-86ed-430f-b014-194d6382a2db.gif)|![LoadAll](https://user-images.githubusercontent.com/37105602/226990610-9c3d33a8-6e43-4b8d-8d75-b5d545a0948f.gif)|

|이미지 로드 중단|전체 이미지 로드 중단|
|:--:|:--:|
|![stop](https://user-images.githubusercontent.com/37105602/226990967-e9c4453b-3c66-4780-9d45-0722e21565a7.gif)|![stopAll](https://user-images.githubusercontent.com/37105602/226991087-3978d7f9-d222-459f-ab45-be8799a66d01.gif)|
