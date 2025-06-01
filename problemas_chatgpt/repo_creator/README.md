## 🚀 Ejercicio propuesto (local, sin proveedores)

### 🎯 Objetivo:

Simular la creación y configuración de un proyecto Git local, incluyendo estructura básica, archivos iniciales, y un primer commit.

---

### 📋 Requisitos:

1. Crea una variable llamada `repositorio` con atributos:

   ```hcl
   repositorio = {
     nombre     = "mi_super_repo"
     autor      = "Juan Pérez"
     email      = "juan@example.com"
     estructura = ["src", "docs", "tests"]
   }
   ```

2. Usa `null_resource` + `local-exec` para:

   * Crear una carpeta con el nombre del repositorio.

   * Dentro, crear las subcarpetas definidas en `estructura`.

   * Generar un archivo `README.md` con este contenido:

     ```
     # <nombre>
     Autor: <autor>
     ```

   * Inicializar un repositorio git local (`git init`)

   * Hacer un primer commit con los archivos generados.

   * (Opcional) Crear una rama `develop`

3. (Avanzado) Usa una variable booleana `incluir_license` y si es `true`, genera un archivo `LICENSE.txt` con un texto simple.

---

### 🧩 Extra: Desafíos opcionales

* Crea una estructura dinámica de carpetas con `for_each` y `local-exec`
* Usa `triggers` para evitar que se repita si ya existe
* Agrega un output con la ruta absoluta del repositorio

---

### 🗂️ Archivos sugeridos:

* `variables.tf`: define `repositorio` y `incluir_license`
* `main.tf`: contiene todos los recursos y lógica de ejecución
* `terraform.tfvars`: define valores reales para la variable `repositorio`
