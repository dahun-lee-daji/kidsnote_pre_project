# kidsnote_pre_project
## 주의
빌드 시, macro validation 에러가 발생합니다.
TCA로 인해서 발생하는 것입니다.
<img width="896" alt="스크린샷 2024-08-30 오후 4 22 31" src="https://github.com/user-attachments/assets/b51a0b25-c480-451c-8fd9-0451e4f5cf10">

위와 같이 에러를 눌러서 확인을 눌러주면 됩니다.

## 빌드환경
- Xcode: 15.4 
- simulator: iPhone11
- DeploymentTarget: iOS 15.0
  - 키즈노트 앱과 동일하게 설정.

## 라이브러리
- Composable Architecture 1.5.6
- SnapKit

## 설계
![제목 없는 다이어그램](https://github.com/user-attachments/assets/4982574b-21e4-4269-86fe-76c488a80a36)


## 기본 Flow 흐름
- SceneDelegate에서 AppCoordinator 초기화
- 초기 화면으로 BookSearchView
- BookSearchView의 셀 터치 - Action 동작 - State 변경 - AppCoordinator 내부 binding 동작 
- BookDetailViewController에서 leftBarButton Tap할 경우, BookDetailViewModel에서 BookDetailViewModelActions의 closure를 호출하여 AppCoordinator의 method를 실행

## 왜 이렇게 설계했나요?
키즈노트의 과제 제안을 받고 나서 UIKit으로 구현을 시작했습니다. 채용 공고에 ReactorKit에 대한 우대사항이 존재했기 때문입니다.
하지만, 진행 도중에 잘하는 것을 보여드려야 한다는 생각이 들었습니다.

그래서 두 가지를 모두 써서 보여드리자는 생각을 하게 되었습니다.

이는 실제 프로젝트에서 할 수도 있고, 아키텍쳐를 변경하는 중간 과정으로써 존재할 수도 있습니다. 
하지만, 공존하는 것이 좋은 구조는 아니라고 생각합니다.

저는 두 가지 모두 사용할 수 있음을 보여드리기 위해서 이러한 구조를 택하였습니다.

ReactorKit을 사용해 본 적은 없습니다. 하지만, 상태 관리에 중점을 둔 단방향 아키텍쳐임을 알 고 있습니다.
이를 이해함을 보여드리기 위하여, TCA를 사용하거나, ViewModel에서 subject를 앙방향으로 사용할 수 있으므로, AnyPublisher로
형변환하여 state를 전달하였습니다.

## 아쉬운 점
- 초기 구상에는 BookSearchView에서 segementedPicker를 사용하여 BookShelf의 목록 또한 보여주려 하였습니다. 하지만, 시간 부족으로 구현하지 못하였습니다.
- 차선으로 구현한 관련순, 최신순의 반환이 같았습니다. 이에 대한, 상세 분석 및 해결을 하지 못하였습니다.
- bookSearch에서 API 호출 시, projection을 lite로 했을 때 리뷰 점수와 리뷰 개수에 대한 정보가 누락되어서 lite를 쓸 수 없었습니다. 
- 에러 처리가 미흡한 상태입니다.
  - 인터넷이 존재하지 않는 경우.
  - 검색 시, 공백 문자를 넣는 경우
  - 검색 내용이 없는 경우
  - 검색어의 pagination이 완료되었을 때 (더 보여줄 컨텐츠가 존재하지 않을 때) 


## trouble shooting
- 작가는 항상 존재한다고 생각했습니다. 하지만 작가가 없는 경우가 존재했습니다. AuthorCase는 작가가 없는 경우를 고려하지 않았었으나,
실제 데이터를 반영하여 작가가 없는 경우를 해결하도록 하였습니다.
- parameter에 APIKey를 전달했으나, 권한이 없는 경우가 지속 발생했었습니다. 알 고 보니, Books API를 등록하지 않았었습니다.
- 책의 이미지를 보여줄 때 ImageURL 구조체를 사용합니다. 특정 사이즈의 URL String을 사용하고 싶었습니다. 그런데, 원하는 특정 사이즈의 URL String이 존재하지 않는 경우가 있을 것이라 생각하여 선택한 사이즈 외의 다른 사이즈 정보를 순회하며, 적절한 크기를 찾도록 하였습니다. 
