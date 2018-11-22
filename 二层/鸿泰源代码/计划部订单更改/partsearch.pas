unit partsearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, Db, DBTables, ComCtrls,
  Menus, ADODB;

type
  TFrmCustPart = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1customer_ptr: TIntegerField;
    ADOQuery1abbr_name: TStringField;
    ADOQuery1cust_code: TStringField;
    ADOQuery1customer_name: TStringField;
    ADOQuery1credit_rating: TWordField;
    ADOQuery1credit_limit: TFloatField;
    ADOQuery1manu_part_number: TStringField;
    ADOQuery1manu_part_desc: TStringField;
    ADOQuery1analysis_code_2: TStringField;
    ADOQuery1bath_former: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
   private
    { Private declarations }
    fieldname:string;
    preColumn: TColumn;
  public
    { Public declarations }
  end;

var
  FrmCustPart: TFrmCustPart;

implementation
uses damo;
{$R *.DFM}

procedure TFrmCustPart.Edit1Change(Sender: TObject);
begin
if trim(Edit1.text) <> '' then
 Adoquery1.Filter := fieldname+' like ''%'+trim(edit1.Text)+'%'''
else
 Adoquery1.Filter := '';
end;

procedure TFrmCustPart.BitBtn3Click(Sender: TObject);
begin
 Edit1.text := '';
 Edit1.SetFocus;
end;

procedure TFrmCustPart.DBGrid1DblClick(Sender: TObject);
begin
 if not adoquery1.IsEmpty then ModalResult := mrOk;
end;

procedure TFrmCustPart.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key = 13) and (not adoquery1.IsEmpty) then self.ModalResult := mrok;
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text); 
end;

procedure TFrmCustPart.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled := false
else
 button1.Enabled := true;
end;

procedure TFrmCustPart.FormActivate(Sender: TObject);
begin
 fieldname:='manu_part_number';
 preColumn:=dbgrid1.Columns[0];
end;

procedure TFrmCustPart.DBGrid1TitleClick(Column: TColumn);
begin
if  self.fieldname<> column.FieldName then
begin
 fieldname:=column.FieldName;
 label1.Caption:=column.Title.Caption;
 edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
end;
end;

end.
