using System.Collections.Generic;
using Aries.Core;
using CYQ.Data;
using CYQ.Data.Tool;
using Aries.Core.Config;
using System.Web;
using System;
using Aries.Core.Auth;

namespace Aries.Logic
{
    public partial class PurchaseLogic : LogicBase
    {
        public PurchaseLogic(IBase custom) : base(custom) { }

        #region 供应商表和供应商价格相关操作
        /// <summary>
        /// 更新记录
        /// </summary>
        /// <returns></returns>
        public string UpdateSupplier(object tableName,string Conn)
        {
            bool result = false;
            string debugInfo = "";
            string user_ptr = null;
            string d73rkey = null;
            List<Dictionary<string, string>> FormData = JsonHelper.SplitArray(HttpContext.Current.Server.HtmlDecode(Query<string>("ZYFormData")));
            List<Dictionary<string, string>> ModiData = JsonHelper.SplitArray(HttpContext.Current.Server.HtmlDecode(Query<string>("FormModiData")));
            using (MAction action = new MAction("data0073", Conn))
            {
                string where = string.Format("USER_LOGIN_NAME='{0}'", UserAuth.UserName);
                if (action.Fill(where))
                {
                    user_ptr = "" + action.Data["employee_ptr"];
                    d73rkey = "" + action.Data["rkey"];
                } 
            }
            using (MAction action = new MAction(tableName,Conn))
            {
                action.BeginTransation();
                action.Set("update_date", "getdate()");
                action.Set("user_ptr", user_ptr);
                result = action.Update(true);
                if (result)
                {
                    var supplier_ptr = action.Data.PrimaryCell.Value;
                    object ChildTable = "Data0023_15";
                    action.ResetTable(ChildTable);
                    action.Data.Clear();
                    action.Set("isSync", 0);
                    action.Update("rkey23="+supplier_ptr);

                    ChildTable="Data0024";
                    action.ResetTable(ChildTable);
                    for (int i = 0; i < FormData.Count; i++)
                    {
                        action.Data.Clear();
                        foreach (KeyValuePair<string, string> item in FormData[i])
                        {
                            action.Set(item.Key, item.Value);
                        }
                        if (string.IsNullOrEmpty(FormData[i]["rkey"]))
                        {
                            result = action.Insert(true,InsertOp.ID);//插入
                            if (!result) { break; }
                        }
                        else {
                            if (FormData[i].ContainsKey("isUIDelete") && FormData[i]["isUIDelete"]=="true")
                            {
                                result = action.Delete(); //删除
                                if (!result) { break; }
                            }
                            else
                            {
                                result = action.Update(true); //更新
                                if (!result) { break; }
                            }
                        }
                    }
                    ChildTable = "Data0318";
                    action.ResetTable(ChildTable);
                    for (int i = 0; i < ModiData.Count; i++)
                    {
                        action.Data.Clear();
                        action.Set("trans_date", "getdate()");
                        action.Set("user_ptr", d73rkey);
                        action.Set("supplier_ptr", supplier_ptr);
                        action.Set("program_source", "23");
                        foreach (KeyValuePair<string, string> item in ModiData[i])
                        {
                            action.Set(item.Key, item.Value);
                        }
                        result = action.Insert(true, InsertOp.ID);//插入
                        if (!result) { break; } 
                    }
                }
                if (!result)
                {
                    debugInfo = AppConfig.Debug.OpenDebugInfo ? action.DebugInfo : "";
                    action.RollBack();
                }
                action.EndTransation();
            }
            return JsonHelper.OutResult(result, result ? LangConst.UpdateSuccess : LangConst.UpdateError + debugInfo);
        }


