unit UQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, Buttons, StdCtrls, ExtCtrls, DB, ADODB;

type
  TFrmQry = class(TForm)
    GroupBox6: TGroupBox;
    lbl_field: TLabel;
    edt_Value: TEdit;
    btn_add: TButton;
    lst_fields: TListBox;
    StaticText7: TStaticText;
    btn_del: TButton;
    cbb1: TComboBox;
    StaticText2: TStaticText;
    sg1: TStringGrid;
    btn_OK: TButton;
    btn_cancel: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    rg_condi: TRadioGroup;
    qry_temp: TADOQuery;
    procedure btn_delClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure lst_fieldsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
  private
    { Private declarations }
     v_Field_List_CN,v_Field_List_EN:Variant;
    procedure  updateSG(sgrid_row: integer);
  public
    { Public declarations }
  end;

var
  FrmQry: TFrmQry;

implementation
   uses Pick_Item_Single,ConstVar, UDM;
{$R *.dfm}


procedure TFrmQry.btn_delClick(Sender: TObject);
var i :integer;
begin
 for i:=1 to sg1.RowCount-2 do
 sg1.Rows[i].Clear;
 sg1.RowCount:=2;
end;

procedure TFrmQry.btn_addClick(Sender: TObject);
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
  0:  //编号
  begin
        sg1.Cells[1,sgrid_row]:=trim(edt_Value.Text);
        case rg_condi.ItemIndex of
        0:sg1.Cells[2,sgrid_row]:='and CCode = '''+edt_Value.Text+'''';
        1:sg1.Cells[2,sgrid_row]:='and CCode like ''%'+edt_Value.Text+'%''';
        end;
    end;
  1:  
  begin
        sg1.Cells[1,sgrid_row]:=trim(edt_Value.Text);
        case rg_condi.ItemIndex of
        0:sg1.Cells[2,sgrid_row]:='and CName = '''+edt_Value.Text+'''';
        1:sg1.Cells[2,sgrid_row]:='and CName like ''%'+edt_Value.Text+'%''';
        end;
    end;

//  2:
//  begin
//    sg1.Cells[1,sgrid_row]:=trim(cbb1.Text);
//    sg1.Cells[2,sgrid_row]:='and Ctype = '+inttostr(cbb1.itemindex)+' ';
//  end;
//  3:
//  begin
//    sg1.Cells[1,sgrid_row]:=trim(cbb1.Text);
//    sg1.Cells[2,sgrid_row]:='and Ctype2 ='+inttostr(Integer(cbb1.Items.Objects[cbb1.itemindex]))+' ';
//  end;
//  4:
//  begin
//    sg1.Cells[1,sgrid_row]:=trim(cbb1.Text);
//    sg1.Cells[2,sgrid_row]:='and TType = '+inttostr(cbb1.itemindex)+' ';
//  end;
//  5:
//  begin
//    sg1.Cells[1,sgrid_row]:=trim(cbb1.Text);
//    sg1.Cells[2,sgrid_row]:='and Etype = '+inttostr(cbb1.itemindex)+' ';
//  end;
 end;
 end;

procedure TFrmQry.lst_fieldsClick(Sender: TObject);
var
  Lsql:string;
begin
 lbl_field.Caption:=' '+lst_fields.Items[lst_fields.itemindex]+':  ';
  edt_Value.Text:='';


  edt_Value.Visible := false;
 // btn_qry.Visible := False;
  cbb1.Visible := False;
  rg_condi.Visible:=false;

  if lst_fields.ItemIndex in  [0,1] then    // 编号、名称
  begin
     // btn_qry.Visible:=false;
      edt_Value.Visible:=true;
      rg_condi.Visible:=true;
      cbb1.Visible:=false;
  end;

//  if lst_fields.ItemIndex in  [2,3,4,5] then    // 类型
//  begin
//    //  btn_qry.Visible:=false;
//      edt_Value.Visible:=false;
//      rg_condi.Visible:=false;
//      cbb1.Visible:=true;
//      cbb1.Items.Clear;
//
//   if lst_fields.ItemIndex=2  then
//   begin
//     cbb1.Items.Add('内训');
//     cbb1.Items.Add('外训');
//   end;
//
//   if lst_fields.ItemIndex=3  then
//   begin
//     //培训需求：
//     cbb1.Items.Add('入职培训');
//     cbb1.Items.Add('岗前培训');
//     cbb1.Items.Add('在岗培训');
//
//
//   end;
//
//  if lst_fields.ItemIndex=4  then
//   begin
//     cbb1.Items.Add('课堂面授');
//     cbb1.Items.Add('实操培训');
//     cbb1.Items.Add('在线培训');
//   end;
//
//   if lst_fields.ItemIndex=5  then
//   begin
//     cbb1.Items.Add('口试考核');
//     cbb1.Items.Add('笔试考核');
//     cbb1.Items.Add('实操考核');
//     cbb1.Items.Add('在线考核');
//   end;
//  end;
end;

procedure TFrmQry.FormShow(Sender: TObject);
var i:integer;
ssql: string;
begin
 try
 lst_fields.Items.Clear;
  v_Field_List_CN := VarArrayOf(['课程编号',
  '课程名称']);
  v_Field_List_EN := VarArrayOf(['CCode',
  'CName']);

  for i:= VarArrayLowBound(v_Field_List_CN,1)
  to VarArrayHighBound(v_Field_List_CN,1) do
    lst_fields.Items.Add(v_Field_List_CN[i]);
  sg1.Cells[0,0]:='条件名';
  sg1.Cells[1,0]:='条件值';
  lst_fields.ItemIndex := 0;

   edt_value.visible:=true;
  // btn_qry.Visible:=false;
   rg_condi.Visible:=false;

   except on e:exception do
   begin
   ShowMessage('错误：'+e.Message);
   exit;
   end;
  end;

end;

procedure TFrmQry.btn_qryClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
   if lst_fields.ItemIndex=2 then
   begin 
    InputVar.Fields := 'departmentname/部门名称/100,departmentcode/部门号码/100,rkey/部门ID/120,';
    InputVar.Sqlstr :='select * from datadepartment order by 2';
    InputVar.AdoConn := DM.con;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edt_Value.Text := frmPick_Item_Single.adsPick.FieldValues['departmentname'];
      edt_Value.tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end
   end
   else  if lst_fields.ItemIndex=3 then
   begin
    InputVar.fields:= 'item/职务名称/400';
    InputVar.sqlstr:='select  rkey, item   from datadetail where dictid=1 ';
    InputVar.keyField:='rKey' ;
    InputVar.ADoConn:=dm.con;
    
    frmPick_item_single.InitForm_New(InputVar);
    if frmPick_item_single.ShowModal =mrok then
    begin
     edt_Value.text:= frmPick_item_single.adsPick.fieldbyname('item').asstring;
     edt_Value.Tag:= frmpick_item_single.adsPick.fieldByName('rkey').asinteger
    end;

   end;

  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

end.
