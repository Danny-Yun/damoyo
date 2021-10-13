INSERT INTO meet_plan(m_plan_num, m_plan_name, m_plan_people_cnt, m_plan_startdate, m_plan_money, m_plan_area, m_num)
VALUES(MEET_PLAN_SEQ.nextval);

SELECT * FROM meet_plan WHERE m_num=16;
SELECT m_plan_startdate + (1/24) FROM meet_plan;

SELECT * FROM USER_SCHEDULER_JOBS;

-- 스케줄러 실행_매일 0시 변수 curDate
-- 테이블에 있는 정모 날짜와 비교하여 지났을 경우 삭제 실행

-- 프로시저
CREATE PROCEDURE auto_delete_plan AS
DECLARE
    curDate := SYSDATE;
BEGIN
    IF curDate >= (SELECT m_plan_startdate FROM meet_plan) THEN
        DELETE meet_plan WHERE m_plan_startdate=m_plan_startdate + (1/24);
    ELSE
        SELECT * FROM meet_plan;
    END IF;
END;
-- 스케줄러 (