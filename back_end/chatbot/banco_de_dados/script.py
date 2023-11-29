
"CREATE DATABASE feridas_hc;"

"USE feridas_hc;"

"""CREATE TABLE feridas_paciente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(50),
    email VARCHAR(100),
    nome VARCHAR(100),
    prontuario VARCHAR(50),
    senha VARCHAR(32) 
);"""

"""CREATE TABLE feridas_sintomas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pac INT,
    febre BOOLEAN,
    dor BOOLEAN,
    vermelha BOOLEAN,
    pus BOOLEAN,
    cicatrizada BOOLEAN,
    FOREIGN KEY (id_pac) REFERENCES feridas_paciente(id)
);"""
