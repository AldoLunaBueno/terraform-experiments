## 💡 Ejercicio propuesto: **Generador de reportes por entorno**

### 🧩 Contexto:

Quieres simular que estás generando reportes para distintos entornos de desarrollo (por ejemplo: `dev`, `qa`, `staging`). Cada entorno tiene una configuración mínima con su nombre y una lista de servicios (en lugar de puertos o versiones). Por cada entorno, deberás crear un archivo de texto que diga qué servicios contiene y escribirlo localmente usando `null_resource` y `local-exec`.

---

### 🛠️ Requisitos

1. Define una variable tipo `map(list(string))`, donde:

   - La clave es el nombre del entorno (ej. `dev`, `qa`, etc.)
   - El valor es una lista de nombres de servicios (ej. `["auth", "api", "db"]`)

2. Usa `for_each` para crear un `null_resource` por entorno que:

   - Cree una carpeta `generated_environment/reports/` si no existe.
   - Cree un archivo llamado `reporte_<entorno>.txt` con el contenido:

     ```
     Entorno: <nombre>
     Servicios: <servicio1>, <servicio2>, ...
     ```

3. El script debe ejecutarse en Bash (usa `interpreter = ["bash", "-c"]` si estás en Windows y tienes Git Bash o similar).

4. Usa `local_file` para crear un archivo `resumen.txt` en esa misma carpeta que liste todos los entornos con el número de servicios que tiene cada uno, como:

   ```
   dev: 3 servicios
   qa: 2 servicios
   staging: 4 servicios
   ```

---

### 🔥 Nivel: Medio

No necesitas `modules`, `outputs`, ni Python. Solo `null_resource`, `local-exec`, `locals`, `variables`, y `local_file`.

