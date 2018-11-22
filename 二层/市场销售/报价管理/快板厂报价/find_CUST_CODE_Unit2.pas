unit find_CUST_CODE_Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Find_Unit1, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB,
  ADODB;

type
  Tfind_CUST_CODE_Form2 = class(Tfind_Form1)
    ADOStoredProc1CUST_CODE: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  find_CUST_CODE_Form2: Tfind_CUST_CODE_Form2;

implementation

{$R *.dfm}

procedure Tfind_CUST_CODE_Form2.Edit1Change(Sender: TObject);
begin
  inherited;
   if trim(edit1.text)<>'' then
   begin
     ADOStoredProc1.Filter := 'CUST_CODE like '''+trim(EDIT1.TEXT)+'%''';
   end
   else
     ADOStoredProc1.Filter:='';
end;

procedure Tfind_CUST_CODE_Form2.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Button1Click(sender);
end;

procedure Tfind_CUST_CODE_Form2.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then
    Button1Click(sender);
end;

procedure Tfind_CUST_CODE_Form2.Button1Click(Sender: TObject);
begin
  inherited;
  modalresult:=mrok;
end;

procedure Tfind_CUST_CODE_Form2.Button2Click(Sender: TObject);
begin
  inherited;
  modalresult:=mrCancel	;
end;

end.
