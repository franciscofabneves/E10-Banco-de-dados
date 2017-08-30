--Criando tabelas
create table livros(
    		isbn int,
    		nome varchar(150),
    		autor varchar(100),
    		editora varchar(20),
    		tema varchar(50));

create table bibliotecas(
				id int,
				nome varchar(50),
				endereço varchar(100));

create table usuarios(
    		id int,
    		nome varchar(30),
    		email varchar(20),
    		curso varchar(20));

create table exemplares(
				id int,
				idLivro int,
				idBiblioteca int,
				edicao int,
				AnoPublicacao int,
				numPaginas int);

create table emprestimos(
    		data datetime,
    		IDexemplar int,
    		IDusuario int,
    		IDbiblioteca int,
    		dataDevolucao datetime);

-- Modificando tabelas para incluir keys
alter table livros
	add constraint pk_livros primary key (isbn),
	change isbn isbn int auto_increment;

alter table bibliotecas
	add constraint pk_bibliotecas primary key (id),
	change id id int auto_increment;

alter table usuarios
	add constraint pk_usuarios primary key (id),
	change id id int auto_increment;

alter table exemplares
	add constraint pk_exemplares primary key(id),
	change id id int auto_increment,
	add constraint fk_bibliotecaDoExemplar foreign key (idBiblioteca) references bibliotecas(id),
	add constraint fk_livroDoExemplar foreign key (idLivro) references livros(isbn);
	
alter table emprestimos
	add constraint pk_emprestimos primary key(data),
	change data data timestamp null default current_timestamp;
	add constraint fk_exemplarDoEmprestimo foreign key (IDexemplar) references exemplares(id),
	add constraint fk_usuarioDoEmprestimo foreign key (IDusuario) references usuarios(id),
	add constraint fk_bibliotecaDoEmprestimo foreign key (IDbiblioteca) references bibliotecas(id);

--Populando a DB
insert into bibliotecas (nome, endereço) values ("Biblioteca Central", "Rua Centro Absoluto de Tudo, s/n");
insert into bibliotecas (nome, endereço) values ("Biblioteca Marginal", "Rua favela amigável, 17639");
insert into bibliotecas (nome, endereço) values ("Biblioteca Espacial", "Anéis de Saturno, quadrante 3, posicao 23348");
insert into bibliotecas (nome, endereço) values ("Biblioteca Secreta", "?");

insert into usuarios (nome, email, curso) values ("Francisco", "FF@N", "info");
insert into usuarios (nome, email, curso) values ("Eduardo", "E@madepino", "info");
insert into usuarios (nome, email, curso) values ("Victor", "VH@Games", "curso intensivo de youtuber");
insert into usuarios (nome, email, curso) values ("Felps", "filipin@rip", "info");
insert into usuarios (nome, email, curso) values ("Bruzzi", "turboel@lbm", "CAAD");
insert into usuarios (nome, email, curso) values ("Jemaf", "jem@f", "curso pra ser um baita professor que todo mundo ama");
insert into usuarios (nome, email, curso) values ("Virginia", "V@V", "Curso intensivo de Unity");
insert into usuarios (nome, email, curso) values ("Armando Neves", "AG@gmail", "Matemática");
insert into usuarios (nome, email, curso) values ("De Paula", "anc@Np", "como ter opiniões políticas que mudam o tempo todo");
insert into usuarios (nome, email, curso) values ("Clap", "cl@p", "Escrita criativa");

insert into livros (nome, autor, editora, tema) values ("Alma de Cristal", "Krysvera", "Casa dos Sonhos", "Guerra, depressão, coming of age");
insert into livros (nome, autor, editora, tema) values ("DAW para todos", "Jemaf", "Infamília", "Desenvolvimento de aplicações para a web");
insert into livros (nome, autor, editora, tema) values ("Nome do Vento", "Patrick Rothfuss", "Arqueiro", "Magia, vingança, folclore, coming of age");

