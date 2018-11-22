unit ConstVar;
interface
//程序的变量定义，便于集中管理。
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VCLCom, StdVcl, DBClient, DB, ADODB, variants;

const
// 进入界面的模式
  em_Browse = 1;//1。浏览，2。新增，3。编辑 4。复制记录
  em_Add = 2;
  em_Edit = 3;
  em_copy = 4;
//----------------------------------------------------------
//文件版本

  InfoStr: array[1..9] of string = (
  'ProductName',
  'ProductVersion',
  'FileDescription',
  'LegalCopyright',
  'FileVersion',
  'CompanyName',
  'LegalTradeMarks',
  'InternalName',
  'OriginalFileName'
  );

//  ENG_NULL_VALUE = 'NULL';
//---------------------
//数据挑选对话框项目定义
  v_PICK_CUST_ID          = 1 ; //选择客户编号
  v_Pick_SALES_MAN        = 2 ; //选择销售员
  v_Pick_Sales_Director   = 3 ;//选择销售主管
  v_Pick_Prod_Type        = 4; //选择产品类型
  v_Pick_Eng_Param        = 5; //选择工程参数


//选择框的传入变量
 type
  PDlgInput = record
    Fields,  //选择框的Dbgrid显示的字段信息,输入格式为'Field1/Caption1,Field2/Caption'
    KeyField,  //主键，如果为空则为'rkey'
    Sqlstr:string; //数据集的sql查询
    InPut_value : variant;    //用于定位于当前数值的记录
    AdoConn: TAdoConnection; //传入的Ado连接
  end;
  PFile_Ver_INfo = record
    ProductName,
    ProductVersion,
    FileDescription,
    LegalCopyright,
    FileVersion,
    CompanyName,
    LegalTradeMarks,
    InternalName,
    OriginalFileName:string
  end;
  

implementation

end.
