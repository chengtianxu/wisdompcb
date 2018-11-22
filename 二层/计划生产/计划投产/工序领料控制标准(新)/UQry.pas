unit UQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, Buttons, Grids;

type
  TFrmQry = class(TForm)
    pnl1: TPanel;
    txt1: TStaticText;
    sgrid1: TStringGrid;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    grp1: TGroupBox;
    lbl_fieldname: TLabel;
    lst1: TListBox;
    txt2: TStaticText;
    btn_sel: TBitBtn;
    edt_value: TEdit;
    btn_add: TBitBtn;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lst1Click(Sender: TObject);
    procedure btn_selClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
     v_Field_List_CN,v_Field_List_EN:Variant;
    procedure update2_sgrid(sgrid_row:integer);
    procedure update_sgrid();
  public
    { Public declarations }
  end;

var
  FrmQry: TFrmQry;

implementation

uses UDM,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TFrmQry.FormShow(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';

  SELF.lst1.ItemIndex := 0;
  self.lst1Click(lst1);
end;

procedure TFrmQry.FormCreate(Sender: TObject);
//var i:integer;
begin
//  v_Field_List_CN := VarArrayOf(['标准名称','工厂代码','工厂名称','标准产出']);
//  v_Field_List_EN := VarArrayOf(['dbo.DATA0136.control_name','dbo.Data0015.WAREHOUSE_CODE','dbo.Data0015.WAREHOUSE_NAME' ,'dbo.DATA0136.stan_consume']);
//
//  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
//    lst1.Items.Add(v_Field_List_CN[i]);
//  sgrid1.Cells[0,0]:='条件名';
//  sgrid1.Cells[1,0]:='条件值';
//  lst1.ItemIndex := 0;
end;

procedure TFrmQry.lst1Click(Sender: TObject);
begin
 lbl_fieldname.Visible := false;
  lbl_fieldname.Caption:=' '+lst1.Items[lst1.itemindex]+':  ';

  edt_value.Text:='';
  edt_value.Visible:=false;
  edt_value.ReadOnly:=false;
  btn_sel.Visible:=false;
  //btn_add.Enabled:=false;
 // rg_sign.Visible := False;
  case lst1.ItemIndex of
    0:
    begin
      lbl_fieldname.Visible := true;
      edt_value.Visible := true;
      btn_sel.Visible :=False;
    end;
    1,2,3:
    begin
      lbl_fieldname.Visible := true;
      edt_value.Visible := true;
      btn_sel.Visible :=True;
    end;

  end;
end;

procedure TFrmQry.btn_selClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
try
  frmpick_item_single:=Tfrmpick_item_single.Create(application);

    case self.lst1.ItemIndex of
    1:
    begin
     InputVar.Fields := 'warehouse_code/工厂代码/100,warehouse_name/工厂名称/200,rkey/ID/50';
     InputVar.Sqlstr := ' select warehouse_code , warehouse_name,rkey from data0015 ';
      InputVar.AdoConn :=dm.con1;
      frmPick_Item_Single.InitForm_New(InputVar) ;
     if frmPick_Item_Single.ShowModal=mrok then
     begin
    edt_value.text:= frmPick_Item_Single.adsPick.fieldbyname('warehouse_code').asstring;
    edt_value.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
    end;
    end;

    2:
    begin
      InputVar.Fields := 'dept_code/工序编号/100,dept_name/名称/120,rkey/ID/50';
      InputVar.Sqlstr := ' select  dept_code, dept_name,rkey from data0034 where rkey=cost_dept_ptr ';
      InputVar.AdoConn :=dm.con1;
      frmPick_Item_Single.InitForm_New(InputVar) ;
      if frmPick_Item_Single.ShowModal=mrok then
      begin
      edt_value.text:=frmPick_Item_Single.adsPick.fieldbyname('dept_name').asstring;
      edt_value.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      end;

    end;

    3:
     begin
       InputVar.Fields := 'group_name/类别名称/100,group_desc/类别描述/120,rkey/ID/50';
       InputVar.Sqlstr := ' select  group_name, group_desc,rkey from data0496   ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
           if frmPick_Item_Single.ShowModal=mrok then
           begin
          edt_value.text:= frmPick_Item_Single.adsPick.fieldbyname('group_desc').asstring;
          edt_value.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
          end;
     end;

//    4:
//     begin
//       InputVar.Fields := 'inv_part_number/物料编号/100,INV_PART_DESCRIPTION/物料规格/120,INV_PART_DESCRIPTION/物料名称/120,rkey/ID/50';
//       InputVar.Sqlstr := ' select  inv_part_number, INV_PART_DESCRIPTION,INV_NAME,rkey from data0017   ';
//        InputVar.AdoConn :=dm.con1;
//        frmPick_Item_Single.InitForm_New(InputVar) ;
//          if frmPick_Item_Single.ShowModal=mrok then
//          begin
//          edt_value.text:= frmPick_Item_Single.adsPick.fieldbyname('group_desc').asstring;
//          edt_value.tag:=  frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
//          end;
//     end;



    end;

 finally
  frmPick_Item_Single.adsPick.Close;
  frmPick_Item_Single.Free ;
 end;


end;

procedure TFrmQry.btn_addClick(Sender: TObject);
begin
  update_sgrid;
end;

procedure TFrmQry.update_sgrid;
var
  i:integer;
begin
  //检查是不是已有加在sgrid1中的内容，没有就增加
  for i:=1 to sgrid1.RowCount-2 do
    if (sgrid1.Cells[0,i]=lst1.Items[lst1.ItemIndex]) and
    (sgrid1.Cells[1,i]<>lst1.Items[lst1.ItemIndex]) then
    begin
      update2_sgrid(i);
      exit;
    end;
  //更新0列记录
  sgrid1.Cells[0,sgrid1.RowCount-1]:=lst1.Items[lst1.itemindex];
  update2_sgrid(sgrid1.RowCount-1);
  //增加一行空的记录
  sgrid1.RowCount :=sgrid1.RowCount +1;
end;

procedure TFrmQry.update2_sgrid(sgrid_row: integer);
begin
  case lst1.ItemIndex of
     0:begin //标准代码
         sgrid1.Cells[1,sgrid_row]:=edt_value.Text;
         sgrid1.Cells[2,sgrid_row]:='and a.control_name LIKE '''+trim(edt_value.Text)+'%''' ;
       end;
     1:begin //工厂代码
         sgrid1.Cells[1,sgrid_row]:=edt_value.Text;
         sgrid1.Cells[2,sgrid_row]:='and f.WAREHOUSE_CODE LIKE '''+trim(edt_value.Text)+'%''' ;
       end;
     2:begin //成本中心
         sgrid1.Cells[1,sgrid_row]:=edt_value.Text;
         sgrid1.Cells[2,sgrid_row]:='and g.dept_name LIKE '''+trim(edt_value.Text)+'%''' ;
       end;

     3:
     begin
         sgrid1.Cells[1,sgrid_row]:=edt_value.Text;
         sgrid1.Cells[2,sgrid_row]:='and h.group_desc LIKE '''+trim(edt_value.Text)+'%''' ;
     end;

//     4:
//     begin
//         sgrid1.Cells[1,sgrid_row]:=edt_value.Text;
//         sgrid1.Cells[2,sgrid_row]:='and h.group_desc LIKE '''+trim(edt_value.Text)+'%''' ;
//     end;
//   
  end;

end;

procedure TFrmQry.mniN1Click(Sender: TObject);
var
 i:integer;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQry.btn2Click(Sender: TObject);
var
  i:integer;
begin
  for i:=sgrid1.Row to sgrid1.RowCount-2 do
    sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;

end;

procedure TFrmQry.btn3Click(Sender: TObject);
var
  i:integer;
begin
  for i:=1 to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;

end;

end.
