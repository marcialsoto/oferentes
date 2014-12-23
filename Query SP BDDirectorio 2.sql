
-- Creación de Procedimientos Almacenados BDDirectorio, Proyecto Oferentes Agro Rural --
-- Por: FERNÁNDEZ REYES, Angel



-- ************** SP Estado Civil ************** --

create procedure sp_EstadoCivil_read

as
	select * from Estado_Civil
go

--exec sp_EstadoCivil_read
--go


-- ************** *************************************** ************* --

-- ************** SP Residencia ************** --

create procedure sp_Residencia_read

as
	select * from Residencia
go

--exec sp_Residencia_read
--go


-- ************** *************************************** ************* --

-- ************** SP Estudio ************** --

create procedure sp_Estudio_read

as
	select distinct substring(cod_estudio,1,1) 'cod_estudio', nivel from Estudio
go

--exec sp_Estudio_read
--go


create procedure sp_Estudio_search
@cod char(1)
as
	select cod_estudio, grado from Estudio where cod_estudio like @cod+'%'
go

--exec sp_Estudio_search '4'
--go

-- ************** *************************************** ************* --

-- ************** SP Idioma ************** --


create procedure sp_Idioma_read

as
	select * from Idioma
go

--exec sp_Idioma_red
--go

-- ************** *************************************** ************* --

-- ************** SP Actividad ************** --

create procedure sp_Actividad_insert
@nombre varchar(50)
as
	insert into Actividad values(@nombre)
go


create procedure sp_Actividad_read

as
	select * from Actividad
go

create procedure sp_Actividad_search
@nombre varchar(50)
as
	select cod_activ from Actividad where nombre like @nombre
go

-- ************** *************************************** ************* --

-- ************** SP Organización Atendida ************** --

create procedure sp_OrgAtendida_insert
@nombre varchar(50)
as
	insert into Org_Atendida values(@nombre)
go


create procedure sp_OrgAtendida_read

as
	select * from Org_Atendida
go


create procedure sp_OrgAtendida_search
@nombre varchar(50)
as
	select cod_orgatend from Org_Atendida where nombre like @nombre
go

-- ************** *************************************** ************* --

-- ************** SP Ubigeo ************** --

create procedure sp_Ubigeo_Dept

as
	select distinct substring(cod_ubigeo,1,2) 'cod_dep', departamento 
	from Ubigeo order by 1
go

--exec sp_Ubigeo_Dept
--go


create procedure sp_Ubigeo_prov
@cod_dept char(2)
as
	select distinct substring(cod_ubigeo,1,4) 'cod_prov', provincia 
	from Ubigeo where cod_ubigeo like @cod_dept+'%'  order by 1
go

--exec sp_Ubigeo_prov '12'
--go


create procedure sp_Ubigeo_dist
@cod_prov char(4)
as
	select cod_ubigeo 'cod_dist', distrito 
	from Ubigeo where cod_ubigeo like @cod_prov+'%'  order by 1
go

--exec sp_Ubigeo_dist '1501'
--go

-- ************** *************************************** ************* --


-- ************** SP Talento ************** --

create procedure sp_Talento_insert
@dni numeric(8,0), @apell varchar(30), @nombres varchar(20), @fecha_nac datetime,
@lugar_nac char(6), @sexo varchar(10), @est_civil int, @resid int, @dir varchar(150),
@ubigeo char(6), @fono_fijo numeric(10,0), @fono_cell numeric(12,0), @correo varchar(30),
@estudio char(2), @lect_esc varchar(20), @idioma int
as
	insert into talento
	values(@dni, @apell, @nombres, @fecha_nac, @lugar_nac, @sexo, @est_civil, 
	@resid, @dir, @ubigeo, @fono_fijo, @fono_cell, 
	@correo,@estudio, @lect_esc, @idioma, getdate(),'1' )

go


--exec sp_Talento_insert 41378300,'Fernández Reyes', 'Angel', '29/07/1982','120801','Masculino', 1, null, 'calle las begonias 520', '150133', 012765266, 516874235, 'amigosfelices@hotmail.com','44'
--go

--exec sp_Talento_insert 12345678,'Riz Díaz', 'Carlos', '08/11/1982','150132','Masculino', 1, null, 'calle las begonias 520', '150133', 012765266, 516874235, 'xxx@hotmail.com','43'
--go

create procedure sp_Talento_read

as
	select * from talento where estado like '1'

go

--exec sp_Talento_read
--go

create procedure sp_Talento_combo_mant

