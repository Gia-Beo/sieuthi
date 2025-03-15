const bar = document.getElementById('bar');
const nav = document.getElementById('navbar');
const close = document.getElementById('close');
if (bar) {
    bar.addEventListener('click', () =>{
        nav.classList.add('active');
    })
}

if (close) {
    close.addEventListener('click', () =>{
        nav.classList.remove('active');
    })
}

// Lấy các form đăng nhập và đăng ký
const loginForm = document.getElementById('login-form');
const registerForm = document.getElementById('register-form');

// Lấy các nút chuyển đổi giữa đăng nhập và đăng ký
const toggleToRegister = document.getElementById('toggle-register');
const toggleToLogin = document.getElementById('toggle-login');

// Xử lý chuyển đổi giữa form đăng nhập và đăng ký
toggleToRegister.addEventListener('click', () => {
    loginForm.classList.add('hidden');
    registerForm.classList.remove('hidden');
});

toggleToLogin.addEventListener('click', () => {
    registerForm.classList.add('hidden');
    loginForm.classList.remove('hidden');
});

// Hàm xác thực đăng nhập
function validateLogin() {
    const username = loginForm.querySelector('input[name="username"]').value;
    const password = loginForm.querySelector('input[name="password"]').value;
    
    // Kiểm tra nếu các trường không để trống
    if (!username || !password) {
        alert('Vui lòng nhập đầy đủ thông tin!');
        return false;
    }
    
    // Thực hiện xử lý đăng nhập (giả lập)
    if (username === "user" && password === "12345") {
        alert('Đăng nhập thành công!');
        return true;
    } else {
        alert('Thông tin đăng nhập không đúng!');
        return false;
    }
}

// Hàm xác thực đăng ký
function validateRegister() {
    const username = registerForm.querySelector('input[name="username"]').value;
    const email = registerForm.querySelector('input[name="email"]').value;
    const password = registerForm.querySelector('input[name="password"]').value;
    const confirmPassword = registerForm.querySelector('input[name="confirm-password"]').value;
    
    // Kiểm tra nếu các trường không để trống
    if (!username || !email || !password || !confirmPassword) {
        alert('Vui lòng nhập đầy đủ thông tin!');
        return false;
    }

    // Kiểm tra mật khẩu xác nhận
    if (password !== confirmPassword) {
        alert('Mật khẩu và xác nhận mật khẩu không khớp!');
        return false;
    }

    // Thực hiện xử lý đăng ký (giả lập)
    alert('Đăng ký thành công!');
    return true;
}

// Gắn sự kiện submit cho các form
loginForm.addEventListener('submit', (e) => {
    e.preventDefault(); // Ngừng hành động mặc định (reload trang)
    if (validateLogin()) {
        // Nếu hợp lệ, có thể tiếp tục gửi dữ liệu
    }
});

registerForm.addEventListener('submit', (e) => {
    e.preventDefault(); // Ngừng hành động mặc định (reload trang)
    if (validateRegister()) {
        // Nếu hợp lệ, có thể tiếp tục gửi dữ liệu
    }
});
