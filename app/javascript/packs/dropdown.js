document.addEventListener("DOMContentLoaded", () => {
    const userInfo = document.querySelector(".header-user-info");
    const dropdownMenu = document.querySelector(".dropdown-menu");
  
    userInfo.addEventListener("click", (e) => {
      e.stopPropagation();
      dropdownMenu.classList.toggle("active");
    });
  
    document.addEventListener("click", () => {
      dropdownMenu.classList.remove("active");
    });
  });