as
	select num_dni, (convert(varchar(8), num_dni)+' - '+apellidos+ ' '+ nombres) 'ident' from talento
	order by apellidos

go

create procedure sp_Talento_search_dni
@dni numeric(8,0)
as
	select * from Talento where num_dni = @dni

go

create procedure sp_Talento_search_dni_ubigeo_activ_lugar_activ_org
@activ int, @lugar_act char(6), @ubigeo char(6), @dni numeric(8,0), @org int
as
	if (LEN(@ubigeo)>= 0 and @dni = 0 and @activ = 0 and @lugar_act = '' and @org = 0)	
		select 
		distinct t.num_dni, t.apellidos, t.nombres, t.fecha_nac, t.lugar_nac, t.sexo, t.estado_civil, est.nombre,
		t.residencia, re.nombre, t.direccion, t.ubigeo, t.telefono_fijo, t.telefono_celular, t.correo, t.estudio, e.grado, e.nivel,
		t.lect_esc, t.idioma, id.nombre
		from talento t inner join Estado_Civil est on t.estado_civil = est.cod_estcivil
		inner join Residencia re on t.residencia = re.cod_resid inner join Estudio e on t.estudio = e.cod_estudio
		inner join Idioma id on t.idioma = id.cod_Idioma   inner join Experiencia ep on t.num_dni = ep.num_dni
		where t.ubigeo like @ubigeo+'%'  and t.estado like '1' and ep.estado like '1'
	
	else	
		if (@ubigeo = '' and LEN(@dni) = 8  and @activ = 0 and @lugar_act = '' and @org = 0)
			select
			distinct t.num_dni, t.apellidos, t.nombres, t.fecha_nac, t.lugar_nac, t.sexo, t.estado_civil, est.nombre,
			t.residencia, re.nombre, t.direccion, t.ubigeo, t.telefono_fijo, t.telefono_celular, t.correo, t.estudio, e.grado, e.nivel,
			t.lect_esc, t.idioma, id.nombre 
			from talento t inner join Estado_Civil est on t.estado_civil = est.cod_estcivil
			inner join Residencia re on t.residencia = re.cod_resid inner join Estudio e on t.estudio = e.cod_estudio
			inner join Idioma id on t.idioma = id.cod_Idioma  inner join Experiencia ep on t.num_dni = ep.num_dni 
			where t.num_dni = @dni and t.estado like '1' and ep.estado like '1'
		else
			if (@ubigeo = '' and @dni = 0 and @activ <> 0 and LEN(@lugar_act) >= 0 and @org <> 0)
				select 
				distinct t.num_dni, t.apellidos, t.nombres, t.fecha_nac, t.lugar_nac, t.sexo, t.estado_civil, est.nombre,
				t.residencia, re.nombre, t.direccion, t.ubigeo, t.telefono_fijo, t.telefono_celular, t.correo, t.estudio, e.grado, e.nivel,
				t.lect_esc, t.idioma, id.nombre 
				from talento t inner join Estado_Civil est on t.estado_civil = est.cod_estcivil
				inner join Residencia re on t.residencia = re.cod_resid inner join Estudio e on t.estudio = e.cod_estudio
				inner join Idioma id on t.idioma = id.cod_Idioma  inner join Experiencia ep on t.num_dni = ep.num_dni 
				where ep.actividad = @activ and ep.lugar_activ like @lugar_act+'%' and ep.organizacion_atendida = @org
				and t.estado like '1' and ep.estado like '1'
			else
				if (@ubigeo = '' and @dni = 0 and @activ <> 0 and LEN(@lugar_act) >= 0 and @org = 0)
					select 
					distinct t.num_dni, t.apellidos, t.nombres, t.fecha_nac, t.lugar_nac, t.sexo, t.estado_civil, est.nombre,
					t.residencia, re.nombre, t.direccion, t.ubigeo, t.telefono_fijo, t.telefono_celular, t.correo, t.estudio, e.grado, e.nivel,
					t.lect_esc, t.idioma, id.nombre 
					from talento t inner join Estado_Civil est on t.estado_civil = est.cod_estcivil
					inner join Residencia re on t.residencia = re.cod_resid inner join Estudio e on t.estudio = e.cod_estudio
					inner join Idioma id on t.idioma = id.cod_Idioma  inner join Experiencia ep on t.num_dni = ep.num_dni 
					where ep.actividad = @activ and ep.lugar_activ like @lugar_act+'%' 
					and t.estado like '1' and ep.estado like '1'
				else
					if (@ubigeo = '' and @dni = 0 and @activ = 0 and LEN(@lugar_act) >= 0 and @org <> 0)
						select 
						distinct t.num_dni, t.apellidos, t.nombres, t.fecha_nac, t.lugar_nac, t.sexo, t.estado_civil, est.nombre,
						t.residencia, re.nombre, t.direccion, t.ubigeo, t.telefono_fijo, t.telefono_celular, t.correo, t.estudio, e.grado, e.nivel,
						t.lect_esc, t.idioma, id.nombre 
						from talento t inner join Estado_Civil est on t.estado_civil = est.cod_estcivil
						inner join Residencia re on t.residencia = re.cod_resid inner join Estudio e on t.estudio = e.cod_estudio
						inner join Idioma id on t.idioma = id.cod_Idioma  inner join Experiencia ep on t.num_dni = ep.num_dni 
						where ep.lugar_activ like @lugar_act+'%'  and ep.organizacion_atendida = @org
						and t.estado like '1' and ep.estado like '1'	
					else
						if (@ubigeo = '' and @dni = 0 and @activ = 0 and LEN(@lugar_act) >= 0 and @org = 0)
							select 
							distinct t.num_dni, t.apellidos, t.nombres, t.fecha_nac, t.lugar_nac, t.sexo, t.estado_civil, est.nombre,
							t.residencia, re.nombre, t.direccion, t.ubigeo, t.telefono_fijo, t.telefono_celular, t.correo, t.estudio, e.grado, e.nivel,
							t.lect_esc, t.idioma, id.nombre 
							from talento t inner join Estado_Civil est on t.estado_civil = est.cod_estcivil
							inner join Residencia re on t.residencia = re.cod_resid inner join Estudio e on t.estudio = e.cod_estudio
							inner join Idioma id on t.idioma = id.cod_Idioma  inner join Experiencia ep on t.num_dni = ep.num_dni 
							where ep.lugar_activ like @lugar_act+'%' and t.estado like '1' and ep.estado like '1'		
