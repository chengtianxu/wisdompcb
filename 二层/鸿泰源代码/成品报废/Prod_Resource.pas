unit Prod_Resource;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ADODB, ExtCtrls;

type
  TFrmProdResource = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1dept_name: TStringField;
    ADOQuery1ctype: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  FrmProdResource: TFrmProdResource;

implementation

uses main;
{$R *.DFM}

procedure TFrmProdResource.BitBtn1Click(Sender: TObject);
begin
EDIT1.TEXT:='';
AdoQuery1.FILTER:='';
end;

procedure TFrmProdResource.BitBtn2Click(Sender: TObject);
begin
  if ADOQuery1.Eof then exit;
  Modalresult:=mrok;
end;

procedure TFrmProdResource.BitBtn3Click(Sender: TObject);
begin
CLOSE;
end;

procedure TFrmProdResource.Edit1Change(Sender: TObject);
begin
    if trim(Edit1.text)<>'' then
      Adoquery1.Filter:=field_name+' LIKE '''+TRIM(EDIT1.TEXT)+'%'''
     ELSE
      Adoquery1.FILTER:='';
end;

procedure TFrmProdResource.FormShow(Sender: TObject);
begin
  Adoquery1.open;
  field_name:='DEPT_CODE';
  Edit1.SetFocus ;
end;

procedure TFrmProdResource.DataSource2DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 bitbtn2.Enabled:=false
else
 bitbtn2.Enabled:=true;
end;

procedure TFrmProdResource.DBGrid1TitleClick(Column: TColumn);
begin
  if (column.ReadOnly) and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  edit1.SetFocus;
  adoquery1.Sort:=column.FieldName+' ASC';
 end;
end;

end.
