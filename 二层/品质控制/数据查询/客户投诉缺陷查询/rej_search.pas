unit rej_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TForm_rej = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource4: TDataSource;
    AQ39: TADOQuery;
    AQ39RKEY: TAutoIncField;
    AQ39REJ_CODE: TStringField;
    AQ39REJECT_DESCRIPTION: TStringField;
    AQ39DSDesigner: TStringField;
    AQ39DSDesigner2: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DataSource4DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
   PreColumn: TColumn;    
   field_name :string;
  public
    { Public declarations }
  end;

var
  Form_rej: TForm_rej;

implementation
uses  main;
{$R *.dfm}

procedure TForm_rej.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm_rej.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
   AQ39.Filter := field_name+' like ''%'+trim(edit1.Text)+'%'''
  else
   AQ39.Filter := '';
end;

procedure TForm_rej.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not AQ39.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_rej.DBGrid1DblClick(Sender: TObject);
begin
if not AQ39.IsEmpty then  ModalResult:=mrok;
end;

procedure TForm_rej.FormCreate(Sender: TObject);
begin
 AQ39.Open;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
end;

procedure TForm_rej.DBGrid1TitleClick(Column: TColumn);
begin
IF (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  PreColumn.Title.Color := clBtnFace;
  PreColumn := column;
  Column.Title.Color := clred;  
  edit1.Text:='';
  edit1.SetFocus;

 end;
end;

procedure TForm_rej.DataSource4DataChange(Sender: TObject; Field: TField);
begin
if AQ39.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
