(SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.GROUP_PTR, 
                      dbo.Data0017.MANUFACTURER_CODE, dbo.Data0017.MANUFACTURER_NAME, dbo.Data0017.CYCLE_CODE, dbo.Data0017.BATCH_SERIAL_CONTROL, dbo.Data0017.P_M, dbo.Data0017.S_B_N, 
                      dbo.Data0017.INSPECT, dbo.Data0017.STOP_PURCH, dbo.Data0017.MIX_PARTS, dbo.Data0017.PHY_COUNT_METHOD, dbo.Data0017.BOM_FLAG, dbo.Data0017.COST_METHOD, 
                      dbo.Data0017.MODIFY_ENGG_RTE_CODE, dbo.Data0017.G_L_CODE_SELL_PTR, dbo.Data0017.G_L_CODE_BUY_PTR, dbo.Data0017.ENGG_ROUTE_PTR, dbo.Data0017.NOTE_PAD_PTR, 
                      dbo.Data0017.ALTERNATE_PART_PTR, dbo.Data0017.AUTHORIZED_BUYER_PTR, dbo.Data0017.STOCK_UNIT_PTR, dbo.Data0017.PURCH_UNIT_PTR, dbo.Data0017.PREF_SUPPLIER_PTR, 
                      dbo.Data0017.STOCK_PURCH, dbo.Data0017.STOCK_QUOTE, dbo.Data0017.STOCK_SELL, dbo.Data0017.STOCK_BASE, dbo.Data0017.STD_COST, dbo.Data0017.ACTUAL_COST, 
                      dbo.Data0017.FAILURE_RATE, dbo.Data0017.SHELF_LIFE, dbo.Data0017.COUNT_INTERVAL_TRANS, dbo.Data0017.EST_SCRAP, dbo.Data0017.FIXED_SCRAP_RATE, 
                      dbo.Data0017.NEW_STD_COST, dbo.Data0017.CATALOG_NUM, dbo.Data0017.OPT_LOT_SIZE, dbo.Data0017.AVL_FLAG, dbo.Data0017.CURRENT_ACT_ACTIVITY, 
                      dbo.Data0017.CURRENT_ACT_MATERIAL, dbo.Data0017.LAST_CURNT_COST_UPDT, dbo.Data0017.LAST_STD_COST_UPDT, dbo.Data0017.ALLOW_EDIT_FLAG, 
                      dbo.Data0017.STORAGE_COND_PTR, dbo.Data0017.SHELF_LIFE_PTR, dbo.Data0017.STORG_PRECATION_PTR, dbo.Data0017.CONSIGN_ONHAND_QTY, dbo.Data0017.CONSIGN_QTY_IN_INSP, 
                      dbo.Data0017.REPORT_VALUE1, dbo.Data0017.REPORT_VALUE2, dbo.Data0017.REPORT_VALUE3, dbo.Data0017.MIN_LOT_SIZE_AUTOREL, dbo.Data0017.AUTO_RELEASE_FLAG, 
                      dbo.Data0017.AUTO_PURCHASE_FLAG, dbo.Data0017.CRITICAL_MATL_FLAG, dbo.Data0017.AUTO_RELEASE_HOLDFLG, dbo.Data0017.HOLD_BY_EMPL_PTR, dbo.Data0017.ONHOLD_DATE, 
                      dbo.Data0017.CUR_MONTH_OPEN_BAL, dbo.Data0017.CONSIGNMENT_FLAG, dbo.Data0017.ACTIVE_FLAG, dbo.Data0017.LOT_NUMBER_COUNT, dbo.Data0017.ANALYSIS_CODE1, 
                      dbo.Data0017.ANALYSIS_CODE2, dbo.Data0017.ANALYSIS_CODE3, dbo.Data0017.ANALYSIS_CODE4, dbo.Data0017.ANALYSIS_CODE5, dbo.Data0017.IES_PARAMETER_VALUE1, 
                      dbo.Data0017.IES_PARAMETER_VALUE2, dbo.Data0017.IES_PARAMETER_VALUE3, dbo.Data0017.IES_PARAMETER_VALUE4, dbo.Data0017.IES_PARAMETER_VALUE5, 
                      dbo.Data0017.IES_PARAMETER_VALUE6, dbo.Data0017.IES_PARAMETER_VALUE7, dbo.Data0017.IES_PARAMETER_VALUE8, dbo.Data0017.IES_PARAMETER_VALUE9, 
                      dbo.Data0017.IES_PARAMETER_VALUE10, dbo.Data0017.QUAN_ON_HAND, dbo.Data0017.QUAN_ASSIGN, dbo.Data0017.QUAN_ON_HAND - dbo.Data0017.QUAN_ASSIGN AS quan_alloc, 
                      dbo.Data0496.GROUP_NAME, dbo.Data0496.GROUP_DESC, dbo.Data0002.UNIT_CODE, ISNULL(z_t.zaitu, 0) AS zaitu, ISNULL(vmi.vmi_quantotal, 0) AS vmi_quantotal, 
                      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0023.SUPPLIER_NAME, Data0002_1.UNIT_CODE AS STOCK_UNIT_name, dbo.Data0496.IF_FLAG,dbo.data0496.Rkey595,dbo.data0496.rkey as rkey496
FROM         dbo.Data0017 INNER JOIN
                      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN
                      dbo.Data0002 ON dbo.Data0017.PURCH_UNIT_PTR = dbo.Data0002.RKEY left JOIN
                      dbo.Data0023 ON dbo.Data0017.PREF_SUPPLIER_PTR = dbo.Data0023.RKEY INNER JOIN
                      dbo.Data0002 AS Data0002_1 ON dbo.Data0017.STOCK_UNIT_PTR = Data0002_1.RKEY LEFT OUTER JOIN
                      dbo.Data0005 ON dbo.Data0017.AUTHORIZED_BUYER_PTR = dbo.Data0005.RKEY LEFT OUTER JOIN
                          (SELECT     dbo.Data0071.INVT_PTR, SUM(dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD) AS zaitu
                            FROM          dbo.Data0071 INNER JOIN
                                                   dbo.Data0070 AS Data0070 ON dbo.Data0071.PO_PTR = Data0070.RKEY
                            WHERE      (Data0070.STATUS = 5) AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0)
                            GROUP BY dbo.Data0071.INVT_PTR) AS z_t ON dbo.Data0017.RKEY = z_t.INVT_PTR LEFT OUTER JOIN
                          (SELECT     TOP (100) PERCENT INVENTORY_PTR, SUM(QUAN_ON_HAND) AS vmi_quantotal
                            FROM          dbo.DATA0134
                            WHERE      (QUAN_ON_HAND > 0)
                            GROUP BY INVENTORY_PTR) AS vmi ON dbo.Data0017.RKEY = vmi.INVENTORY_PTR
							)a