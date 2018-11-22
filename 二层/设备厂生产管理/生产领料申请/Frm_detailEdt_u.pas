unit Frm_detailEdt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, Mask,
  DBCtrls, Provider, DBClient;

type
  TFrm_detailEdt = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Grd1: TDBGridEh;
    CDS: TClientDataSet;
    DSP: TDataSetProvider;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CDSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure CDSAfterScroll(DataSet: TDataSet);
    procedure CDSBeforeInsert(DataSet: TDataSet);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
  private
    FGrd:TStringGrid;
    PreColumn: TColumnEh;
    field_name:string;
    Fcut_no:string;
    FBOMQty:string;

    Ffac:array[0..10] of integer;
    procedure QtyValidate(Sender: TField);
  public
    class function InitEdt(iBom_ptr:integer;Grd:TStringGrid;cut_no:string;BOMQty:string):boolean;
  end;

var
  Frm_detailEdt: TFrm_detailEdt;

implementation
 uses DM_u;
{$R *.dfm}

class function TFrm_detailEdt.InitEdt(iBom_ptr:integer;Grd:TStringGrid;cut_no:string;BOMQty:string): boolean;
var i:integer;
    s:string;
begin
  with TFrm_detailEdt.Create(nil) do
  begin
    field_name:='part_name';
    PreColumn := Grd1.Columns[1] ;
    PreColumn.Title.Color := clred ;

    FGrd:=Grd;
    Fcut_no:=cut_no;
    FBOMQty:=BOMQty;
    for i:=1 to FGrd.RowCount-2 do
      s:=s+FGrd.Cells[9,i]+',';
    if s<>'' then s:=' and not data0148.rkey in ('+s+'0) ';
    DM.ADO17.Close;
    DM.ADO17.SQL.Text:='SELECT cast(0 as bit) Sel, data0148.*,data0148.quan_bom*'+FBOMQty+' TotalQty ,  data0140.*,data0005.employee_name,'+
          '''材料'' invent_tp, cast(0 as numeric(15,3)) Qty ,cast('''' as varchar(30)) remark, cast(0 as bit) TD,'+
          'd17_0.inv_part_number,d17_0.inv_name,d17_0.INV_DESCRIPTION,(d17_0.QUAN_ON_HAND-d17_0.QUAN_ASSIGN) valQty,'+
          'd17_1.inv_part_number inv_part_number_r ,d17_1.inv_name inv_name_r,d17_1.INV_DESCRIPTION INV_DESCRIPTION_r,d02.unit_name,(d17_1.QUAN_ON_HAND-d17_1.QUAN_ASSIGN) valQty_r '+
          'FROM data0140 inner join DATA0148 on data0140.rkey=data0148.part_ptr  inner join '+
          'data0005 on data0140.user_ptr=data0005.rkey inner join '+
               'data0017 d17_0 on data0148.invent_ptr=d17_0.rkey inner join data0002 d02 on d17_0.STOCK_UNIT_PTR=d02.rkey '+
                         'left join data0017 d17_1 on data0148.repl_invt_ptr=d17_1.rkey '+
          'WHERE data0140.status=1 and (dbo.DATA0148.Invent_or = 0) and dbo.DATA0140.PART_PTR='+inttostr(iBom_ptr)+s+
          {' union all '+
          'SELECT  cast(0 as bit) Sel, data0148.* ,  data0140.*,data0005.employee_name,'+
          '''半成品''  invent_tp,cast(0 as numeric(15,2)) Qty ,cast('''' as varchar(30)) remark, cast(0 as bit) TD,'+
          'd08_0.PROD_CODE inv_part_number,d08_0.PRODUCT_NAME inv_name,d08_0.PRODUCT_DESC INV_DESCRIPTION,d08_0.qty_onhand valQty,'+
          'd08_1.PROD_CODE inv_part_number_r ,d08_1.PRODUCT_NAME inv_name_r,d08_1.PRODUCT_DESC INV_DESCRIPTION_r,d02.unit_name,d08_1.qty_onhand valQty_r '+
          'FROM  data0140 inner join DATA0148 on data0140.rkey=data0148.part_ptr  inner join '+
           'data0005 on data0140.user_ptr=data0005.rkey inner join '+
                'data0008 d08_0 on data0148.invent_ptr=d08_0.rkey inner join data0002 d02 on d08_0.unit_ptr=d02.rkey '+
                         'left join data0008 d08_1 on data0148.repl_invt_ptr=d08_1.rkey '+
        'WHERE (dbo.DATA0148.Invent_or = 1) and dbo.DATA0140.PART_PTR='+inttostr(iBom_ptr)+s+
        }
          'order by data0140.part_name,d17_0.inv_part_number';
    DM.ADO17.Open;

    DM.ADO17.FieldByName('sel').ReadOnly:=false;
    DM.ADO17.FieldByName('Qty').ReadOnly:=false;
    DM.ADO17.FieldByName('remark').ReadOnly:=false;
    DM.ADO17.FieldByName('TD').ReadOnly:=false;
    CDS.Data:=DSP.Data;

    CDS.FieldByName('Qty').OnValidate:=QtyValidate;
    showmodal;
    free;
    DM.ADO17.Close;
  end;
