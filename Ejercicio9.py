import psycopg2

def conectar():
    conn=None
    print("Conectando a la base de datos")
    try:
        conn = psycopg2.connect(
            host="127.0.0.1",
            database="pecl2",
            user="postgres",
            password="postgres",
            port="5432"
        )

    except (Exception, psycopg2.DatabaseError) as error:
        print("Error al conectarse a la base de datos")
        print(error)

    return conn

def consultar(tabla, nresult):
    print("Consultando la base de datos " + tabla + " con " + str(nresult) + " resultados")
    conn = conectar()
    try:
        cur = conn.cursor()
        cur.execute("SELECT DISTINCT * FROM final."+tabla+" FETCH FIRST " + str(nresult)+ " ROWS ONLY;")
        
        rows = cur.fetchall()

        resultado = []

        for row in rows:
            registro = {}

            for i in range(len(cur.description)):
                nombre_columna = cur.description[i].name
                valor_columna = row[i]
                registro[nombre_columna] = valor_columna

            resultado.append(registro)

        for i in range(nresult):
            print(resultado[i])
            print("")

        cur.close()

    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

if __name__ == '__main__':
    print("\nMostrando 10 personas:\n")
    consultar("personas", 10)
    print("\nMostrando 10 vehículos:\n")
    consultar("vehículos", 10)
    print("\nMostrando 10 accidentes:\n")
    consultar("accidente", 10)
    print("Fin del programa")