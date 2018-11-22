unit searchfs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB, ExtCtrls;

type
  TForm_fasset = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADO417: TADOQuery;
    ADO417RKEY: TAutoIncField;
    ADO417FASSET_CODE: TStringField;
    ADO417FASSET_NAME: TStringField;
    ADO417FASSET_DESC: TStringField;
    ADO417FASSET_TYPE_PTR: TSmallintField;
    ADO417DEPT_PTR: TIntegerField;
    ADO417LOCATION: TStringField;
    ADO417PURCH_DATE: TDateTimeField;
    ADO417BOOK_DATE: TDateTimeField;
    ADO417REMARK: TStringField;
    ADO417active_flag: TWordField;
    ADO417USER_DATE: TDateTimeField;
    ADO417USER_PTR: TIntegerField;
    ADO417warehouse_ptr: TIntegerField;
    ADO417supplier_name: TStringField;
    ADO417MAKE_VENDER: TStringField;
    ADO417confi_date: TDateTimeField;
    ADO417confi_userptr: TIntegerField;
    ADO417install_date: TDateTimeField;
    ADO417install_userptr: TIntegerField;
    ADO417machine_number: TStringField;
    RadioGroup1: TRadioGroup;
    ADO417id_code: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_fasset: TForm_fasset;

implementation

uses demo;

{$R *.dfm}

procedure TForm_fasset.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_fasset.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
  if radiogroup1.ItemIndex=0 then
   ADO417.Filter:='fasset_code like ''%'+trim(edit1.text)+'%'''
  else
   ADO417.Filter:='fasset_name like ''%'+trim(edit1.text)+'%'''
 ELSE
   ADO417.FILTER:='';

if ADO417.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_fasset.DBGrid1DblClick(Sender: TObject);
begin
if (not ADO417.IsEmpty) then
 ModalResult:=mrok;
end;

procedure TForm_fasset.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not ADO417.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_fasset.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
 label1.Caption := '设备编号:'
else
 label1.Caption := '设备名称:';
edit1.SetFocus;
end;

procedure TForm_fasset.FormCreate(Sender: TObject);
begin
ADO417.Open;
end;

end.