        /// <summary>
        /// 新增记录
        /// </summary>
        /// <returns></returns>
        public string AddSupplier(object tableName, string Conn)
        {
            bool result = false;
            string debugInfo = "";
            string msg = "";
            List<Dictionary<string, string>> FormData = JsonHelper.SplitArray(HttpContext.Current.Server.HtmlDecode(Query<string>("ZYFormData")));
            using (MAction action = new MAction(tableName,Conn))
            {
                action.BeginTransation();
                action.Set("suppier_ent_date", DateTime.Now.ToString("yyyy-MM-dd"));
                result=action.Insert(true, InsertOp.ID);
                if (result)
                {
                    msg = action.Get<string>(action.Data.PrimaryCell.ColumnName);
                    object ChildTable = "Data0024";
                    action.ResetTable(ChildTable);
                    for (int i = 0; i < FormData.Count; i++)
                    {
                        action.Data.Clear();
                        foreach (KeyValuePair<string, string> item in FormData[i])
                        {
                            action.Set(item.Key, item.Value);
                        }
                        action.Set("supplier_ptr", msg);//主表键值
                        result = action.Insert(true, InsertOp.ID);//插入 
                    }
                }
                if (!result)
                {
                    debugInfo = AppConfig.Debug.OpenDebugInfo ? action.DebugInfo : "";
                    action.RollBack();
                }
                action.EndTransation();
            }
            return JsonHelper.OutResult(result, result ? msg : LangConst.UpdateError + debugInfo);
        }
        #endregion
        #region 供应商价格相关操作
        public string UpdateSuppPrice(object tableName, string Conn)
        {

            bool result = false;
            string debugInfo = "";
            string rkey05 = null;
            string rkey73 = null;
            // List<Dictionary<string, string>> FormData = JsonHelper.SplitArray(HttpContext.Current.Server.HtmlDecode(Query<string>("ZYFormData")));
            List<Dictionary<string, string>> ModiData = JsonHelper.SplitArray(HttpContext.Current.Server.HtmlDecode(Query<string>("FormModiData")));
            using (MAction action = new MAction("Data0073", Conn))
            {
                string where = string.Format("USER_LOGIN_NAME='{0}'", UserAuth.UserName);
                if (action.Fill(where))
                {
                    rkey05 = "" + action.Data["employee_ptr"];
                    rkey73 = "" + action.Data["rkey"];
                }
            }

            using (MAction action = new MAction(tableName, Conn))
            {
                action.BeginTransation();
               // action.Set("update_date", "getdate()"); //最后更新日期
                action.Set("EMPLOYEE_PTR", rkey05);//最后保存人ID
                action.Set("CSI_USER_PTR", rkey73); //系统用户ID
                //  action.Set("EDI_OUT_FORCST", rkey73); //最后认可用户ID

                result = action.Update(true);
                if (result)
                {
                    var rkey28 = action.Data.PrimaryCell.Value;
                    object ChildTable = "Data0028_15";
                    action.ResetTable(ChildTable);
                    action.Data.Clear();
                    action.Set("isSync", 0);
                    action.Update("rkey28=" + rkey28);

                    ChildTable = "Data0328";
                    action.ResetTable(ChildTable);
                    for (int i = 0; i < ModiData.Count; i++)
                    {
                        action.Data.Clear();
                        action.Set("sys_longdate", "getdate()");
                        action.Set("user_ptr", rkey73);
                        action.Set("price_ptr", rkey28);
                        foreach (KeyValuePair<string, string> item in ModiData[i])
                        {
                            action.Set(item.Key, item.Value);
                        }
                        result = action.Insert(true, InsertOp.ID);//插入
                        if (!result) { break; }
                    }
                }
                if (!result)
                {
                    debugInfo = AppConfig.Debug.OpenDebugInfo ? action.DebugInfo : "";
                    action.RollBack();
                }
                action.EndTransation();
            }
            return JsonHelper.OutResult(result, result ? LangConst.UpdateSuccess : LangConst.UpdateError + debugInfo);
        }

