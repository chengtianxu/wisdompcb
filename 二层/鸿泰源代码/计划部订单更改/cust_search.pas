unit cust_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, Mask, Buttons, ADODB, ExtCtrls;

type
  TForm_Custmer = class(TForm)
    DBGrid1: TDBGrid;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOStoredProc;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1cust_code: TStringField;
    ADOQuery1customer_name: TStringField;
    RadioGroup1: TRadioGroup;
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Custmer: TForm_Custmer;

implementation
 uses damo;
{$R *.DFM}

procedure TForm_Custmer.MaskEdit1Change(Sender: TObject);
begin
 if trim(MaskEdit1.text)<>'' then
  if radiogroup1.ItemIndex=0 then
   ADOQuery1.Filter := 'Cust_code like '''+Trim(maskEdit1.Text)+'%'''
  else
   adoQUERY1.Filter := 'customer_name like ''%'+trim(maskedit1.text)+'%'''
 ELSE
  adoQUERY1.FILTER:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_Custmer.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then modalresult:=mrok;
end;

procedure TForm_Custmer.BitBtn2Click(Sender: TObject);
begin
 Maskedit1.Text := '';
 maskedit1.SetFocus;
end;

procedure TForm_Custmer.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 if adoquery1.IsEmpty then
  button1.Enabled:=false;
end;

procedure TForm_Custmer.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then self.ModalResult:=mrok;
end;

procedure TForm_Custmer.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
 label1.Caption := '客户代码'
else
 label1.Caption := '客户名称';
 
maskedit1.SetFocus;

end;

end.
