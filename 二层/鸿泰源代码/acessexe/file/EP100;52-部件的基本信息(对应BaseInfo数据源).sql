--exec EP100;52 36872,0,536
DECLARE @vptr      INT,
        @vptr1     INT,
        @vptr2     INT

SET @vptr = 36872
SET @vptr1 = 0
SET @vptr2 = 536


IF @vptr1 = 0
BEGIN
    SELECT CAST(data0010.other_req AS VARCHAR(8000)) AS cust_spec_info1,
           data0050.spec_info  AS proj_spec_info1,
           data0050.layers,
           data0025.manu_part_number,
           data0025.remark,
           data0025.eng_note,
           data0025.rkey       AS bom_ptr,
           data0025.parent_ptr,
           data0025.manu_part_desc,
           data0025.est_scrap,
           data0008.prod_code,
           data0008.product_name,
           Data0025.layer1,
           Data0025.layer2,
           data0050.CATALOG_NUMBER,
           data0050.customer_part_number,
           data0059.customer_part_desc,
           data0050.cp_rev,
           data0010.cust_code,
           data0010.customer_name,
           data0050.cp_code,
           data0050.array_size,
           data0050.vcut_B,
           data0050.vcut_T,
           data0050.vcut_X,
           data0050.gf_A,
           data0050.GF_T,
           data0050.GF_L,
           data0050.sample_nr,
           data0005.employee_name,
           data0050.LAST_MODIFIED_DATE,
           a.employee_name     AS auditor,
           data0050.audited_date,
           b.employee_name     AS checker,
           data0050.check_date,
           DATA0025.DR1_REMARK,
           DATA0025.DR2_REMARK,
           c.employee_name     AS auditor_2,
           data0050.audited_date_2,
           analysis_code_1,
           analysis_code_2,
           analysis_code_3,
           analysis_code_4,
           analysis_code_5,
           d.employee_name     AS auditor_3,
           data0050.audited_date_3,
           data0050.tax_flag,
           data0050.cl_flag,
           data0050.set_x_qty,
           data0050.set_y_qty,
           data0050.green_flag,
           data0050.ttype,
           data0050.green_desc,
           data0059.customer_matl_desc,
           data0010.abbr_name,
           Data0050.eng_tp,
           Data0050.etest_tp,
           Data0050.cnc_tp,
           Data0050.mat_tp,
           Data0050.mat_color,
           Data0050.mat_thick,
           Data0050.mat_oz,
           Data0050.mat_fact,
           Data0050.mat_other,
           data0025.press_thick_mins,
           data0025.press_thick,
           data0025.press_remark,
           data0025.press_size,
           data0025.press_tol,
           data0050.ZK_remark,
           Data0050.rspec_flag_1,
           Data0050.rspec_flag_2,
           Data0050.rspec_flag_3,
           Data0050.rspec_flag_4,
           Data0050.rspec_flag_5,
           Data0050.rspec_flag_6,
           Data0050.rspec_flag_7,
           Data0050.rspec_flag_8,
           Data0050.rspec_flag_9,
           Data0050.rspec_flag_10,
           Data0050.rspec_flag_11,
           Data0050.rspec_flag_12,
           Data0050.rspec_flag_13,
           Data0050.rspec_flag_14,
           Data0050.rspec_flag_15,
           Data0050.rspec_flag_16,
           Data0050.rspec_flag_17,
           Data0050.rspec_flag_18,
           Data0050.rspec_flag_19,
           Data0050.rspec_flag_20,
           Data0050.spec_flag_1,
           Data0050.spec_flag_2,
           Data0050.spec_flag_3,
           Data0050.spec_flag_4,
           Data0050.spec_flag_5,
           Data0050.spec_flag_6,
           Data0050.spec_flag_7,
           Data0050.spec_flag_8,
           Data0050.spec_flag_9,
           Data0050.spec_flag_10,
           Data0050.spec_flag_11,
           Data0050.spec_flag_12,
           Data0050.spec_flag_13,
           Data0050.spec_flag_14,
           Data0050.spec_flag_15,
           Data0050.spec_flag_16,
           Data0050.spec_flag_17,
           Data0050.spec_flag_18,
           Data0050.spec_flag_19,
           Data0050.spec_flag_20
    FROM   data0059,
           data0025,
           data0010,
           data0008,
           data0050
           LEFT OUTER JOIN data0005
                ON  data0050.last_modified_by_ptr = data0005.rkey
           LEFT OUTER JOIN data0005 a
                ON  data0050.audited_by_ptr = a.rkey
                AND data0050.tstatus IN (3, 4, 7, 8, 9)
           LEFT OUTER JOIN data0005 b
                ON  data0050.check_by_ptr = b.rkey
                AND data0050.tstatus IN (2, 3, 4, 6, 7, 8, 9)
           LEFT OUTER JOIN data0005 c
                ON  data0050.audited_by_ptr_2 = c.rkey
                AND data0050.tstatus IN (4, 8, 9)
           LEFT OUTER JOIN data0005 d
                ON  data0050.audited_by_ptr_3 = d.rkey
                AND data0050.tstatus IN (9)
    WHERE  data0025.rkey = @vptr
           AND data0010.rkey = @vptr2
           AND data0025.ancestor_ptr = data0050.rkey
           AND data0025.prod_code_ptr = data0008.rkey
           AND data0050.rkey = data0059.cust_part_ptr
           AND data0059.customer_ptr = @vptr2
