CREATE TABLE IF NOT EXISTS public.terco (
  id SERIAL NOT NULL,
  descricao VARCHAR(1000) NOT NULL,
  id_oracao_bolinha_pai_nosso INTEGER,
  id_oracao_bolinha_ave_maria INTEGER,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.santo (
  id SERIAL NOT NULL,
  mencao VARCHAR(1000) NOT NULL,
  resposta VARCHAR(1000) NOT NULL,
  is_favorito BOOLEAN DEFAULT FALSE,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.santo_terco (
  id SERIAL NOT NULL,
  id_terco INTEGER,
  id_santo INTEGER,
  ordem INTEGER,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.contemplacao_inicial_final (
  id SERIAL NOT NULL,
  id_terco INTEGER,
  id_oracao INTEGER,
  ordem INTEGER,
  tipo VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.oracao (
  id SERIAL NOT NULL,
  texto VARCHAR(1000) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.misterios (
  id SERIAL NOT NULL,
  id_terco INTEGER,
  id_oracao INTEGER,
  ordem INTEGER,
  misterio VARCHAR(1000) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.santo_rezado (
  id_santo INTEGER NOT NULL,
  quantidade INTEGER
);

CREATE TABLE IF NOT EXISTS public.oracao_rezada (
  id_oracao INTEGER NOT NULL,
  quantidade INTEGER
);

CREATE TABLE IF NOT EXISTS public.terco_rezado (
  id_terco INTEGER NOT NULL,
  quantidade_completo INTEGER,
  quantidade_incompleto INTEGER
);

ALTER TABLE public.santo_terco
  ADD CONSTRAINT fk_terco_santo_terco FOREIGN KEY (id_terco)
    REFERENCES public.terco(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE public.santo_terco
  ADD CONSTRAINT fk_santo_santo_terco FOREIGN KEY (id_santo)
    REFERENCES public.santo(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE public.santo_rezado
  ADD CONSTRAINT fk_santo_santo_rezado FOREIGN KEY (id_santo)
    REFERENCES public.santo(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE public.oracao_rezada
  ADD CONSTRAINT fk_oracao_oracao_rezada FOREIGN KEY (id_oracao)
    REFERENCES public.oracao(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE public.terco_rezado
  ADD CONSTRAINT fk_terco_terco_rezado FOREIGN KEY (id_terco)
    REFERENCES public.terco(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE public.misterios
  ADD CONSTRAINT fk_terco_misterios FOREIGN KEY (id_terco)
    REFERENCES public.terco(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE public.misterios
  ADD CONSTRAINT fk_oracao_misterios FOREIGN KEY (id_oracao)
    REFERENCES public.oracao(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE public.contemplacao_inicial_final
  ADD CONSTRAINT fk_oracao_contemplacao_inicial_final FOREIGN KEY (id_oracao)
    REFERENCES public.oracao(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE public.contemplacao_inicial_final
  ADD CONSTRAINT fk_terco_contemplacao_inicial_final FOREIGN KEY (id_terco)
    REFERENCES public.terco(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE public.terco
  ADD CONSTRAINT fk_oracao_pai_nosso_terco FOREIGN KEY (id_oracao_bolinha_pai_nosso)
    REFERENCES public.oracao(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE public.terco
  ADD CONSTRAINT fk_oracao_ave_maria_terco FOREIGN KEY (id_oracao_bolinha_ave_maria)
    REFERENCES public.oracao(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
