unit uCostom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, Buttons;

type
  TfrmCostom = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    Query1: TADOQuery;
    Query1CUST_CODE: TStringField;
    Query1CUSTOMER_NAME: TStringField;
    Query1abbr_name: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCostom: TfrmCostom;

implementation
uses common;

{$R *.dfm}

procedure TfrmCostom.FormActivate(Sender: TObject);
begin
 query1.Close;
 if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
 query1.SQL.Text:=query1.SQL.Text+
'and rkey in (SELECT customer_ptr from data0100 WHERE csi_ptr='+rkey73+')';
 Query1.Open;
end;

procedure TfrmCostom.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Query1.Filter :='CUST_CODE like '''+trim(edit1.text)+'%'''
 else
  Query1.filter:='';

end;

procedure TfrmCostom.SpeedButton1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.setfocus;
end;

procedure TfrmCostom.DBGrid1DblClick(Sender: TObject);
begin
if not Query1.IsEmpty then
 ModalResult:=mrOK;
end;

procedure TfrmCostom.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not Query1.IsEmpty) then ModalResult:=mrOK;
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(query1.SQL.Text);
end;

procedure TfrmCostom.DataSource1DataChange(Sender: TObject; Field: TField);
begin
if Query1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.

