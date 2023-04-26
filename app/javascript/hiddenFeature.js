// Get search form
const searchForm = document.getElementById('post_search')
const x = window.matchMedia("(min-width: 991px)")
const navbar = document.querySelector('.navbar')
const navItem = document.querySelectorAll('.nav-item')

function hideForm() {
    if (x.matches) {
        searchForm.classList.replace("d-flex", "d-none");;
    }
}
hideForm()



