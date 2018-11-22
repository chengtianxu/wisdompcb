<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierPriceDetail.aspx.cs" Inherits="Web.UI.Web.Purchase.SupplierPriceDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
 <body>   
      <div class="cont-box">
        <div class="cont-box-tit">
            <h3>供应商价格/交货时间表</h3>&nbsp<a class="arrows hover"></a></div>
 <form  class="cont-box-form" id="form1">
        <input type="hidden" name="rkey" id="rkey" value="" />
		<table class="kv-table" id="A01"  >
			<tbody>
				<tr>
					<td class="kv-label">库存原材料</td>
					<td class="kv-label"><div style="float:left;width:90%"><b class="fluid-input"><b class="fluid-input-inner"><input class="text textread" type="text" readonly="true" name="country_name" id="Text1" />
                        <input class="text" type="text" name="country_ptr" id="Text2" style="display:none" /></b></b></div>
                        <div style="float:left"><a href="#" id="A2" dialog="V_Common_Data0017" class="searchIcon2" ></a></div>
					</td>
                    <td class="kv-label">供应商名称</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text easyui-validatebox" type="text" name="supplier_name" id="supplier_name" data-options="required:true" validtype="length[1,100]" /></b></b></td>
					<td class="kv-label">名称缩写</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text easyui-validatebox" type="text"  name="abbr_name" id="abbr_name" data-options="required:true" validtype="length[1,16]" /></b></b></td>
				</tr>
                <tr>
                    <td class="kv-label">关联公司</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text" configkey="是否" defaultitem="false"  name="brother_flag" id="brother_flag" /></b></b></td>
					<td class="kv-label">营业执照</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text"  name="EDI_ID" id="EDI_ID" /></b></b></td>
					<td class="kv-label">供应商评分</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text" value="0" name="TAX_1" id="TAX_1"  /></b></b></td>                  
				</tr>
                <tr>
                    <td class="kv-label">供应商开发人</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text"  name="developer" id="developer" /></b></b></td>
                    <td class="kv-label">上传文件</td>
					<td class="kv-label" colspan="3"><b class="fluid-input"><b class="fluid-input-inner"><input class="text textread" type="text" readonly="true"  name="" id="" /></b></b></td>
                </tr>
                <tr>
					<td class="kv-label">详细地址</td>
					<td class="kv-content" colspan="5"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text"  name="billing_address_1" id="billing_address_1" /></b></b></td>
				</tr>
                <tr>
					<td class="kv-label">州/省</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text"  name="state" id="state" /></b></b></td>
					<td class="kv-label">邮政编码</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text" name="zip" id="zip"  /></b></b></td>
					<td class="kv-label">电话号码</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text"  name="phone" id="phone" /></b></b></td>
				</tr>
                <tr>
					<td class="kv-label">传真号码</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text"  name="fax" id="fax" /></b></b></td>
					<td class="kv-label">开户银行</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text" name="telex" id="telex"  /></b></b></td>
					<td class="kv-label">银行帐户</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text"  name="gen_email_address" id="gen_email_address" /></b></b></td>
				</tr>
                <tr>
					<td class="kv-label">国家或地区</td>
					<td class="kv-label"><div style="float:left;width:90%"><b class="fluid-input"><b class="fluid-input-inner"><input class="text textread" type="text" readonly="true" name="country_name" id="country_name" />
                        <input class="text" type="text" name="country_ptr" id="country_ptr" style="display:none" /></b></b></div><div style="float:left"><a href="#" id="ShowCountry" dialog="V_Common_Data0250" class="searchIcon2" ></a></div>
					</td>
					<td class="kv-label">货币类型</td>
					<td class="kv-label"><div style="float:left;width:90%"><b class="fluid-input"><b class="fluid-input-inner"><input class="text textread" type="text" readonly="true" name="curr_name" id="curr_name"  />
                        <input class="text" type="text" name="currency_ptr" id="currency_ptr"style="display:none" /></b></b></div><div style="float:left"><a href="#" id="ShowCurrency" dialog="V_Common_Data0001" class="searchIcon2" ></a></div>
                    </td>
					<td class="kv-label">状态</td>
					<td class="kv-content"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text" configkey="有无效" defaultitem="false" name="status" id="status" /></b></b></td>
				</tr>
                <tr>
					<td class="kv-label">供应商类型</td>
					<td class="kv-content"  colspan="5"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text" configkey="供应商类型" defaultitem="false" name="ttype" id="ttype" /></b></b></td>
				</tr>
                <tr>
					<td class="kv-label">供应商无效说明</td>
					<td class="kv-content" colspan="5"><b class="fluid-input"><b class="fluid-input-inner"><input class="text" type="text"  name="invalid_explain" id="invalid_explain" /></b></b></td>
				</tr>
			</tbody>
		</table>  
             <div class="btn" style="margin-top:30px;width:100%;text-align: center">
            <a><input class="submit" type="submit" name="保存" value="" /></a>
            <a><input class="return" type="button" name="返回" value="" /></a>
        </div>   
     </form>
</div>
    </body>
</html>
