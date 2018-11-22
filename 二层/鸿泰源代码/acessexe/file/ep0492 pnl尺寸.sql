ep0492 pnl尺寸
Select m.so_no,min(m.issue_date) issue_date,                
case when panel_a_b=0 then 'A' else 'B' END panel_a_b,                
case when panel_a_b=0 then MIN(M.PNL1_SIZE) else MIN(M.PNL2_SIZE) END PNL_SIZE,--PNL尺寸                
case when panel_a_b=0 then MIN(M.UPANEL1) else MIN(M.UPANEL2) END UPANEL , --PCS/PNL数               
SUM(Ceiling(N.QUAN_SCH/N.PARTS_PER_PANEL)) PANELS,--投产PNL数        
SUM(n.QUAN_SCH) QUAN_SCH --投产PCS数               
--INTO #data0492         
from data0492 m      
inner join Data0025 p on m.BOM_PTR=p.RKEY and p.PARENT_PTR=0    
inner join data0006 n on m.cut_no=n.cut_no                
group by m.so_no,n.panel_a_b  

SELECT pnl1_size,pnl2_size,* FROM data0492 ORDER BY rkey DESC

SELECT * FROM data0278 WHERE SPEC_RKEY ='H'

SELECT CP_REV,* FROM DATA0050 WHERE CUSTOMER_PART_NUMBER ='P1W001317'
SELECT * FROM DATA0025 WHERE ANCESTOR_PTR=2653 AND PARENT_PTR=0 --2701
SELECT * FROM DATA0278  ORDER BY RKEY DESC
INSERT INTO Data0279
(
	-- RKEY -- this column value is auto-generated
	IES_FLOW,
	IES_CRP,
	IES_COST,
	IES_PROD,
	PARAMETER_PTR,
	PARAMETER_VALUE,
	SOURCE_PTR,
	production_flag
)
SELECT 	IES_FLOW,
	IES_CRP,
	IES_COST,
	IES_PROD,
	1051,
	'520MM X 255MM',
	2701,
	production_flag FROM DATA0279 WHERE RKEY=1049
	
	SPEC_RKEY =
	H:pnl A SIZE  SELECT * from data0278 where spec_rkey='H'
	I:pnl B SIZE  SELECT * from data0278 where spec_rkey='I'
	
	6:pnl A 长度  SELECT * from data0278 where spec_rkey='6'
	7:pnl A 宽度  SELECT * from data0278 where spec_rkey='7'
	8:pnl B 长度  SELECT * from data0278 where spec_rkey='8'
	9:pnl B 宽度  SELECT * from data0278 where spec_rkey='9'
	
	SELECT data0492.BOM_PTR,pnla.PARAMETER_VALUE,pnlb.parameter_value
    FROM data0492
	LEFT JOIN (SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE data0279.PARAMETER_PTR=1050) pnla ON data0492.BOM_PTR=pnla.SOURCE_PTR 
	LEFT JOIN (SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE data0279.PARAMETER_PTR=1051) pnlb ON data0492.BOM_PTR=pnlb.SOURCE_PTR 
	

UPDATE data0492 
SET data0492.pnl1_size=	
	CASE WHEN (LTRIM(RTRIM(pnla.parameter_value))<>'') THEN pnla.PARAMETER_VALUE END,
data0492.pnl2_size=
CASE WHEN (LTRIM(RTRIM(pnlb.parameter_value))<>'') THEN pnlb.PARAMETER_VALUE END
    FROM data0492
	LEFT JOIN (SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE data0279.PARAMETER_PTR=1050) pnla ON data0492.BOM_PTR=pnla.SOURCE_PTR 
	LEFT JOIN (SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE data0279.PARAMETER_PTR=1051) pnlb ON data0492.BOM_PTR=pnlb.SOURCE_PTR 
	
	
	
	--空的还会更新
	SELECT data0492.bom_ptr,
	CASE WHEN (LTRIM(RTRIM(pnla_l.parameter_value))='') THEN '' 
	else
	pnla_l.parameter_value+'mm X '+pnla_w.parameter_value+'mm' END,
  CASE WHEN (LTRIM(RTRIM(pnlb_l.parameter_value))='') THEN '' 
	else
	pnlb_l.parameter_value+'mm X '+pnlb_w.parameter_value+'mm' end
	  FROM data0492 
	LEFT JOIN (	SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE parameter_ptr=6 ) pnla_l ON data0492.BOM_PTR=pnla_l.SOURCE_PTR
	LEFT JOIN (SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE parameter_ptr=13) pnla_w ON data0492.BOM_PTR=pnla_w.SOURCE_PTR
	LEFT JOIN (SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE parameter_ptr=15) pnlb_l ON data0492.BOM_PTR=pnlb_l.SOURCE_PTR
	LEFT JOIN (SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE parameter_ptr=16) pnlb_w ON data0492.BOM_PTR=pnlb_w.SOURCE_PTR
	
	
UPDATE data0492 
SET data0492.pnl1_size=	
	CASE WHEN (LTRIM(RTRIM(pnla_l.parameter_value))='') THEN '' 
	else
	pnla_l.parameter_value+'mm X '+pnla_w.parameter_value+'mm' END,
data0492.pnl2_size=
  CASE WHEN (LTRIM(RTRIM(pnlb_l.parameter_value))='') THEN '' 
	else
	pnlb_l.parameter_value+'mm X '+pnlb_w.parameter_value+'mm' end
  FROM data0492 
	LEFT JOIN (	SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE parameter_ptr=6 ) pnla_l ON data0492.BOM_PTR=pnla_l.SOURCE_PTR
	LEFT JOIN (SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE parameter_ptr=13) pnla_w ON data0492.BOM_PTR=pnla_w.SOURCE_PTR
	LEFT JOIN (SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE parameter_ptr=15) pnlb_l ON data0492.BOM_PTR=pnlb_l.SOURCE_PTR
	LEFT JOIN (SELECT SOURCE_PTR,parameter_value FROM data0279 WHERE parameter_ptr=16) pnlb_w ON data0492.BOM_PTR=pnlb_w.SOURCE_PTR

		
	SELECT bom_ptr,pnl1_size,pnl2_size FROM data0492