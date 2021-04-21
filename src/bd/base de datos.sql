create table USUARIO(
    idUsuario integer not null generated always as identity (start with 1, increment by 1) primary key,
    rol integer not null,
    nickname varchar(50) not null,
    password varchar(50) not null
);

create table USUARIO_EVENTO(
    usuario integer not null,
    apellido  varchar(50) not null,
    domicilio varchar(50) not null, 
    ciudad varchar(50) not null,
    edad  integer not null,
    sexo varchar(50) not null,
    constraint fk_UsEv foreign key (usuario) references USUARIO(idUsuario),
    constraint pk_UsEv primary key(usuario)
);

create table EVENTO(
    idEvento integer not null generated always as identity (start with 1, increment by 1) primary key,
    titulo varchar(50)  not null,
    descripcion varchar(200) not null,
    fecha date not null,
    fecha_reserva date not null,
    coste_entrada integer not null,
    aforo integer not null,
    max_num_entradas integer not null,
    musica integer,
    aire_libre integer,
    deporte integer,
    teatro integer,
    gaming integer,
    constraint ck_boolean check (musica in (1,0) and aire_libre in (1,0) and deporte in (1,0) and teatro in (1,0) and gaming in (1,0))
);

create table ASIENTOS(
    fila integer not null,
    columna integer not null,
    evento integer not null,
    ocupado integer not null,
    constraint fk_asientos foreign key(evento) references EVENTO(idEvento),
    constraint pk_asientos primary key(evento, fila, columna)
);

create table EVENTO_USUARIO(
   usuario integer not null,
   idEvento integer not null,
   fila integer not null,
   columna integer not null,
   evento integer not null,
   constraint fk_EvUs1 foreign key(usuario) references USUARIO_EVENTO(usuario), 
   constraint fk_EvUs2 foreign key(idEvento) references EVENTO(idEvento),
   constraint fk_EvUs3 foreign key(evento, fila, columna) references ASIENTOS(evento, fila, columna),
   constraint pk_EvUs primary key(usuario, idEvento)
);

create table CHAT(
    idChat integer not null generated always as identity (start with 1, increment by 1) primary key,
    usuario1 integer not null,
    usuario2 integer not null,
    constraint fk_usuario1 foreign key(usuario1) references USUARIO(idUsuario),
    constraint fk_usuario2 foreign key(usuario2) references USUARIO(idUsuario) 
);


create table MENSAJE(
    chat integer not null,
    idMensaje integer not null generated always as identity (start with 1, increment by 1),
    texto varchar(200) not null,
    fecha_hora date not null,
    emisor integer not null,
    constraint fk_mensaje1 foreign key(chat) references CHAT(idChat),
    constraint fk_mensaje2 foreign key (emisor) references USUARIO(idUsuario),
    constraint pk_mensaje primary key(idMensaje, chat)
);


create table FILTRO(
    idFiltro integer not null generated always as identity (start with 1, increment by 1),
    edad_lim_inf integer,
    edad_lim_sup integer,
    sexo varchar(50),
    ciudad varchar(50),
    anyo integer,
    coste_entrada integer,
    categoria varchar(50),
    usuario integer,
    constraint pk_filtro primary key(idFiltro),
    constraint fk_filtro foreign key(usuario) references USUARIO(idUsuario)
);

