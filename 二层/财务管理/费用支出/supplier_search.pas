unit supplier_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TForm_inex = class(TForm)
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
    ADOData0023TTYPE: TSmallintField;
    ADOData0023NAME: TStringField;
    ADOData0023DESCRIPTION: TStringField;
    ADOData0023GL_ACCT_PTR: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_inex: TForm_inex;

implementation

uses datamd;

{$R *.dfm}

procedure TForm_inex.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_inex.Edit1Change(Sender: TObject);
begin
  if Radiogroup1.ItemIndex=0 then
  begin
     if trim(Edit1.text)<>'' then
       ADOData0023.Filter:='NAME like '''+trim(edit1.text)+'%'''
     ELSE
       ADOData0023.FILTER:='';
  end else
  begin
    if trim(Edit1.text)<>'' then
      ADOData0023.Filter:='DESCRIPTION like '''+trim(edit1.text)+'%'''
    ELSE
      ADOData0023.FILTER:='';
  end;
end;

procedure TForm_inex.DBGrid1DblClick(Sender: TObject);
begin
if not self.ADOData0023.IsEmpty then ModalResult:=mrok;
end;

procedure TForm_inex.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not self.ADOData0023.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_inex.FormCreate(Sender: TObject);
begin
  if ADOData0023.active=false then
    ADOData0023.open;
  ADOData0023.Filter:='';
end;

procedure TForm_inex.RadioGroup1Click(Sender: TObject);
begin
edit1.SetFocus;
label1.Caption:=radiogroup1.Items.Strings[radiogroup1.itemindex];
end;

procedure TForm_inex.DataSource1DataChange(Sender: TObject; Field: TField);
begin
 if adodata0023.IsEmpty then
  button3.Enabled:=false
 else
  button3.Enabled:=true;
end;

end.
