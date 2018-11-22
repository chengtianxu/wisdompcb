unit cust_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, Mask, Buttons, ADODB, ExtCtrls;

type
  TFrm_Cust = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOStoredProc;
    RadioGroup1: TRadioGroup;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cust: TFrm_Cust;

implementation
uses main;
{$R *.DFM}

procedure TFrm_Cust.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then modalresult := mrok;
end;

procedure TFrm_Cust.BitBtn2Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TFrm_Cust.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
  if radiogroup1.ItemIndex=0 then
   ADOQuery1.Filter := 'Cust_code like '''+Trim(Edit1.Text)+'%'''
  else
   adoQUERY1.Filter:='customer_name like ''%'+trim(edit1.text)+'%'''
 ELSE
  adoQUERY1.FILTER:='';
if adoquery1.IsEmpty then
 button1.Enabled := false
else
 button1.Enabled := true;  
end;

procedure TFrm_Cust.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then  modalresult:=mrok;
  if key=27 then self.ModalResult:=mrCancel;
end;

procedure TFrm_Cust.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
 label1.Caption := '客户代码'
else
 label1.Caption := '客户名称';
 
edit1.SetFocus;

end;

end.
