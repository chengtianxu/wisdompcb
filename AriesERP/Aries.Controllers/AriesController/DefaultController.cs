using Aries.Core;
using Aries.Core.Auth;
using Aries.Core.Config;
using Aries.Core.DB;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using System;
using System.Collections.Generic;
using System.Configuration;
//using System.Web.Configuration;
using Aries.Core.Helper;
using Aries.Core.Extend;

namespace Aries.Controllers
{
    /// <summary>
    /// 默认请求地址
    /// </summary>
    public partial class DefaultController : Controller
    {
        protected override MDataRow GetOne()
        {
            switch (ObjName)
            {
                case "V_Test"://处理Demo中文本数据库
                    if (AppConfig.DB.DefaultDalType == DalType.Txt)
                    {
                        return Select(GridConfig.SelectType.Show).Rows[0];
                    }
                    break;
            }
            return base.GetOne();
        }
        protected override MDataTable Select(GridConfig.SelectType st)
        {
            switch (ObjName)
            {
                case "V_Test"://处理Demo中文本数据库
                    if (AppConfig.DB.DefaultDalType == DalType.Txt)
                    {
                        MDataTable dt = null;
                        using (MAction action = new MAction("Demo_TestA"))
                        {
                            dt = action.Select();
                        }
                        dt.JoinOnName = "ID";
                        MDataTable joinDt = dt.Join("Demo_TestB", "ID");
                        return joinDt.Select(PageIndex, PageSize, GetWhere() + GetOrderBy("ID"), GridConfig.GetSelectColumns(ObjName, st));
                    }
                    break;

            }
            return base.Select(st);
        }
        //protected override void BeforeInvoke(string methodName)
        //{
        //    //CYQ.Data 已具备自动缓存功能，所以可以简化掉一些手工的缓存机制。
        //    //switch (functionName.ToLower())
        //    //{
        //    //    case "add":
        //    //    case "delete":
        //    //    case "update":
        //    //        //清缓存
        //    //        switch (ObjName)
        //    //        {
        //    //            case "Sys_Action":
        //    //                SysMenu.ActionTable = null;
        //    //                break;
        //    //            case "Sys_Menu":
        //    //                SysMenu.MenuTable = null;
        //    //                break;
        //    //        }
        //    //        break;
        //    //}
        //}
        public void Login()
        {
            string outMsg;
            bool result = UserAuth.Login(Query<string>("cpy"), Query<string>("uid"), Query<string>("pwd"), out outMsg);
            companyAuth(0,result, outMsg);//增加公司帐号验证
            //jsonResult = JsonHelper.OutResult(result, outMsg);
            if (Query<string>("iscorscookie") == "1")
            {
                jsonResult = "handleResponse(" + jsonResult + ")";
            }
        }
        
        public void ChangePassword()
        {
            bool result = UserAuth.ChangePassword(Query<string>("pwd"));
            jsonResult = JsonHelper.OutResult(result, result ? LangConst.UpdateSuccess : LangConst.UpdateError);
        }
        public void GetUserInfo()
        {
            MDataRow row = UserAuth.User;
            row.Columns.Remove("Password");//移除密码。
            row.Columns.Remove("UserInfoID");//移除重复的主建值。
            jsonResult = row.ToJson(true);//转小写（兼容oracle）
        }
        /// <summary>
        /// 用户首页呈现的菜单数据
        /// </summary>
        public void GetUserMenu()
        {
            MDataTable dt = p.UserMenu;
            if (IsUseUISite)//格式化菜单数据。
            {
                string ui = AppConfig.GetApp("UI").Trim('/');
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    MDataRow row = dt.Rows[i];
                    string url = row.Get<string>(Sys_Menu.MenuUrl).TrimStart('/');
                    if (url != "#" && !url.ToLower().StartsWith(ui.ToLower() + "/"))
                    {
                        row.Set(Sys_Menu.MenuUrl, "/" + ui + "/" + url);
                    }
                }
            }
            jsonResult = dt.ToJson(false, false, true);
        }
        /// <summary>
        /// 登录页面取公司(erp系统)列表
        /// </summary>
        public void GetCompany()
        {
            string jsonstr = "";
            List<MDataRow> RowList = new List<MDataRow>();
            int cmpLength = Convert.ToInt32(ConfigurationManager.AppSettings["cmpLength"]);
            for (int i = 1; i <= cmpLength; i++)
            {
                MDataRow MRow=new MDataRow();
                MRow.Add("value", ConfigurationManager.AppSettings.Keys[i].ToString().ToLower());
                MRow.Add("text", ConfigurationManager.AppSettings[i].ToString().ToLower());
                jsonstr+=MRow.ToJson()+",";
            }
            jsonstr = "[" + jsonstr.Substring(0, jsonstr.Length - 1).Replace("[", "\"[").Replace("]", "]\"") + "]";
            jsonResult = jsonstr;
        }
        public void companyAuth()
        {
            companyAuth(1,true, "");
        }
        public void companyAuth(byte type,bool result, string errMsg)
        {
            string userName=Query<string>("uid");
            using (MAction action = new MAction("data0073", CrossDb.GetConn("data0073")))
            {
                MDataRow row = null;
                string where=string.Format("USER_LOGIN_NAME='{0}' AND ACTIVE_FLAG=0",userName);
                if (action.Fill(where))
                {
                    row = action.Data;
                }
                if (row == null || row.Count == 0)
                {
                    result = false;
                    errMsg = LangConst.NoCompanyAuth;
                }
            }
            if (type == 1)//页面直接调用时重写Token
            {
                using (MAction action = new MAction(TableNames.Sys_User))
                {
                    string where = string.Format("Status=1 and UserName='{0}'", userName);
                    if (action.Fill(where))
                    {
                        string userID = action.Get<string>(Sys_User.UserID);
                        userName = action.Get<string>(Sys_User.UserName);
                        string fullName = action.Get<string>(Sys_User.FullName, userName);
                        string roleIDs = action.Get<string>(Sys_User.RoleIDs);
                        string token = EncrpytHelper.Encrypt(DateTime.Now.Day + "," + userID + "," + userName + "," + fullName + "," + roleIDs);
                        UserAuth.SetToken(token, userName);
                        UserAuth.WriteCookie(token, userName, "");
                    }
                    else
                    {
                        result = false;
                        errMsg = LangConst.UserNotExists;
                    }
                }
            }
            jsonResult = JsonHelper.OutResult(result, errMsg);
        }
        /// <summary>
        /// 取语言设置
        /// </summary>
        public void GetLang()
        {

            string langType = Query<string>("langType");
            string module = Query<string>("module");
            MDataTable dt;
            using (MAction action = new MAction(TableNames.Config_Language))
            {
                string where = string.Format("langType='{0}' and module='{1}'", langType, module);
                dt = action.Select(where);
                jsonResult = dt.ToJson();
            }
        }
    }
}
