unit Uallmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh;

type
  TForm_allmx = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1DSDesigner: TBCDField;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1DSDesigner3: TStringField;
    ADOQuery1DSDesigner4: TStringField;
    ADOQuery1DSDesigner5: TStringField;
    ADOQuery1DSDesigner6: TStringField;
    ADOQuery1DSDesigner7: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    PreColumn: TColumnEh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_allmx: TForm_allmx;

implementation

uses DmUnit1,common;

{$R *.dfm}

procedure TForm_allmx.BitBtn1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm_allmx.BitBtn3Click(Sender: TObject);
begin
 // ADOQuery1.Refresh;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TForm_allmx.BitBtn2Click(Sender: TObject);
begin
 if ADOQuery1.IsEmpty then exit;
 Export_dbGridEH_to_Excel(DBGridEh1,'配料单管理')
end;

procedure TForm_allmx.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if column.Title.SortMarker =smDownEh then
  begin
    column.Title.SortMarker:=smUpEh;
    ADOQuery1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ADOQuery1.Sort:=Column.FieldName+' DESC';
  end;
 if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;

end;

procedure TForm_allmx.FormShow(Sender: TObject);
begin
 Form_allmx.BitBtn3.Click;
 PreColumn := DBGridEh1.Columns[0];
end;

procedure TForm_allmx.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  ADOQuery1.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
 ADOQuery1.Filter:='';
end;

procedure TForm_allmx.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssCtrl in Shift) and (Key=46 ) then Key := 0;
 if (key=VK_Insert)then
 begin
  KEY:=0;
  Shift:=[];
 end;
 if (chr(key)='V') and (ssalt in shift) then
 showmessage(ADOQuery1.SQL.Text);
end;

end.
