unit UQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Menus, ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls;

type
  TfrmQry = class(TForm)
    pnl1: TPanel;
    grp1: TGroupBox;
    lbl_field: TLabel;
    edt_Value: TEdit;
    btn_add: TButton;
    lst_fields: TListBox;
    txt1: TStaticText;
    btn_del: TButton;
    cbb1: TComboBox;
    txt2: TStaticText;
    sg1: TStringGrid;
    rg_condi: TRadioGroup;
    btn_OK: TButton;
    btn_cancel: TButton;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    qry_temp: TADOQuery;
    btn_Search: TBitBtn;
    lbl3: TLabel;
    dtp3: TDateTimePicker;
    lbl4: TLabel;
    dtp4: TDateTimePicker;
    procedure lst_fieldsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);

  private
    { Private declarations }
    v_Field_List_CN,v_Field_List_EN:Variant;
    procedure  updateSG(sgrid_row: integer);
  public
    { Public declarations }
  end;

var
  frmQry: TfrmQry;

implementation

uses UDM,Pick_Item_Single,ConstVar,common;

{$R *.dfm}

procedure TfrmQry.lst_fieldsClick(Sender: TObject);
var
  Lsql:string;
begin
 lbl_field.Caption:=' '+lst_fields.Items[lst_fields.itemindex]+':  ';
  edt_Value.Text:='';


     btn_Search.Visible:=false;
      edt_Value.Visible:=false;
      lbl_field.visible:=false;
      rg_condi.Visible:=false;
      cbb1.Visible:=false;


  if lst_fields.ItemIndex in [0,7,8] then    // edit
  begin
      edt_Value.Visible:=true;
      lbl_field.visible:=true;
  end;
 
  if lst_fields.ItemIndex in  [1,2,3,4,5] then    // 有选择窗口
  begin
    btn_Search.Visible:=true;
    edt_Value.Visible:=true;
    lbl_field.visible:=true;
  end;

    
   if lst_fields.ItemIndex=6  then    //cbb
   begin
     cbb1.Items.Clear;
     cbb1.Items.AddObject('维修', Tobject(2));
     cbb1.Items.AddObject('维护', Tobject(3));
     cbb1.Items.AddObject('工程', Tobject(4));
     cbb1.Items.AddObject('公用', Tobject(5));

     cbb1.Visible:=true;

   end;


end;

procedure TfrmQry.FormShow(Sender: TObject);
var i:integer;
ssql: string;
begin
 try
  lst_fields.Items.Clear;
  v_Field_List_CN := VarArrayOf(['领料单号','申领员工名称','设备所在部门名称','审核人员名称','工厂简称','设备责任小组','类型','维修单号'  ,'空调事业部工作单号' ]);
  v_Field_List_EN := VarArrayOf(['data0268.number','data0005.EMPLOYEE_NAME','data034.DEPT_NAME',
    'Data0005_1.EMPLOYEE_NAME','Data0015.ABBR_NAME','data0840.Location','data0268.ttype','data0567.NUMBER','data0835.WorkOrder'
  ]) ;

  for i:= VarArrayLowBound(v_Field_List_CN,1)
  to VarArrayHighBound(v_Field_List_CN,1) do
    lst_fields.Items.Add(v_Field_List_CN[i]);
  sg1.Cells[0,0]:='条件名';
  sg1.Cells[1,0]:='条件值';
  lst_fields.ItemIndex := 0;

   lbl_field.visible:=true;
   edt_value.visible:=true;
   rg_condi.Visible:=true;
   btn_Search.Visible:=false;

   dtp3.date:=IncMonth(common.getsystem_date(dm.qrytemp,0),-1);
   dtp4.Date:=common.getsystem_date(dm.qrytemp,0)+1;
   except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
  end;
end;

procedure TfrmQry.btn_SearchClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    if lst_fields.ItemIndex=2 then //设备所在部门
    begin
      InputVar.Fields := 'Dept_code/部门编号/100,dept_name/部门名称/150';
      InputVar.Sqlstr :=' select RKEY,DEPT_CODE,DEPT_NAME from data0034 '+
                      ' where (ttype in (4,1) or is_cost_dept=1)and (ACTIVE_FLAG=0)'+
                      ' and RKEY in (select DEPT_PTR from data0417 )';
    end else if lst_fields.ItemIndex in [1,3] then begin //申领员工姓名：
      InputVar.Fields := 'EMPL_CODE/员工代码/200,EMPLOYEE_NAME/员工姓名/200';
      InputVar.Sqlstr := 'select EMPL_CODE,EMPLOYEE_NAME from data0005 ';
    end else if lst_fields.ItemIndex =4  then begin //工厂名
      InputVar.Fields := 'warehouse_CODE/工厂代码/100,ABBR_NAME/工厂简称/100,warehouse_NAME/工厂名称/200';
      InputVar.Sqlstr := 'select warehouse_CODE,ABBR_NAME,warehouse_NAME from data0015';
    end;

    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;

    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if lst_fields.ItemIndex=1 then
        edt_Value.Text := frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']
      else if lst_fields.ItemIndex=3 then
        edt_Value.Text := frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']
      else if lst_fields.ItemIndex=2 then
        edt_Value.Text := frmPick_Item_Single.adsPick.FieldValues['dept_name']
      else if lst_fields.ItemIndex=4 then
        edt_Value.Text := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];      
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmQry.btn_addClick(Sender: TObject);
var
  i:integer;
