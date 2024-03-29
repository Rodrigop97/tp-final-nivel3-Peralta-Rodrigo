USE [CATALOGO_WEB_DB]
GO
/****** Object:  StoredProcedure [dbo].[listarPorRelevancia]    Script Date: 23/02/2024 07:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[listarPorRelevancia] as
select ARTICULOS.Id, ARTICULOS.Codigo,ARTICULOS.Nombre,ARTICULOS.Descripcion,ARTICULOS.IdMarca,
MARCAS.Descripcion as Marca,ARTICULOS.IdCategoria,CATEGORIAS.Descripcion as Categoria,ARTICULOS.ImagenUrl,ARTICULOS.Precio 
, count(FAVORITOS.IdArticulo) as Relevancia
from ARTICULOS 
join CATEGORIAS on (CATEGORIAS.Id = ARTICULOS.IdCategoria) 
join MARCAS on (MARCAS.Id = ARTICULOS.IdMarca)
left join FAVORITOS on (FAVORITOS.IdArticulo = ARTICULOS.Id)
group by ARTICULOS.Id, ARTICULOS.Codigo,ARTICULOS.Nombre,ARTICULOS.Descripcion,ARTICULOS.IdMarca,
MARCAS.Descripcion,ARTICULOS.IdCategoria,CATEGORIAS.Descripcion,ARTICULOS.ImagenUrl,ARTICULOS.Precio 
order by Relevancia desc