        public string AddSuppPrice(object tableName, string Conn)
        {
            bool result = false;
            string debugInfo = "";
            string msg = "";
            string rkey05 = null;
            string rkey73 = null;
            //List<Dictionary<string, string>> FileFormData = JsonHelper.SplitArray(HttpContext.Current.Server.HtmlDecode(Query<string>("FileFormData")));
            using (MAction action = new MAction("data0073", Conn))
            {
                string where = string.Format("USER_LOGIN_NAME='{0}'", UserAuth.UserName);
                if (action.Fill(where))
                {
                    rkey05 = "" + action.Data["employee_ptr"];
                    rkey73 = "" + action.Data["rkey"];
                }
            }

            using (MAction action = new MAction(tableName, Conn))
            {
                action.BeginTransation();
                action.Set("TDATE", DateTime.Now.ToString("yyyy-MM-dd"));
               // action.Set("update_date", "getdate()"); //最后更新日期
                action.Set("EMPLOYEE_PTR", rkey05);//最后保存人ID
                action.Set("CSI_USER_PTR", rkey73); //系统用户ID
                action.Set("EDI_OUT_FORCST", 0);//EDI_OUT_FORCST

                // action.Set("TAX_1", 0);   //默认值
                action.Set("PRICE_2", 0);   //默认值
                action.Set("PRICE_3", 0);   //默认值
                action.Set("PRICE_4", 0);   //默认值
                action.Set("PRICE_5", 0);   //默认值
                action.Set("PRICE_6", 0);   //默认值
                action.Set("QUAN_VOL_1", 0);   //默认值
                action.Set("QUAN_VOL_2", 0);   //默认值
                action.Set("QUAN_VOL_3", 0);   //默认值
                action.Set("QUAN_VOL_4", 0);   //默认值
                action.Set("QUAN_VOL_5", 0);   //默认值
                action.Set("DISC_1", 0);   //默认值
                action.Set("DISC_2", 0);   //默认值
                action.Set("DISC_3", 0);   //默认值
                action.Set("DISC_4", 0);   //默认值
                action.Set("DISC_5", 0);   //默认值
                action.Set("DISC_6", 0);   //默认值
                action.Set("TAX_3", 0);   //默认值
                action.Set("TAX_4", 0);   //默认值
                action.Set("prot_report_ptr", 0); //prot_report_ptr
                action.Set("QUAN_VOL_1", 0);
         
                if (string.IsNullOrEmpty(action.Get<string>("MIN_ORDER_AMT")))
                {
                    action.Set("MIN_ORDER_AMT", 0);
                }
                //if (string.IsNullOrEmpty(action.Get<string>("MIN_ORDER_QTY")))
                //{
                //    action.Set("MIN_ORDER_QTY", 0);
                //}
                

                result = action.Insert(true, InsertOp.ID);

                //data0028_FileList  //todo

                //if (result)
                //{
                //    msg = action.Get<string>(action.Data.PrimaryCell.ColumnName);
                //    object ChildTable = "data0028_FileList";
                //    action.ResetTable(ChildTable);
                //    for (int i = 0; i < FormData.Count; i++)
                //    {
                //        action.Data.Clear();
                //        foreach (KeyValuePair<string, string> item in FormData[i])
                //        {
                //            action.Set(item.Key, item.Value);
                //        }
                //        action.Set("rkey28", msg);//主表键值
                //        result = action.Insert(true, InsertOp.ID);//插入 
                //    }
                //}
                if (!result)
                {
                    debugInfo = AppConfig.Debug.OpenDebugInfo ? action.DebugInfo : "";
                    action.RollBack();
                }
                action.EndTransation();
            }
            return JsonHelper.OutResult(result, result ? msg : LangConst.UpdateError + debugInfo);
        }
        #endregion
        #region 材料编码定义相关操作
        public string UpdateData0017(object tableName, string Conn)
        {
            bool result = false;
            string debugInfo = "";
            string msg = "";
            using (MAction action = new MAction(tableName, Conn))
            {
                action.BeginTransation();
                result = action.Update(true);
                if (!result)
                {
                    debugInfo = AppConfig.Debug.OpenDebugInfo ? action.DebugInfo : "";
                    action.RollBack();
                }
                action.EndTransation();
            }
            return JsonHelper.OutResult(result, result ? msg : LangConst.UpdateError + debugInfo);
        }

