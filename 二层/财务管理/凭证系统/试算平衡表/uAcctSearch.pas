unit uAcctSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFAcctSearch = class(TForm)
    Splitter1: TSplitter;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button2: TButton;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Qry: TADOQuery;
    RadioGroup1: TRadioGroup;
    QryRKEY: TAutoIncField;
    QryCURR_TP: TWordField;
    QryCURR_PTR: TIntegerField;
    QryDSDesigner: TStringField;
    QryDSDesigner2: TStringField;
    QryGL_ACC_NUMBER: TStringField;
    Qrydescription_2: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    pFname:string;
    PreColumn: TColumn;
  public
    { Public declarations }
  end;

var
  FAcctSearch: TFAcctSearch;

implementation

uses uMD;

{$R *.dfm}

procedure TFAcctSearch.FormShow(Sender: TObject);
begin
 pFname := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
end;

procedure TFAcctSearch.BitBtn1Click(Sender: TObject);
begin
 EDIT1.TEXT:='';
 edit1.SetFocus;
end;

procedure TFAcctSearch.Edit1Change(Sender: TObject);
begin
 if TRIM(EDIT1.TEXT)<>'' then
  if self.RadioGroup1.ItemIndex=1 then
   Qry.Filter := pFname+' like '+''''+'%'+trim(EDIT1.TEXT)+'%'''
  else
   Qry.Filter := pFname+' like '+''''+trim(EDIT1.TEXT)+'%'''
 else
  Qry.FILTER := '';
end;

procedure TFAcctSearch.DBGrid1DblClick(Sender: TObject);
begin
 ModalResult:=mrok;
end;

procedure TFAcctSearch.Button1Click(Sender: TObject);
begin
 ModalResult:=mrok;
end;

procedure TFAcctSearch.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly) and (column.FieldName<>pFname) then
 begin
  label1.Caption:=column.Title.Caption;
  pFname:=column.FieldName;
  PreColumn.Title.Color := clBtnFace;
  PreColumn:=column;
  Column.Title.Color := clred;

  edit1.SetFocus;
 end;
end;

procedure TFAcctSearch.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 if Qry.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

end.
