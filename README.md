# terraform-experiments

Si trabajamos en Windows dentro de un entorno WSL (Linux), todos los archivos contienen al final de cada línea el carácter \r (retorno de carro o CR) y esto impide correr los scripts de Bash (.sh) y archivos de Terraform (.tf). Lo resulevo con este comando desde la raíz de mi proyecto:

```bash
find . -type f \( -name "*.sh" -o -name "*.tf" \) -exec sed -i 's/\r$//' {} +
```