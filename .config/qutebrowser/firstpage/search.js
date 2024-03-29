const searchInput = document.querySelector("#search");
searchInput.focus();
const search = () => {
  const searchQuery = searchInput.value;
  location.href = `https://duckduckgo.com/?q=${searchQuery}`;
};

searchInput.addEventListener("keypress", (e) => {
  if (e.key == "Enter") {
    e.preventDefault();
    search();
  }
});
