/* === Подтверждение удаления === */
var delArr = document.querySelectorAll('.btn_del');
if(delArr.length > 0){
    for(var i = 0; i < delArr.length; i++){
        delArr[i].addEventListener('click',function(event){
            event.preventDefault();
            var url = this.href;
            var res = confirm("Подтвердите удаление.");
            if(!res) return false;
            window.location = url;
        });
    }
}

/* === Проверка паролей при регистрации === */
function RegForm(options){
    var form = document.getElementById(options.formId);
    
    form.addEventListener('click', function(event) {
        var target = event.target;
        
        if (target.classList.contains('btn_reg')) {
            event.preventDefault();
            
	    var pass = document.querySelector('.js_reg_pass').value;
	    var repass = document.querySelector('.js_reg_repass').value;
	    console.log(pass);
	    console.log(repass);
            if (pass === repass) {
                form.submit();
            } else {
                alert('Пароли не совпадают');
		pass.value = '';
		repass.value = '';
            }
        }
    });
}
