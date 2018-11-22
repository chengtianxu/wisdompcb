unit PublicFunc;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,StrUtils,
  Dialogs, ImgList, StdCtrls, Buttons, ToolWin, DBCtrls, ComCtrls, DB, Grids,ADODB,
    DBGrids, ExtCtrls ,DBGridEh,DBCtrlsEh ,DBClient,DBGridEhImpExp;
type
  TDropDownInfo=class
  private
  protected
  public
    L_GridName               :TDBGridEh;     //添加下拉列表将创建在哪个表格名上
    L_DropdownColumn         :string;        //添加下拉列表的表格列名 //也可用于发生改变事件的字段
    L_ListDataSetName        :TClientDataSet;//下拉列表数据集名
    L_ListDataSetFilterField :string;        //拉列表数据集过滤字段名，//
    L_GetValueField          :string;        //获取值的字段名
    L_ListResultField        :string;        //下拉列表数据集返回的字段名 //当改变事件发生时，和该值进行定位
    L_FormWidth              :Integer;       //下拉窗体的宽度
    L_FormHeight             :Integer;       //下拉窗体的高度
    L_FormType               :Integer;       //下拉窗体的类型 1:单选窗口，2：多选窗口
    L_AddPickList            :array of string;//
    L_PickListResultValues   :array of string;//
    L_SourceDataSet          :TClientDataSet; //用于设置发生改变事件的数据集
    L_SourceField            :array of string;// DEPT_CODE,DEPT_NAME  改变发生后，获取值的字段
    L_ResultField            :array of string;        //DEPT_CODE,DEPT_NAME   改变发生后，从这些字段获取值
    L_FieldNotNull           :Boolean;                //如果设置为真，在L_DropdownColumn字段的值为空时，提示
//    L_FK            : string;
//    L_PK            : string;
  end;

type
  TQueryInfo=class
  private
  protected
  public
    L_ListDataSetName  :TDataSet;          //下拉列表数据集名
    L_AddPickList      :array of string;   //
    L_DropdownColumn   :string;            //添加下拉列表的字段名
    L_ListResultField  :string;            //下拉列表数据集返回的字段名     AnsiString
    L_FormWidth              :Integer;       //下拉窗体的宽度
    L_FormHeight             :Integer;       //下拉窗体的高度
  end;
  Function IsNumeric(Str:string):Boolean;
  Function IsDateTime(Str:string):Boolean;    //是有效的日期时间
  procedure MsgError(msg:string);
  var
    DropDown_Info:array of TDropDownInfo;
    Query_Info:array of TQueryInfo;
    frmFindOutSQL:string;
    FindNotDisplayFields  :array of string;
    FindDisplayFields     :array of string;
    FindFieldsName        :array of string;
    FindQueryFieldsName   :array of string;
    Find_Def_FieldName    :array of String;
    Find_Def_Oper         :array of String;
    Find_Def_FieldValue  :array of String;
    Find_Def_Field2Value  :array of String;
    FindFormHeight        :Integer;
    Find_Curr_Date:TDate;
implementation

Function IsDateTime(Str:string):Boolean;    //是有效的日期时间
var
  mDateTime: TDateTime;
begin
  Result:=False;
  if TryStrToDateTime(Str,mDateTime) then
  Result:=True;
end;

Function IsNumeric(Str:string):Boolean;
var
  i: integer;
  f: Double;
begin
  Result:=False;
  if TryStrToInt(Str,i) or TryStrToFloat(Str, f) then
    Result:=True;
end;
procedure MsgError(msg:string);
begin
  messagedlg(msg,mterror,[mbok],0);
end;
end.
