unit UQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, Grids, StdCtrls, Buttons, ComCtrls, ExtCtrls,ConstVar;

type
  TFrmQry = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    grp1: TGroupBox;
    txt1: TStaticText;
    btn15: TBitBtn;
    btn_reset: TBitBtn;
    btn_qry: TBitBtn;
    strngrdSGrid1: TStringGrid;
    txt8: TStaticText;
    lst1: TListBox;
    lbl_field: TLabel;
    lbl2: TLabel;
    edt_value: TEdit;
    dtp11: TDateTimePicker;
    btn_qryy: TBitBtn;
    rg1: TRadioGroup;
    DTP22: TDateTimePicker;
    btn_add: TButton;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure btn_resetClick(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
    procedure lst1Click(Sender: TObject);
    procedure btn_qryyClick(Sender: TObject);
  private
    { Private declarations }
    
procedure  updateSG(sgrid_row: integer);
  public
    { Public declarations }
  end;

var
  FrmQry: TFrmQry;

implementation
            uses Pick_Item_Single, UDM;
{$R *.dfm}

procedure TFrmQry.FormShow(Sender: TObject);
begin
  self.lst1.ItemIndex:=0;
 lst1Click(sender);
end;

procedure TFrmQry.btn_addClick(Sender: TObject);
var
  i:integer;
begin
  //检查是不是已有加在sgrid1中的内容，没有就增加
  for i:=1 to strngrdSGrid1.RowCount-2 do
     if (strngrdSGrid1.Cells[0,i]=lst1.Items[lst1.ItemIndex]) and
        (strngrdSGrid1.Cells[1,i]<>lst1.Items[lst1.ItemIndex]) then
         begin
             updateSG(i);
             exit;
         end;
  //更新0列记录
  strngrdSGrid1.Cells[0,strngrdSGrid1.RowCount-1]:=lst1.Items[lst1.itemindex];
  updateSG(strngrdSGrid1.RowCount-1);
  //增加一行空的记录
  strngrdSGrid1.RowCount :=strngrdSGrid1.RowCount +1;
end;


procedure  TFrmQry.updateSG(sgrid_row: integer);
var
  i,j:integer;
begin
  strngrdSGrid1.Cells[0,sgrid_row]:=lst1.Items[lst1.itemindex];
 case lst1.ItemIndex of
  0:    //入库单号
  begin
    strngrdSGrid1.Cells[1,sgrid_row]:=trim(edt_value.Text);
    if rg1.ItemIndex=0  then
    strngrdSGrid1.Cells[2,sgrid_row]:='and a.GRN_NUMBER = '''+trim(edt_value.Text)+''' '
    else
    strngrdSGrid1.Cells[2,sgrid_row]:='and a.GRN_NUMBER like  ''%'+trim(edt_value.Text)+'%'' '
   end;

  1:    //材料编号
  begin
     strngrdSGrid1.Cells[1,sgrid_row]:=trim(edt_value.Text);
    if rg1.ItemIndex=0  then
    strngrdSGrid1.Cells[2,sgrid_row]:='and c.inv_part_number = '''+trim(edt_value.Text)+''' '
    else
    strngrdSGrid1.Cells[2,sgrid_row]:='and c.inv_part_number like  ''%'+trim(edt_value.Text)+'%'' '

   end;

  2:   //名称
  begin
      strngrdSGrid1.Cells[1,sgrid_row]:=trim(edt_value.Text);
    if rg1.ItemIndex=0  then
    strngrdSGrid1.Cells[2,sgrid_row]:='and c.inv_name = '''+trim(edt_value.Text)+''' '
    else
    strngrdSGrid1.Cells[2,sgrid_row]:='and c.inv_name like  ''%'+trim(edt_value.Text)+'%'' '
  end;
  3:  //规格
  begin
          strngrdSGrid1.Cells[1,sgrid_row]:=trim(edt_value.Text);
    if rg1.ItemIndex=0  then
    strngrdSGrid1.Cells[2,sgrid_row]:='and c.inv_part_description = '''+trim(edt_value.Text)+''' '
    else
    strngrdSGrid1.Cells[2,sgrid_row]:='and c.inv_part_description like  ''%'+trim(edt_value.Text)+'%'' '
    end;
  4:  //入库日期
  begin
       strngrdSGrid1.Cells[1,sgrid_row]:='从'+datetostr(DTP1.date)+'到'+datetostr(dtp2.date);
         strngrdSGrid1.Cells[2,sgrid_row]:=
         ' and  a.ship_DATE>='''+datetostr(dtp1.date)+
         formatdatetime(' hh:nn:ss',dtp11.Time)+
         ''' and a.ship_DATE<='''+datetostr(dtp2.date)+
         formatdatetime(' hh:nn:ss',dtp22.Time)+'''';
    end;
   5: //供应商编号
   begin
     strngrdSGrid1.Cells[1,sgrid_row]:=trim(edt_value.Text);
    if rg1.ItemIndex=0  then
    strngrdSGrid1.Cells[2,sgrid_row]:='and e.code = '''+trim(edt_value.Text)+''' '
    else
    strngrdSGrid1.Cells[2,sgrid_row]:='and e.code like  ''%'+trim(edt_value.Text)+'%'' '
    end;

   6: //入库工厂编号
   begin
      strngrdSGrid1.Cells[1,sgrid_row]:=trim(edt_value.Text);
    if rg1.ItemIndex=0  then
    strngrdSGrid1.Cells[2,sgrid_row]:='and i.warehouse_code = '''+trim(edt_value.Text)+''' '
    else
    strngrdSGrid1.Cells[2,sgrid_row]:='and i.warehouse_code like  ''%'+trim(edt_value.Text)+'%'' '
    end;



   7: //材料组别
   begin
       strngrdSGrid1.Cells[1,sgrid_row]:=trim(edt_value.Text);
    if rg1.ItemIndex=0  then
    strngrdSGrid1.Cells[2,sgrid_row]:='and g.inv_group_name = '''+trim(edt_value.Text)+''' '
    else
    strngrdSGrid1.Cells[2,sgrid_row]:='and c.inv_part_description like  ''%'+trim(edt_value.Text)+'%'' '
    end;



   8: //材料类别
   begin
     strngrdSGrid1.Cells[1,sgrid_row]:=trim(edt_value.Text);
    if rg1.ItemIndex=0  then
    strngrdSGrid1.Cells[2,sgrid_row]:='and f.group_Name = '''+trim(edt_value.Text)+''' '
    else
    strngrdSGrid1.Cells[2,sgrid_row]:='and f.group_Name like  ''%'+trim(edt_value.Text)+'%'' '
    end;



   9: //仓库编号
   begin
             strngrdSGrid1.Cells[1,sgrid_row]:=trim(edt_value.Text);
    if rg1.ItemIndex=0  then
    strngrdSGrid1.Cells[2,sgrid_row]:='and h.code = '''+trim(edt_value.Text)+''' '
    else
    strngrdSGrid1.Cells[2,sgrid_row]:='and h.code like  ''%'+trim(edt_value.Text)+'%'' '
    end;

  10:  //有效日期
  begin
       strngrdSGrid1.Cells[1,sgrid_row]:='从'+datetostr(DTP1.date)+'到'+datetostr(dtp2.date);
         strngrdSGrid1.Cells[2,sgrid_row]:=
         ' and  b.EXPIRE_DATE>='''+datetostr(dtp1.date)+
         formatdatetime(' hh:nn:ss',dtp11.Time)+
         ''' and b.EXPIRE_DATE<='''+datetostr(dtp2.date)+
         formatdatetime(' hh:nn:ss',dtp22.Time)+'''';
    end;

   end;


 end;

procedure TFrmQry.btn_resetClick(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to strngrdSGrid1.RowCount-1 do
  strngrdSGrid1.Rows[i].Clear;
 strngrdSGrid1.RowCount:=2;

end;

procedure TFrmQry.btn_qryClick(Sender: TObject);
begin
close;
end;

procedure TFrmQry.lst1Click(Sender: TObject);
begin

    Self.edt_value.Visible:=False;
    rg1.Visible:=false;
    DTP1.Visible:=false;
    DTP11.Visible:=false;
    dtp2.Visible:=false;
    dtp22.Visible:=false;
    btn_qryy.Visible:=false;
    lbl_field.Caption:= lst1.items[lst1.itemindex];

    case  lst1.ItemIndex of
    0:
    begin
       edt_value.Visible:=true;
       rg1.Visible:=true;
    end;

    1:
    begin
        edt_value.Visible:=true;
       rg1.Visible:=true;
       btn_qryy.Visible:=true;

    end;
    2:
    begin
       edt_value.Visible:=true;
       rg1.Visible:=true;
       btn_qryy.Visible:=true;

    end;
    3:
    begin
        edt_value.Visible:=true;
       rg1.Visible:=true;
       btn_qryy.Visible:=true;

    end;
    4:
    begin
        DTP1.Visible:=true;
    DTP11.Visible:=true;
    dtp2.Visible:=true;
    dtp22.Visible:=true;

    end;
    5:
    begin
      edt_value.Visible:=true;
       rg1.Visible:=true;
       btn_qryy.Visible:=true;

    end;
    6:
    begin
       edt_value.Visible:=true;
       rg1.Visible:=true;
       btn_qryy.Visible:=true;

    end;
    7:
    begin
       edt_value.Visible:=true;
       rg1.Visible:=true;
       btn_qryy.Visible:=true;

    end;
    8:
    begin
        edt_value.Visible:=true;
       rg1.Visible:=true;
       btn_qryy.Visible:=true;

    end;
    9:
    begin
        edt_value.Visible:=true;
       rg1.Visible:=true;
       btn_qryy.Visible:=true;

    end;
    10:
    begin
        DTP1.Visible:=true;
    DTP11.Visible:=true;
    dtp2.Visible:=true;
    dtp22.Visible:=true;

    end;



    end;
end;

procedure TFrmQry.btn_qryyClick(Sender: TObject);
var
  InputVar: PDlgInput ;
begin                                                //manufacturer_name
     frmpick_item_single:=Tfrmpick_item_single.Create(application);

     case  lst1.ItemIndex of
    1:
    begin
       InputVar.Fields := 'INV_PART_NUMBER/材料编码/100,INV_PART_DESCRIPTION/规格/400,manufacturer_name/制造商名称/100';
      InputVar.Sqlstr := ' select  INV_PART_NUMBER,INV_PART_DESCRIPTION,manufacturer_name  from data0017';
      inputvar.KeyField:='INV_PART_NUMBER';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER'];

    end;
    2:
    begin
     InputVar.Fields := 'INV_PART_NUMBER/材料编码/100,INV_NAME/材料名称/200,INV_PART_DESCRIPTION/规格/400,manufacturer_name/制造商名称/100';
      InputVar.Sqlstr := ' select  INV_PART_NUMBER,INV_NAME,INV_PART_DESCRIPTION,manufacturer_name  from data0017';
      inputvar.KeyField:='INV_PART_NUMBER';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['INV_NAME'];

    end;
    3:
    begin
      InputVar.Fields := 'INV_PART_NUMBER/材料编码/100,INV_NAME/材料名称/200,INV_PART_DESCRIPTION/规格/400,manufacturer_name/制造商名称/100';
      InputVar.Sqlstr := ' select  INV_PART_NUMBER,INV_NAME,INV_PART_DESCRIPTION,manufacturer_name  from data0017';
      inputvar.KeyField:='INV_PART_NUMBER';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['INV_PART_DESCRIPTION'];

    end;
   
    5:
    begin
           InputVar.Fields := 'CODE/编码/100,SUPPLIER_NAME/名称/200';
      InputVar.Sqlstr := ' select  CODE,SUPPLIER_NAME  from Data0023';
      inputvar.KeyField:='CODE';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['CODE'];

    end;
    6:
    begin
            InputVar.Fields := 'WAREHOUSE_CODE/编码/100,WAREHOUSE_NAME/名称/200,ABBR_NAME/简称/100';
      InputVar.Sqlstr := ' select  WAREHOUSE_CODE,WAREHOUSE_NAME  from DAta0015';
      inputvar.KeyField:='WAREHOUSE_CODE';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];

    end;
    7:
    begin
         InputVar.Fields := 'inv_group_name/组别名称/100,inv_group_desc/描述/200';
      InputVar.Sqlstr := ' select  inv_group_name,inv_group_desc  from Data0019';
      inputvar.KeyField:='inv_group_name';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['inv_group_name'];

    end;
    8:
    begin
        InputVar.Fields := 'GROUP_NAME/类别名称/100,GROUP_DESC/描述/200';
      InputVar.Sqlstr := ' select  GROUP_NAME,GROUP_DESC  from Data0496';
      inputvar.KeyField:='GROUP_NAME';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['GROUP_NAME'];

    end;
    9:
    begin
         InputVar.Fields := 'CODE/编码/100,LOCATION/名称/200';
      InputVar.Sqlstr := ' select  CODE,LOCATION  from DAta0016';
      inputvar.KeyField:='CODE';
      InputVar.AdoConn := DM.con1;
      frmPick_Item_Single.InitForm_New(InputVar);

      if frmPick_Item_Single.ShowModal=mrok then
        edt_value.Text := frmPick_Item_Single.adsPick.FieldValues['CODE'];

    end;
   end; 
end;

end.


