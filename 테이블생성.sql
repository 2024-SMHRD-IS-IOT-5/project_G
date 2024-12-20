USE campus_24IS_IOT2_p2_2;
SHOW DATABASES;



CREATE TABLE t_admin
(
    `admin_id`       VARCHAR(50)    NOT NULL    COMMENT '관리자 아이디', 
    `admin_pw`       VARCHAR(50)    NOT NULL    COMMENT '관리자 비밀번호', 
    `building_name`  VARCHAR(50)    NULL        COMMENT '건물명', 
    `create_dt`      TIMESTAMP      NOT NULL    COMMENT '생성 일자', 
     PRIMARY KEY (admin_id)
);

-- 테이블 Comment 설정 SQL - t_admin
ALTER TABLE t_admin COMMENT '관리자';


-- t_kep_power Table Create SQL
-- 테이블 생성 SQL - t_kep_power
CREATE TABLE t_kep_power
(
    `power_id`     INT UNSIGNED      NOT NULL    AUTO_INCREMENT COMMENT '전력 식별자', 
    `power_meter`  DECIMAL(10, 2)    NOT NULL    COMMENT '전력 값', 
    `create_dt`    TIMESTAMP         NOT NULL    COMMENT '등록 일자', 
    `admin_id`     VARCHAR(50)       NOT NULL    COMMENT '관리자 아이디', 
     PRIMARY KEY (power_id)
);

-- 테이블 Comment 설정 SQL - t_kep_power
ALTER TABLE t_kep_power COMMENT '스마트 미터기(Korea Electric Power)';

