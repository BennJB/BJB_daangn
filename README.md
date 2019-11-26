## 당근마켓 웹 개발 과제 설명 

- 과제 수행 기술 스택: Ruby on Rails, jQuery, html, css  
- 개발 환경: Windows, Docker, Visual Studio Code

## 프로젝트 요구사항별 구현 방법 

1. 모든 상품 목록(index.html.erb)에 카테고리(category)와 상품(item)에 1:N 관계 모델 설정을 하였습니다.  
   * 'seed.rb' 파일에 미리 각각의 카테고리를 생성하고, 카테고리 ID 값에 따라 해당 상품 카테고리로 이동
   * 인기매물 카테고리는 상품의 조회수를 기준으로 나열되도록 `'impressionist' gem` 활용
  
2. 차량에 대한 카테고리 목록(categorized_index.html.erb)을 전체 구현하였습니다. 
   * 카테고리 목록의 ID 값이 '차량'일 때만 필터 버튼 표시
   * 차량 필터 기능: 해당 옵션(query) 값을 전달 받아 차량 필터링   
     `slider(refresh)` 메소드와 `reset()`으로 필터 초기화   
     초기화 버튼 클릭 시, `removeClass()`를 통해 active클래스 제거  
   * 필터 적용 후, 페이지 상단에 적용된 필터 옵션 텍스트로 노출
   * 상품 등록 버튼 클릭 시, 카테고리 ID 값을 상품 등록 form 카테고리(select)에 전달     
     해당 카테고리 ID에 따라 '차량 추가 폼 표시 및 숨김 'triger' 실행 
  
3. 상품등록(item_create.html.erb) 페이지에서 카테고리 입력 기능과 차량에 대한 추가 폼을 구현하였습니다.
   * 'seed.rb' 에서 생성된 카테고리 DB에서 `collection_select`으로 id와 title 전달  
   * 상품 DB 테이블: 차량에 대한 3개 추가 테이블 생성      
   * 추가 폼 필수 입력: Model - `validates presence: true` 부여, View - `required` 추가      
     주행거리는 차량 필터 기능과의 연동으로 인해 `numericality: 0 ~ 10,000`km 이내로 설정    
   * '가격과 주행거리'는 numericality 유효성 검증 실패 시, 해당하는 입력 폼 아래에 에러 메세지 출력   
   * select 태그의 차량 선택 유무에 따라 jQuery.show() / hide() 메소드로 차량 추가 폼 표시/숨김    
   
 4. 제품 상세(detail.html.erb)페이지에는 선택된 카테고리와 추가된 차량 정보가 표시됩니다.
     * 카테고리 id 값이 차량 일때만 차량 정보(연식/주행거리/흡연여부) li 태그 표시
     * 해당 상품의 조회수 view 추가     
