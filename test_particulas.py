import pytest
from acelerador_particulas import AceleradoresDeParticulas


def test_consultar_siglo_siglo_XX():
    acelerador = AceleradoresDeParticulas("Cockcroft-Walton", 1932, "John Cockcroft", "UK")
    assert acelerador.consultar_siglo() == "Los aceleradores de partículas se crearon a partir del siglo XX."
    
def test_atributos_juntos__str__():
    acelerador = AceleradoresDeParticulas("Cockcroft-Walton", 1932, "John Cockcroft y Ernest Walton", "Universidad de Cambridge, Reino Unido")
    assert acelerador.atributos_juntos__str__() == ("Acelerador: Cockcroft-Walton, Año: 1932, Inventor: John Cockcroft y Ernest Walton, Origen: Universidad de Cambridge, Reino Unido") 
    
def suma__add__():
    sumaaños = AceleradoresDeParticulas[("Cockcroft-Walton", 1932, "John Cockcroft y Ernest Walton", "Universidad de Cambridge, Reino Unido"),("Van de Graaff", 1930, "Robert J. Van de Graaff","Instituto Tecnológico de Massachusetts (MIT), EE.UU.")]
    assert sumaaños.__add__() == 3682