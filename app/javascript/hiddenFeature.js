// Get search form
const searchForm = document.getElementById('post_search')
const x = window.matchMedia("(min-width: 991px)")
const navbar = document.querySelector('.navbar')
const navItem = document.querySelectorAll('.nav-item')
const adminNavItem = document.querySelector('.nav-link')

function hideForm() {
    if (adminNavItem.classList.contains('admin')) {
        searchForm.classList.replace("d-flex", "d-none");;
    }
}
hideForm()



