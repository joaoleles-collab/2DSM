def validar_insert(sql):

    if "insert" not in sql:
        return False, "❌ Você precisa utilizar INSERT."

    if "into" not in sql:
        return False, "❌ Está faltando INTO."

    if "values" not in sql:
        return False, "❌ Está faltando VALUES."

    if "(" not in sql:
            return False, "❌ Os nomes e valores devem ser envolvidos por parênteses: (atributo) VALUES ('Texto')."

    if ";" not in sql:
            return False, "❌ Todo comando SQL deve terminar com ponto-e-vírgula: ';'."

    return True, "SQL básico correto!"