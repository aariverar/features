Feature: Emisión de poliza de VC para el canal de FFVV por Suscripción

    COMO clientes con DNI / CE, 
    QUIERO realizar el flujo completo de cotización, pago y emisión de mi póliza de Vida Contigo, 
    PARA poder adquirir el producto de Vida Contigo.

    @CP001
        Scenario Outline: Emitir poliza de VC para el canal de FFVV por Suscripción Automática y Emisión en Línea.
        
        Given que ingreso al sistema Journey Vida
            And ingreso el correo "<correo>" y contraseña "<contrasenia>"
        When ingreso el DNI de un cliente "<dni>"
            And relleno el numero de celular "<celular>", correo electronico "<correocliente>", ocupacion "<ocupacion>", origen "<origen>", nacionalidad "<nacionalidad>", residencia "<residencia>"
            And selecciono el trabajo como dependiente
            And acepto la Politica de aceptacion de Proteccion de Datos Personales.
            And pulso en el boton continuemos
            And ingreso a Ingresos y Ahorros
            And ingreso los ingresos al mes aproximadamente "<ingresos>" 
            And pulso en guardar
            And ingreso en Ver suma asegurada
            And pulso en coticemos
            And pulso en ver mas productos
            And pulso ver mas en el producto Vida Contigo
            And seleccionamos la moneda Soles
            And seleccionamos Plan proteccion
            And seleccionamos la frecuencia de pago "<frecPago>"
            And pulso en continuemos
            And seleccionamos Elige tus beneficiarios legales
            And pulso en Guardar
            And pulso en Continuar
            And relleno la empresa de trabajo "<empresa>", "<aniosempresa>"
            And selecciono ocupación laboral implica alguna actividad de riesgo "<actividadriesgo>", es ciudadano o cuenta con residencia de EEUU "<ciudadanous>", se comunica a través del lenguaje de señas "<lenguajeseniaas>", ha afrontado o afronta procesos legales por actividades ilícitas "<actividadesilicitas>", cuál es el origen de sus ingresos actualmente "<origeningresos>", persona expuesta políticamente (PEP) "<personapolitica>".
            And pulso en continuemos
            And pulso en empezar  
            And pulso en Abrir el formulario
            And relleno la altura "<metros>" "<centimetros>", peso "<peso>", fumador "<fumador>" si/no, alguna vez fumo "<fumo>" 
            And pulso en Continuar
            And selecciono todas las opciones de información médica como negativas 
            And pulso en Continuar
            And regresamos a la otra pestaña y pulsamos en Continuar
            And seleccionamos departamento "<departamento>", provincia "<provincia>", distrito "<distrito>", via "<via>", dirección "<dirección>", numero "<numero>".
            And pulso en continuar
            And selecciono la opción no y acepto la declaración del proceso de asesoría.
            And pulso en continuemos
            And pulso en Pagar
            And pulso en Pago digital
            And pulso Confirmar
        Then se valida el mensaje de confirmacion de pago

    Examples:
    | correo                    | contrasenia | dni      | celular   | correocliente      | ocupacion             | origen | nacionalidad | residencia | ingresos | frecPago | deudapendiente | aniospendientes | banco | empresa | aniosempresa | actividadriesgo | ciudadanous | lenguajesenias | actividadesilicitas | origeningresos | personapolitica | metros | centimetros | peso | fumador | fumo | departamento | provincia | distrito   | via     | direccion | numero |
    | jarojast@indracompany.com | 123456      | 40746425 | 966312199 | smgs8787@gmail.com | Ingeniero de sistemas | Otros  | PERU         | PERU       | 4000     | anual    | 10000          | 15              | BCP   | RIMAC   | 5            | NO              | NO          | NO             | NO                  | NO             | NO              | 1      | 70          | 70   | NO      | NO   | LIMA         | LIMA      | SAN MIGUEL | AVENIDA | Prueba    | 900    |

