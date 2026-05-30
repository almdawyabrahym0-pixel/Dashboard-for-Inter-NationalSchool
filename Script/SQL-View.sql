CREATE VIEW V_School AS
SELECT 
    -- بيانات التقييم
    fsa.record_id,
    fsa.exam_dt AS Assessment_Date,
    fsa.assessment_kind,
    fsa.score_points,
    fsa.max_mark,
    fsa.presence_flag,
    fsa.grade_txt,
    (CAST(fsa.score_points AS FLOAT) / NULLIF(fsa.max_mark, 0)) * 100 AS Score_Percentage,
    -- بيانات الطالب
    s.student_key,
    s.full_name AS Student_Name,
    s.gender_code,
    s.admission_year,
    s.scholarship_pct,
    -- بيانات الكورس والقسم
    c.course_id,
    TRIM(c.course_title) AS Course_Title,
    c.difficulty_band,
    d.department_title,
    -- بيانات المعلم
    t.teacher_no,
    t.teacher_name,
    -- بيانات الترم والفرع
    term.term_name,
    term.acad_year,
    cam.campus_name,
    cam.zone_label
FROM fact_assessments fsa
LEFT JOIN dim_students s ON fsa.learner_id = s.student_key
LEFT JOIN dim_classes cls ON fsa.section_code = cls.class_code
LEFT JOIN dim_courses c ON cls.course_ref = c.course_id
LEFT JOIN dim_teachers t ON cls.teacher_ref = t.teacher_no
LEFT JOIN dim_departments d ON c.dept_link = d.dept_code
LEFT JOIN dim_terms term ON cls.term_ref = term.term_key
LEFT JOIN dim_campuses cam ON s.campus_id = cam.campus_ref;

select *
from V_School;
