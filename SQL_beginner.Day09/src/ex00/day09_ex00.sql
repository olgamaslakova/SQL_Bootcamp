CREATE TABLE person_audit(
       created timestamp with time zone  DEFAULT NOW() NOT NULL,
       type_event char(1) DEFAULT 'I' NOT NULL,
       row_id bigint NOT NULL,
       name varchar,
       age integer,
       gender varchar,
       address varchar,
	   CONSTRAINT ch_type_event CHECK (type_event IN('I', 'D', 'U'))
);

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $person_audit$
    BEGIN
        INSERT INTO person_audit(row_id, name, age, gender, address)
        VALUES(new.id, new.name, new.age, new.gender, new.address);
        RETURN NULL;
    END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) 
VALUES (10,'Damir', 22, 'male', 'Irkutsk');