go

--exec sp_Talento_search_dni_ubigeo_activ_lugar_activ_org 1, '______', '',0, 0
--go


--create procedure sp_Talento_search_ubigeo
--@ubigeo char(6)
--as
--	select * from talento where ubigeo = @ubigeo  and estado like '1'

--go

--create procedure sp_Talento_search_ubigeo_dni_lugaractiv_activ
--@activ varchar(100), @lugar_act char(6), @ubigeo char(6), @dni numeric(8,0)
--as
--	if (@ubigeo = '' and @dni = 0 and @lugar_act='' and @activ = '')
--		select * from talento t inner join Ubigeo u on t.ubigeo = u.cod_ubigeo where t.estado like '1'		
--	else
--		if ( LEN(@ubigeo)= 6 and @dni = 0 and @lugar_act='' and @activ = '')
--			select * from talento t inner join Ubigeo u on t.ubigeo = u.cod_ubigeo where t.ubigeo = @ubigeo  and t.estado like '1'
--		else
--			if (@ubigeo = '' and LEN(@dni) = 8 and @lugar_act='' and @activ = '')
--				select * from talento t inner join Ubigeo u on t.ubigeo = u.cod_ubigeo where t.num_dni = @dni  and t.estado like '1'	
--			else
--				if (@ubigeo = ''  and @dni = 0 and LEN(@lugar_act) = 6 and @activ = '')
--					select * from talento t inner join Experiencia e on t.num_dni = e.num_dni inner join Ubigeo u on t.ubigeo = u.cod_ubigeo where e.lugar_activ = @lugar_act  and t.estado like '1'	
--				else
--					if (@ubigeo = ''  and @dni = 0 and @lugar_act='' and LEN(@activ) <> 0)
--						select * from Talento t inner join Experiencia e on t.num_dni = e.num_dni inner join Ubigeo u on t.ubigeo = u.cod_ubigeo where e.actividad = @activ

--go

--exec sp_Talento_search_ubigeo_dni '', 12345678
--go

-- ************** *************************************** ************* --





create procedure sp_Talento_update
@dni numeric(8,0), @apell varchar(30), @nombres varchar(20), @fecha_nac datetime,
@lugar_nac char(6), @sexo varchar(10), @est_civil int, @resid int, @dir varchar(150),
@ubigeo char(6), @fono_fijo numeric(10,0), @fono_cell numeric(12,0), @correo varchar(30),
@estudio char(2), @lect_esc varchar(20), @idioma int
as
	
	update Talento set apellidos = @apell, nombres = @nombres, fecha_nac = @fecha_nac, lugar_nac = @lugar_nac, sexo = @sexo,
					   estado_civil = @est_civil, residencia = @resid, direccion = @dir, ubigeo = @ubigeo, 
					   telefono_fijo = @fono_fijo, telefono_celular = @fono_cell, correo = @correo, estudio = @estudio,
					   lect_esc = @lect_esc, idioma = @idioma
	where num_dni = @dni