end;

procedure TFrm_detailEdt.BitBtn1Click(Sender: TObject);
var i:integer;
begin
  if CDS.State in [dsEdit,dsInsert] then CDS.Post;
  CDS.AfterScroll:=nil;
  cds.DisableControls;
  CDS.Filtered:=false;
  CDS.First;
  i:=FGrd.RowCount-1;
  screen.Cursor:=crHourGlass;
  while not CDS.Eof do
  begin
    if CDS.FieldByName('Sel').AsBoolean and (CDS.FieldByName('Qty').AsFloat>0) then
    begin
      DM.ADO468_1.Append;
      if CDS.FieldByName('TD').AsBoolean then
      begin
        FGrd.Cells[0,i]:=CDS.FieldByName('INV_PART_NUMBER_r').AsString;
        FGrd.Cells[1,i]:=CDS.FieldByName('inv_name_r').AsString;
        FGrd.Cells[2,i]:=CDS.FieldByName('INV_DESCRIPTION_r').AsString;
        FGrd.Cells[7,i]:=CDS.FieldByName('repl_invt_ptr').AsString;
        DM.ADO468_1.FieldByName('INVENT_PTR').AsInteger:=CDS.FieldByName('repl_invt_ptr').AsInteger;
      end else begin
        FGrd.Cells[0,i]:=CDS.FieldByName('INV_PART_NUMBER').AsString;
        FGrd.Cells[1,i]:=CDS.FieldByName('inv_name').AsString;
        FGrd.Cells[2,i]:=CDS.FieldByName('INV_DESCRIPTION').AsString;
        FGrd.Cells[7,i]:=CDS.FieldByName('D017_ptr').AsString;
        DM.ADO468_1.FieldByName('INVENT_PTR').AsInteger:=CDS.FieldByName('INVENT_PTR').AsInteger;
      end;

      FGrd.Cells[3,i]:=CDS.FieldByName('Qty').AsString;
      FGrd.Cells[4,i]:=CDS.FieldByName('Remark').AsString;
      FGrd.Cells[5,i]:=CDS.FieldByName('unit_name').AsString;
      FGrd.Cells[6,i]:=CDS.FieldByName('invent_tp').AsString;
      FGrd.Cells[8,i]:=CDS.FieldByName('INVENT_or').AsString;
      FGrd.Cells[9,i]:=CDS.FieldByName('rkey').AsString;


      DM.ADO468_1.FieldByName('quan_bom').AsFloat:=CDS.FieldByName('Qty').AsFloat;
      DM.ADO468_1.FieldByName('VENDOR').AsString:=CDS.FieldByName('Remark').AsString;
      DM.ADO468_1.FieldByName('STATUS').AsInteger:=0;
      DM.ADO468_1.FieldByName('invent_or').AsInteger:=CDS.FieldByName('INVENT_or').AsInteger;
      DM.ADO468_1.FieldByName('bom_list_ptr').AsInteger:=CDS.FieldByName('rkey').AsInteger; //148.rkey
      DM.ADO468_1.Post;
      inc(i);
      FGrd.RowCount:=FGrd.RowCount+1;
    end;

    CDS.Next;
  end;
  screen.Cursor:=crDefault;
  modalresult:=mrok;
end;

procedure TFrm_detailEdt.Grd1TitleClick(Column: TColumnEh);
begin
  if field_name <> column.FieldName then
  begin
    if not (Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftTime, ftDateTime]) then
      label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1.Text:='';
  end else
    edit1.SetFocus;
end;

procedure TFrm_detailEdt.Edit1Change(Sender: TObject);
begin
  CDS.Filtered:=false;
  CDS.Filtered:=true;
end;

procedure TFrm_detailEdt.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_detailEdt.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
        showmessage(DM.ADO17.SQL.Text);
