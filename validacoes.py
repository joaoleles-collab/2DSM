from banco import cadastrar_aventureiro
def validar_cadastro(sql):
    # coloca tudo minúsculo para comparar
    sql = sql.lower()
    # erros
    if "insert" not in sql:
        return False, "Você precisa utilizar INSERT"
    if "into" not in sql:
        return False, "Você precisa utilizar INTO"
    if "aventureiro" not in sql:
        return False, "Falta o nome correto da tabela"
    # acerto
    cadastrar_aventureiro(sql)
    return True, "SELECT válido"