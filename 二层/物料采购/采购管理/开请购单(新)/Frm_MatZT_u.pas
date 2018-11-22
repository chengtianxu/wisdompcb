unit Frm_MatZT_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons;

type
  TFrm_MatZT = class(TForm)
    Panel1: TPanel;
    Grd1: TDBGridEh;
    DataSource1: TDataSource;
    ADO71: TADOQuery;
    Label1: TLabel;
    ADO71INV_PART_NUMBER: TStringField;
    ADO71INV_PART_DESCRIPTION: TStringField;
    ADO71ABBR_NAME: TStringField;
    ADO71zaitu: TFloatField;
    ADO71UNIT_NAME: TStringField;
    ADO71tax_price: TFloatField;
    ADO71TAX_2: TBCDField;
    ADO71REQ_DATE: TDateTimeField;
    ADO71PO_NUMBER: TStringField;
    ADO71ANALYSIS_CODE_1: TStringField;
    ADO71reason: TStringField;
    ADO71rohs: TStringField;
    Edit1: TEdit;
    BtClose: TBitBtn;
    BtnExcel: TBitBtn;
    ADO71ComNm: TStringField;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ADO71QUAN_ORD: TFloatField;
    ADO71QUAN_RECD: TFloatField;
    ADO71Quan_on_hand: TBCDField;
    ADO71EMPLOYEE_NAME: TStringField;
    ADO71dept_name: TStringField;
    ADO71PO_REQ_NUMBER: TStringField;
    ADO71reply_date: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure BtnExcelClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    FsCom:string;
  public
    { Public declarations }
  end;

var
  Frm_MatZT: TFrm_MatZT;

implementation
uses DM_u,common;
{$R *.dfm}

procedure TFrm_MatZT.FormShow(Sender: TObject);
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  ComboBox1.Items.Append('所有');
  ComboBox1.ItemIndex:=0;
  DM.tmp.Close;
  DM.tmp.SQL.Text:='select abbr_name from data0015' ;
  DM.tmp.Open;
  while not DM.tmp.Eof do
  begin
    ComboBox1.Items.Append(DM.tmp.Fields[0].asstring);
    DM.tmp.Next;
  end;
end;

procedure TFrm_MatZT.Edit1Change(Sender: TObject);
begin
  if ADO71.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if ADO71.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        ADO71.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'+FsCom
      else if ADO71.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        ADO71.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')'+FsCom;
    end else if FsCom<>'' then
      ADO71.Filter:=' ComNm='''+ComboBox1.Text+''''
    else
      ADO71.Filter:='';
  end;
end;

procedure TFrm_MatZT.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(ADO71.SQL.Text);
end;

procedure TFrm_MatZT.Grd1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ADO71.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ADO71.Sort:=Column.FieldName+' DESC';
  end;
  if field_name <> column.FieldName then
  begin
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

procedure TFrm_MatZT.BtnExcelClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(Grd1,'在途材料');
end;

procedure TFrm_MatZT.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then FsCom:='' else FsCom:=' and ComNm='''+ComboBox1.Text+'''';
  Edit1Change(nil);
end;

end.
