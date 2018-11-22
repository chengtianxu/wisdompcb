unit Frm_detailEdt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls,
  Provider, DBClient;

type
  TFrm_detailEdt = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    AQ153: TADOQuery;
    AQ153rkey: TAutoIncField;
    AQ153SHIP_PTR: TIntegerField;
    AQ153CUSTPART_PTR: TIntegerField;
    AQ153QUANTITY: TIntegerField;
    AQ153QTY_ON_HAND: TIntegerField;
    AQ153PO_NUMBER: TStringField;
    AQ153EMPL_PTR: TIntegerField;
    AQ153MFG_DATE: TDateTimeField;
    AQ153REMARK: TStringField;
    AQ153TAX_RATE: TBCDField;
    AQ153CUSTOMER_PTR: TIntegerField;
    AQ153CURRENCY_PTR: TIntegerField;
    AQ153EXCH_RATE: TBCDField;
    AQ153MANU_PART_NUMBER: TStringField;
    AQ153MANU_PART_DESC: TStringField;
    Grd1: TDBGridEh;
    DataSource1: TDataSource;
    AQ153analysis_code_2: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    AQ153delivery_no: TStringField;
    AQ153PRICE: TBCDField;
    AQ153Price6: TFloatField;
    cds153: TClientDataSet;
    dsp153: TDataSetProvider;
    AQ153chk: TBooleanField;
    AQ153OutQty: TIntegerField;
    AQ153OutPrice: TFloatField;
    AQ153ReferenceNum: TStringField;
    AQ153Note: TStringField;
    cds153chk: TBooleanField;
    cds153rkey: TAutoIncField;
    cds153MANU_PART_NUMBER: TStringField;
    cds153analysis_code_2: TStringField;
    cds153PO_NUMBER: TStringField;
    cds153MANU_PART_DESC: TStringField;
    cds153MFG_DATE: TDateTimeField;
    cds153QTY_ON_HAND: TIntegerField;
    cds153REMARK: TStringField;
    cds153TAX_RATE: TBCDField;
    cds153PRICE: TBCDField;
    cds153Price6: TFloatField;
    cds153CUSTOMER_PTR: TIntegerField;
    cds153CURRENCY_PTR: TIntegerField;
    cds153EXCH_RATE: TBCDField;
    cds153EMPL_PTR: TIntegerField;
    cds153QUANTITY: TIntegerField;
    cds153CUSTPART_PTR: TIntegerField;
    cds153SHIP_PTR: TIntegerField;
    cds153delivery_no: TStringField;
    cds153OutQty: TIntegerField;
    cds153OutPrice: TFloatField;
    cds153ReferenceNum: TStringField;
    cds153Note: TStringField;
    chk1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cds153OutQtyValidate(Sender: TField);
    procedure cds153chkChange(Sender: TField);
    procedure BitBtn2Click(Sender: TObject);
    procedure cds153AfterScroll(DataSet: TDataSet);
    procedure chk1Click(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FGrd:TStringGrid;
    PreColumn: TColumnEh;
    field_name:string;
  public
    class function InitEdt(iCUSTOMER_PTR:integer;Grd:TStringGrid):boolean;
  end;

var
  Frm_detailEdt: TFrm_detailEdt;

implementation
 uses DM_u,Frm_Out_u;
{$R *.dfm}

class function TFrm_detailEdt.InitEdt(iCUSTOMER_PTR:integer;Grd:TStringGrid): boolean;
var i:integer;
    s:string;
begin
  try
    with TFrm_detailEdt.Create(nil) do
    begin
      s:='';
      for i:=1 to Grd.RowCount-2 do
        s:=s+Grd.Cells[Grd.ColCount-1,i]+',';
      s:=s+'0';
      cds153.Close;
      AQ153.Close;
      AQ153.SQL.Text:='select cast(0 as bit) as chk,data0153.*,data0025.MANU_PART_NUMBER,data0025.MANU_PART_DESC,data0025.analysis_code_2,Convert(Float,data0153.PRICE) as Price6,data0439.delivery_no, '+
                      'OutQty=0,OutPrice=Convert(Float,data0153.PRICE),ReferenceNum=CAST('''' as Varchar(15)),Note=CAST('''' as Varchar(50)) '+
                      'from data0153 inner join data0025 on data0153.CUSTPART_PTR=data0025.rkey '+
                      'left join data0064 on data0153.SHIP_PTR=data0064.rkey '+
                      'left join data0439 on data0064.packing_list_ptr=data0439.rkey '+
                      'where data0153.CUSTOMER_PTR='+inttostr(iCUSTOMER_PTR)+
                      ' and data0153.QTY_ON_HAND>0 and (not  data0153.rkey in ('+s+')) '+
                      'order by data0025.MANU_PART_DESC,data0153.MFG_DATE';
      AQ153.Open;
      cds153.Open;
      if AQ153.IsEmpty then
      begin
        showmessage('此客户当前没有可用库存...');
        result:=false;
        //free;
      end else begin
        field_name:='MANU_PART_NUMBER';
        PreColumn := Grd1.Columns[1] ;
        PreColumn.Title.Color := clred ;
        FGrd:=Grd;

        showmodal;
        //free;
      end;
    end;
  finally
    Frm_detailEdt.Free;
  end;
end;

procedure TFrm_detailEdt.BitBtn1Click(Sender: TObject);
var i:integer;
begin
  {需注意多人操作的问题，检查是否超出库存}
  with cds153 do
  begin
    DisableControls;
    try
      First;
      while not cds153.Eof do
      begin
        if cds153.FieldByName('chk').AsBoolean then
        begin
          for i:=1 to FGrd.RowCount-2 do
          if FGrd.Cells[FGrd.ColCount-1,i]=cds153.Fieldbyname('rkey').AsString  then
          begin
            showmessage('不能重复发放...');
            Abort;
          end;
          i:=FGrd.RowCount-1;
          FGrd.Cells[0,i]:=cds153.Fieldbyname('MANU_PART_DESC').AsString; //客户型号
          FGrd.Cells[1,i]:=cds153.Fieldbyname('MANU_PART_NUMBER').AsString; //客户型号
          FGrd.Cells[2,i]:=cds153.Fieldbyname('analysis_code_2').AsString; //客户物料号
          FGrd.Cells[3,i]:=cds153.Fieldbyname('OutQty').AsString; //数量
          FGrd.Cells[4,i]:=cds153.Fieldbyname('OutPrice').AsString; //单价

          FGrd.Cells[5,i]:=cds153.Fieldbyname('TAX_RATE').AsString;  //税率

          FGrd.Cells[6,i]:=cds153.Fieldbyname('PO_NUMBER').AsString; //PO号
          FGrd.Cells[7,i]:=cds153.Fieldbyname('MFG_DATE').AsString; //入库日期
          FGrd.Cells[8,i]:=cds153.Fieldbyname('ReferenceNum').AsString; //收料号
          FGrd.Cells[9,i]:=cds153.Fieldbyname('Note').AsString; //备注
          FGrd.Cells[10,i]:=cds153.Fieldbyname('rkey').AsString; //rkey153
          FGrd.RowCount:=FGrd.RowCount+1;  
          DM.AQ158_1.Append;
          DM.AQ158_1.FieldByName('PRINT_PTR').AsInteger:=-1;
          DM.AQ158_1.FieldByName('STOCK_PTR').AsInteger:=cds153.Fieldbyname('rkey').AsInteger; //rkey153
          DM.AQ158_1.FieldByName('OUT_QTY').AsString:=cds153.Fieldbyname('OutQty').AsString;
          DM.AQ158_1.FieldByName('PRICE').AsString:=cds153.Fieldbyname('OutPrice').AsString;
          DM.AQ158_1.FieldByName('RECE_NUMBER').AsString:=cds153.Fieldbyname('ReferenceNum').AsString;
          DM.AQ158_1.FieldByName('REMARK').AsString:=cds153.Fieldbyname('Note').AsString;
          DM.AQ158_1.Post;
        end;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  
//  for i:=1 to FGrd.RowCount-2 do
//    if FGrd.Cells[FGrd.ColCount-1,i]=AQ153.Fieldbyname('rkey').AsString  then
//    begin
//      showmessage('不能重复发放...');
//      exit;
//    end;
//    
//  with TFrm_out.Create(nil) do
//  try
//    Edit1.Text:=AQ153.Fieldbyname('MANU_PART_DESC').AsString;
//    Edit2.Text:=AQ153.Fieldbyname('MANU_PART_NUMBER').AsString;
//    Edit4.Text:=AQ153.Fieldbyname('QTY_ON_HAND').AsString;
//    Edit5.Text:=AQ153.Fieldbyname('QTY_ON_HAND').AsString;
//    Edit7.Text:=AQ153.Fieldbyname('Price6').AsString;
//    i:=FGrd.RowCount-1;
//    if showmodal=mrok then
//    begin
//      FGrd.Cells[0,i]:=Edit1.Text; //客户型号
//      FGrd.Cells[1,i]:=Edit2.Text; //客户型号
//      FGrd.Cells[2,i]:=AQ153.Fieldbyname('analysis_code_2').AsString; //客户物料号
//
//      FGrd.Cells[3,i]:=Edit5.Text; //数量
//      FGrd.Cells[4,i]:=Edit7.Text; //单价
//
//      FGrd.Cells[5,i]:=AQ153.Fieldbyname('PO_NUMBER').AsString; //PO号
//      FGrd.Cells[6,i]:=AQ153.Fieldbyname('MFG_DATE').AsString; //入库日期
//
//
//      FGrd.Cells[7,i]:=Edit3.Text; //收料号
//      FGrd.Cells[8,i]:=Edit6.Text; //备注
//      FGrd.Cells[9,i]:=AQ153.Fieldbyname('rkey').AsString; //rkey153
//      FGrd.RowCount:=FGrd.RowCount+1;
//
//      DM.AQ158_1.Append;
//      DM.AQ158_1.FieldByName('PRINT_PTR').AsInteger:=-1;
//      DM.AQ158_1.FieldByName('STOCK_PTR').AsInteger:=AQ153.Fieldbyname('rkey').AsInteger; //rkey153
//      DM.AQ158_1.FieldByName('OUT_QTY').AsString:=Edit5.Text;
//      DM.AQ158_1.FieldByName('PRICE').AsString:=Edit7.Text;
//      DM.AQ158_1.FieldByName('RECE_NUMBER').AsString:=Edit3.Text;
//      DM.AQ158_1.FieldByName('REMARK').AsString:=Edit6.Text;
//      DM.AQ158_1.Post;
//      AQ153.Delete;
//    end;
//  finally
//    free;
//  end;
end;

procedure TFrm_detailEdt.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker=smNoneEh) or (column.Title.SortMarker =smDownEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    AQ153.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    AQ153.Sort:=Column.FieldName+' DESC';
  end;
  if field_name <> column.FieldName then
  begin
    if not (Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftTime, ftDateTime]) then
      label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_detailEdt.Edit1Change(Sender: TObject);