-- Foreign Key 설정 SQL - t_kep_power(admin_id) -> t_admin(admin_id)
ALTER TABLE t_kep_power
    ADD CONSTRAINT FK_t_kep_power_admin_id_t_admin_admin_id FOREIGN KEY (admin_id)
        REFERENCES t_admin (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_kep_power(admin_id)
-- ALTER TABLE t_kep_power
-- DROP FOREIGN KEY FK_t_kep_power_admin_id_t_admin_admin_id;


-- t_re_power Table Create SQL
-- 테이블 생성 SQL - t_re_power
CREATE TABLE t_re_power
(
    `power_id`     INT UNSIGNED      NOT NULL    AUTO_INCREMENT COMMENT '재생에너지 식별자', 
    `power_type`   VARCHAR(50)       NOT NULL    COMMENT '전력 구분', 
    `power_meter`  DECIMAL(10, 2)    NOT NULL    COMMENT '전력 값', 
    `create_dt`    TIMESTAMP         NOT NULL    COMMENT '등록 일자', 
    `admin_id`     VARCHAR(50)       NOT NULL    COMMENT '관리자 아이디', 
     PRIMARY KEY (power_id)
);

-- 테이블 Comment 설정 SQL - t_re_power
ALTER TABLE t_re_power COMMENT '재생 에너지(renewable energy)';

-- Foreign Key 설정 SQL - t_re_power(admin_id) -> t_admin(admin_id)
ALTER TABLE t_re_power
    ADD CONSTRAINT FK_t_re_power_admin_id_t_admin_admin_id FOREIGN KEY (admin_id)
        REFERENCES t_admin (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_re_power(admin_id)
-- ALTER TABLE t_re_power
-- DROP FOREIGN KEY FK_t_re_power_admin_id_t_admin_admin_id;


-- t_consumption Table Create SQL
-- 테이블 생성 SQL - t_consumption
CREATE TABLE t_consumption
(
    `comp_id`     INT UNSIGNED      NOT NULL    AUTO_INCREMENT COMMENT '소비 식별자', 
    `comp_dt`     TIMESTAMP         NOT NULL    COMMENT '해당 날짜', 
    `comp_power`  DECIMAL(10, 2)    NOT NULL    COMMENT '소비 전력', 
    `admin_id`    VARCHAR(50)       NOT NULL    COMMENT '관리자 아이디', 
     PRIMARY KEY (comp_id)
);

-- 테이블 Comment 설정 SQL - t_consumption
ALTER TABLE t_consumption COMMENT '전력 소비';

-- Foreign Key 설정 SQL - t_consumption(admin_id) -> t_admin(admin_id)
ALTER TABLE t_consumption
    ADD CONSTRAINT FK_t_consumption_admin_id_t_admin_admin_id FOREIGN KEY (admin_id)
        REFERENCES t_admin (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_consumption(admin_id)
-- ALTER TABLE t_consumption
-- DROP FOREIGN KEY FK_t_consumption_admin_id_t_admin_admin_id;


-- t_weather Table Create SQL
-- 테이블 생성 SQL - t_weather
CREATE TABLE t_weather
(
    `wt_id`     INT UNSIGNED      NOT NULL    AUTO_INCREMENT COMMENT '기상 식별자', 
    `wt_temp`   DECIMAL(10, 1)    NOT NULL    COMMENT '실외 온도', 
    `wt_humid`  DECIMAL(10, 1)    NOT NULL    COMMENT '실외 습도', 
    `wt_dt`     TIMESTAMP         NOT NULL    COMMENT '등록 일자', 
    `admin_id`  VARCHAR(50)       NOT NULL    COMMENT '관리자 아이디', 
     PRIMARY KEY (wt_id)
);

-- 테이블 Comment 설정 SQL - t_weather
ALTER TABLE t_weather COMMENT '기상정보';

-- Foreign Key 설정 SQL - t_weather(admin_id) -> t_admin(admin_id)
ALTER TABLE t_weather
    ADD CONSTRAINT FK_t_weather_admin_id_t_admin_admin_id FOREIGN KEY (admin_id)
        REFERENCES t_admin (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_weather(admin_id)
-- ALTER TABLE t_weather
-- DROP FOREIGN KEY FK_t_weather_admin_id_t_admin_admin_id;


-- t_indoor_weather Table Create SQL
-- 테이블 생성 SQL - t_indoor_weather
CREATE TABLE t_indoor_weather
(
    `indoor_id`     INT UNSIGNED      NOT NULL    AUTO_INCREMENT COMMENT '온습도 식별자', 
    `indoor_floor`  INT               NOT NULL    COMMENT '층수', 
    `indoor_temp`   DECIMAL(10, 1)    NOT NULL    COMMENT '실내 온도', 
    `indoor_humid`  DECIMAL(10, 1)    NOT NULL    COMMENT '실내 습도', 
    `indoor_dt`     TIMESTAMP         NOT NULL    COMMENT '등록 일자', 
    `admin_id`      VARCHAR(50)       NOT NULL    COMMENT '관리자 아이디', 
     PRIMARY KEY (indoor_id)
);

-- 테이블 Comment 설정 SQL - t_indoor_weather
ALTER TABLE t_indoor_weather COMMENT '실내 온습도';

-- Foreign Key 설정 SQL - t_indoor_weather(admin_id) -> t_admin(admin_id)
ALTER TABLE t_indoor_weather
    ADD CONSTRAINT FK_t_indoor_weather_admin_id_t_admin_admin_id FOREIGN KEY (admin_id)
        REFERENCES t_admin (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_indoor_weather(admin_id)
-- ALTER TABLE t_indoor_weather
-- DROP FOREIGN KEY FK_t_indoor_weather_admin_id_t_admin_admin_id;


-- t_light Table Create SQL
-- 테이블 생성 SQL - t_light
CREATE TABLE t_light
(
    `light_id`   INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '조도 식별자', 
    `floor`      INT             NOT NULL    COMMENT '층수', 
    `light_in`   INT             NOT NULL    COMMENT '실내 조도', 
    `light_out`  INT             NOT NULL    COMMENT '실외 조도', 
    `create_dt`  TIMESTAMP       NOT NULL    COMMENT '등록 일자', 
    `admin_id`   VARCHAR(50)     NOT NULL    COMMENT '관리자 아이디', 
     PRIMARY KEY (light_id)
);

-- 테이블 Comment 설정 SQL - t_light
ALTER TABLE t_light COMMENT '조도';

-- Foreign Key 설정 SQL - t_light(admin_id) -> t_admin(admin_id)
ALTER TABLE t_light
    ADD CONSTRAINT FK_t_light_admin_id_t_admin_admin_id FOREIGN KEY (admin_id)
        REFERENCES t_admin (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_light(admin_id)
-- ALTER TABLE t_light
-- DROP FOREIGN KEY FK_t_light_admin_id_t_admin_admin_id;


-- t_ess Table Create SQL
-- 테이블 생성 SQL - t_ess
CREATE TABLE t_ess
(
    `ess_id`      INT UNSIGNED      NOT NULL    AUTO_INCREMENT COMMENT '저장 식별자', 
    `ess_type`    VARCHAR(10)       NOT NULL    COMMENT '전력 구분', 
    `ess_energy`  DECIMAL(10, 2)    NOT NULL    COMMENT '에너지 량', 
    `create_dt`   TIMESTAMP         NOT NULL    COMMENT '등록 일자', 
    `admin_id`    VARCHAR(50)       NOT NULL    COMMENT '관리자 아이디', 
     PRIMARY KEY (ess_id)
);

-- 테이블 Comment 설정 SQL - t_ess
ALTER TABLE t_ess COMMENT '에너지 저장 시스템';

-- Foreign Key 설정 SQL - t_ess(admin_id) -> t_admin(admin_id)
ALTER TABLE t_ess
    ADD CONSTRAINT FK_t_ess_admin_id_t_admin_admin_id FOREIGN KEY (admin_id)
        REFERENCES t_admin (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - t_ess(admin_id)
-- ALTER TABLE t_ess
-- DROP FOREIGN KEY FK_t_ess_admin_id_t_admin_admin_id;t_admin


