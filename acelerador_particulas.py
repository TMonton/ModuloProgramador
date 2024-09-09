class AceleradoresDeParticulas:
    def __init__(self, nombre_del_modelo, año, inventor, origen):
        self.__nombre_del_modelo = nombre_del_modelo
        self.__año = año
        self._inventor = inventor
        self._origen = origen
    
    def get_nombre_del_modelo(self):
        return self.__nombre_del_modelo
    
    def set_nombre_del_modelo(self, nuevo_nombre):
        self.__nombre_del_modelo = nuevo_nombre
        
    def get_año(self):
        return self.__año
    
    def set_año(self, nuevo_año):
        self.__año = nuevo_año
        
    def consultar_siglo(self):
        if 1901 <= self.__año <= 2000:
            return "Los aceleradores de partículas se crearon a partir del siglo XX."
        elif self.__año <= 1900:
            return "Los aceleradores no se habían inventado en ese siglo todavía."
        else:
            return "El acelerador es del siglo XXI."
    
    def atributos_juntos__str__(self):
        return (f"Acelerador: {self.__nombre_del_modelo}, Año: {self.__año}, "f"Inventor: {self._inventor}, Origen: {self._origen}")
    
    def __add__(self, other):
        if isinstance(other, AceleradoresDeParticulas):
            return self.__año + other.get_año()
        else:
            raise ValueError("Ambos objetos deben ser instancias de AceleradoresDeParticulas.")
    
        
    
acelerador1 = AceleradoresDeParticulas ("Cockcroft-Walton", 1932, "John Cockcroft y Ernest Walton", "Universidad de Cambridge, Reino Unido")
acelerador2 = AceleradoresDeParticulas ("Van de Graaff", 1930, "Robert J. Van de Graaff","Instituto Tecnológico de Massachusetts (MIT), EE.UU.")


print(acelerador1.consultar_siglo())
print(acelerador2.consultar_siglo())

print(acelerador1.atributos_juntos__str__())
print(acelerador2.atributos_juntos__str__())

suma_años = (acelerador1) + (acelerador2)

print(suma_años)