go


create procedure sp_Talento_delete
@dni numeric(8,0)
as
	update Talento set estado = '0' where num_dni = @dni

go

create procedure sp_Talento_habilitar
@dni numeric(8,0)
as
	update Talento set estado = '1' where num_dni = @dni
go

-- ************** *************************************** ************* --

-- ************** SP Experiencia ************** --

create procedure sp_Experiencia_insert
@num_dni numeric(8,0), @activ int, @duracion varchar(30), @certif varchar(50), @lugar_act char(6),
@org int, @refer varchar(100), @recon varchar(200)
as
	insert into experiencia
	values(@num_dni, @activ, @duracion, @certif, @lugar_act, @org, @refer, @recon, GETDATE(), '1');


go

--exec sp_experiencia_insert 41378300, 'Levantamiento de la información', '4 años y medio', '150130', 'Riesgos&Mercados SAC', 'Dr. César Alfonso Alvarado Morales 9845210236', ''
--go
--
--exec sp_experiencia_insert 41378300, 'Soporte técnico', 'medio año', '150130', 'Instituto Superior Tecnológico Cimas', 'Ing Carlos Castillo Vera 947856321', ''
--go
--
--exec sp_experiencia_insert 12345678, 'Crianza de cuyes', '20 años', '150135', 'Ministerio', 'Ing Mengoa Fuentes 947856321', 'Primer Puesto criador de cuyes'
--go



create procedure sp_Experiencia_read

as
	select * from Experiencia where estado like '1'

go

--exec sp_Experiencia_read
--go

--create procedure sp_Experiencia_read_actividad

--as
--	select distinct actividad from Experiencia where estado like '1' order by 1
--go


create procedure sp_Experiencia_search_dni
@num_dni numeric(8,0)
as
	select e.num 'num', e.num_dni 'dni', act.cod_activ 'cod_act', act.nombre 'actividad', e.duracion 'duracion', 
	e.certificado 'certificado', e.lugar_activ 'cod_lugar_activ', org.cod_orgatend 'cod_org',
	org.nombre 'organizacion', e.referente 'referente', e.reconocimientos 'reconocimientos',
	(u.distrito+', '+u.provincia+', '+u.departamento) 'lugar_activ' 
	from Experiencia e inner join Actividad act on e.actividad = act.cod_activ
	inner join Org_atendida org on e.organizacion_atendida = org.cod_orgatend inner join Ubigeo u on e.lugar_activ = u.cod_ubigeo
	where num_dni = @num_dni  and estado like '1'

go

--exec sp_Experiencia_search_dni 34523123
--go


--create procedure sp_Experiencia_search_lugar_actv
--@lugar_act char(6)
--as
--	select * from Experiencia where lugar_activ = @lugar_act

--go

