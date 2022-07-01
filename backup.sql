--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)

-- Started on 2022-07-01 15:00:48 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 17115)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    cpf character varying(200) NOT NULL,
    telefone character varying(200),
    email character varying(200),
    data_nascimento date,
    id_endereco integer NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17114)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 222 (class 1259 OID 17151)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra (
    id integer NOT NULL,
    valor_total numeric(15,2),
    data_compra date,
    id_cliente integer NOT NULL,
    id_vendedor integer NOT NULL
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17150)
-- Name: compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_id_seq OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 221
-- Name: compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_id_seq OWNED BY public.compra.id;


--
-- TOC entry 216 (class 1259 OID 17106)
-- Name: enderecos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enderecos (
    id integer NOT NULL,
    rua character varying(200),
    bairro character varying(200),
    numero integer,
    estado character varying(200),
    uf character varying(200),
    municipio character varying(200)
);


ALTER TABLE public.enderecos OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17105)
-- Name: enderecos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enderecos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enderecos_id_seq OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 215
-- Name: enderecos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enderecos_id_seq OWNED BY public.enderecos.id;


--
-- TOC entry 214 (class 1259 OID 17079)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    codigo integer NOT NULL,
    estoque integer,
    valor_unitario numeric(15,2),
    id_setor integer NOT NULL,
    aliquota numeric(15,2),
    id_unidades_medida integer NOT NULL
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17172)
-- Name: produtos_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos_compra (
    id integer NOT NULL,
    quantidade integer,
    valor_unitario numeric(15,2),
    valor_total numeric(15,2),
    id_produtos integer NOT NULL,
    id_compra integer NOT NULL
);


ALTER TABLE public.produtos_compra OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17171)
-- Name: produtos_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_compra_id_seq OWNER TO postgres;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 223
-- Name: produtos_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_compra_id_seq OWNED BY public.produtos_compra.id;


--
-- TOC entry 213 (class 1259 OID 17078)
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_id_seq OWNER TO postgres;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 213
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- TOC entry 210 (class 1259 OID 17059)
-- Name: setores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setores (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    localizacao character varying(200)
);


ALTER TABLE public.setores OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17058)
-- Name: setores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setores_id_seq OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 209
-- Name: setores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setores_id_seq OWNED BY public.setores.id;


--
-- TOC entry 212 (class 1259 OID 17068)
-- Name: unidades_medida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidades_medida (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    abreviacao character varying(200) NOT NULL
);


ALTER TABLE public.unidades_medida OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17067)
-- Name: unidades_medida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unidades_medida_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidades_medida_id_seq OWNER TO postgres;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 211
-- Name: unidades_medida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidades_medida_id_seq OWNED BY public.unidades_medida.id;


--
-- TOC entry 220 (class 1259 OID 17133)
-- Name: vendedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendedores (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    cpf character varying(200) NOT NULL,
    telefone character varying(200),
    email character varying(200),
    data_nascimento date,
    salario numeric(15,2) NOT NULL,
    id_endereco integer NOT NULL
);


ALTER TABLE public.vendedores OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17132)
-- Name: vendedores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendedores_id_seq OWNER TO postgres;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 219
-- Name: vendedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendedores_id_seq OWNED BY public.vendedores.id;


--
-- TOC entry 227 (class 1259 OID 17260)
-- Name: vw_custo_total_produtos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_custo_total_produtos AS
 SELECT concat('R$ ', sum(produtos.valor_unitario)) AS custo_total_produtos
   FROM public.produtos;


ALTER TABLE public.vw_custo_total_produtos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17264)
-- Name: vw_media_compras; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_media_compras AS
 SELECT concat('R$ ', round(avg(compra.valor_total))) AS media_compras
   FROM public.compra;


ALTER TABLE public.vw_media_compras OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17238)
-- Name: vw_quantidade_estoque; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_quantidade_estoque AS
 SELECT sum(produtos.estoque) AS estoque
   FROM public.produtos;


ALTER TABLE public.vw_quantidade_estoque OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17256)
-- Name: vw_salario_total_empresa; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_salario_total_empresa AS
 SELECT concat('R$ ', sum(vendedores.salario)) AS salario_empresa
   FROM public.vendedores;


