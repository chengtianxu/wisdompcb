using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Aries.Core;
using Aries.Logic;
using Aries.Core.Config;
using Aries.Core.Helper;
using Aries.Core.Auth;
using Aries.Core.DB;
using Aries.Core.Extend;


namespace Aries.Controllers
{
    public partial class HRController : Controller
    {
        /// <summary>
        /// 重写查询事件
        /// </summary>
        public override void GetList()
        {
            if (ObjName.Substring(0, 3).ToLower() == "vs_")
            {
                string spName = ObjName.Substring(3);

                string conn = CrossDb.GetConn(ObjName);
                jsonResult = Select_SP(spName, conn).ToJson(true, false, true);
            }else if (Query<string>("isCompany") == "1")
            {
                string spName = "sp_selectCompany";
                string conn = CrossDb.GetConn(ObjName);
                jsonResult = SelectList_SP(spName, conn).ToJson(true, false, true);
            }
            else
            {
                base.GetList();
            }
        }
        /// <summary>
        /// 针对导出重写查询
        /// </summary>
        /// <param name="st"></param>
        /// <returns></returns>
        protected override MDataTable Select(GridConfig.SelectType st)
        {
            MDataTable dt;
            if (st.ToString() == "Export")
            {
                if (ObjName.Substring(0, 3).ToLower() == "vs_")
                {
                    string spName = ObjName.Substring(3);
                    string conn = CrossDb.GetConn(ObjName);
                    dt = Select_SP(spName, conn);
                }
                else if (Query<string>("isCompany") == "1")
                {
                    string spName = "sp_SelectCompany";
                    string conn = CrossDb.GetConn(ObjName);
                    dt = SelectList_SP(spName, conn);
                }
                else
                {
                    dt = base.Select(st);
                }
            }
            else
            {
                dt = base.Select(st);
            }
            return dt;
         }
        /// <summary>
        /// 存储过程查询
        /// </summary>
        /// <param name="spName"></param>
        /// <param name="conn"></param>
        /// <returns></returns>
        protected MDataTable Select_SP(string spName, string conn)
        {
            MDataTable dt;
            string WhereStr = GetWhere();
            string GroupBy = Query<string>("GroupBy");
            string OrderBy = Query<string>("OrderBy");
            string ShowGroup = Query<string>("ShowGroup");
            string ShowStr = Query<string>("ShowStr");

            using (MProc proc = new MProc(spName, conn))
            {
                proc.Set("@PageIndex", PageIndex);
                proc.Set("@PageSize", PageSize);
                proc.Set("@ShowGroup", ShowGroup);
                proc.Set("@ShowStr", ShowStr);
                proc.Set("@WhereStr", WhereStr);
                proc.Set("@GroupBy", GroupBy);
                proc.Set("@OrderBy", OrderBy);
                proc.SetCustom("ReturnValue", ParaType.ReturnValue);//返回值
                dt = proc.ExeMDataTable();
                if (proc.ReturnValue > 0)
                {
                    dt.RecordsAffected = proc.ReturnValue;
                }
            }
            return dt;
        }
    }

    public partial class HRController
    {

    }
}
