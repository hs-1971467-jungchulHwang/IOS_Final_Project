
  # 💸MoneyKeep💸
  > **가계부 어플**


<br/>


## 📌 프로젝트 개요
```
평소 돈 관리를 잘 하지 못하고 돈이 항상 줄줄 세는 사람들에게 꼭 필요한 가계부를 어플로 개발해보았다. 
가계부 어플인 MONEY KEEP은 직관적으로 수입과 지출을 관리하고 통계를 조회할 수 있는 어플이다. 통계를
그래프로 한눈에 볼 수 있어 돈이 세는 구멍을 찾아 관리할 수 있다.
```
</br>

## 💡 사용한 개념
```
UITableView, UINavigationBar, Tab Bar Controller, UIPickerView, 
UISegmentedControll, Charts 라이브러리(PieChartView, BarChartView)
```
</br>

## ❌ 발생했던 문제들
```
1. pod install 과정에서 오류로 제대로 install이 되지 않음
  -> 해결방법: cocoapods버전이 낮으면 종종 발생하는 문제임을 알아냄. Ruby버전을 업그레이드 후
     cocoapods 최신버전으로 재설치 후 해결

2. 차트 부분으로 넘어가면서 UIViewController에서 차트 class key값을 받지 못해서 앱이 중단되는 현상이 발생함
  -> 해결방법: 스토리보드에서 아울렛 연결이 뒤엉키면서 발생함을 알아냄. 아울렛을 모두 끊고 다시 연결해서 해결

3. 차트 함수가 값을 제대로 받지 못해 nil값이 생겨 차트 부분으로 넘어가면서 앱이 중단되는 현상이 발생함
  -> 해결방법: int형인 price에 돈 단위 가시성을 위해 넣은 ' , ' 때문에 값이 제대로 넘어가지 않아서
     nil값이 발생하는 것을 알아냄. price에 ' , '를 뺌으로서 해결
```
</br>

## 💻 결과 화면

### 지출 파트 화면

</br>

![image](https://github.com/hs-1971467-jungchulHwang/IOS_Final_Project/assets/115887505/2535f073-f5b6-4e07-a68d-b4d4a3bf6c78)

</br>


### 수입 파트 화면

</br>
  
![image](https://github.com/hs-1971467-jungchulHwang/IOS_Final_Project/assets/115887505/7169a379-bb22-4d6c-80fc-dd12f0472a06)

</br>
</details>

### 통계 파트 화면

</br>

![image](https://github.com/hs-1971467-jungchulHwang/IOS_Final_Project/assets/115887505/16414af9-87a2-4066-906c-1fda920aad4e)
</br>

## 📹 시연 영상

### Xcode버전이 낮아서 아이폰 최신 ios버전 지원이 안되서 에뮬레이터로 진행했습니다.</br> 따라서 렉이 많이 심합니다! 양해 부탁드립니다!
[<img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white">
](https://youtu.be/G8HCprMc6s8)
<br/>