        public string AddData0017(object tableName, string Conn)
        {
            bool result = false;
            string debugInfo = "";
            string msg = "";
            using (MAction action = new MAction(tableName, Conn))
            {
                //            dm.AQ17 CRITICAL_MATL_FLAG.Value := 0;  //ÖØÒª²ÄÁÏ
                //            dm.AQ17 STOP_PURCH.Value := 'N';       //Í£Ö¹²É¹º÷òÎªÎªN
                //            dm.AQ17 AVL_FLAG.Value := 'N';         //²ÄÁÏÐèÒªÈÏ¿É¹©Ó¦ÉÌ
                //            dm.AQ17 AUTO_PURCHASE_FLAG.Value := 0;  //×Ô¶¯²É¹º
                //            dm.AQ17 INSPECT.Value := 'N';          //¼ì²é
                //            dm.AQ17 MIX_PARTS.Value := 'N';        //ÔÊÐí»ìºÏ²¿¼þ
                //            if dm.AQ17 STOCK_UNIT_PTR.Value = dm.AQ17 PURCH_UNIT_PTR.Value then
                //  dm.AQ17 STOCK_PURCH.Value := 1
                //else
                //  dm.AQ17STOCK_PURCH.Value := 0;


                //AUTO_PURCHASE_FLAG
                action.Set("CRITICAL_MATL_FLAG", 0);
                
                if (this.Query<string>("AVL_FLAG") =="")
                {
                    action.Set("AVL_FLAG", "N");
                }
                if (this.Query<string>("CATALOG_NUM") == "")
                {
                    action.Set("CATALOG_NUM", "N");
                }
                if (this.Query<string>("STOP_PURCH") == "")
                {
                    action.Set("STOP_PURCH", "N");
                }
                //action.Set("AVL_FLAG", 0);
                action.Set("AUTO_PURCHASE_FLAG", 0);
                //action.Set("INSPECT", 0);
                action.Set("MIX_PARTS", 0);
                if (this.Query<string>("STOCK_UNIT_PTR") == this.Query<string>("PURCH_UNIT_PTR"))
                {
                    action.Set("STOCK_PURCH", "Y");
                }
                else
                {
                    action.Set("STOCK_PURCH", "N");
                }

                action.Data.Remove("INV_PART_DESCRIPTION");
                action.BeginTransation();
                result = action.Insert(true, InsertOp.ID);
                if (!result)
                {
                    debugInfo = AppConfig.Debug.OpenDebugInfo ? action.DebugInfo : "";
                    action.RollBack();
                }
                action.EndTransation();
            }
            return JsonHelper.OutResult(result, result ? msg : LangConst.UpdateError + debugInfo);
        }
       
        public string DeleData0017(object tableName, string Conn)
        {
            using (MAction action = new MAction("data0011", Conn))
            {
                string rkey17 = GetID;
                bool result = false;
                action.BeginTransation();
                while (true)
                {
                    action.Delete("source_type=17 and file_pointer=" + rkey17);
                    action.ResetTable("data0018");
                    action.Delete("invent_ptr=" + rkey17);
                    action.ResetTable("data0017_15");
                    action.Delete("rkey17=" + rkey17);
                    action.ResetTable("data0017");
                    if (!action.Delete("rkey=" + rkey17)) break;
                    result = true;
                    break;
                }
                if (!result)
                {
                    action.RollBack();
                }
                action.EndTransation();

                return JsonHelper.OutResult(result, result ? "操作成功" : "此材料编码已使用,不能删除,操作失败...");

            }
        }

        #endregion
    }
}
