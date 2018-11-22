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
    public partial class pzkzController : Controller
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
            }
            else if(Query<string>("isCompany") == "1")
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
            if (st.ToString() == "Export" && ObjName.Substring(0, 3).ToLower() == "vs_")
            {
                string spName = ObjName.Substring(3);
                string conn = CrossDb.GetConn(ObjName);
                dt = Select_SP(spName, conn);
            }
            else if (Query<string>("isCompany") == "1")
            {
                string spName = "sp_selectCompany";
                string conn = CrossDb.GetConn(ObjName);
                dt = SelectList_SP(spName, conn);
            }
            else {
                dt = base.Select(st);
            }
            return dt;
        }
    }

    public partial class pzkzController
    {

    }
}