END
ELSE
BEGIN
    DECLARE @vrkey INT	
    SELECT @vrkey = ancestor_ptr
    FROM   data0025
    WHERE  rkey = @vptr
    
    SELECT CAST(data0010.other_req AS VARCHAR(8000)) AS cust_spec_info1,
           data0050.spec_info  AS proj_spec_info1,
           data0050.layers,
           data0025.manu_part_number,
           data0025.remark,
           data0025.eng_note,
           data0025.rkey       AS bom_ptr,
           data0025.parent_ptr,
           data0025.manu_part_desc,
           data0025.est_scrap,
           data0008.prod_code,
           data0008.product_name,
           Data0025.layer1,
           Data0025.layer2,
           data0050.CATALOG_NUMBER,
           data0050.customer_part_number,
           data0059.customer_part_desc,
           data0050.cp_rev,
           data0010.cust_code,
           data0010.customer_name,
           data0050.cp_code,
           data0050.array_size,
           data0050.vcut_B,
           data0050.vcut_T,
           data0050.vcut_X,
           data0050.gf_A,
           data0050.GF_T,
           data0050.GF_L,
           data0050.sample_nr,
           data0005.employee_name,
           data0050.LAST_MODIFIED_DATE,
           a.employee_name     AS auditor,
           data0050.audited_date,
           b.employee_name     AS checker,
           data0050.check_date,
           DATA0025.DR1_REMARK,
           DATA0025.DR2_REMARK,
           c.employee_name     AS auditor_2,
           data0050.audited_date_2,
           analysis_code_1,
           analysis_code_2,
           analysis_code_3,
           analysis_code_4,
           analysis_code_5,
           d.employee_name     AS auditor_3,
           data0050.audited_date_3,
           data0050.tax_flag,
           data0050.cl_flag,
           data0050.set_x_qty,
           data0050.set_y_qty,
           data0050.green_flag,
           data0050.ttype,
           data0050.green_desc,
           data0059.customer_matl_desc,
           data0010.abbr_name,
           Data0050.eng_tp,
           Data0050.etest_tp,
           Data0050.cnc_tp,
           Data0050.mat_tp,
           Data0050.mat_color,
           Data0050.mat_thick,
           Data0050.mat_oz,
           Data0050.mat_fact,
           Data0050.mat_other,
           data0025.press_thick_mins,
           data0025.press_thick,
           data0025.press_remark,
           data0025.press_size,
           data0025.press_tol,
           data0050.ZK_remark,
           Data0050.rspec_flag_1,
           Data0050.rspec_flag_2,
           Data0050.rspec_flag_3,
           Data0050.rspec_flag_4,
           Data0050.rspec_flag_5,
           Data0050.rspec_flag_6,
           Data0050.rspec_flag_7,
           Data0050.rspec_flag_8,
           Data0050.rspec_flag_9,
           Data0050.rspec_flag_10,
           Data0050.rspec_flag_11,
           Data0050.rspec_flag_12,
           Data0050.rspec_flag_13,
           Data0050.rspec_flag_14,
           Data0050.rspec_flag_15,
           Data0050.rspec_flag_16,
           Data0050.rspec_flag_17,
           Data0050.rspec_flag_18,
           Data0050.rspec_flag_19,
           Data0050.rspec_flag_20,
           Data0050.spec_flag_1,
           Data0050.spec_flag_2,
           Data0050.spec_flag_3,
           Data0050.spec_flag_4,
           Data0050.spec_flag_5,
           Data0050.spec_flag_6,
           Data0050.spec_flag_7,
           Data0050.spec_flag_8,
           Data0050.spec_flag_9,
           Data0050.spec_flag_10,
           Data0050.spec_flag_11,
           Data0050.spec_flag_12,
           Data0050.spec_flag_13,
           Data0050.spec_flag_14,
           Data0050.spec_flag_15,
           Data0050.spec_flag_16,
           Data0050.spec_flag_17,
           Data0050.spec_flag_18,
           Data0050.spec_flag_19,
           Data0050.spec_flag_20
    FROM   data0059,
           data0025,
           data0010,
           data0008,
           data0050
           LEFT OUTER JOIN data0005
                ON  data0050.last_modified_by_ptr = data0005.rkey
           LEFT OUTER JOIN data0005 a
                ON  data0050.audited_by_ptr = a.rkey
                AND data0050.tstatus IN (3, 4, 7, 8, 9)
           LEFT OUTER JOIN data0005 b
                ON  data0050.check_by_ptr = b.rkey
                AND data0050.tstatus IN (2, 3, 4, 6, 7, 8, 9)
           LEFT OUTER JOIN data0005 c
                ON  data0050.audited_by_ptr_2 = c.rkey
                AND data0050.tstatus IN (4, 8, 9)
           LEFT OUTER JOIN data0005 d
                ON  data0050.audited_by_ptr_3 = d.rkey
                AND data0050.tstatus IN (9)
    WHERE  data0025.ANCESTOR_PTR = @vrkey
           AND data0010.rkey = @vptr2
           AND data0025.ancestor_ptr = data0050.rkey
           AND data0025.prod_code_ptr = data0008.rkey
           AND data0050.rkey = data0059.cust_part_ptr
           AND data0059.customer_ptr = @vptr2
END