begin
//  if AQ153.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
//  begin
//    if trim(Edit1.text) <> '' then
//    begin
//      if AQ153.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
//        AQ153.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
//      else if AQ153.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
//        AQ153.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
//    end else
//      AQ153.Filter:='';
//  end;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_detailEdt.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_detailEdt.cds153OutQtyValidate(Sender: TField);
begin
  if Sender.AsInteger>cds153.FieldByName('QTY_ON_HAND').AsInteger then
  begin
    ShowMessage('发放数量不能大于当前有效库存...');
    Abort;
  end;
end;

procedure TFrm_detailEdt.cds153chkChange(Sender: TField);
begin
  if not cds153.FieldByName('chk').AsBoolean then
  begin
    if cds153.FieldByName('OutQty').ReadOnly then cds153.FieldByName('OutQty').ReadOnly:= not cds153.FieldByName('OutQty').ReadOnly;
    cds153.FieldByName('OutQty').AsInteger:=0;
    cds153.FieldByName('OutQty').ReadOnly:= True;
    cds153.FieldByName('OutPrice').ReadOnly:= True;
    cds153.FieldByName('ReferenceNum').ReadOnly:= True;
    cds153.FieldByName('Note').ReadOnly:= True;
  end;
  if cds153.FieldByName('chk').AsBoolean then
  begin
    if cds153.FieldByName('OutQty').ReadOnly then cds153.FieldByName('OutQty').ReadOnly:= not cds153.FieldByName('OutQty').ReadOnly;
    if cds153.FieldByName('OutQty').AsInteger=0 then
      cds153.FieldByName('OutQty').AsInteger:= cds153.FieldByName('QTY_ON_HAND').AsInteger;
    cds153.FieldByName('OutPrice').ReadOnly:= False;
    cds153.FieldByName('ReferenceNum').ReadOnly:= False;
    cds153.FieldByName('Note').ReadOnly:= False;
  end;