create procedure sp_Experiencia_search_activ_lugaractv_dni_ubigeo_org
@activ int, @lugar_act char(6), @ubigeo char(6), @dni numeric(8,0), @org int
as

			if(@activ = 0 and LEN(@lugar_act) >= 0 and @ubigeo = '' and @dni = 0 and @org = 0)
				select * from Experiencia e inner join Actividad act on e.actividad = act.cod_activ 
				inner join Org_Atendida org on e.organizacion_atendida = org.cod_orgatend 
				inner join Talento t on e.num_dni = t.num_dni
				where e.lugar_activ like @lugar_act+'%' and e.estado like '1'
			else
				if(@activ <> 0 and LEN(@lugar_act) >= 0 and @ubigeo = '' and @dni = 0 and @org = 0)
					select * from Experiencia e inner join Actividad act on e.actividad = act.cod_activ 
					inner join Org_Atendida org on e.organizacion_atendida = org.cod_orgatend 
					inner join Talento t on e.num_dni = t.num_dni
					where e.actividad = @activ and e.lugar_activ like @lugar_act+'%' and e.estado like '1'
				else
					if(@activ = 0 and LEN(@lugar_act) >= 0 and @ubigeo = '' and @dni = 0 and @org <> 0)
						select * from Experiencia e inner join Actividad act on e.actividad = act.cod_activ 
						inner join Org_Atendida org on e.organizacion_atendida = org.cod_orgatend 
						inner join Talento t on e.num_dni = t.num_dni
						where e.lugar_activ like @lugar_act+'%' and e.organizacion_atendida = @org
						and e.estado like '1'
					else
						if(@activ <> 0 and LEN(@lugar_act) >= 0 and @ubigeo = '' and @dni = 0 and @org <> 0)
							select * from Experiencia e inner join Actividad act on e.actividad = act.cod_activ 
							inner join Org_Atendida org on e.organizacion_atendida = org.cod_orgatend 
							inner join Talento t on e.num_dni = t.num_dni
							where e.actividad = @activ and e.lugar_activ like @lugar_act+'%' and e.organizacion_atendida = @org
							and e.estado like '1'
						else
							if(@activ = 0 and LEN(@lugar_act) = 0 and LEN(@ubigeo) >= 0 and @dni = 0 and @org = 0)
								select * from Experiencia e inner join Actividad act on e.actividad = act.cod_activ 
								inner join Org_Atendida org on e.organizacion_atendida = org.cod_orgatend 
								inner join Talento t on e.num_dni = t.num_dni
								where t.ubigeo like @ubigeo+'%' and e.estado like '1'
							else
								if(@activ = 0 and LEN(@lugar_act) = 0 and @ubigeo = '' and LEN(@dni) = 8 and @org = 0)
								select * from Experiencia e inner join Actividad act on e.actividad = act.cod_activ 
								inner join Org_Atendida org on e.organizacion_atendida = org.cod_orgatend 
								inner join Talento t on e.num_dni = t.num_dni
								where t.num_dni = @dni and e.estado like '1'
go

--exec sp_Experiencia_search_activ_lugaractv_dni_ubigeo_org 0, '______', '',0,0
--go

--create procedure sp_Experiencia_search_lugaractv_dni_ubigeo_activ
--@activ varchar(100), @lugar_act char(6), @dni numeric(8,0), @ubigeo char(6)
--as
--	if(@lugar_act=''  and @ubigeo = '' and @dni = 0 and @activ = '')
--		select * from Experiencia e inner join Ubigeo u on e.lugar_activ = u.cod_ubigeo where e.estado like '1'
--	else
--		if(LEN(@lugar_act)=6 and @ubigeo = '' and @dni = 0 and @activ = '')
--			select * from Experiencia e inner join Ubigeo u on e.lugar_activ = u.cod_ubigeo where e.lugar_activ = @lugar_act and e.estado like '1'
--		else
--			if(@lugar_act='' and LEN(@ubigeo) = 6 and @dni = 0 and @activ = '')
--				select * from Experiencia e inner join Talento t on e.num_dni = t.num_dni inner join Ubigeo u on e.lugar_activ = u.cod_ubigeo where t.ubigeo = @ubigeo and e.estado like '1'
--			else
--				if(@lugar_act='' and @ubigeo = '' and LEN(@dni) = 8 and @activ = '')
--					select * from Experiencia e inner join Ubigeo u on e.lugar_activ = u.cod_ubigeo where e.num_dni = @dni and e.estado like '1'
--				else
--					if(@lugar_act='' and @ubigeo = '' and @dni = 0  and LEN(@activ) <> 0)
--						select * from Experiencia e inner join Talento t on e.num_dni = t.num_dni inner join Ubigeo u on e.lugar_activ = u.cod_ubigeo where e.actividad = @activ and e.estado like '1'

--go

--exec sp_Experiencia_search_lugaractv_dni_ubigeo '', 12345678, ''
--go


-- ************** *************************************** ************* --


create procedure sp_Experiencia_update
@num int, @num_dni numeric(8,0), @activ int, @duracion varchar(30), @certif varchar(50), @lugar_act char(6),
@org int, @refer varchar(100), @recon varchar(200)
as
	
	update Experiencia set actividad = @activ, duracion = @duracion, certificado = @certif, lugar_activ = @lugar_act, 
						   organizacion_atendida = @org, referente = @refer, reconocimientos = @recon
	where num_dni = @num_dni and num = @num

go

--exec sp_Experiencia_update 4, 34523123, 'Especialista en Desarrollo.', '2 años', 'Instituto Cimas',	'150101',	
--	'Instituto Cibertec',	'Ing. Carlos Molina', 'Primer puesto en el examen de certificación CCNA.'
--go


create procedure sp_Experiencia_delete
@num int, @num_dni numeric(8,0)
as
	update Experiencia set estado = '0' where num = @num and num_dni = @num_dni

go

-- ************** *************************************** ************* --
