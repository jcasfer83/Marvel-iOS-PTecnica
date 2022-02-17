# Marvel-iOS-PTecnica

Hola!
Soy Joaquín Castellano, el desarrollador de esta prueba técnica.
El proyecto desarrollado para iOS tiene la siguiente configuración:
 - versión 1.0
 - iOS 15.2
 - XCode 13.2.1
 - la app se debe visualizar en portrait y los constraints están optimizados para un iPhone 13
 - en el apartado info -> App Transport Security Settings -> Allow Arbitrary Loads; esta habilitado para poder hacer peticiones a con urls de protocolo http

La aplicación está desarrollada en 4 capas, Vista, Modelo, Servicio (controlador) y he añadido una capa más que debería ser la encargada de almacenar los datos o gestionar la inserción de datos en data core.

Las funcionalidades principales son las que marca la prueba técnica:

 - Hacer un listado de personajes marvel
 - Obtener el detalle de los mismos mediante id

Otras funcionalidades:

 - La aplicación muestra las imágenes de las que dispone la API de marvel para cada personaje
 - Hace las peticiones de forma recurrente y sincronizada.
 - Testing: Todas las pruebas que he realiza son de integración y de casos de uso; las unitarias sólo he implementado un test LLamado URLBuilderTest, que comprueba que la url sea correcta para hacer la petición

Funcionalidades que he intentado implementar y que no han llegado a funcionar por diversos motivos:

 - Crear la estructura interna mediante core data para que con una sola petición los datos estén disponibles siempre que la aplicación esté en uso; esto mejoraría la experiencia de usuario.
 - Debido a que no he conseguido implementar la funcionalidad anterior la sincronización en las peticiones se ha complicado un poco; he tenido que dar por defecto 4 segundos a la app para que tenga tiempo de procesar la petición a la API y utilizar los datos para cargar la lista de personajes. Este tiempo está basado en numerosas pruebas de integración en todo el proceso de desarrollo; para intentar garantizar que la información está disponible y no supone una experiencia mala para el usuario (aunque es mejorable). 
 - Otra opción que he probado es la de almacenar los datos en un repositorio (clase) que contenía un array de personajes, compilaba pero no podía disponer de los objetos en la clase que gestiona el view controller específico.
 - Customizar con mejor diseño las barras de navegación (he intentado que no cambien de color en ningún momento y en añadir un icono en el botón back) por motivos que desconozco me daba errores o no me aplicaba los cambios...
 - Todas la pruebas que he hecho son de integración y de casos de uso, excepto una unitaria; podría haber realizado más pruebas unitarias.
 - He intentado por diversas vías hacer que las custom cells de la lista de personajes (Se muestran en una table view) tuviesen bordes redondeados y algo de sombreado para conseguir realzarlas; la vía en la que tenía mas esperanzas ha sido contener todos los elementos en una UIView y cambiar sus propiedades; lo he intentado en todas las partes del código que he podido, me compilaba, pero no me aplicaba los cambios, por lo he decidido dejarla como está ahora.
 - Las celdas tiene un tamaño fijo ya que si las hacía de tamaño ajustable, no me salían ni parecidas; intenté controlar el tamaño de las imagenes que está alojadas en la api; pero no me ha dado tiempo a implementarlo (las imágenes de los personjes tienen tamaños diferentes o directamente se recibe una por defecto si no está disponible la específica.
 - Aplicar un diseño mas estilizado y proporcionado.

Funcionalidades que se pueden incorporar y que yo podria implementar entre otras:

 - Todas las que se imaginen relacionadas con servicios marvel; reproducción de trailers con webviews o con enlaces específicor mediante reproductor nativo, enlaces a repositorios, comunidades, imagenes, datos, etc.
 - autentificación de ususarios y demás servicios que brinda Firebase.

