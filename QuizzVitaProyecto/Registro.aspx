<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="QuizzVitaProyecto.Registro" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro</title>

</head>
<body>
    <div id="registerModal" class="modal">
        <div class="modal-content-wrapper">
            <div class="Rectangle37" style="background: #FFFFFF; padding: 20px;">
                <div class="Rectangle23" style="background: #CBCBCB; padding: 20px;">
                    <button class="btn-close" onclick="closeModal()">
                        <img src="/Principal/img/close-icon.png" alt="Cerrar" class="close-icon" />
                    </button>
                    <img src="/Principal/img/reg.png" alt="Registro" style="display: block; margin: 0 auto;" />
                    <form id="registerForm" method="post" >
                        <label for="name" class="label2">Nombre</label>
                        <input type="text" id="name" name="name" class="input2" />

                        <label for="surname" class="label2">Apellidos</label>
                        <input type="text" id="surname" name="surname" class="input2" />

                        <label for="years" class="label2">Edad</label>
                        <input type="text" id="years" name="years" class="input2" />

                        <label for="email-register" class="label2">Correo electrónico</label>
                        <input type="email" id="email-register" name="email-register" class="input2" />

                        <label for="password-register" class="label2">Contraseña</label>
                        <input type="password" id="password-register" name="password-register" class="input2" />

                        <div class="button-container" style="text-align: center;">
                            <button type="button" class="btn btn-register2" onclick="submitRegisterForm()">Registrarse</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        function submitRegisterForm() {
            var form = document.getElementById('registerForm');
            var formData = new FormData(form);

            fetch('/Registro.aspx', {
                method: 'POST',
                body: formData
            })
                .then(response => response.json())
                .then(data => {
                    console.log('Server response:', data);
                    alert(data.message);
                    if (data.status === "success") {
                        closeModal();
                        form.reset();  // Limpiar el formulario después del registro exitoso
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Error en el registro');
                });
        }

        function closeModal() {
            document.getElementById('registerModal').style.display = 'none';
        }
    </script>
</body>
</html>