insert into exemplares (idLivro, idBiblioteca, edicao, AnoPublicacao, numPaginas) values ("1", "1", "0", "2019", "700");
insert into exemplares (idLivro, idBiblioteca, edicao, AnoPublicacao, numPaginas) values ("1", "1", "0", "2019", "700");
insert into exemplares (idLivro, idBiblioteca, edicao, AnoPublicacao, numPaginas) values ("1", "4", "1", "2022", "674");
insert into exemplares (idLivro, idBiblioteca, edicao, AnoPublicacao, numPaginas) values ("1", "3", "0", "2019", "699");
insert into exemplares (idLivro, idBiblioteca, edicao, AnoPublicacao, numPaginas) values ("2", "1", "1", "2015", "700");
insert into exemplares (idLivro, idBiblioteca, edicao, AnoPublicacao, numPaginas) values ("2", "2", "1", "2016", "700");
insert into exemplares (idLivro, idBiblioteca, edicao, AnoPublicacao, numPaginas) values ("2", "3", "1", "2017", "700");
insert into exemplares (idLivro, idBiblioteca, edicao, AnoPublicacao, numPaginas) values ("3", "1", "1", "2006", "458");
insert into exemplares (idLivro, idBiblioteca, edicao, AnoPublicacao, numPaginas) values ("3", "2", "1", "2010", "458");
insert into exemplares (idLivro, idBiblioteca, edicao, AnoPublicacao, numPaginas) values ("3", "1", "2", "2006", "462");

insert into emprestimos (IDexemplar, IDusuario, idBiblioteca, dataDevolucao) values ("1", "1", "1", "2018-10-28 00:00:00");
insert into emprestimos (IDexemplar, IDusuario, idBiblioteca, dataDevolucao) values ("5", "2", "1", "2020-08-01 00:00:00");
insert into emprestimos (IDexemplar, IDusuario, idBiblioteca, dataDevolucao) values ("6", "3", "2", "2017-08-31 00:00:00");
insert into emprestimos (IDexemplar, IDusuario, idBiblioteca, dataDevolucao) values ("7", "4", "3", "2015-08-27 00:00:00");
insert into emprestimos (IDexemplar, IDusuario, idBiblioteca, dataDevolucao) values ("8", "5", "1", "2007-05-31 00:00:00");
insert into emprestimos (IDexemplar, IDusuario, idBiblioteca, dataDevolucao) values ("9", "6", "2", "2006-03-11 00:00:00");
insert into emprestimos (IDexemplar, IDusuario, idBiblioteca, dataDevolucao) values ("1", "7", "1", "2013-08-31 00:00:00");
insert into emprestimos (IDexemplar, IDusuario, idBiblioteca, dataDevolucao) values ("5", "8", "1", "2017-08-31 00:00:00");

--CONSULTAS

--nomes de todas as bibliotecas
select nome from bibliotecas;

--nomes de todos os alunos de info
select nome from usuarios
where curso = "info";

--Nome e autor dos livros de "Desenvolvimento de aplicações para a web"
select nome, autor from livros
where tema = "Desenvolvimento de aplicações para a web";

--Todos os exemplares publicados após 2010
select id, idLivro, AnoPublicacao from exemplares
where AnoPublicacao > 2010;

--Todos os exemplares da biblioteca Central
select id, livros.nome from exemplares
join livros on livros.isbn = exemplares.idLivro
where idBiblioteca = 1;

--Empréstimos do usuário Francisco
select data, dataDevolucao, bibliotecas.nome, livros.nome from emprestimos
join bibliotecas on emprestimos.idBiblioteca = bibliotecas.id
join exemplares on emprestimos.IDexemplar = exemplares.id
join livros on exemplares.idLivro = livros.isbn
where emprestimos.IDusuario = 1;

--Empréstimos do Francisco na Biblioteca Central
select data, dataDevolucao, bibliotecas.nome, livros.nome from emprestimos
join bibliotecas on emprestimos.idBiblioteca = bibliotecas.id
join exemplares on emprestimos.IDexemplar = exemplares.id
join livros on exemplares.idLivro = livros.isbn
where emprestimos.IDusuario = 1 AND emprestimos.IDbiblioteca = 1;

--Exemplares emprestados pelo menos uma vez
select distinct livros.nome, exemplares.id, emprestimos.data from emprestimos
join exemplares on emprestimos.IDexemplar = exemplares.idLivro
join livros on livros.isbn = exemplares.idLivro;