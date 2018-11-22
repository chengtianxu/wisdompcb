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
    public partial class PurchaseController : Controller
    {
        public override void Add()
        {
            switch (TableName)
            {
                case "Data0023":
                    jsonResult = purchaseLogic.AddSupplier(CrossTableName, CrossDb.GetConn(ObjName));
                    break;
                case "Data0028":
                     jsonResult = purchaseLogic.AddSuppPrice(CrossTableName, CrossDb.GetConn(ObjName));
                    break;
                case "Data0017":
                    jsonResult = purchaseLogic.AddData0017(CrossTableName, CrossDb.GetConn(ObjName));
                    break;
                default:
                    base.Add();
                    break;
            }
        }

        public override void Delete()
        {
            switch (TableName)
            {
                case "Data0017":
                    jsonResult = purchaseLogic.DeleData0017(CrossTableName, CrossDb.GetConn(ObjName));
                    break;
                default:
                    base.Delete();
                    break;
            }
            
        }
        public override void Update()
        {
            switch (TableName)
            {
                case "Data0023":
                    jsonResult = purchaseLogic.UpdateSupplier(CrossTableName, CrossDb.GetConn(ObjName));
                    break;
                case "Data0028":
                   jsonResult = purchaseLogic.UpdateSuppPrice(CrossTableName, CrossDb.GetConn(ObjName));
                    break;
                case "Data0017":
                    jsonResult = purchaseLogic.UpdateData0017(CrossTableName, CrossDb.GetConn(ObjName));
                    break;
                default:
                    base.Update();
                    break;
            }
        }
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
            else if (Query<string>("isCompany") == "1")
            {
                string spName = "sp_SelectCompany";
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
                string spName = "sp_SelectCompany";
                string conn = CrossDb.GetConn(ObjName);
                dt = SelectList_SP(spName, conn);
            }
            else
            {
                dt = base.Select(st);
            }
            return dt;
        }
    }

    public partial class PurchaseController
    {
        PurchaseLogic purchaseLogic;
        public PurchaseController()
        {
            purchaseLogic = new PurchaseLogic(this);
        }
    }
}

