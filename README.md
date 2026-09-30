# 💈 BARBERSHOP - Sistema Web de Gestión de Citas y Barbería

Plataforma web integral diseñada para la automatización de citas, administración de turnos y control operativo de barberías. El sistema implementa una arquitectura basada en Java Web (JSP/Servlets), gestión modular con Apache Maven y persistencia relacional en MySQL, permitiendo a los clientes autogestionar sus reservas y a los administradores auditar métricas financieras y operativas[cite: 9, 10].

---

## 📌 Tabla de Contenidos
- [Características Principales](#-características-principales)
  - [Módulo de Clientes](#módulo-de-clientes)
  - [Panel Administrativo (Dashboard)](#panel-administrativo-dashboard)
- [Arquitectura y Tecnologías](#-arquitectura-y-tecnologías)
- [Requisitos Previos](#-requisitos-previos)
- [Guía de Instalación del Entorno](#-guía-de-instalación-del-entorno)
- [Puesta en Marcha y Despliegue](#-puesta-en-marcha-y-despliegue)
- [Módulo de Seguridad y Restablecimiento](#-módulo-de-seguridad-y-restablecimiento)
- [Reportes y Auditoría](#-reportes-y-auditoría)

---

## 🚀 Características Principales

### 👤 Módulo de Clientes
* **Landing Page Interactiva:** Barra superior con reloj dinámico en tiempo real y navegación rápida a Servicios, Horarios, Barberos y Contacto.
* **Catálogo de Servicios:** Tarjetas descriptivas con tarifas (S/), tiempo estimado y especificaciones de lo que incluye cada servicio.
* **Galería y Portafolio:** Carrusel responsivo para visualizar trabajos y estilos recientes.
* **Selección de Barbero:** Fichas técnicas con especialidad, años de experiencia y calificación en estrellas.
* **Geolocalización:** Integración con Google Maps para ubicación de la sede principal y sucursales.
* **Reserva de Citas:** Formulario automatizado que precarga los datos del usuario logueado para seleccionar barbero, servicio, fecha, hora e instrucciones especiales.
* **Mis Citas y Boleta Digital:** Panel de consulta para editar o cancelar citas y generar la **Boleta de Servicio** digital.

### 🛠️ Panel Administrativo (Dashboard)
* **Gestión de Clientes:** Tabla centralizada con identificador, nombres, teléfonos y correos para fidelización.
* **Gestión de Barberos:** Módulo CRUD para dar de alta nuevos profesionales (con foto, especialidad y años de experiencia) o retirarlos del catálogo.
* **Gestión de Servicios:** Control dinámico de precios, tiempos de atención, etiquetas descriptivas y orden de visualización en la web.
* **Gestión de Horarios:** Configuración y personalización de turnos (Mañana, Tarde, Noche) e intervalos de disponibilidad.
* **Control Transaccional de Citas:** Tablero en vivo con acciones para finalizar citas (consolidando el ingreso económico) o cancelarlas para liberar cupos.

---

## 💻 Arquitectura y Tecnologías

* **Backend:** Java EE / Jakarta EE (JSP, Servlets, JDBC)[cite: 9, 10].
* **Servidor Web:** Apache Tomcat 10.1[cite: 9, 10].
* **Gestor de Dependencias:** Apache Maven[cite: 9, 10].
* **Base de Datos:** MySQL Server & MySQL Workbench.
* **Frontend:** HTML5, CSS3, JavaScript y Bootstrap.
* **Librerías de Soporte:**
  * **Jakarta Mail & Angus Activation:** Servicio automatizado de envío de correos y tokens de seguridad.
  * **iText:** Generación de boletas y reportes generales en formato PDF.
  * **Apache POI:** Exportación de reportes de citas a hojas de cálculo Microsoft Excel[cite: 10].

---

## ⚙️ Requisitos Previos

Antes de desplegar el aplicativo, verifique contar con el siguiente software instalado[cite: 9, 10]:
1. **Java Development Kit (JDK 17 o superior)**.
2. **Eclipse IDE for Enterprise Java and Web Developers**.
3. **Apache Tomcat v10.0 / v10.1**[cite: 9, 10].
4. **Apache Maven 3.9.x**.
5. **MySQL Server & MySQL Workbench**[cite: 10].

---

## 🛠️ Guía de Instalación del Entorno

### 1. Configuración de Maven
1. Descargar el archivo binario (`apache-maven-3.9.x-bin.zip`) del sitio oficial de Apache Maven.
2. Descomprimir el contenido en una ruta fija (ejemplo: `C:\apache-maven-3.9.x` o `C:\Recursos-LP-II\`).
3. Abrir **Propiedades del sistema** > **Variables de entorno** en Windows:
   * Crear la variable de sistema `M2_HOME` apuntando a la carpeta de Maven.
   * Crear la variable de sistema `MAVEN_HOME` con la misma ruta.
   * En la variable `Path` del sistema o de usuario, agregar `%M2_HOME%\bin`.
4. Abrir la terminal (`cmd`) y validar la instalación ejecutando[cite: 9]:
   ```bash
   mvn -v
