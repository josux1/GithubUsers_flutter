# GitHub Users API
Este proyecto nos ayuda a comprender el consumo de la API de github users, mediante el cliente HTTP. Con una implementacion básica de UI.

# Funciones principales
- Consumo de API por medio de cliente HTTP
- Parseo de respuesta json a modelo de clase custom
- Manejo de UI simple para la busqueda de información
- Manejo de SearchDelegate integrado en Flutter


### Arquitectura
Este proyecto está hecho con la arquitectura simple para Flutter.

- Models
- Pages
- Repository
- Search
- Widgets

| Capa | Función |
| ------ | ------ |
| Models | Contiene todos los modelos de clases a partir de una respuesta json. |
| Pages | Contiene todas las paginas de la aplicación.
| Repository | Se encarga de géstionar todas las comunicaciones por peticiones http con los servicios que se le conecten.|
| Search | Contiene todas las implementaciones de la clase SearchDelegate |
| Widgets | Contiene todos los componentes(Widgets) personalizados.  |

### Info Versionamiento
 Versión de Flutter
• Flutter 3.16.0
• Dart 3.2.0 
• App Version 1.0.0