begin
  for i:=1 to sg1.RowCount-2 do
     if (sg1.Cells[0,i]=lst_fields.Items[lst_fields.ItemIndex]) and
        (sg1.Cells[1,i]<>lst_fields.Items[lst_fields.ItemIndex]) then
         begin
         updateSG(i);
         exit;
         end;
  sg1.Cells[0,sg1.RowCount-1]:=lst_fields.Items[lst_fields.itemindex];
  updateSG(sg1.RowCount-1);

  sg1.RowCount :=sg1.RowCount +1;
end;

procedure  TFrmQry.updateSG(sgrid_row: integer);
begin
  sg1.Cells[0,sgrid_row]:=lst_fields.Items[lst_fields.itemindex];
  case lst_fields.ItemIndex of
  0:  //申领单号
  begin
        sg1.Cells[1,sgrid_row]:=trim(edt_Value.Text);
        case rg_condi.ItemIndex of
        0:sg1.Cells[2,sgrid_row]:='and data0268.number = '''+trim(edt_Value.Text)+'''';
        1:sg1.Cells[2,sgrid_row]:='and data0268.number like ''%'+trim(edt_Value.Text)+'%''';
        end;
    end;
  1: // 申领人员名称
  begin
        sg1.Cells[1,sgrid_row]:=trim(edt_Value.Text);
        case rg_condi.ItemIndex of
        0:sg1.Cells[2,sgrid_row]:='and data0005.EMPLOYEE_NAME = '''+trim(edt_Value.Text)+'''';
        1:sg1.Cells[2,sgrid_row]:='and data0005.EMPLOYEE_NAME like ''%'+trim(edt_Value.Text)+'%''';
        end;
  end;
  2:  // 设备所在部门
  begin
    sg1.Cells[1,sgrid_row]:=trim(edt_Value.text);
    sg1.Cells[2,sgrid_row]:='and data0034.DEPT_NAME = '''+trim(edt_Value.text)+''' ';
  end;
//  3:   // 申请日期
//  begin
//    sg1.Cells[1,sgrid_row]:=trim(cbb1.Text);
//    sg1.Cells[2,sgrid_row]:=' and convert(char(10),'+v_Field_List_EN[lst_fields.ItemIndex]+',120)>='''+DatetoStr(dtp1.Date)+''' and convert(char(10),'+v_Field_List_EN[lst_fields.ItemIndex]+',120)<='''+DatetoStr(dtp2.Date)+'''';
//  end;
  3:  // 审核人员名称
  begin
    sg1.Cells[1,sgrid_row]:=trim(edt_Value.text);
    sg1.Cells[2,sgrid_row]:='and Data0005_1.EMPLOYEE_NAME =  '''+trim(edt_Value.text)+''' ';
  end;
  4: //  工厂简称
  begin
    sg1.Cells[1,sgrid_row]:=trim(edt_Value.text);
    sg1.Cells[2,sgrid_row]:='and data0015.ABBR_NAME ='''+trim(edt_Value.text)+''' ';
  end;
  5: //  设备责任小组
  begin
    sg1.Cells[1,sgrid_row]:=trim(edt_Value.text);
    sg1.Cells[2,sgrid_row]:='and data0840.location ='''+trim(edt_Value.text)+''' ';
  end;
  6: // 申领类型
  begin
    sg1.Cells[1,sgrid_row]:=trim(cbb1.text);
    sg1.Cells[2,sgrid_row]:='and data0268.ttype = '+inttostr(Integer(cbb1.Items.Objects[cbb1.itemindex]))+' ';
  end;
  7:  //维修单号
  begin
    sg1.Cells[1,sgrid_row]:=trim(edt_Value.text);
    sg1.Cells[2,sgrid_row]:='and data0567.number ='''+trim(edt_Value.text)+''' ';
  end;
  8:// 空调事业部工作单号“
  begin
    sg1.Cells[1,sgrid_row]:=trim(edt_Value.text);
    sg1.Cells[2,sgrid_row]:='and data0835.WorkOrder ='''+trim(edt_Value.text)+''' ';
  end;
  end;
end;
end.
