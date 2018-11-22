unit waif_supp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, Buttons;

type
  TF_supp = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1code: TStringField;
    ADOQuery1SUPPLIER_NAME: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1TAX_2: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    file_name:string;
  public
    { Public declarations }
  end;

var
  F_supp: TF_supp;

implementation

uses damo;

{$R *.dfm}

procedure TF_supp.FormCreate(Sender: TObject);
begin
file_name:='code';
self.ADOQuery1.Open;
end;

procedure TF_supp.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
   adoQUERY1.Filter:=file_name+' like ''%'+trim(edit1.text)+'%'''
 ELSE
  adoQUERY1.FILTER:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TF_supp.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
  if (chr(key)='V') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TF_supp.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then ModalResult:=mrok;
end;

procedure TF_supp.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TF_supp.DBGrid1TitleClick(Column: TColumn);
begin
if (file_name<>column.FieldName) and (column.FieldName<>'TAX_2') then
 begin
  label1.Caption:=column.Title.Caption;
  file_name:=column.FieldName;
  edit1.Text:='';
  edit1.SetFocus;
 end;
end;

end.