ALTER TABLE public.vw_salario_total_empresa OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17273)
-- Name: vw_valor_total_sergipe; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_valor_total_sergipe AS
 SELECT concat('R$ ', sum(cp.valor_total)) AS valor_total_sergipe
   FROM ((public.clientes c
     JOIN public.enderecos e ON ((c.id_endereco = e.id)))
     JOIN public.compra cp ON ((c.id = cp.id_cliente)))
  WHERE ((e.estado)::text = 'Sergipe'::text);


ALTER TABLE public.vw_valor_total_sergipe OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17268)
-- Name: vw_valor_vendido_por_rn; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_valor_vendido_por_rn AS
 SELECT concat('R$ ', sum(cp.valor_total)) AS valor_vendido_por_rn
   FROM ((public.vendedores v
     JOIN public.enderecos e ON ((v.id_endereco = e.id)))
     JOIN public.compra cp ON ((v.id = cp.id_vendedor)))
  WHERE ((e.uf)::text = 'RN'::text);


ALTER TABLE public.vw_valor_vendido_por_rn OWNER TO postgres;

--
-- TOC entry 3237 (class 2604 OID 17118)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 17154)
-- Name: compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra ALTER COLUMN id SET DEFAULT nextval('public.compra_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 17109)
-- Name: enderecos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos ALTER COLUMN id SET DEFAULT nextval('public.enderecos_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 17082)
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 17175)
-- Name: produtos_compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_compra ALTER COLUMN id SET DEFAULT nextval('public.produtos_compra_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 17062)
-- Name: setores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setores ALTER COLUMN id SET DEFAULT nextval('public.setores_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 17071)
-- Name: unidades_medida id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medida ALTER COLUMN id SET DEFAULT nextval('public.unidades_medida_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 17136)
-- Name: vendedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedores ALTER COLUMN id SET DEFAULT nextval('public.vendedores_id_seq'::regclass);


--
-- TOC entry 3437 (class 0 OID 17115)
-- Dependencies: 218
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes VALUES (1, 'Afonso Padilha dos Anjos', '102.230.129-10', '(11) 8991-9991', 'afonso@gmail.com', '1987-05-02', 1);
INSERT INTO public.clientes VALUES (2, 'Herbert Jones II', '121.211.120-10', '(55) 8865-8602', 'herb@zoom.com', '1985-01-05', 4);
INSERT INTO public.clientes VALUES (3, 'Scooby Johnson', '998.189.436-21', '(23) 9121-8814', 'scooby@amigo.com', '1984-09-30', 9);
INSERT INTO public.clientes VALUES (4, 'Marley Reis', '155.450.764-29', '(33) 9009-8775', 'marleizinhopvp@gmail.com', '1986-05-24', 10);
INSERT INTO public.clientes VALUES (5, 'Estevão Fagundes Filho', '707.789.323-33', '(71) 3210-0123', 'steve@zero.com', '1946-12-12', 2);
INSERT INTO public.clientes VALUES (6, 'Aline Isadora Pinto', '447.012.043-07', '(11) 98584-0477', 'aline-pinto77@nipbr.com', '2002-07-01', 11);
INSERT INTO public.clientes VALUES (7, 'Adriana Priscila Manuela Jesus', '122.129.562-40', '(66) 99724-8377', 'adriana_jesus@tigertimoveis.com', '1985-01-21', 12);
INSERT INTO public.clientes VALUES (8, 'Noah Thales Nathan Pereira', '894.674.749-80', '(67) 99494-7326', 'noah_pereira@macroengenharia.com', '1968-10-23', 13);
INSERT INTO public.clientes VALUES (9, 'Márcio Ricardo Carvalho', '230.169.463-19', '(69) 98863-4162', 'marcio.ricardo.carvalho@uou.com.br', '1983-02-19', 14);
INSERT INTO public.clientes VALUES (10, 'Gabriel Leandro Corte Real', '093.736.425-88', '(92) 98824-2563', 'gabriel_leandro_cortereal@kframe.com.br', '1995-04-21', 15);


--
-- TOC entry 3441 (class 0 OID 17151)
-- Dependencies: 222
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.compra VALUES (1, 150.00, '2022-06-30', 3, 5);
INSERT INTO public.compra VALUES (2, 360.00, '2022-06-28', 4, 2);
INSERT INTO public.compra VALUES (3, 200.00, '2022-06-20', 1, 3);
INSERT INTO public.compra VALUES (4, 65.00, '2022-06-20', 2, 1);
INSERT INTO public.compra VALUES (5, 130.00, '2022-06-05', 5, 4);
INSERT INTO public.compra VALUES (7, 320.00, '2022-03-10', 6, 3);
INSERT INTO public.compra VALUES (8, 250.00, '2022-03-11', 8, 4);
INSERT INTO public.compra VALUES (9, 450.00, '2022-03-13', 10, 3);
INSERT INTO public.compra VALUES (10, 300.00, '2022-04-25', 9, 1);
INSERT INTO public.compra VALUES (11, 300.00, '2022-04-28', 2, 5);
INSERT INTO public.compra VALUES (12, 100.00, '2022-05-03', 7, 2);
INSERT INTO public.compra VALUES (13, 80.00, '2022-05-09', 3, 2);
INSERT INTO public.compra VALUES (14, 180.00, '2022-05-19', 1, 2);
INSERT INTO public.compra VALUES (15, 200.00, '2022-04-22', 8, 5);
INSERT INTO public.compra VALUES (16, 80.00, '2022-04-30', 5, 1);


--
-- TOC entry 3435 (class 0 OID 17106)
-- Dependencies: 216
-- Data for Name: enderecos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.enderecos VALUES (1, 'Travessa Francisco Sales Vieira', 'Bairro Pintolândia', 210, 'Roraima', 'RR', 'Boa Vista');
INSERT INTO public.enderecos VALUES (2, 'Rua João Dias Moraes', 'Bairro Zona de Expansão (Aruana)', 196, 'Sergipe', 'SE', 'Aracaju');
INSERT INTO public.enderecos VALUES (3, 'Vila Alves', 'Bairro Quintas', 120, 'Rio Grande do Norte', 'RN', 'Natal');
INSERT INTO public.enderecos VALUES (4, 'Rua Tento', 'Bairro Distrito Industrial II', 131, 'Amazonas', 'AM', 'Manaus');
INSERT INTO public.enderecos VALUES (5, 'Beco Dois', 'Bairro Vila Nova', 98, 'Rio Grande do Sul', 'RS', 'Porto Alegre');
INSERT INTO public.enderecos VALUES (6, 'Rua João Rodrigues de Oliveira', 'Bairro Ponta Negra', 253, 'Rio Grande do Norte', 'RN', 'Natal');
INSERT INTO public.enderecos VALUES (7, 'Rua Corticeira', 'Bairro Vivenda do Bosque', 193, 'Dsitrito Federal', 'DF', 'Brasília');
INSERT INTO public.enderecos VALUES (8, 'Rua Vinte e Sete', 'Bairro Jardim Passaredo', 12, 'Mato Grosso', 'MT', 'Cuiabá');
INSERT INTO public.enderecos VALUES (9, 'Rua Belém', 'Bairro Renascer', 54, 'Minas Gerais', 'MG', 'Betim');
INSERT INTO public.enderecos VALUES (10, 'Rua José Aranda Valeriano', 'Bairro Novo Horizonte', 170, 'Alagoas', 'AL', 'Arapiraca');
INSERT INTO public.enderecos VALUES (11, 'Rua Cumbica', 'Jardim Aeroporto III', 72, 'São Paulo', 'SP', 'Mogi das Cruzes');
INSERT INTO public.enderecos VALUES (12, 'Rua dos Cambucis', 'Jardim Botânico', 286, 'Mato Grosso', 'MT', 'Sinop');
INSERT INTO public.enderecos VALUES (13, 'Rua Clóvis Cerzósimo de Souza', 'Jardim Piratininga', 61, 'Mato Grosso do Sul', 'MS', 'Dourados');
INSERT INTO public.enderecos VALUES (14, 'Rua Brilhantes', 'Balneário Arco-Íris', 785, 'Roraima', 'RO', 'Cacoal');
INSERT INTO public.enderecos VALUES (15, 'Rua Helena de Moura', 'Alvorada', 293, 'Amazonas', 'AM', 'Manaus');


--
-- TOC entry 3433 (class 0 OID 17079)
-- Dependencies: 214
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.produtos VALUES (9, 'Desinfetante Rosas 2l', 890052, 1644, 20.00, 1, 11.00, 9);
INSERT INTO public.produtos VALUES (10, 'Desodorante Aerosol 500ml', 229054, 256, 10.00, 2, 10.00, 8);
INSERT INTO public.produtos VALUES (11, 'Coxão Mole 1,5kg', 332190, 44, 50.00, 3, 22.00, 2);
INSERT INTO public.produtos VALUES (12, 'Leite Integral 1l', 332258, 201, 10.00, 4, 8.00, 9);
INSERT INTO public.produtos VALUES (13, 'Banana Prata 1kg', 62001, 26, 15.00, 5, 5.00, 2);
INSERT INTO public.produtos VALUES (14, 'Tintura Cabelo Louro Liso', 981252, 1238, 15.00, 6, 9.00, 7);
INSERT INTO public.produtos VALUES (15, 'Coca-Cola 2l', 330019, 1071, 10.00, 7, 11.00, 9);
INSERT INTO public.produtos VALUES (16, 'Piranha 2,5kg', 62503, 8, 50.00, 8, 14.00, 2);
INSERT INTO public.produtos VALUES (17, 'Biscoito Oreo Diversos Sabores 90g', 339700, 456, 5.00, 9, 10.00, 6);
INSERT INTO public.produtos VALUES (18, 'Esfiha de Goiabada com Tomate e Azeitona 200g', 62090, 4, 10.00, 10, 8.00, 1);
INSERT INTO public.produtos VALUES (19, 'Sprite Lata 350ml', 856012, 200, 4.50, 7, 11.52, 8);


--
-- TOC entry 3443 (class 0 OID 17172)
-- Dependencies: 224
-- Data for Name: produtos_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.produtos_compra VALUES (4, 3, 50.00, 150.00, 16, 1);
INSERT INTO public.produtos_compra VALUES (5, 4, 40.00, 160.00, 11, 2);
INSERT INTO public.produtos_compra VALUES (6, 6, 15.00, 90.00, 15, 2);
INSERT INTO public.produtos_compra VALUES (7, 22, 5.00, 110.00, 17, 2);
INSERT INTO public.produtos_compra VALUES (8, 5, 20.00, 100.00, 9, 3);
INSERT INTO public.produtos_compra VALUES (9, 2, 50.00, 100.00, 11, 3);
INSERT INTO public.produtos_compra VALUES (10, 1, 8.00, 8.00, 12, 4);
INSERT INTO public.produtos_compra VALUES (11, 5, 10.00, 50.00, 13, 4);
INSERT INTO public.produtos_compra VALUES (12, 1, 20.00, 20.00, 14, 5);
INSERT INTO public.produtos_compra VALUES (13, 1, 10.00, 10.00, 18, 5);
INSERT INTO public.produtos_compra VALUES (14, 2, 50.00, 100.00, 16, 5);
INSERT INTO public.produtos_compra VALUES (15, 1, 10.00, 10.00, 9, 4);
INSERT INTO public.produtos_compra VALUES (16, 4, 4.50, 18.00, 19, 7);
INSERT INTO public.produtos_compra VALUES (17, 9, 50.00, 450.00, 16, 9);
INSERT INTO public.produtos_compra VALUES (18, 4, 50.00, 200.00, 11, 8);
INSERT INTO public.produtos_compra VALUES (19, 6, 50.00, 300.00, 16, 7);
INSERT INTO public.produtos_compra VALUES (20, 10, 15.00, 150.00, 13, 10);
INSERT INTO public.produtos_compra VALUES (21, 5, 10.00, 50.00, 15, 10);
INSERT INTO public.produtos_compra VALUES (22, 5, 4.50, 50.00, 19, 8);
INSERT INTO public.produtos_compra VALUES (23, 5, 20.00, 100.00, 9, 10);
INSERT INTO public.produtos_compra VALUES (24, 30, 10.00, 300.00, 18, 11);
INSERT INTO public.produtos_compra VALUES (25, 2, 10.00, 20.00, 10, 12);
INSERT INTO public.produtos_compra VALUES (26, 3, 10.00, 30.00, 12, 12);
INSERT INTO public.produtos_compra VALUES (27, 4, 5.00, 20.00, 17, 12);
INSERT INTO public.produtos_compra VALUES (28, 1, 20.00, 20.00, 9, 12);
INSERT INTO public.produtos_compra VALUES (29, 1, 10.00, 10.00, 15, 12);


--
-- TOC entry 3429 (class 0 OID 17059)
-- Dependencies: 210
-- Data for Name: setores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.setores VALUES (1, 'Limpeza', 'Bloco E');
INSERT INTO public.setores VALUES (2, 'Higiene', 'Bloco D');
INSERT INTO public.setores VALUES (3, 'Açougue', 'Bloco B');
INSERT INTO public.setores VALUES (4, 'Laticínios', 'Bloco B');
INSERT INTO public.setores VALUES (5, 'Hortifruti', 'Bloco C');
INSERT INTO public.setores VALUES (6, 'Beleza', 'Bloco D');
INSERT INTO public.setores VALUES (7, 'Bebidas', 'Bloco C');
INSERT INTO public.setores VALUES (8, 'Pescados', 'Bloco C');
INSERT INTO public.setores VALUES (9, 'Biscoitos', 'Bloco A');
INSERT INTO public.setores VALUES (10, 'Padaria', 'Bloco A');


--
-- TOC entry 3431 (class 0 OID 17068)
-- Dependencies: 212
-- Data for Name: unidades_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.unidades_medida VALUES (1, 'Gramas', 'g');
INSERT INTO public.unidades_medida VALUES (2, 'Quilogramas', 'kg');
INSERT INTO public.unidades_medida VALUES (3, 'Centímetros', 'cm');
INSERT INTO public.unidades_medida VALUES (4, 'Metros', 'm');
INSERT INTO public.unidades_medida VALUES (5, 'Caixa com 12', 'Cx/12');
INSERT INTO public.unidades_medida VALUES (6, 'Caixa com 24', 'Cx/24');
INSERT INTO public.unidades_medida VALUES (7, 'Caixa com 6', 'Cx/6');
INSERT INTO public.unidades_medida VALUES (8, 'Mililitros', 'ml');
INSERT INTO public.unidades_medida VALUES (9, 'Litros', 'l');
INSERT INTO public.unidades_medida VALUES (10, 'Caixa com 3', 'Cx/3');


--
-- TOC entry 3439 (class 0 OID 17133)
-- Dependencies: 220
-- Data for Name: vendedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vendedores VALUES (1, 'Murilo José', '100.848.159-90', '(49) 9960-4056', 'murilojrp@dibre.com', '2004-03-24', 1250000.00, 3);
INSERT INTO public.vendedores VALUES (2, 'Péricles Farias', '121.331.570-40', '(55) 8865-8602', 'pericao@fenomeno.com', '2015-02-04', 65.00, 5);
INSERT INTO public.vendedores VALUES (3, 'Ronaldo Ribas', '998.202.223-66', '(23) 9121-8814', 'ron4ld4o@pericao.com', '2001-10-29', 23.00, 6);
INSERT INTO public.vendedores VALUES (4, 'Horácio Tyrone', '241.450.200-06', '(33) 9009-8775', 'tyrone@bruxo.com', '1990-04-25', 78.00, 7);
INSERT INTO public.vendedores VALUES (5, 'Gus Miller', '171.157.789-33', '(71) 3210-0123', 'gus@pintolandia.com', '1992-06-07', 1.50, 8);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 10, true);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 221
-- Name: compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compra_id_seq', 16, true);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 215
-- Name: enderecos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enderecos_id_seq', 15, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 223
-- Name: produtos_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_compra_id_seq', 29, true);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 213
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 19, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 209
-- Name: setores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setores_id_seq', 10, true);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 211
-- Name: unidades_medida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unidades_medida_id_seq', 10, true);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 219
-- Name: vendedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendedores_id_seq', 5, true);


--
-- TOC entry 3260 (class 2606 OID 17124)
-- Name: clientes clientes_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_key UNIQUE (cpf);


--
-- TOC entry 3262 (class 2606 OID 17126)
-- Name: clientes clientes_id_endereco_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_id_endereco_key UNIQUE (id_endereco);


--
-- TOC entry 3264 (class 2606 OID 17122)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 17156)
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 17113)
-- Name: enderecos enderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT enderecos_pkey PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 17090)
-- Name: produtos produtos_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_codigo_key UNIQUE (codigo);