end;

procedure TFrm_detailEdt.CDSFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Edit1.Text<>'' then
    Accept:=(Pos(uppercase(Edit1.Text),uppercase(CDS.FieldByName(field_name).AsString))>0)
  else
   Accept:=true;
end;

procedure TFrm_detailEdt.CDSAfterScroll(DataSet: TDataSet);
var s:string;
begin
  DBCheckBox1.Enabled:=CDS.FieldByName('repl_invt_ptr').AsInteger>0;
  Edit2.Text:=CDS.fieldbyname('TotalQty').AsString; //BOM总需求
  if Ftag=1 then s:=' and DATA0268.rkey<>'+DM.ADO268rkey.AsString;
  if CDS.IsEmpty then
  begin
    Edit3.Text:='';
    Edit4.Text:='';
  end else begin
    DM.tmp.Close;
  {  这是原代码
    DM.tmp.SQL.Text:='SELECT sum(Data0468.QUAN_BOM) from dbo.Data0468 INNER JOIN dbo.DATA0268 ON dbo.Data0468.FLOW_NO = dbo.DATA0268.rkey '+
                     'where DATA0268.CUT_NO='''+Fcut_no+''''+s+' and data0468.bom_list_ptr='+CDS.fieldbyname('rkey').asstring;   }

    DM.tmp.SQL.Text:=
                'select (select isnull(sum(QUAN_ISSUED),0)from Data0468  join DATA0268 '
               +' on DATA0268.rkey=FLOW_NO and DATA0268.CUT_NO='+QuotedStr(Fcut_no)
               +' and bom_list_ptr='+CDS.fieldbyname('rkey').asstring+' and((DATA0268.STATUS=4)or(Data0468.STATUS=1)))+'
               +' (select isnull(sum(QUAN_BOM),0)from Data0468 join DATA0268 '
               +' on DATA0268.rkey=FLOW_NO and DATA0268.CUT_NO='+QuotedStr(Fcut_no)
               +' and bom_list_ptr='+CDS.fieldbyname('rkey').asstring+' and (DATA0268.STATUS in (1,2,3))and Data0468.STATUS=0) ';
   {彭华修改于2012-08-23，该查询分两部分，一是已发放即 DATA0268.STATUS=4的已发放数量（QUAN_ISSUED）汇总，
   加上DATA0268.STATUS in (1,2,3))已开单数量（QUAN_BOM）的汇总。
   和投产数量和BOM用量进行比较，如果数量小于0，不允许在开单 }
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
      Edit3.Text:='0'
    else
      Edit3.Text:=DM.tmp.Fields[0].AsString;
    Edit4.Text:=floattostr(strtofloat(Edit2.Text)-strtofloat('0'+Edit3.Text));
    DBEdit5.Enabled:=(Edit4.Text<>'0') and (Edit4.Text<>'');
  end;
end;

procedure TFrm_detailEdt.CDSBeforeInsert(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrm_detailEdt.QtyValidate(Sender: TField);
begin
  if self.ActiveControl=BitBtn2 then exit;
  if CDS.fieldbyname('Sel').AsBoolean and (Sender.AsFloat<=0) then
  begin
    Self.BitBtn1.Enabled :=False;
    screen.Cursor:=crDefault;
    showmessage('申领数不正确!');
    abort;
  end;
  if StrToFloat(Sender.AsString) - StrToFloat(Edit4.text) > 0  then
  begin
    screen.Cursor:=crDefault;
    showmessage('申领数不能超出总需求数!');
    abort;
  end;
end;

procedure TFrm_detailEdt.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选,再输入数量');
    abort;
  end;
end;

procedure TFrm_detailEdt.CheckBox1Click(Sender: TObject);
begin
  CDS.DisableControls;
  screen.Cursor:=crHourGlass;
  CDS.First;
  if CheckBox1.Checked then
  while not CDS.Eof do
  begin
    CDS.Edit;
    CDS.FieldByName('sel').AsBoolean:=true;
    CDS.FieldByName('Qty').AsFloat:=strtofloat(Edit4.Text);
    CDS.Post;
    CDS.Next;
  end
  else
  while not CDS.Eof do
  begin
    CDS.Edit;
    CDS.FieldByName('sel').AsBoolean:=false;
    CDS.FieldByName('Qty').AsFloat:=0;
    CDS.Post;
    CDS.Next;
  end ;
  CDS.EnableControls;
  screen.Cursor:=crDefault;
end;

end.
