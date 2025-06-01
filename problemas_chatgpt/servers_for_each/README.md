### 🎯 **Enunciado del problema (Nivel básico con `count` o `for_each`)**

Tienes que simular el despliegue de múltiples servidores locales. Cada servidor debe imprimir un mensaje indicando su nombre y su propósito. Esta información se encuentra en un mapa de variables donde la **clave** es el nombre del servidor y el **valor** es su propósito (por ejemplo: `"web"`, `"db"`, `"cache"`).

Debes usar el meta-argumento `for_each` para crear un `null_resource` por cada servidor definido, y ejecutar un script de Bash que genere un archivo llamado `servidor_<nombre>.txt` con el siguiente contenido:

```
Servidor <nombre>: propósito <propósito>
```

No hay ningún proveedor externo, y debes usar solo `null_resource` y `local-exec`.

---

### 🧠 **Requisitos clave que debes cubrir en tu código de Terraform**

* Declarar una variable tipo `map(string)` para los servidores.
* Usar un recurso `null_resource` con `for_each` para iterar sobre el mapa.
* En cada recurso, usar un provisioner `local-exec` que:

  * Cree un archivo `servidor_<clave>.txt`.
  * Escriba en él el propósito del servidor (el valor del mapa).
* No necesitas dividir en módulos, pero puedes hacerlo si lo prefieres.

---

### 🧪 **Ejemplo de entrada**

La variable puede verse así:

```hcl
variable "servidores" {
  type = <tipo de dato adecuado>
  default = {
    "alpha" = "web"
    "beta"  = "db"
    "gamma" = "cache"
  }
}
```
