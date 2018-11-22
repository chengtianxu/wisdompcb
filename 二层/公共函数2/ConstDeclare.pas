unit ConstDeclare;
interface
//程序的变量定义，便于集中管理。
uses
  Windows, Messages, SysUtils, Classes;

const
// 进入界面的模式
  em_Browse = 1;//1。浏览，2。新增，3。编辑 4。复制记录
  em_Add = 2;
  em_Edit = 3;
  em_copy = 4;
//----------------------------------------------------------
//  ENG_NULL_VALUE = 'NULL';
//---------------------
//数据挑选对话框项目定义
  v_PICK_CUST_ID          = 1 ; //选择客户编号
  v_Pick_SALES_MAN        = 2 ; //选择销售员
  v_Pick_Sales_Director   = 3 ;//选择销售主管
  v_Pick_Prod_Type        = 4; //选择产品类型
  v_Pick_Eng_Param        = 5; //选择工程参数
  v_Pick_Qry_No           = 6;//选择查询模块编号
  v_Pick_Part_No          = 201;//材料编码
  v_Pick_Part_Type        = 202; //材料类别
  v_Pick_Supplier         = 203;//供应商
  v_Pick_Factory          = 204;//工厂
  v_Pick_Part_Group       = 205;//材料组别
  v_Pick_Employee         = 206;//员工
  v_Pick_Department       = 207;//部门
  v_Pick_WareHouse        = 208;//仓库
  v_Pick_Matrl_Type       = 209;//物品类别
  MOD_QRY          = 201 ; //查询设置模块

  qry_Order_Price               = 101;//订单价格分析
//材料查询
  qry_Matrl_receiving_List      = 202;//材料接收明细
  qry_Matrl_receiving_Sum       = 203;//材料接收汇总
  qry_Matrl_Issue_List          = 204;//材料发放明细
  qry_Matrl_Issue_Sum           = 205;//材料发放汇总
  qry_Matrl_Stock_List          = 206;//材料库存明细
  qry_Matrl_Stock_Sum           = 207;//材料库存汇总
  qry_Matrl_ReMove              = 208;//材料库存

//采购查询
  qry_Prchs_Req_Matrl_Prod      = 301;//生产物料请购
  qry_Prchs_Req_Matrl_Other     = 302;//非生产物料请购
  qry_Prchs_Matrl_Prod          = 303;//生产物料采购
  qry_Prchs_Matrl_Other         = 304;//非生产物料采购
  qry_Prchs_summarizing         = 3051;//采购汇总--采购
  qry_Prchs_Stock_summarizing   = 3052;//采购汇总--入库

  rpt_Item_Set                  = 401;//报表设置

//选择框的传入变量
 type
  DlgPickItem = record
    Fields,  //选择框的Dbgrid显示的字段信息,输入格式为'Field1/Caption1,Field2/Caption'
    KeyField,  //主键，如果为空则为'rkey'
    InPut_value : variant;    //用于定位于当前数值的记录
    vData: olevariant; //传入的数据
  end;

  PMstrDtl = record
    sqlstr: array of string;
  end;

implementation

end.

