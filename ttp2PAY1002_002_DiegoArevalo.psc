Proceso Ficha
	Definir menu_principal Como Entero;
	Definir folio Como Entero;
	Definir fecha_ficha Como Caracter;
	Definir hora_ficha Como Entero;
	Definir nombre_recepcionista Como Caracter;
	Definir apellido_recepcionista Como Caracter;
	Definir nombre_paciente Como Caracter;
	Definir apellido_paciente Como Caracter;
	Definir rut_paciente Como Caracter;
	Definir sexo_paciente Como Caracter;
	Definir edad_paciente Como Entero;
	Definir ecivil_paciente Como Caracter;
	Definir domicilio_paciente Como Caracter;
	Definir telefono_paciente Como Caracter;
	Definir gsanguineo_paciente Como Caracter;
	Definir acompanante_paciente Como Caracter;
	Definir nivel_paciente Como Caracter;
	Definir cont_hombres Como Entero;
	Definir cont_mujeres Como Entero;
	Definir validador_sexo Como Entero;
	Definir validador_edad Como Entero;
	Definir nombre_medico Como Caracter;
	Definir apellido_medico Como Caracter;
	Definir sintomas Como Caracter;
	Definir diagnostico Como Caracter;
	Definir reposo Como Logico;
	Definir dias_reposo Como Entero;
	Definir cantidad_medicamentos Como Entero;
	Definir tipo_medicamento Como Entero;
	Definir paracetamol Como Entero;
	Definir lidocaina Como Entero;
	Definir omeprazol Como Entero;
	Definir penicilina Como Entero;
	Definir salbutamol Como Entero;
	Definir pac_reposo Como Entero;
	Definir fin_hora Como Entero;
	Definir prescripcion Como Logico;
	Definir t_total Como Entero;
	
	t_total=0;
	pac_reposo=0;
	folio=0;
	cont_hombres=0;
	cont_mujeres=0;
	validador_sexo=0;
	validador_edad=0;
	
	paracetamol=0;
	lidocaina=0;
	omeprazol=0;
	penicilina=0;
	salbutamol=0;
	
	Repetir
		Borrar Pantalla;
		Escribir "---------------------------------";
		Escribir "SERVICIO DE ATENCION DE URGENCIAS";
		Escribir "---------------------------------";
		Escribir "1 - Ingresar Ficha de Paciente";
		Escribir "2 - Actualizar Ficha por el Médico";
		Escribir "3 - Asignación de medicamentos";
		Escribir "4 - Estadísticas";
		Escribir "5 - Salir";
		Leer menu_principal;
		
		Segun menu_principal Hacer
			1:
				Borrar Pantalla;
				Escribir "----------------";
				Escribir "FICHA DE INGRESO";
				Escribir "----------------";
				Escribir "Ingresar Fecha (Formato dd/mm/aa)";
				Leer fecha_ficha;
				Escribir "Hora de atención (Formato hh:mm)";
				Leer hora_ficha;
				Escribir "Nombre de recepcionista";
				Leer nombre_recepcionista;
				Escribir "Apellido recepcionista";
				Leer apellido_recepcionista;
				Borrar Pantalla;
				Escribir "----------------";
				Escribir "IDENTIFICACION DE PACIENTE";
				Escribir "----------------";
				Escribir "Nombre";
				Leer nombre_paciente;
				Escribir "Apellido";
				Leer apellido_paciente;
				Escribir "RUT";
				Leer rut_paciente;
				Escribir "Sexo (M/F)";
				Leer sexo_paciente;
				
				//Validacion sexo paciente
				Mientras validador_sexo==0 Hacer
					Si (Minusculas(sexo_paciente)=="m") || (Mayusculas(sexo_paciente)=="M")Entonces
						cont_hombres=cont_hombres+1;
						validador_sexo=1;
					SiNo
						Si (Minusculas(sexo_paciente)=="f") || (Mayusculas(sexo_paciente)=="F")Entonces
							cont_mujeres=cont_mujeres+1;
							validador_sexo=1;
						SiNo						
							Escribir "Debe ingresar M ó F";
							Leer sexo_paciente;
						FinSi	
					FinSi			
				FinMientras
				
				Escribir "Edad";
				Leer edad_paciente;
				
				//Validacion rango de edad
				Mientras validador_edad==0 Hacer
					Si (edad_paciente>=0) && (edad_paciente<120) Entonces
						validador_edad=1;
					SiNo
						Escribir "El rango de edad es de 0 a 119 años";
						Escribir "Favor volver a ingresar edad";
						Leer edad_paciente;
					FinSi
				FinMientras
				
				Escribir "Estado Civil";
				Leer ecivil_paciente;
				Escribir "Domicilio";
				Leer domicilio_paciente;
				Escribir "Teléfono";
				Leer telefono_paciente;
				Escribir "Grupo sanguíneo";
				Leer gsanguineo_paciente;
				Escribir "Asiste acompañado? (V/F)";
				Leer acompanante_paciente;
				Escribir "Nivel de urgencia asignado";
				Leer nivel_paciente;
				folio=folio+1;
				Escribir "----------------";
				Escribir "FOLIO GENERADO: ", folio;
				Escribir "----------------";
				
			2:
				Borrar Pantalla;
				Escribir "-----------------------";
				Escribir "INFORMACION DE ATENCION";
				Escribir "(Uso médico)";
				Escribir "-----------------------";
				Escribir "Nombre Médico";
				Leer nombre_medico;
				Escribir "Apellido Médico";
				Leer apellido_medico;
				Escribir "Síntomas detectados";
				Leer sintomas;
				Escribir "Diagnóstico";
				Leer diagnostico;
				Escribir "Reposo? (V/F)";
				Leer reposo;
				Si reposo Entonces
					Escribir "Ingrese la cantidad de días de reposo";
					Leer dias_reposo;
					pac_reposo=pac_reposo+1;
				FinSi
				Escribir "Ingrese hora de fin atención";
				Leer fin_hora;
				t_total=t_total + (fin_hora-hora_ficha);
				
			3:
				Borrar Pantalla;
				Escribir "--------------------------";
				Escribir "ASIGNACION DE MEDICAMENTOS";
				Escribir "--------------------------";
				Escribir "Prescribe medicamentos? (V/F)";
				Leer prescripcion;
				Si prescripcion Entonces
					Escribir "Ingrese cantidad de medicamentos";
					Leer cantidad_medicamentos;
					Escribir "Seleccione el tipo de medicamento a recetar";
					Escribir "1 - Paracetamol";
					Escribir "2 - Lidocaína";
					Escribir "3 - Omeprazol";
					Escribir "4 - Penicilina";
					Escribir "5 - Salbutamol";
					Leer tipo_medicamento;
					Segun tipo_medicamento Hacer
						1:
							paracetamol=paracetamol+cantidad_medicamentos;
						2:
							lidocaina=lidocaina+cantidad_medicamentos;
						3:
							omeprazol=omeprazol+cantidad_medicamentos;
						4:
							penicilina=penicilina+cantidad_medicamentos;
						5:
							salbutamol=salbutamol+cantidad_medicamentos;
						De Otro Modo:
							Escribir "Opción no disponible";
					FinSegun
				FinSi				
			4:
				Borrar Pantalla;
				Escribir "--------------------------";
				Escribir "ESTADISTICAS DE ATENCION";
				Escribir "--------------------------";
				Escribir "Cantidad de mujeres atendidas: ", cont_mujeres;
				Escribir "Cantidad de hombres atendidos: ", cont_hombres;
				Escribir "Cantidad total de pacientes atendidos: ",cont_hombres+cont_mujeres;
				Escribir "Cantidad de pacientes con reposo: ", pac_reposo;
				Escribir "Tiempo total de atención de pacientes: ",t_total, " minutos";
				Escribir "Total medicamentos recetados: ",(paracetamol+lidocaina+omeprazol+penicilina+salbutamol);
				Escribir "Total Paracetamol: ", paracetamol;
				Escribir "Total Lidocaína: ", lidocaina;
				Escribir "Total Omeprazol: ", omeprazol;
				Escribir "Total Penicilina: ", penicilina;
				Escribir "Total Salbutamol: ", salbutamol;				
				Escribir "";
				Escribir "Presione una tecla para volver al menú principal";
				Esperar Tecla;
				
			De Otro Modo:
				Escribir "Opcion No valida";
		FinSegun
	Hasta que menu_principal==5;
FinProceso