--
-- TOC entry 3274 (class 2606 OID 17177)
-- Name: produtos_compra produtos_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_compra
    ADD CONSTRAINT produtos_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 17088)
-- Name: produtos produtos_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_nome_key UNIQUE (nome);


--
-- TOC entry 3256 (class 2606 OID 17086)
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 17066)
-- Name: setores setores_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setores
    ADD CONSTRAINT setores_nome_key UNIQUE (nome);


--
-- TOC entry 3244 (class 2606 OID 17064)
-- Name: setores setores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setores
    ADD CONSTRAINT setores_pkey PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 17077)
-- Name: unidades_medida unidades_medida_abreviacao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medida
    ADD CONSTRAINT unidades_medida_abreviacao_key UNIQUE (abreviacao);


--
-- TOC entry 3248 (class 2606 OID 17075)
-- Name: unidades_medida unidades_medida_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medida
    ADD CONSTRAINT unidades_medida_nome_key UNIQUE (nome);


--
-- TOC entry 3250 (class 2606 OID 17073)
-- Name: unidades_medida unidades_medida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medida
    ADD CONSTRAINT unidades_medida_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 17142)
-- Name: vendedores vendedores_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_cpf_key UNIQUE (cpf);


--
-- TOC entry 3268 (class 2606 OID 17144)
-- Name: vendedores vendedores_id_endereco_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_id_endereco_key UNIQUE (id_endereco);


