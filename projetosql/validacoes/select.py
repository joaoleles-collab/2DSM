
def validar_select(sql):

    if not sql.startswith("select"):
        return False, "❌ O comando precisa começar com SELECT."

    if "from" not in sql:
        return False, "❌ Está faltando FROM."

    if ";" not in sql:
        return False, "❌ Todo comando SQL deve terminar com ponto-e-vírgula: ';'."

    return True, "SELECT válido."