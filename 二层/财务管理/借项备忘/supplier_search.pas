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
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button3: TButton;
    Button4: TButton;
    RadioGroup1: TRadioGroup;
    ADOData0023: TADOQuery;
    ADOData0023RKEY: TIntegerField;
    ADOData0023CODE: TStringField;
    ADOData0023SUPPLIER_NAME: TStringField;
    ADOData0023DISCOUNT: TFloatField;
    ADOData0023DISCOUNT_DAYS: TSmallintField;
    ADOData0023DISCOUNT2: TFloatField;
    ADOData0023DISCOUNT2_DAYS: TSmallintField;
    ADOData0023PAYMENT_TERMS: TSmallintField;
    ADOData0023currency_ptr: TIntegerField;
    ADOData0023abbr_name: TStringField;
    ADOData0023curr_code: TStringField;
    ADOData0023curr_name: TStringField;
    ADOData0023BASE_TO_OTHER: TFloatField;
    ADOData0023ACC_PAYABLE_PTR: TIntegerField;
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
  if Radiogroup1.ItemIndex=0 then
  begin
     if trim(Edit1.text)<>'' then
       ADOData0023.Filter:='code like '''+trim(edit1.text)+'%'''
     ELSE
       ADOData0023.FILTER:='';
  end else
  begin
    if trim(Edit1.text)<>'' then
      ADOData0023.Filter:='supplier_name like ''%'+trim(edit1.text)+'%'''
    ELSE
      ADOData0023.FILTER:='';
  end;
end;

procedure TForm_supp.DBGrid1DblClick(Sender: TObject);
begin
 ModalResult:=mrok;
end;

procedure TForm_supp.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then ModalResult:=mrok;
end;

procedure TForm_supp.FormCreate(Sender: TObject);
begin
  if ADOData0023.active=false then
    ADOData0023.open;
  ADOData0023.Filter:='';
end;

procedure TForm_supp.RadioGroup1Click(Sender: TObject);
begin
edit1.SetFocus;
label1.Caption:=radiogroup1.Items.Strings[radiogroup1.itemindex];
end;

end.
