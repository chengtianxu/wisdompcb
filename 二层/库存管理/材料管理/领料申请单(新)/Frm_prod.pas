unit Frm_prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls,
  ComCtrls;

type
  TProd_frm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Grd1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADO492: TADOQuery;
    DataSource1: TDataSource;
    ADO492CUT_NO: TStringField;
    ADO492SO_NO: TStringField;
    ADO492MANU_PART_NUMBER: TStringField;
    ADO492MANU_PART_DESC: TStringField;
    ADO492ISSUE_DATE: TDateTimeField;
    ADO492DSDesigner: TStringField;
    ADO492ISSUED_QTY: TIntegerField;
    ADO492A: TIntegerField;
    ADO492B: TIntegerField;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    intgrfldADO492rkey: TIntegerField;
    procedure Grd1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
  public
    { Public declarations }
  end;

var
  Prod_frm: TProd_frm;

implementation

uses DM_u,common;

{$R *.dfm}

procedure TProd_frm.Grd1DblClick(Sender: TObject);
begin
 if not ADO492.IsEmpty then
 BitBtn1Click(Sender);
end;

procedure TProd_frm.BitBtn1Click(Sender: TObject);
begin
 ModalResult:= mrOK;
end;

procedure TProd_frm.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (ssAlt in Shift)  and  (Key=86) then
   showmessage(ADO492.SQL.Text);
end;

procedure TProd_frm.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ADO492.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ADO492.Sort:=Column.FieldName+' DESC';
  end;
  //DM.ADO492AfterScroll(DM.ADO492);
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
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

procedure TProd_frm.Edit1Change(Sender: TObject);
begin
if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
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

procedure TProd_frm.FormCreate(Sender: TObject);
begin
          field_name := Grd1.Columns[0].FieldName;
          PreColumn := Grd1.Columns[0];
          Grd1.Columns[0].Title.Color := clred ;
  DateTimePicker1.Date:=getsystem_date(dm.tmp,1);
  DateTimePicker2.Date:=getsystem_date(dm.tmp,1)+1;
end;

procedure TProd_frm.FormShow(Sender: TObject);
begin
  ADO492.Close;
  ADO492.Parameters[0].Value:=common.getsystem_date(dm.tmp,1);
  ADO492.Parameters[1].Value:=common.getsystem_date(dm.tmp,1)+1;
  ADO492.Open;
  Grd1TitleClick(PreColumn);
end;

procedure TProd_frm.DateTimePicker1Exit(Sender: TObject);
begin
 ADO492.Close;
 ADO492.Parameters[0].Value := DateTimePicker1.Date;
 ADO492.Parameters[1].Value := DateTimePicker2.Date;
 ADO492.Prepared;
 ADO492.Open;
end;

procedure TProd_frm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
 if  ADO492.IsEmpty then
 begin
   BitBtn1.Enabled:=False;
 end
 else
 begin
   BitBtn1.Enabled:=true;
 end;

end;

end.