end;

procedure TFrm_detailEdt.BitBtn2Click(Sender: TObject);
begin
  if (cds153.State in [dsInsert,dsEdit]) then cds153.Cancel;
end;

procedure TFrm_detailEdt.cds153AfterScroll(DataSet: TDataSet);
begin
  if cds153.FieldByName('chk').AsBoolean then
  begin
    cds153.FieldByName('OutQty').ReadOnly:= False;
    cds153.FieldByName('OutPrice').ReadOnly:= False;
    cds153.FieldByName('ReferenceNum').ReadOnly:= False;
    cds153.FieldByName('Note').ReadOnly:= False;
  end
  else
  begin
    cds153.FieldByName('OutQty').ReadOnly:= True;
    cds153.FieldByName('OutPrice').ReadOnly:= True;
    cds153.FieldByName('ReferenceNum').ReadOnly:= True;
    cds153.FieldByName('Note').ReadOnly:= True;
  end;
end;

procedure TFrm_detailEdt.chk1Click(Sender: TObject);
begin
  cds153.DisableControls;
  Screen.Cursor:=crHourGlass;
  cds153.First;
  while not cds153.Eof do
  begin
    if chk1.Checked then
     begin
       cds153.Edit;
       cds153.FieldByName('chk').AsBoolean:=True ;
       cds153.Post;
     end else
     begin
       cds153.Edit;
       cds153.FieldByName('chk').AsBoolean:= False;
       cds153.Post;
     end;
     cds153.Next;
  end;
  cds153.EnableControls;
  Screen.Cursor:=crDefault;

end;

procedure TFrm_detailEdt.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(AQ153.SQL.Text);
end;

end.
