unit User;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, Grids, DBGrids, ExtCtrls, DB, ADODB;

type
  TForm_User = class(TForm)
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    ADOQuery1: TADODataSet;
    ADOQuery1EMPL_CODE: TStringField;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1abbr_name: TStringField;
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form_User: TForm_User;

implementation

uses demo;

{$R *.dfm}

procedure TForm_User.MaskEdit1Change(Sender: TObject);
begin
  if trim(MaskEdit1.text)<>'' then
    Adoquery1.Filter :=field_name+' like ''%'+Trim(MaskEdit1.Text)+'%'''
  else
    Adoquery1.filter:='';

if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_User.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then  modalresult:=mrok;
end;

procedure TForm_User.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name:='EMPL_CODE';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;


procedure TForm_User.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.field_name then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  adoquery1.IndexFieldNames:=column.FieldName;
  self.MaskEdit1.SetFocus;
 end;
end;

procedure TForm_User.BitBtn2Click(Sender: TObject);
begin
maskedit1.Text:='';
maskedit1.SetFocus;
end;

end.


