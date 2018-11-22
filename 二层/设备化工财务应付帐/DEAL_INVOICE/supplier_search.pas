unit supplier_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TForm_supp = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    RadioGroup1: TRadioGroup;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1CODE: TStringField;
    ADOQuery1SUPPLIER_NAME: TStringField;
    ADOQuery1CURRENCY_PTR: TIntegerField;
    ADOQuery1curr_code: TStringField;
    ADOQuery1curr_name: TStringField;
    ADOQuery1BASE_TO_OTHER: TFloatField;
    ADOQuery1PAYMENT_TERMS: TSmallintField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_supp: TForm_supp;

implementation

uses datamd;



{$R *.dfm}

procedure TForm_supp.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_supp.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
  begin
   if radiogroup1.ItemIndex=0 then
    adoQUERY1.Filter:='code like '''+trim(edit1.text)+'%'''
   else
    adoQUERY1.Filter:='supplier_name like ''%'+trim(edit1.text)+'%''';
  end
 ELSE
  adoQUERY1.FILTER:='';
  
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;  
end;

procedure TForm_supp.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrok;
end;

procedure TForm_supp.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_supp.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;   
end;

procedure TForm_supp.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
 begin
  label1.Caption := ' 供应商代码:';
  edit1.SetFocus;
 end
else
 begin
  label1.Caption := ' 供应商名称:';
  edit1.SetFocus;
 end;
end;

end.
