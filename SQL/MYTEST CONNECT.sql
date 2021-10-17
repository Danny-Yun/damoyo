SELECT COUNT(*) FROM meet_member_list WHERE meet_member_list.m_num=2304;

ALTER TABLE meet ADD(m_join_people_cnt NUMBER DEFAULT 1);
UPDATE meet set m_join_people_cnt = (SELECT COUNT(*) FROM meet_member_list WHERE meet_member_list.m_num=meet.m_num);
ALTER TABLE meet ADD(m_profilePath VARCHAR2(200) DEFAULT NULL);
ALTER TABLE meet ADD(m_uuid VARCHAR2(100) DEFAULT NULL);
ALTER TABLE meet ADD(m_image CHAR(1) DEFAULT 'I');
DESC meet;

SELECT * FROM meet ORDER BY m_num DESC;
DELETE FROM meet WHERE m_num=2311;
DESC meet_member_list;
COMMIT;