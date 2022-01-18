Feature: Base de datos Mis consultas

    COMO usuario administrador,
    QUIERO realizar consultas (selects) al back-end,
    PARA verificar la consistencia de data.    

    Rule: Se verifica solo el ultimo trimestre.

    Background:
        Given: Se tenga accesos correctos a la VPN: Mis consultas

    Scenario: Validación de SELECTS
        """
        Cuando se Valide cualquier base de datos
        =========================================
        Solo se podrá realizar con el usuario root.
        """
        Given ingreso a la bbdd
        When  realizo la consulta
        Then  verifico que la data es correcta.

        #Para ejectuar la regresión total aplicar el tag @BBDD_Regresion
        @BBDD_SelectClientes @BBDD_Regresion
        Scenario Outline: Validación de Selects en base de datos
            Given ingreso a la BBDD "<nom_bbdd>"
                And especifico el host "<host>", el usuario "<user>", la contrasenia "<password>"
                And ingreso a la tabla "<nom_table>"
            When ejecuto el query "<query>", con el resultado esperado "<dato1>"
            Then valido que "<dato1>" sea igual a "<r_query>"

            #Estos querys fueron validados por ultima vez el día 12/09/2020
            Examples:
                | nom_bbdd | host                             | user | password | nom_table        | query                                           | dato1 | r_query |
                | Clientes | http//10.300.28.10;8080/uri_bbdd | root | root     | vk_sueldos       | Select * from vk_sueldos where vk_neto = '3500' | 10    |         |
                | Clientes | http//10.300.28.10;8080/uri_bbdd | root | root     | vk_sueldos       | Select * from vk_sueldos where vk_neto = '2000' | 5     |         |
                | Clientes | http//10.300.28.10;8080/uri_bbdd | root | root     | vk_ingresos      | Select * from vk_sueldos where vk_neto = '1200' | 20    |         |
                | Clientes | http//10.300.28.10;8080/uri_bbdd | root | root     | vk_ingresos      | Select * from vk_sueldos where vk_neto = '5000' | 30    |         |
                | Clientes | http//10.300.28.10;8080/uri_bbdd | root | root     | vk_saldos        | Select * from vk_sueldos where vk_neto = '8000' | 50    |         |
                | Clientes | http//10.300.28.10;8080/uri_bbdd | root | root     | vk_saldos        | Select * from vk_sueldos where vk_neto = '500'  | 2     |         |
                | Clientes | http//10.300.28.10;8080/uri_bbdd | root | root     | vk_saldos        | Select * from vk_sueldos where vk_neto = '900 ' | 90    |         |
                | Clientes | http//10.300.28.10;8080/uri_bbdd | root | root     | vk_restricciones | Select * from vk_sueldos where vk_neto = '2200' | 15    |         |
                | Clientes | http//10.300.28.10;8080/uri_bbdd | root | root     | vk_restricciones | Select * from vk_sueldos where vk_neto = '3300' | 32    |         |
