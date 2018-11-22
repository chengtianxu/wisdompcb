<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuppPrice_UpdateSuppDaysAndTax.aspx.cs" Inherits="Web.UI.Web.Purchase.SuppPrice_UpdateSuppDaysAndTax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div class="cont-box">
        <div class="cont-box-tit">
            <h3>更新供应商信息</h3>
            <a class="arrows hover"></a>
        </div>
        <div class="cont-box-in">
            <div class="cont-box-form">
                <form>                    
                    <div class="line">

                        <div class="short">
                            <label><em>*</em>更新供应商所有物料交付时间：</label>
                            <input   id="SuppDay" class='text' data-options="required:true" />
                             <a>
                            <input class="submit" type="submit" name="更新" value="" />
                        </a>      
                        </div>
                         <div class="short">
                            <label><em>*</em>更新供应商所有物料的增值税率：</label>
                            <input   id="Tax" class='text' data-options="required:true" />
                             <a>
                            <input class="submit" type="submit" name="更新" value="" />
                        </a>      
                        </div>
              </div>
                </form>
         </div>
        </div>
    </div>
</body>
</html>
