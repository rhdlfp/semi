if ($_SERVER["REQUEST_METHOD"] === "POST") {
  $postIndex = $_POST["postIndex"];
  // 여기서 데이터베이스에 좋아요 정보를 저장하는 작업을 수행합니다.
  // 저장 후, 해당 개시글의 좋아요 수를 업데이트합니다.
  $likeCount = 10; // 예시로 임의의 좋아요 수를 설정
  echo $likeCount;
}