--
-- TOC entry 3270 (class 2606 OID 17140)
-- Name: vendedores vendedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 17161)
-- Name: compra fk_id_cliente_to_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT fk_id_cliente_to_compra FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


--
-- TOC entry 3282 (class 2606 OID 17187)
-- Name: produtos_compra fk_id_compra_to_produtos_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_compra
    ADD CONSTRAINT fk_id_compra_to_produtos_compra FOREIGN KEY (id_compra) REFERENCES public.compra(id);


--
-- TOC entry 3277 (class 2606 OID 17127)
-- Name: clientes fk_id_endereco_to_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fk_id_endereco_to_clientes FOREIGN KEY (id_endereco) REFERENCES public.enderecos(id);


--
-- TOC entry 3278 (class 2606 OID 17145)
-- Name: vendedores fk_id_endereco_to_vendedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT fk_id_endereco_to_vendedores FOREIGN KEY (id_endereco) REFERENCES public.enderecos(id);


--
-- TOC entry 3281 (class 2606 OID 17182)
-- Name: produtos_compra fk_id_produtos_to_produtos_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_compra
    ADD CONSTRAINT fk_id_produtos_to_produtos_compra FOREIGN KEY (id_produtos) REFERENCES public.produtos(id);


--
-- TOC entry 3275 (class 2606 OID 17095)
-- Name: produtos fk_id_setor_to_produtos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT fk_id_setor_to_produtos FOREIGN KEY (id_setor) REFERENCES public.setores(id);


--
-- TOC entry 3280 (class 2606 OID 17166)
-- Name: compra fk_id_vendedor_to_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT fk_id_vendedor_to_compra FOREIGN KEY (id_vendedor) REFERENCES public.vendedores(id);


--
-- TOC entry 3276 (class 2606 OID 17100)
-- Name: produtos fk_unidades_medida_to_produtos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT fk_unidades_medida_to_produtos FOREIGN KEY (id_unidades_medida) REFERENCES public.unidades_medida(id);


-- Completed on 2022-07-01 15:00:48 -03

--
-- PostgreSQL database dump complete
--

