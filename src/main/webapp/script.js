// script.js 파일

const likeButtons = document.querySelectorAll(".like-button");
const likeCounts = document.querySelectorAll(".like-count");

likeButtons.forEach((button, index) => {
  let liked = false;

  button.addEventListener("click", () => {
    if (!liked) {
      liked = true;
      likeCounts[index].textContent = parseInt(likeCounts[index].textContent) + 1;
      button.textContent = "좋아요 취소";
    } else {
      liked = false;
      likeCounts[index].textContent = parseInt(likeCounts[index].textContent) - 1;
      button.textContent = "좋아요";
    }
  });
});
