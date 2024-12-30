import psycopg2

def conectar():
    # Creamos una variable con los datos de la conexion
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

    # Retornamos la conexion
    return conn

def consultar_campo(collision_id):
    print("Consultando los datos del accidente " + collision_id + ":")
    conn = conectar()
    try:
        cur = conn.cursor()

        cur.execute("SELECT DISTINCT * FROM final.accidente WHERE collision_id = '"+collision_id+"';")
        accidente = cur.fetchall()

        cur.execute("SELECT DISTINCT * FROM final.colision_vehiculo WHERE collision_id = '"+collision_id+"';")
        colis_v = cur.fetchall()

        cur.execute("SELECT DISTINCT * FROM final.colision_persona WHERE collision_id = '"+collision_id+"';")
        colis_p = cur.fetchall()
        

        print("\nAccidente ("+collision_id+"):")
        for i in range(len(accidente)):
            print(accidente[i])
        
        print("\nTabla colision persona:")
        for j in range(len(colis_p)):
            print(colis_p[j])

        print("\nTabla colision vehículo:")
        for k in range(len(colis_v)):
            print(colis_v[k])

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            # Cerramos la conexion
            conn.close()

if __name__ == '__main__':
    collision_id = input("\nIntroduce el id de la colision sobre la que quieres hacer una consulta:\n")
    consultar_campo(collision_id)
    print("\nFin del programa")