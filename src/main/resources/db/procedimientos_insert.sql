-- Procedimientos que usa PeliculaData.save() para registrar una película.
-- Faltaban en la base VideoRentTallerGrupo2DS4 (solo existían los de eliminar).
-- El orden de los parámetros debe coincidir con el que declara PeliculaData.

CREATE OR ALTER PROCEDURE dbo.Pelicula_Insert
    @pelicula_id INT OUTPUT,
    @titulo      VARCHAR(255),
    @subtitulada BIT,
    @estreno     BIT,
    @genero_id   INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.Pelicula (titulo, subtitulada, estreno, genero_id)
    VALUES (@titulo, @subtitulada, @estreno, @genero_id);
    SET @pelicula_id = SCOPE_IDENTITY();
END
GO

CREATE OR ALTER PROCEDURE dbo.PeliculaActor_Insert
    @pelicula_id INT,
    @actor_id    INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.PeliculaActor (pelicula_id, actor_id)
    VALUES (@pelicula_id, @actor_id);
END
GO
